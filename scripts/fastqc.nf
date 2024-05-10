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
