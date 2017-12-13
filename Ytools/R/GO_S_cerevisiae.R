# Get and read last GO term associated of S. cerevisiae
#
# This is a function named 'GO_S_cerevisiae'
# which get and return the last annotation file of S. cerevisiae from SGD.
#

GO_S_cerevisiae <- function(file_go_terms = NULL, file_gene_association = NULL){

  # Create a folder Data
  dir.create("Data", showWarnings = FALSE)

  #--------------------------------------------------
  # GO TERM term
  #--------------------------------------------------

  if (is.null(file_go_terms)){

    # Get the last version of GO term
    download.file(url = paste0("https://downloads.yeastgenome.org/curation/",
                               "literature/go_terms.tab"),
                  destfile = "./Data/SC_go_terms.tab",
                  method = "wget")

    # Read GO term file
    go_term <- read.csv("./Data/SC_go_terms.tab", sep = "\t",
                       stringsAsFactors = F, header = F)

  }else{

    # Read GO term file
    go_term <- read.csv(file_go_terms, sep = "\t", stringsAsFactors = F,
                       header = F)

  }

  # Rename colnames
  colnames(go_term) <- c("GO ID", "Term", "Aspect", "Description")

  # Rename GO ID to match with standard
  for (i in 1:nrow(go_term)){
    go_term$`GO ID`[i] <- paste0("GO:",
                                paste(rep(0, (7 - nchar(go_term$`GO ID`[i]))),
                                      collapse = ""),
                                go_term$`GO ID`[i])
  }

  #--------------------------------------------------
  # Association GO TERM and SGD ID
  #--------------------------------------------------

  if (is.null(file_gene_association)){

    # Get the last version of association ID and GO term
    download.file(url = paste0("https://downloads.yeastgenome.org/curation/",
                               "literature/gene_association.sgd.gz"),
                  destfile = "./Data/SC_gene_association.sgd.gz",
                  method = "wget")

    # Read association file
    association_SC <- read.table(gzfile("./Data/SC_gene_association.sgd.gz"),
                                sep = "\t", stringsAsFactors = F, skip = 8,
                                quote = "")

  }else {

    # Read association file
    association_SC <- read.table(gzfile(file_gene_association),
                                sep = "\t", stringsAsFactors = F,
                                skip = 8, quote = "")

  }

  # Rename column of association table
  colnames(association_SC) <- c("DB", "DB_Object_ID", "DB_Object_Symbol",
                               "NOT", "GO ID", "DB:Reference(|DB:Reference)",
                               "Evidence", "With (or) From", "Aspect",
                               "DB_Object_Name(|Name)",
                               "DB_Object_Synonym(|Synonym)",
                               "DB_Object_Type", "taxon(|taxon)",
                               "Date", "Assigned_by")

  # Maintain only GO ID and SGD ID
  association_SC <- as.data.frame(association_SC[, c(2, 5)])

  #--------------------------------------------------
  # Association SGD ID, GO Term and Go description
  #--------------------------------------------------
  go_SC_all <- merge(association_SC, go_term, by = "GO ID" )

  return(go_SC_all)
}
