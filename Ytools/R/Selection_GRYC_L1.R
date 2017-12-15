# Selection of a list of genes by GRYC annotation with a list of terms
#
# This is a function named 'Selection_GRYC_L1'
#

Selection_GRYC_L1 <- function(Annotation_table,
                              Primary_ID_column,
                              Standard_name_column,
                              Description_column,
                              Feature_column,
                              GRYC_Table,
                              GRYC_locus_tag = "locus_tag",
                              GRYC_note = "GRYC_note",
                              list_term){
  # Initialisation table
  Table_selection_GRYC <- NULL

  # Table de compatage
  TC_GRYC <- rep(0, length(list_term))
  names(TC_GRYC) <- list_term

  for (i in 1:nrow(GRYC_Table)){
    for (t in list_term){
      if (length(grep(t, as.character(GRYC_Table[i, GRYC_note]),
                     ignore.case = T) != 0)){

        pos_inter <- which(Annotation_table[Feature_column] ==
                            as.character(GRYC_Table[i, GRYC_locus_tag]))

        if (length(pos_inter) != 0 ){
          inter <- NULL

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
          inter <- c(inter, as.character(GRYC_Table[i, GRYC_note]))

          Table_selection_GRYC <- rbind(Table_selection_GRYC, inter)

          # Add +1 in comtage table
          TC_GRYC[t] <- TC_GRYC[t] + 1
        }

      }
    }
  }

  # Eliminate duplicated genes
  Table_selection_GRYC <-
    Table_selection_GRYC[!duplicated(Table_selection_GRYC[, 2]), ]

  # Preparation of Table_selection_GRYC
  Table_selection_GRYC <- as.data.frame(Table_selection_GRYC)

  for (i in 1: ncol(Table_selection_GRYC)){
    Table_selection_GRYC[, i] <- as.character(Table_selection_GRYC[, i])
  }

  colnames(Table_selection_GRYC) <- c("Standard_name", "Primary ID",
                                     "Mixed_name", "Position", "Description")

  rownames(Table_selection_GRYC) <- 1:nrow(Table_selection_GRYC)

  Table_selection_GRYC$Position <-
    as.numeric(as.character(Table_selection_GRYC$Position))

  # Return list with comtage table and table with selected genes
  return( list("Table_selection" = Table_selection_GRYC,
               "Table_count" = TC_GRYC))

}
