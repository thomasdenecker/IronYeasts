# Selection of a list of genes by GO with a list of terms
#
# This is a function named 'Selection_Annotations_L1 '
#

Selection_GO_L1 <- function(Annotation_table, Primary_ID_column,
                            Standard_name_column, Description_column,
                            GO_Table, GO_Description_column = "Description",
                            GO_DB_Object_ID = "DB_Object_ID",
                            list_term){

  # Table de compatage
  TC_GO <- rep(0, length(list_term))
  names(TC_GO) <- list_term

  # Initialisation table
  Tableau_selection_GO <- NULL
  for (i in 1:nrow(GO_Table)){
    for (t in list_term){
      if (length(grep(t, as.character(GO_Table$Description[i]),
                     ignore.case = T)) != 0){
        if (length(which(Annotation_table[Primary_ID_column] ==
                        GO_Table[i, GO_DB_Object_ID])) != 0 ){

          inter <- NULL
          pos_inter <- which(Annotation_table[Primary_ID_column] ==
                              GO_Table[i, GO_DB_Object_ID])

          # Add feature and standard
          inter <- c(Annotation_table[pos_inter, Standard_name_column],
                    Annotation_table[pos_inter, Primary_ID_column])

          # Add mixed name
          if (Annotation_table[pos_inter, Standard_name_column] == ""){
            inter <- c(inter, Annotation_table[pos_inter, Primary_ID_column])
          }else{
            inter <- c(inter, Annotation_table[pos_inter, Standard_name_column])
          }

          # Add position
          inter <- c(inter, pos_inter)

          # Add GO description
          inter <- c(inter, as.character(GO_Table[i, GO_Description_column]))

          Tableau_selection_GO <- rbind(Tableau_selection_GO, inter)

          # Add +1 in comtage table
          TC_GO[t] <- TC_GO[t] + 1
        }
      }
    }
  }

  # Eliminate duplicated genes
  Tableau_selection_GO <-
    Tableau_selection_GO[!duplicated(Tableau_selection_GO[, 2]), ]

  # Preparation of Tableau_selection_GO
  Tableau_selection_GO <- as.data.frame(Tableau_selection_GO)
  for (i in 1: ncol(Tableau_selection_GO)){
    Tableau_selection_GO[, i] <- as.character(Tableau_selection_GO[, i])
  }
  colnames(Tableau_selection_GO) <- c("Standard_name", "Primary ID",
                                     "Mixed_name", "Position", "GO description")
  rownames(Tableau_selection_GO) <- 1:nrow(Tableau_selection_GO)
  Tableau_selection_GO$Position <- as.numeric(Tableau_selection_GO$Position)

  # Return list with comtage table and table with selected genes
  return(list("Table_selection" = Tableau_selection_GO, "Table_count" = TC_GO))

}
