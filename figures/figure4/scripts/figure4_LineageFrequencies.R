# Load libraries files
library(tidyverse)
library(lubridate)
library(RColorBrewer)

# create figure output directory
general_output_dir = "figures"; dir.create(general_output_dir, showWarnings=F);
data_dir = paste(general_output_dir, "figure4/data", sep="/");
figure4_dir = paste(general_output_dir, "figure4/figures", sep="/"); dir.create(figure4_dir, showWarnings=F, recursive=T);

##############
#  DATASETS  #
##############
# read data 
pdata <- read.csv(paste0(data_dir,"/figure4.csv"))
pdata$week <- as.Date(pdata$week)

# Define colors schemes for each variant
cat('# Annotate colors \n\n')
pdata <- pdata %>% arrange(clade_who)
pdata$clade_who <- factor(pdata$clade_who, levels = unique(pdata$clade_who)[c(2,1,3,7,4:6,8:13)])
pdata <- pdata  %>% group_by(clade_who) %>% arrange(clade_who,week,lineage_display.final)
pdata$lineage_display.final <- factor(pdata$lineage_display.final, levels = unique(pdata$lineage_display.final))
clade_values <- unique(pdata$clade_who) %>% sort()
clade_colors <- rev(colorRampPalette(brewer.pal(9, "Spectral"))(length(clade_values)))
names(clade_colors) <- clade_values
mycolors <- list()
for (i in names(clade_colors)){
  col <- clade_colors[[i]]
  lins <- length(unique(pdata$lineage_display.final[pdata$clade_who == i]))
  if (lins > 1){
    mycolors[[i]] <- data.frame(color=colorRampPalette(c("#FFFFFF", col))(lins+4)[5:(lins+4)])
    mycolors[[i]]$lineage <- unique(pdata$lineage_display.final[pdata$clade_who %in% i])
  } else {
    mycolors[[i]] <- data.frame(color=col)
    mycolors[[i]]$lineage <- unique(pdata$lineage_display.final[pdata$clade_who %in% i])
  }
}
mycolors <- Reduce(rbind,mycolors)
mc <- mycolors$color
names(mc) <- mycolors$lineage

# Reasign colors for JN.1 and recombinants
mc[['JN.1']] <- "#D53E4F"
mc[['X']]    <- "#999999"

# Set group labels
group_labeller <- labeller(ASSEMBLY_PIPELINE=~ifelse(.x == "GISAID", paste(.x, "WGS (NYS)", sep = ", "), paste("MS-PSP,", .x, "(NYC)", sep = " ")))

# Set group order
pdata$ASSEMBLY_PIPELINE <- factor(pdata$ASSEMBLY_PIPELINE, levels=c("SpikeID", "WGS", "combined", "GISAID"))

# plot lineage distribution
p <- ggplot(pdata, aes(x=week,y=Frequency,fill=lineage_display.final)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = mc) +
  scale_x_date(date_breaks = "4 month", date_labels = "%Y-%b") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1), legend.position = "bottom", legend.key.spacing.x = unit(10, "pt")) +
  NULL
p <- p + facet_grid(cols = NULL, rows = vars(ASSEMBLY_PIPELINE), labeller=group_labeller, scales = "free_y") + 
  guides(fill=guide_legend(title="PANGO Lineage", ncol=8))

# plot lineage distribution
p1 <- ggplot(pdata, aes(x=week,y=n,fill=lineage_display.final)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = mc) +
  scale_x_date(date_breaks = "4 month", date_labels = "%Y-%b") +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1), legend.position = "bottom", legend.key.spacing.x = unit(10, "pt")) +
  NULL
p1 <- p1 + facet_grid(cols = NULL, rows = vars(ASSEMBLY_PIPELINE), labeller=group_labeller, scales = "free_y") + 
  guides(fill=guide_legend(title="PANGO Lineage", ncol=8))
pdf(file=paste0(figure4_dir,"/figure4.pdf"), height = 12, width = 10)
print(p)
print(p1)
dev.off()
