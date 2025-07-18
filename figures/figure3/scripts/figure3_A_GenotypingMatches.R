library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(tidyverse)

###################################
# PLOTING: GENOTYPING BREAKDOWNS #
##################################
# create general output directory
general_output_dir = "figures"; dir.create(general_output_dir, showWarnings=F);
figure3_dir = paste(general_output_dir, "figure3", "figures", sep="/"); dir.create(figure3_dir, showWarnings=F, recursive=T);

# Read source data and set plotting order
dp <- read.csv(paste(general_output_dir, "figure3", "data", "figure3_A.csv", sep="/"))

dp$comparison <- factor(dp$comparison, levels = c("who", "clade", "p5", "p1", "p0.5", "p0.1", "lineage", "pango"))
x_axis_labels <- c("WHO VOCs", "Nextstrain Clade", expression("P ">="5%"), expression("P " >="1%"), expression("P" >="0.5%"), expression("P" >="0.1%"), "Parent","PANGO" )

mycols <- colorRampPalette(brewer.pal(12, "Paired"))(12)
m4 <- ggplot(dp, aes(x = comparison, y=frequency, fill = matches)) +
  geom_bar(stat = "identity", position = "stack") +
  scale_fill_manual(values = mycols[c(7,2)])+
  scale_x_discrete(labels=x_axis_labels) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.key.spacing.x = unit(10, "pt")) #+
  #facet_grid(rows = vars(ASSEMBLY_QUALITY), cols = vars(comparison))

m5 <- ggplot(dp, aes(x = comparison, y = n, fill = matches)) +  # Replace 'method' with a meaningful variable
  geom_bar(stat = "identity", position = "stack") +
  scale_fill_manual(values = mycols[c(7, 2)]) +
  scale_x_discrete(labels = x_axis_labels) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.key.spacing.x = unit(10, "pt"))

# Create output directory
pdf(paste0(figure3_dir,"/figure3_A.pdf"))
print(m4)
print(m5)
dev.off()
