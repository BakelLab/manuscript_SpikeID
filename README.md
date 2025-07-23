# SpikeID: Rapid and Unbiased Identification of SARS-CoV-2 Variants by Spike Sequencing

**Authors:**  
Keith Farrugia<sup>1*</sup>, Zain Khalil<sup>1*</sup>, Adriana van de Guchte<sup>1</sup>, Bremy Alburquerque<sup>1</sup>, Daniel Floda<sup>1</sup>, PSP Study Group<sup>**</sup>, Komal Srivastava<sup>2,3</sup>, Luz H. Patiño<sup>4,5</sup>, Juan David Ramirez<sup>4,5</sup>, Alberto E. Paniz-Mondolfi<sup>4</sup>, Emilia Mia Sordillo<sup>4</sup>, Viviana Simon<sup>2,3,4,6,9</sup>, Ana S. Gonzalez-Reiche<sup>1†</sup>, Harm van Bakel<sup>1,2,7,8†</sup>

<sub>*These authors contributed equally.<br>
†Corresponding authors.<br>
**See manuscript for full list of study group members.</sub>

**Affiliations:**

<sup>1</sup> Department of Genetics and Genomic Sciences, Icahn School of Medicine at Mount Sinai, New York, NY, USA  
<sup>2</sup> Department of Microbiology, Icahn School of Medicine at Mount Sinai, New York, NY, USA  
<sup>3</sup> Center for Vaccine Research and Pandemic Preparedness (C-VaRPP), Icahn School of Medicine at Mount Sinai, New York, NY, USA  
<sup>4</sup> Department of Pathology, Molecular, and Cell-Based Medicine, Icahn School of Medicine at Mount Sinai, New York, NY, USA  
<sup>5</sup> Facultad de Ciencias Naturales, Universidad del Rosario, Bogotá, Colombia  
<sup>6</sup> Division of Infectious Diseases, Department of Medicine, Icahn School of Medicine at Mount Sinai, New York, NY, USA  
<sup>7</sup> Icahn Genomics Institute, Icahn School of Medicine at Mount Sinai, New York, NY, USA  
<sup>8</sup> Department of Artificial Intelligence and Human Health, Icahn School of Medicine at Mount Sinai, New York, NY, USA  
<sup>9</sup> The Global Health Emerging Pathogens Institute, Icahn School of Medicine at Mount Sinai, New York, NY, USA


## Repository Overview

This repository contains the code and data to reproduce the figures presented in the *SpikeID* manuscript. Figures 1 through 4 each have dedicated subdirectories that follow a consistent structure:

- **Data/** – Source data used in the figure  
- **Scripts/** – Code to generate the figure panel(s)  
- **Figures/** – Output directory for the generated panels

## Getting Started

To recreate the figures, you will need to set up the required environment using [Miniconda](https://docs.anaconda.com/miniconda/miniconda-install/). Clone this repository and create the conda environment as follows:

```bash
git clone https://github.com/BakelLab/manuscript_SpikeID.git
cd manuscript_SpikeID
conda env create --name manuscript_SpikeID --file=workflow/envs/manuscript_SpikeID.yaml
```

## Reproducing Figures

Each figure folder includes a README.md with detailed steps to reproduce the associated panels. Please follow the instructions in the figures/ directory.

