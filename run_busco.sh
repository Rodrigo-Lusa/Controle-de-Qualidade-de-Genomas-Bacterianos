#!/bin/bash

mkdir -p busco_results
mkdir -p busco_json

for genome in fastas/*.fasta; do

    name=$(basename "$genome")

    busco \
        -i "$genome" \
        -m genome \
        -l bacteria_odb10 \
        -o "BUSCO_${name}" \
        --out_path busco_results \
        -c 16

done

find busco_results -name "*.json" -exec cp {} busco_json/ \;

echo "BUSCO finalizado"
