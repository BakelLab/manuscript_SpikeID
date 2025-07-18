### Figure 3

**Panel A:**

To generate the second panel in figure 3, use the source data in `figures/figure3/data/figure3_A.csv`.

The figure script, [`figures/figure3/scripts/figure3_B_GenotypingMatches.R`](https://github.com/BakelLab/manuscript_SpikeID/blob/main/figures/figure3/scripts/figure3_B_GenotypingMatches.R) uses the benchmarking data according to the different comparision levels and assembly methods, before generating a bar plot using `ggplot2`. 

``` bash
figures/figure3/figures/figure3_A.pdf
```

**Panel B:**

To create the alluvial plot, the [script](https://github.com/BakelLab/manuscript_SpikeID/blob/main/figures/figure3/scripts/figure3_B_AlluvialPlot.R) uses the source data `figures/figure3/data/figures3_B.csv` to generate the alluvial plot, where the x-axis labels go from highly grouped (clade_who) to minimally grouped (Nextclade_pango) in terms of lineage calls.

**<u>Output:</u>**

```bash
figures/figure3/figures/figure3_B_summary.csv
figures/figure3/figures/figure3_B.pdf
```
***

