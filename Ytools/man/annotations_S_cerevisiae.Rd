\name{annotations_S_cerevisiae}
\alias{annotations_S_cerevisiae}
\title{Get the last annotations of S. cerevisiae on SGD}
\description{
1. Get the last version of S. cerevisiae annotations on SGD

2. Read this file

3. Rename column
}
\usage{
annotations_S_cerevisiae(file_name = NULL)
}
\arguments{
\item{file_name}{the name of the file which the data are to be read from. By default = NULL}
}
\value{
A dataframe with the last annotation of S.cerevisiae.
}
\examples{
# The last version
annotations_S_cerevisiae()

# With a personnal file
annotations_S_cerevisiae(file_name = "name_file")
}

