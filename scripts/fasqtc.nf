// nextflow run fastqc.nf -with-singularity  https://depot.galaxyproject.org/singularity/fastqc:0.12.1--hdfd78af_0  -process.debug true
//  nextflow run fastqc.nf -with-singularity https://depot.galaxyproject.org/singularity/fastqc:0.12.1--hdfd78af_0  -process.debug true  -c /exports/igmm/eddie/BioinformaticsResources/nextflow/config/eddie.config
params.read= "data/*.fq.gz"

process FASTQC {
memory 8.GB
debug true

input:
path read

shell:
"""
fastqc $read
"""
}

workflow {
Channel.fromPath(params.read,checkIfExists:true) | FASTQC | view
}


