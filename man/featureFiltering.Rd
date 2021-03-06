% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/featureFiltering.R
\name{featureFiltering}
\alias{featureFiltering}
\title{Feature space reduction via filtering methods}
\usage{
featureFiltering(data, target, index = NULL, method = "cc",
  returning = "names")
}
\arguments{
\item{data}{a dataset containing the target, all features, and potentially a time index}

\item{target}{a string with the column name of the target}

\item{index}{a string with the column name of the index}

\item{method}{a string indicating the method used for filtering: "cc", "mrmr"}

\item{returning}{a string indicating the return: "names", "data"}
}
\value{
Either a vector of names of a data.frame object depending on the returning argument
}
\description{
This function implements several filter methods to reduce a potentially larget feature space.
}
\details{
This function implements filtering methods to reduce a potential feature space.
         Most filtering methods use bivariate or multivariate statistical metrics to
         sort out irrelevant features. Hence, the methods are pretty straight forward.
         Currently, there are two methods implemented in this function.
         \itemize{
         \item Covariance - Correlation Filter
         \item Maximum Relevance Mininum Redundancy
         }
         The objective of the CC-Filter is to maximize the correlation to the target, while
         minimizing the collinearity within the feature space.
         MRMR is quite similar to the CC-Filter, however, it is an incremental filtering method,
         which tries to find mutually exclusive features by considering the joint probability density function.
         The method "mrmr" is a high-level wrapper for the functions implemented in \code{\link{mRMRe}}. For
         further details consider consider the documentation of \code{\link{mRMRe}} as well as 
         the referenced paper.
}
\examples{
\dontrun{
# Simulate Data
test_df <- sim_data()

# Correlation Collinearity Filter
test_cc <- featureFiltering(data = test_df,
                            target = "y",
                            method = "cc",
                            returning = "names")

# Maximum Relevance Minimum Redundancy Filter
test_mr <- featureFiltering(data = test_df,
                            target = "y",
                            method = "mrmr",
                            returning = "names")
}
}
