# The MIXnorm RNA-seq Data Normalization

## Dependencies

R version: 3.5.3 (2019-3-11)

Platform: x86_64-apple-darwin15.6.0 (64-bit)

Running under: macOS Mojave 10.14.5

R Packages: truncnorm_1.0-8

## Data
* The TestData.csv is the clear cell renal cell carcinoma (ccRCC) data from  Eikrem et al. (2016), which contains 18,458 protein coding genes and 32 FFPE RNA-seq data. The RNAlaterdata.csv is the paired RNAlater RNA-seq data from ccRCC.

* FFPE_41_data.csv and FF_41_data.csv are soft tissue sarcomas data from Lesluyes et al. (2016), which contains 20,242 protein coding genes and 41 paired FF and FFPE RNA-seq data.

* protein_gene.txt is a text file contains the name of all protein coding genes.

## Usage
The MIXnorm is implemented in R. The scripts are under folder [R](https://github.com/S-YIN/MIXnorm/tree/create-R/R). 
### Running in R
Install packages from dependencies and use [MIXnorm_main.r](https://github.com/S-YIN/MIXnorm/blob/create-R/R/MIXnorm_main.R).  The func_MIXnorm function takes a read count matrix as input and produces the normalized data, porprotion of expressed genes in the study and the probability of being expressed for each gene.
### Call R from command lines
Please refer to [MIXnorm.txt](https://github.com/S-YIN/MIXnorm/blob/create-R/R/MIXnorm.txt) for instruction.
