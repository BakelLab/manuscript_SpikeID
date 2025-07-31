library(ggplot2)
library(RColorBrewer)
library(tidyverse)

##############
# READ INPUT #
##############
general_output_dir = "figures"; 
figure2_dir = paste(general_output_dir, "figure2/figures", sep="/"); 
sequence_data <- read.csv(paste0(general_output_dir, "/figure2/data", "/figure2_C.csv"))
sequence_data$DOMAIN <- factor(sequence_data$DOMAIN, levels = c("S1","RBD","NTD","S dels"))

# Create the plot and save it as a PDF
m5 <- sequence_data %>%
  ggplot(aes(x = DOMAIN, y = frequency, fill = MATCH)) +
  geom_bar(stat = "identity", position = "stack") +
  geom_text(aes(y = 1-cumFreq, label = round(frequency, 2)), vjust = 0, colour = "white") +
  scale_fill_manual(values = c("#1F78B4", "#FDBF6F")) +  # Adjust colors as needed
  theme_classic() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.key.spacing.x = unit(10, "pt")) +
  facet_grid(rows = vars(ASSEMBLY_QUALITY), cols = vars(ASSEMBLY_PIPELINE))

# Save the plot as a PDF
pdf(file = paste0(figure2_dir, "/figure2_C.pdf"), width = 6, height = 4)
print(m5)
dev.off()