\name{standard_name_SC}
\alias{standard_name_SC}
\title{Get standard names of S. cerevisiae}
\description{
Get standard names of S. cerevisiae from the SGD annotation table.
}
\usage{
standard_name_SC(annatations_SC, column_name = "Standard gene name (optional)")
}
\arguments{
\item{annatations_SC}{A table with the annotation of S. cerevisiae. By debault, the column name format is that of SGD.}
\item{column_name}{Name column containing standard names. By debault,"Standard gene name (optional)" like in SGD annotation table.}
}
\value{
A vector with standard names of S. cerevisiae
}
\examples{
# Get the last annotations
annatations_SC = annotations_S_cerevisiae()

# Get the standard names
standard_name_SC(annatations_SC)
}

