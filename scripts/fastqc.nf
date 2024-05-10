// nextflow run fastqc.nf -with-singularity depot.galaxyproject.org-singularity-fastqc:0.12.1--hdfd78af_0  -process.debug true
//  nextflow run fastqc.nf -with-singularity depot.galaxyproject.org-singularity-fastqc:0.12.1--hdfd78af_0  -process.debug true  -c /exports/igmm/eddie/BioinformaticsResources/nextflow/config/eddie.config
process FASTQC {
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
