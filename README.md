# The MIXnorm RNA-seq Data Normalization

## Introduction
MIXnorm is a normalization method designed for Formalin-Fixed Para􏰌n-Embedded (FFPE) RNA-sequencing (RNA-seq) data. MIXnorm relies on a two-component mixture model, which models non-expressed genes by zero-inflated Poisson distributions and models expressed genes by truncated normal distributions. Though designed specifically for FFPE RNA-seq data, MIXnorm is directly applicable to normalize fresh-frozen (FF) RNA-seq data as a special case of FFPE RNA-seq normalization. To obtain the maximum likelihood estimates, we developed a nested EM algorithm, in which closed-form updates are available in each iteration.

## Dependencies

R version: 3.5.3 (2019-3-11)

Platform: x86_64-apple-darwin15.6.0 (64-bit)

Developed under: macOS Mojave 10.14.5

R Packages: truncnorm_1.0-8

## Input files
Input file should be a raw read count matrix in gene level with (J genes)*(I samples).

## Example
### Install
You can install FFPEnorm from `github` using the `devtool`. 

```{r}
install.packages("devtools")
library(devtools)
install_github("S-YIN/MIXnorm")
library(MIXnorm)
```

### Example data
The ccRCC.RData is the clear cell renal cell carcinoma (ccRCC) data from  Eikrem et al. (2016), which contains 18,458 protein coding genes and 32 FFPE RNA-seq data.

```{r}
data(ccRCC)
head(ccRCC)
```

### Usage
The MIXnom is implemented in R. The scripts are under folder [R](https://github.com/S-YIN/MIXnorm/tree/create-R/R).  `func_MIXnorm` is the core functions that produces the normalized expression matrix, proportion of expressed genes and the probability of being expressed for each gene. 

```{r}
mix <- func_MIXnorm(dat = ccRCC, max_iter = 20, tol = 0.01, log_file = "MIXnorm.log", appr = TRUE)
normalized.by.mix <- mix$MIX_normalized_log
express.gene.mix <- rownames(ccRCC)[mix$D > 0.5]
```

### Details
* The input data must be raw read count matrix of dimension `J genes * I samples`.
* The default maximum number of nested EM iteration (max_iter) is `20`, recommend range `(10, 50)`.
* The default convergency criteria (tol) is `0.01`, recommend range `(1e-5, 1)`.
* A log file will be written to the current working directory during the normalization process. The default file name is `MIXnorm.log` for `func_MIXnorm`. 
* The default setting uses an approximate version of normalization (`appr=TRUE`). The exact normalization uses the posterior probabilities of genes being expressed or not to produce the normalized data. The approximate version uses a cut-off value of `0.5` on those probabilities to classify genes as expressed or not, then non-expressed genes will be normalized to exact `0`.  

