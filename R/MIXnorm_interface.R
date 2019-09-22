#This is the interface file. Use command line (in file MIXnorm.txt) to run MIXnorm_interface.R.
#Description: Shell command line tool for MIXnorm, wrap up input parameters to the script, receive results and saved in the system.
#TestData contains 18458 genes and 32 samples of FFPE RNA-seq 
#dim(TestData) = dim(normalized_dat) = (18458,32)

setwd("/Users/shenyin/Desktop/Research/Normalization")
# A test folder on Shen's local system. Contains TestData.csv and scripts.
source("plot.R")
source("MIXnorm_main.R")

args <- commandArgs(trailingOnly = T)
datapath <- args[1]
max_iter <- as.numeric(args[2])
tol <- as.numeric(args[3])
dat <- read.csv(datapath)

MIXnorm_result <- func_MIXnorm(dat,max_iter,tol) #func_MIXnorm will call the main function MIXnorm to get the MLEs.
MIX_normalized_dat <- MIXnorm_result[[1]] #normalized data
proportion_express <- MIXnorm_result[[2]] #proportion of expressed genes in the study
D <- MIXnorm_result[[3]] #length(D) = dim(dat)[1]; D is the expected probability of each gene being expressed.

func_plot(dat) #from plot.R;  This will generate the empirical density plot for the input data.

write.csv(MIX_normalized_dat,"MIX_normalized.csv") #save the normalized data in .csv

