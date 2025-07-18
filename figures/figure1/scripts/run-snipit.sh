#!/bin/bash

#conda init
#conda activate

if ! snipit_loc="$(type -p "$snipit")" || [[ -z $snipit_loc ]]; then
  pip install snipit
fi

export workdir=$PWD
export outdir=${PWD}"/figures/figure1/figures"

mkdir -p ${outdir}

snipit figures/figure1/data/nextclade_vocs.aligned.S.renamed.fasta \
--output-file ${outdir}/figure1 \
--colour-palette primary \
--show-indels \
--format pdf

mv -f snps.csv ${outdir}/figure1_snps.csv
