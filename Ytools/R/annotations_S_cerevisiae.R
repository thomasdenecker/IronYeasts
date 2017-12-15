# S. cerevisiae annotations
#
# This is a function named 'annotations_S_cerevisiae '
# which get and return the last annotation file of S. cerevisiae from SGD.
#

annotations_S_cerevisiae <- function(file_name = NULL){

  # Create a folder Data
  dir.create("Data", showWarnings = FALSE)

  if (is.null(file_name)){
    # Get the last version of annotation
    download.file(url = paste0("https://downloads.yeastgenome.org/curation/",
                               "chromosomal_feature/SGD_features.tab"),
                  destfile = "./Data/SGD_features.tab",
                  method = "wget")

    # Read annotation file of S. cerevisiae
    annatation_SC <- read.csv("./Data/SGD_features.tab", sep = "\t",
                             stringsAsFactors = F, quote = "", header = F)
  } else {
    # Read annotation file of S. cerevisiae
    annatation_SC <- read.csv(file_name, sep = "\t", stringsAsFactors = F,
                             quote = "", header = F)
  }

  # Rename column
  colnames(annatation_SC) <- c("Primary SGDID (mandatory)",
                             "Feature type (mandatory)",
                             "Feature qualifier (optional)",
                             "Feature name (optional)",
                             "Standard gene name (optional)",
                             "Alias (optional, multiples separated by |)",
                             "Parent feature name (optional)",
                             paste0("Secondary SGDID (optional, multiples ",
                                    "separated by |)"),
                             "Chromosome (optional)",
                             "Start_coordinate (optional)",
                             "Stop_coordinate (optional)",
                             "Strand (optional)",
                             "Genetic position (optional)",
                             "Coordinate version (optional)",
                             "Sequence version (optional)",
                             "Description (optional)")
  # return a dataframe
  return(annatation_SC)
}
