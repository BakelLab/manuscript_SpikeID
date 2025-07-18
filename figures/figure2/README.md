### Figure 2

**Panels A & B:**

The generation of the first two panels in figure 2 require the source data in the data folder `figures/figure2/data/Figure2_A.csv` and  `figures/figure2/data/Figure2_B.csv`. The plotting R script, which is found in [`figure2_AB_CTvsMappedReads.R`](https://github.com/BakelLab/manuscript_SpikeID/blob/main/figures/figure2/scripts/figure2_AB_CTvsMappedReads.R) plots the CT values vs mapped reads for all samples that are part of the paper's dataset, coloring those that were also part of the benchmark set (sequenced using Illumina).

**<u>Output:</u>** 

```bash
figures/figure2/figures/figure2_A.pdf
figures/figure2/figures/figure2_B.pdf
```

**Panel C:**

The generation of the last panel in figure 2 occurs using the R script, [`figure2_C_SequenceComparison.R`](https://github.com/BakelLab/manuscript_SpikeID/blob/main/figures/figure2/scripts/figure2_C_SequenceComparison.R), which requires the source data `figures/figure2/data/Figure2_C.csv` for the plotting of the sequence comparison matches/mismatches for the S, S1, RBD subs, NTD subs, and S Dels positions.

**<u>Output:</u>**

```bash
figures/figure2/figures/figure2_C.pdf
```

