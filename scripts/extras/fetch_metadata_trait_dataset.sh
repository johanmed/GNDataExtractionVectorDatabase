#!/usr/bin/env bash

# Extract metadata of each phenotype using trait id and dataset id and GNApi

for i in {1..5661}; do
        dataset_id=$(cut -d, -f1 ../../processed_data/list_dataset_name_trait_id.csv | tail -n +3 | head -n $i | tail -n 1)
        trait_id=$(cut -d, -f2 ../../processed_data/list_dataset_name_trait_id.csv | tail -n +3 | head -n $i | tail -n 1)
        curl https://genenetwork.org/api/v_pre1/trait/${dataset_id}/${trait_id} >> ../../processed_data/metadata_phenotype_info_file.json
done
