% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hnsw.R
\name{hnsw_search}
\alias{hnsw_search}
\title{Search an HNSW nearest neighbor index}
\usage{
hnsw_search(X, ann, k, ef = 10, verbose = FALSE)
}
\arguments{
\item{X}{A numeric matrix of data to search for neighbors.}

\item{ann}{an instance of a \code{HnswL2}, \code{HnswCosine} or \code{HnswIp}
class.}

\item{k}{Number of neighbors to return.}

\item{ef}{Size of the dynamic list used during search. Higher values lead
to improved recall at the expense of longer search time. Can take values
between \code{k} and the size of the dataset. Typical values are
\code{100 - 2000}.}

\item{verbose}{If \code{TRUE}, log progress to the console.}
}
\value{
a list containing:
\itemize{
  \item \code{idx} an n by k matrix containing the nearest neighbor indices.
  \item \code{dist} an n by k matrix containing the nearest neighbor
   distances.
}

Every item in the dataset is considered to be a neighbor of itself, so the
first neighbor of item \code{i} should always be \code{i} itself. If that
isn't the case, then any of \code{M}, \code{ef_construction} and \code{ef}
may need increasing.
}
\description{
Search an HNSW nearest neighbor index
}
\examples{
irism <- as.matrix(iris[, -5])
ann <- hnsw_build(irism)
iris_nn <- hnsw_search(irism, ann, k = 5)
}
