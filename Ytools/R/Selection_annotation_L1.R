# Selection of a list of genes by annotation with a list of terms
#
# This is a function named 'Selection_Annotations_L1 '
#

Selection_Annotations_L1 <- function(Annotation_table, Primary_ID_column,
                                     Standard_name_column, Description_column,
                                     list_term){
  # Initialisation table
  Tableau_selection_annotations <- NULL

  # Table de compatage
  TC_annot <- rep(0, length(list_term))
  names(TC_annot) <- list_term

  for (i in 1:nrow(Annotation_table)){
    for (t in list_term){
      if (length(grep(t, as.character(Annotation_table[i, Description_column]),
                     ignore.case = T) != 0)){

        # Initialisation
        inter <- NULL

        # Add feature and standard
        inter <- c(Annotation_table[i, Standard_name_column],
                  Annotation_table[i, Primary_ID_column])

        # Add mixed name
        if (Annotation_table[i, Standard_name_column] == ""){
          inter <- c(inter, Annotation_table[i, Primary_ID_column])
        }else{
          inter <- c(inter, Annotation_table[i, Standard_name_column])
        }

        # Add position
        inter <- c(inter, i)

        # Add description
        inter <- c(inter, as.character(Annotation_table[i, Description_column]))

        Tableau_selection_annotations <- rbind(Tableau_selection_annotations,
                                              inter)

        # Add +1 in comtage table
        TC_annot[t] <- TC_annot[t] + 1

      }
    }
  }

  # Eliminate duplicated genes
  Tableau_selection_annotations <-
  Tableau_selection_annotations[!duplicated(Tableau_selection_annotations[, 2])
                                , ]

  # Preparation of Tableau_selection_annotations
  Tableau_selection_annotations <- as.data.frame(Tableau_selection_annotations)

  for (i in 1: ncol(Tableau_selection_annotations)){
    Tableau_selection_annotations[, i] <-
    as.character(Tableau_selection_annotations[, i])
  }

  colnames(Tableau_selection_annotations) <- c("Standard_name", "Primary ID",
                                              "Mixed_name", "Position",
                                              "Description")

  rownames(Tableau_selection_annotations) <-
                                          1:nrow(Tableau_selection_annotations)

  Tableau_selection_annotations$Position <-
                as.numeric(as.character(Tableau_selection_annotations$Position))

  # Return list with comtage table and table with selected genes
  return( list("Table_selection" = Tableau_selection_annotations,
               "Table_count" = TC_annot))

}
