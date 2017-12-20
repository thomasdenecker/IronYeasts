# Get and read last GO term associated in CGD
#
# Organism 1: Candida albicans SC5314, genome version: A22-s07-m01-r42,
#             taxon: 5476
# Organism 2: Candida glabrata CBS138, genome version: s02-m07-r19,
#             taxon: 5478
# Organism 3: Candida parapsilosis CDC317, genome version: s01-m03-r23,
#             taxon: 5480
# Organism 4: Candida dubliniensis CD36, genome version: s01-m02-r13,
#             taxon: 42374
# Organism 5: Candida orthopsilosis Co 90-125, taxon: 1136231
# Organism 6: Debaryomyces hansenii CBS767, taxon: 284592
# Organism 7: Candida albicans WO-1, taxon: 294748
# Organism 8: Lodderomyces elongisporus NRLL YB-4239, taxon: 379508
# Organism 9: Candida tropicalis MYA-3404, taxon: 294747
# Organism 10: Candida lusitaniae ATCC 42720, taxon: 306902
# Organism 11: Candida guilliermondii ATCC 6260, taxon: 294746
#
# This is a function named 'GO_CGD'
# which get and return the last GO term file from SGD.
#

GO_CGD <- function(file_go_terms = NULL){

  # Create a folder Data
  dir.create("Data", showWarnings = FALSE)

  #--------------------------------------------------
  # GO TERM term
  #--------------------------------------------------

  if (is.null(file_go_terms)){

    # Get the last version of GO term
    download.file(url = paste0("http://www.candidagenome.org/download/go/",
                               "gene_association.cgd.gz"),
                  destfile = "./Data/CGD_go_terms.cgd.gz",
                  method = "wget")

    # Read GO term file
    go_term <- read.csv(gzfile("./Data/CGD_go_terms.cgd.gz"), sep = "\t",
                       stringsAsFactors = F, header = F, skip = 18)

  }else{
    # Read GO term file
    go_term <- read.csv(gzfile(file_go_terms), sep = "\t", stringsAsFactors = F,
                       header = F, skip = 18)
  }

  # Rename colnames
  colnames(go_term) <- c("DB",
                        "DB_Object_ID",
                        "DB_Object_Symbol",
                        "Qualifier",
                        "GO ID",
                        "DB:Reference(|DB:Reference)",
                        "Evidence",
                        "With (or) From",
                        "Aspect",
                        "DB_Object_Name(|Name)",
                        "DB_Object_Synonym(|Synonym)",
                        "DB_Object_Type",
                        "taxon(|taxon)",
                        "Date",
                        "Assigned_by")

  # Download and prepare last GO annotation
  system("pipenv run python formater.py --go -o ./Data/GO/GO_with_def")

  # Read last GO annotation
  GO_DEF <- read.csv("./Data/GO/GO_with_def.txt", header = T, sep = "\t")
  colnames(GO_DEF) <- c("GO ID", "Term", "Description")

  GO_final <- merge(go_term, GO_DEF, by = "GO ID" )

  return(GO_final)
}
