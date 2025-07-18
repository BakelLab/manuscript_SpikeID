library(tidyverse)
library(ggalluvial)
library(RColorBrewer)

# create general output directory
general_output_dir = "figures"; dir.create(general_output_dir, showWarnings=F);
figure3_dir = paste(general_output_dir, "figure3", "figures", sep="/"); dir.create(figure3_dir, showWarnings=F, recursive=T);

# Read source data and set plotting order
df_expanded <- read.csv(paste(general_output_dir, "figure3", "data", "figure3_B.csv", sep="/"))
df_expanded$Condition <- factor(df_expanded$Condition, levels = c("clade_who", "P5", "P1", "P0.5", "P0.1", "Nextclade_pango"))
df_expanded$label <- factor(df_expanded$label, levels = unique(df_expanded$label))

x_axis_labels <- c("WHO VOCs", expression("P" >="5%"), expression("P" >="1%"), expression("P" >="0.5%"), expression("P" >="0.1%"), "PANGO" )
# # Plot alluvial diagram using fill_color for colors
#### classic PLOT ####

# Plot alluvial diagram using fill_color for colors
q <- ggplot(df_expanded, aes(x = Condition, stratum = label, alluvium = id, fill = fill_color, y = frequency)) +
  geom_flow(aes(fill = fill_color)) +
  scale_fill_identity() +
  geom_stratum(size = 0.1) +
  scale_x_discrete(labels=x_axis_labels) +
  theme_classic() + theme(legend.position = "none")

q <- q + geom_text(aes(label = sub(" +", "", show_label)), color = "black", position = position_nudge(x = -0.2), hjust = 1, check_overlap = TRUE,
            stat = "stratum", fontface = "bold", size = 2, na.rm = TRUE)

# Save the plot to a PDF file
pdf(file = paste0(figure3_dir,"/figure3_B_summary.csv"))
print(q)
dev.off()

total_groups <- df_expanded %>% select(Condition,label) %>% unique() %>% group_by(Condition) %>% dplyr::count(label) %>% summarize(groups=sum(n))
write_csv(total_groups, file = paste0(figure3_dir,"/figure3_B_summary.csv"))

