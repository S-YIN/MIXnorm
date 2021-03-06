% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MIXnorm.R
\name{dzip}
\alias{dzip}
\title{log likelihood for zero inflated Poisson}
\usage{
dzip(x, delta, pi_j)
}
\arguments{
\item{x}{is a matrix, x[j,i] follows ZIP(delta[i],pi_j[j])}

\item{delta}{is a vector for poisson means}

\item{pi_j}{is a vector for prob. of extra zero}
}
\value{
the log-likelihood of each row of x
}
\description{
Input is a matrix with column specific Poisson mean and row specific probability of extra zero
}
