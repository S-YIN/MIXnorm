# The MIXnorm RNA-seq Data Normalization

## Introduction
MIXnorm is a normalization method designed for Formalin-Fixed Para􏰌n-Embedded (FFPE) RNA-sequencing (RNA-seq) data. MIXnorm relies on a two-component mixture model, which models non-expressed genes by zero-inflated Poisson distributions and models expressed genes by truncated normal distributions. Though designed specifically for FFPE RNA-seq data, MIXnorm is directly applicable to normalize fresh-frozen (FF) RNA-seq data as a special case of FFPE RNA-seq normalization. To obtain the maximum likelihood estimates, we developed a nested EM algorithm, in which closed-form updates are available in each iteration.

## Dependencies

R version: 3.5.3 (2019-3-11)

Platform: x86_64-apple-darwin15.6.0 (64-bit)

Running under: macOS Mojave 10.14.5

R Packages: truncnorm_1.0-8

## Input files
Input file should be a raw read count matrix in gene level with (J genes)*(I samples).

## Example
### Example data
* The TestData.csv is the clear cell renal cell carcinoma (ccRCC) data from  Eikrem et al. (2016), which contains 18,458 protein coding genes and 32 FFPE RNA-seq data. The RNAlaterdata.csv is the paired RNAlater RNA-seq data from ccRCC.

* FFPE_41_data.csv and FF_41_data.csv are soft tissue sarcomas data from Lesluyes et al. (2016), which contains 20,242 protein coding genes and 41 paired FF and FFPE RNA-seq data.

### Usage
The MIXnorm is implemented in R. The scripts are under folder [R](https://github.com/S-YIN/MIXnorm/tree/create-R/R). 
### Run in R
Install packages from dependencies and use [MIXnorm_main.R](https://github.com/S-YIN/MIXnorm/blob/create-R/R/MIXnorm_main.R).  The func_MIXnorm function takes a read count matrix as input and produces the normalized data, porprotion of expressed genes in the study and the probability of being expressed for each gene.
### Call R from command lines
Please refer to [MIXnorm.txt](https://github.com/S-YIN/MIXnorm/blob/create-R/R/MIXnorm.txt) for instruction. This will also return an empirical density plot and a histogram of zero-count proportions (from [plot.R](https://github.com/S-YIN/MIXnorm/blob/create-R/R/plot.R)) for the input data besides the standard output.

Example plots using the ccRCC FFPE RNA-seq data.
![exploratory](https://github.com/S-YIN/MIXnorm/blob/master/exploratory.png)
