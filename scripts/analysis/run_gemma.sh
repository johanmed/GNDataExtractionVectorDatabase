#!/usr/bin/env bash

# Perform LMM analysis using gemma

# Run gemma to generate relatedness matrix

gemma -g ../../processed_data/project_genotype_file.bimbam -p ../../processed_data/project_imputed_phenotype_file.bimbam -a ../data/BXD_snps.txt -gk 1 -o ../../output/bxd_relatedness


# Run LMM implementation of gemma to study genomic to phenotype association

for i in {1..637}; do 
    output="bxd_association_trait${i}"
    gemma -p ../../processed_data/project_imputed_phenotype_file.bimbam -n $i -g ../../processed_data/project_genotype_file.bimbam -a ../../processed_data/BXD_snps.txt \
    -k ../../output/bxd_relatedness.cXX.txt -lmm 1 -o ../../output/association/$output
done
