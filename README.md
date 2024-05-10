# nextflow_eddie
some example to run on eddie


## Qick start

### Log into eddie​

```bash
ssh username@eddie.ecdf.ed.ac.uk​
```

### Start screen session​


```bash
screen –S nextflowtest​
```

Go to interactive node​

```bash
ssh node2c17​
```
Load modules​

```bash
module load igmm/bac/nextflow/23.10.0.5889​
module load java/jdk-20.0.2​
```

Go to project Directory​

```bash
cd /exports/igmm/eddie/<projectdir>​
```

Set ENV variable​


```bash
NXF_SINGULARITY_CACHEDIR=/exports/igmm/eddie/BioinformaticsResources/nfcore/singularity-images​
```
Run nextflow​

```bash
nextflow run ggrimes/nextflow_eddie   
```

```bash
nextflow run nf-core/rnaseq -r 3.14.0 --outdir test -profile eddie,test
```
