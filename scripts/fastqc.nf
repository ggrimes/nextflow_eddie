// nextflow run fastqc.nf -with-singularity depot.galaxyproject.org-singularity-fastqc:0.12.1--hdfd78af_0  -process.debug true
process FASTQC {
debug true
shell:
"""
fastqc --version
"""
}

workflow {
FASTQC()
}
