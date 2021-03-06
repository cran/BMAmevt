% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rect.integrate.r
\name{rect.integrate}
\alias{rect.integrate}
\title{Density integration on the two-dimensional simplex}
\usage{
rect.integrate(density, npoints, eps)
}
\arguments{
\item{density}{A \code{npoints*npoints} matrix containing the
density's values  scattered on the discretization grid defined by
\code{npoints, equi, eps} (see \code{\link{discretize}}).}

\item{npoints}{The number of grid nodes on the squared grid containing the desired triangle.}

\item{eps}{Positive number:  minimum
distance from any node inside the simplex to  the simplex boundary}
}
\value{
The value of the estimated integral of \code{density}.
}
\description{
The integral is approximated by a rectangular method, using the values stored in matrix \code{density}.
}
\details{
Integration is made with respect to the Lebesgue measure on the projection of the simplex onto the plane \eqn{(x,y): x > 0, y > 0, x+y < 1}.
It is assumed that \code{density} has been constructed on a
grid obtained \emph{via} function  \code{\link{discretize}},
with  argument \code{equi} set to \code{FALSE} and \code{npoints}
and \code{eps} equal to those passed to \code{rect.integrate}.
}
\examples{
wrapper <- function(x, y, my.fun,...)
  {
    sapply(seq_along(x), FUN = function(i) my.fun(x[i], y[i],...))
  }

grid <- discretize(npoints=40,eps=1e-3,equi=FALSE)

Density <- outer(grid$X,grid$Y,FUN=wrapper,
                                 my.fun=function(x,y){10*((x/2)^2+y^2)})

rect.integrate(Density,npoints=40,eps=1e-3)

}
