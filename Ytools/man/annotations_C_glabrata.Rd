\name{annotations_C_glabrata}
\alias{annotations_C_glabrata}
\title{Get the last annotations of C. glabrata on CGD}
\description{
1. Get the last version of C. glabrata annotations on CGD

2. Read this file

3. Rename column
}
\usage{
annotations_C. glabrata(file_name = NULL)
}
\arguments{
\item{file_name}{the name of the file which the data are to be read from. By default = NULL}
}
\value{
A dataframe with the last annotation of C. glabrata.
}
\examples{
# The last version
annotations_C_glabrata()

# With a personnal file
annotations_C_glabrata(file_name = "name_file")
}

