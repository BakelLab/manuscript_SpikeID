library(ggplot2)
library(RColorBrewer)
library(tidyverse)

################
#  READ INPUT  #
################

# create general output directory
general_output_dir = "figures"; dir.create(general_output_dir, showWarnings=F);
data_dir = paste(general_output_dir, "figure2", "data", sep="/");
figure2_dir = paste(general_output_dir, "figure2", "figures", sep="/"); dir.create(figure2_dir, showWarnings=F, recursive=T);

filtered_data_qc <- read.csv(paste0(data_dir, "/figure2_A.csv"))

#### PLOTTING ####
# Plot CT values vs number of mapped reads for each run
t2 <- filtered_data_qc %>% arrange(set) %>% 
  ggplot(aes(y = ct_modified, x = Prefilt_reads, group = set, fill = set, color = set, shape = ASSEMBLY_QUALITY)) +
  geom_point(size = 1, alpha = 0.6) + scale_x_log10() +
  geom_smooth(method='lm', formula= y~x) +
  theme_classic() +
  scale_shape_manual(values = c(1, 19), na.value = "lightgrey" ) +
  scale_fill_manual(values = c("darkgrey", "#FDBF6F"), na.value = "lightgrey" ) +
  scale_color_manual(values = c("darkgrey", "#FDBF6F"), na.value = "lightgrey" ) +
  geom_hline(yintercept=32, linetype="dashed", color = "lightgrey", size = 0.5) +
  geom_vline(xintercept=100, linetype="dashed", color = "lightgrey", size = 0.5) +
  xlab("Total Reads") + ylab("CT Value") +
  NULL

pdf(file = paste0(figure2_dir, "/figure2_A.pdf"), height = 5, width = 7)
print(t2)
dev.off()

dt.ct1 <- read.csv(paste0(data_dir, "/figure2_B.csv"))
# # Prepare data to plot distribution of assembly quality by ct values
dt.ct <- dt.ct1 %>% mutate(ct_capped=ifelse(ct_round > 32, 32, ct_round)) %>% 
  group_by(ASSEMBLY_PIPELINE, ASSEMBLY_QUALITY, ct_capped) %>%
  summarise(count = sum(count)) %>% ungroup() %>% group_by(ct_capped) %>% 
  mutate(fraction = prop.table(count))

# Set color palette
main_colors <- colorRampPalette(brewer.pal(12, "Paired"))(12)[c(2,7)]

# Plot
db <- dt.ct %>%
  ggplot(aes(y = fraction, x = ct_capped, fill = ASSEMBLY_QUALITY)) +
  geom_bar(stat = "identity", position = "stack") +
  scale_fill_manual(values = main_colors) +
  theme_classic() +
  theme(axis.text.x = element_text(hjust = 1)) +
  NULL

# Plot counts
db1 <- dt.ct1 %>%
  ggplot(aes(y = count, x = ct_round, fill = ASSEMBLY_QUALITY)) +
  geom_bar(stat = "identity", position = "stack") +
  scale_fill_manual(values = main_colors) +
  theme_classic() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
  NULL

pdf(file = paste0(figure2_dir, "/figure2_B.pdf"), height = 5, width = 7)
print(db)
print(db1)
dev.off()
