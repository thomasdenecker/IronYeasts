# C. albicans annotations
#
# This is a function named 'annotations_C_albicans'
# which get and return the last annotation file of C. albicans from CGD.
#

annotations_C_albicans <- function(file_name = NULL){

  # Create a folder Data
  dir.create("Data", showWarnings = FALSE)

  if (is.null(file_name)){
    # Get the last version of annotation

    download.file(url = paste0("http://www.candidagenome.org/download/",
                  "chromosomal_feature_files/C_albicans_SC5314/",
                  "C_albicans_SC5314_A22_current_chromosomal_feature.tab"),
                  destfile = "./Data/CGD_features_C_albicans.tab",
                  method = "wget")

    # Read annotation file of S. cerevisiae
    annatation_CA <- read.csv("./Data/CGD_features_C_albicans.tab", sep = "\t",
                             stringsAsFactors = F, quote = "",
                             header = F, skip = 8)
  } else {
    # Read annotation file of S. cerevisiae
    annatation_CA <- read.csv(file_name, sep = "\t",
                             stringsAsFactors = F, quote = "", header = F)
  }

  # Rename column
  colnames(annatation_CA) <- c("Feature name (mandatory)",
                              "Gene name (locus name)",
                              "Aliases (multiples separated by |)",
                              "Feature type",
                              "Chromosome",
                              "Start Coordinate",
                              "Stop Coordinate",
                              "Strand",
                              "Primary CGDID",
                              "Secondary CGDID (if any)",
                              "Description",
                              "Date Created",
                              "Sequence Coordinate Version Date (if any)",
                              "Blank",
                              "Blank",
                              "Date of gene name reservation (if any).",
                              paste0("Has the reserved gene name",
                                     " become the standard name? (Y/N)"),
                              paste0("Name of S. cerevisiae ortholog(s) ",
                                     "(multiples separated by |)"))

  # return a dataframe
  return(annatation_CA)
}
