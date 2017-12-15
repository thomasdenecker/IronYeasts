\name{Selection_Annotations_L1}
\alias{Selection_Annotations_L1}
\title{Selection of a list of genes by annotation with a list of terms}
\description{
Selection of a list of genes by annotation with a list of terms
}
\usage{

Selection_Annotations_L1(Annotation_table, Primary_ID_column,
                         Standard_name_column, Description_column
                         list_term)
}
\arguments{
\item{Annotation_table}{A table with the annotation of S. cerevisiae, C. albicans or C. glabrata.}
\item{Primary_ID_column}{Name column containing the primary ID. For exemple, "Primary SGDID (mandatory)" in standard SGD annotation table.}
\item{Standard_name_column}{Name column containing the standard name. For exemple, "Standard gene name (optional)" in standard SGD annotation table.}
\item{Description_column}{Name column containing the description. For exemple, "Description (optional)" in standard SGD annotation table.}
\item{list_term}{Name column containing the description. For exemple, a list of MESH term.}
}
\value{
A list with 2 objects :
\item{Table_selection}{Table with 5 column : "Standard_name", "Primary ID", "Mixed_name", "Position" (line position in Annotation_table) and "Description".}
\item{Table_count}{A vector with occurences of each terms}
}
\examples{
# Annotation selection for S. cerevisiae
Tableau_selection_annotations_SC = Selection_Annotations_L1(
  Annotation_table = annotations_SC,
  Primary_ID_column = "Primary SGDID (mandatory)",
  Standard_name_column = "Standard gene name (optional)",
  Description_column = "Description (optional)",
  list_term = list_term
)

}

