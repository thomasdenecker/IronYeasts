\name{Selection_GRYC_L1 }
\alias{Selection_GRYC_L1 }
\title{Selection of a list of genes by GO descriptio, with a list of terms}
\description{
Selection of a list of genes by GO description with a list of terms
}
\usage{

Selection_GRYC_L1 ( Annotation_table,
                    Primary_ID_column,
                    Standard_name_column,
                    Description_column,
                    Feature_column,
                    GRYC_Table,
                    GRYC_locus_tag = "locus_tag",
                    GRYC_note = "GRYC_note",
                    list_term)
}
\arguments{
\item{Annotation_table}{A table with the annotation of S. cerevisiae, C. albicans or C. glabrata.}
\item{Primary_ID_column}{Name column containing the primary ID. For exemple, "Primary SGDID (mandatory)" in standard SGD annotation table.}
\item{Standard_name_column}{Name column containing the standard name. For exemple, "Standard gene name (optional)" in standard SGD annotation table.}
\item{Description_column}{Name column containing the description. For exemple, "Description (optional)" in standard SGD annotation table.}
\item{Feature_column}{Name column containing the feature name. For exemple, "Feature name (optional)" in standard SGD annotation table (i.e : YLR057W).}
\item{GRYC_table}{A table with association Feature gene name/GRYC note of S. cerevisiae, C. albicans or C. glabrata.}
\item{GRYC_note}{Name column containing the GRYX description. By default "GRYC_note"}
\item{GRYC_locus_tag}{Name column containing the feature gene name. By default "GRYC_note"}
\item{list_term}{Name column containing the description. For exemple, a list of MESH term.}
}
\value{
A list with 2 objects :
\item{Table_selection}{Table with 5 column : "Standard_name", "Primary ID", "Mixed_name", "Position" (line position in Annotation_table) and "Description".}
\item{Table_count}{A vector with occurences of each terms}
}
\examples{
# GRYC selection for S. cerevisiae
GRYC_SG = Selection_GRYC_L1(Annotation_table = annotations_SC,
                            Primary_ID_column = "Primary SGDID (mandatory)",
                            Standard_name_column = "Standard gene name (optional)",
                            Description_column = "Description (optional)",
                            Feature_column = "Feature name (optional)",
                            GRYC_Table = GRYC_SC,
                            list_term = list_term)

Table_selection_GRYC_SG = GRYC_SG$Table_selection
TC_GRYC_SG = GRYC_SG$Table_count
}
