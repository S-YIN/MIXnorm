#Description: Shell command line tool for MIXnorm, wrap up input parameters to the script, receive results and saved in the system.
#TestData contains 18458 genes and 32 samples of FFPE RNA-seq 
#dim(TestData) = dim(normalized_dat) = (18458,32)

setwd("/Users/shenyin/Desktop/Research/Normalization_web")
# A test folder on Shen's local system. Contains TestData.csv and scripts.
source("plot.R")
source("MIXnorm/MIXnorm_main.R")

args <- commandArgs(trailingOnly = T)
datapath <- args[1]
max_iter <- as.numeric(args[2])
tol <- as.numeric(args[3])
dat <- read.csv(datapath)

MIXnorm_result <- func_MIXnorm(dat,max_iter,tol)
MIX_normalized_dat <- MIXnorm_result[[1]]
proportion_express <- MIXnorm_result[[2]]
D <- MIXnorm_result[[3]]

func_plot(dat)

write.csv(MIX_normalized_dat,"MIX_normalized.csv")

