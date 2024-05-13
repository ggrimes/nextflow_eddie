
//nextflow run fastqc_2.nf  -process.debug true  -c /exports/igmm/eddie/BioinformaticsResources/nextflow/config/eddie.config
process FASTQC {
container "depot.galaxyproject.org-singularity-fastqc:0.12.1--hdfd78af_0" 
memory 8.GB
debug true
shell:
"""
fastqc --version
"""
}

workflow {
FASTQC()
}
