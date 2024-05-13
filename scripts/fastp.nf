// nextflow run fastp.nf -with-singularity  https://depot.galaxyproject.org/singularity/fastp:0.23.4--hadf994f_3
// nextflow run fastp.nf -with-singularity https://depot.galaxyproject.org/singularity/fastp:0.23.4--hadf994f_3 -c /exports/igmm/eddie/BioinformaticsResources/nextflow/config/eddie.config
params.read= "data/*.fq.gz"

process FASTP {
memory 8.GB
debug true

input:
path read

output:
stdout

script:
"""
fastp -i $read 2>&1
"""
}

workflow {
Channel.fromPath(params.read,checkIfExists:true) | FASTP |view
}
