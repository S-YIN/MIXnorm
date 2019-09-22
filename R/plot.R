#This R script makes a density plot and a histogram of the input data
#output is a png file 
func_plot <- function(dat)
{
  #note that the density plot uses the log transformed data
  ldat <- log(dat+1)
  
  ymax <- NULL
  for (i in 1:dim(dat)[2])
  {
    ymax[i] <- max(density(ldat[,i],cut=0)$y)
  }
  yul <- max(ymax)
  
  gene.pro <- NULL
  for (u in 1:dim(dat)[1])
  {
    gene.pro[u] <- sum(dat[u,]==0)/dim(dat)[2]
  }
  
  png("exploratory.png",width = 960, height = 480)
  par(mar=c(4,4,2,3))
  par( mfrow = c( 1, 2))
  plot(density(ldat[,1],cut=0),ylim=c(0,yul),xlim=c(0,1.05*max(ldat)),xlab="",main='',col="dodgerblue4",cex.lab=1.2)
  for (i in 2:dim(dat)[2])
  {
    lines(density(ldat[,i],cut=0),col="dodgerblue4")
  }
  title(xlab='Log(Read count + 1)',line=2.2,cex=1.2)
  mtext("Kernal Densities",3,line=0.5,outer=F,las=1,at=1.05*max(ldat)/2,cex=1.2)
  
  hist(gene.pro,breaks=(0:100)/100,main="",xlab="",ylim=c(0,max(table(gene.pro))),col="dodgerblue4",cex.lab=1.2)
  title(xlab='Proporiton',line=2.2,cex=1.2)
  mtext("Zero-count Proportions",3,line=0.5,outer=F,at=0.5,cex=1.2)
  box()
  dev.off()
}




