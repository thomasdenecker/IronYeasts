\name{annotations_C_albicans}
\alias{annotations_C_albicans}
\title{Get the last annotations of C. albicans on CGD}
\description{
1. Get the last version of C. albicans annotations on CGD

2. Read this file

3. Rename columns
}
\usage{
annotations_C_albicans(file_name = NULL)
}
\arguments{
\item{file_name}{the name of the file which the data are to be read from. By default = NULL}
}
\value{
A dataframe with the last annotation of C. albicans.
}
\examples{
# The last version
annotations_C_albicans()

# With a personnal file
annotations_C_albicans(file_name = "name_file")
}

