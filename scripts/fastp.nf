// nextflow run fastqc.nf -with-singularity  https://depot.galaxyproject.org/singularity/fastp:0.23.4--hadf994f_3
//  nextflow run fastqc.nf -with-singularity https://depot.galaxyproject.org/singularity/fastp:0.23.4--hadf994f_3 -c /exports/igmm/eddie/BioinformaticsResources/nextflow/config/eddie.config
params.read= "data/*.fq.gz"

process FASTP {
memory 8.GB
debug true

input:
path read

shell:
"""
fastp -i $read
"""
}

workflow {
Channel.fromPath(params.read,checkIfExists:true) | FASTP 
}
