\name{GO_S_cerevisiae }
\alias{GO_S_cerevisiae }
\title{Get and read last GO term associated of S. cerevisiae}
\description{
1. Get the last version of S. cerevisiae GO term on SGD

2. Read this file

3. Rename columns

4. Get the last version of S. cerevisiae gene association on SGD

5. Gzip and read this file

6. Rename columns

7. Merge and select columns
}
\usage{
GO_S_cerevisiae(file_go_terms = NULL, file_gene_association = NULL)
}
\arguments{
\item{file_go_terms}{the name of the file which the Go term data are to be read from. By default = NULL}
\item{file_gene_association}{the name of the file which the association data are to be read from. The file format are .gz (default format in SGD). By default = NULL}
}
\value{
A dataframe with the last GO term of S.cerevisiae.
}
\examples{
# The last version
GO_S_cerevisiae()

# With a GO term file
GO_S_cerevisiae(file_go_terms = "path_file_go_terms")

# With a gene association file
GO_S_cerevisiae(file_gene_association = "path_file_gene_association")

}

