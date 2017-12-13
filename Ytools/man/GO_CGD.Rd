\name{GO_CGD}
\alias{GO_CGD }
\title{Get and read last GO term associated of CGD}
\description{
1. Get the last version from SGD

2. Gzip and read this file

3. Rename columns

4. Return table

The yeasts concerned are:

- Organism 1: Candida albicans SC5314, genome version: A22-s07-m01-r42, taxon: 5476

- Organism 2: Candida glabrata CBS138, genome version: s02-m07-r19, taxon: 5478

- Organism 3: Candida parapsilosis CDC317, genome version: s01-m03-r23, taxon: 5480

- Organism 4: Candida dubliniensis CD36, genome version: s01-m02-r13, taxon: 42374

- Organism 5: Candida orthopsilosis Co 90-125, taxon: 1136231

- Organism 6: Debaryomyces hansenii CBS767, taxon: 284592

- Organism 7: Candida albicans WO-1, taxon: 294748

- Organism 8: Lodderomyces elongisporus NRLL YB-4239, taxon: 379508

- Organism 9: Candida tropicalis MYA-3404, taxon: 294747

- Organism 10: Candida lusitaniae ATCC 42720, taxon: 306902

- Organism 11: Candida guilliermondii ATCC 6260, taxon: 294746
}
\usage{
GO_CGD(file_go_terms = NULL)
}
\arguments{
\item{file_go_terms}{the name of the file which the Go term data are to be read from. By default = NULL}
}
\value{
A dataframe with the last GO term from CGD.
}
\examples{
# The last version
GO_CGD()

# With a GO term file
GO_CGD(file_go_terms = "path_file_go_terms")
}

