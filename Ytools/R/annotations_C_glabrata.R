# C. glabrata annotations
#
# This is a function named 'annotations_C_glabrata'
# which get and return the last annotation file of C. glabrata from CGD.
#

annotations_C_glabrata <- function(file_name = NULL){

  # Create a folder Data
  dir.create("Data", showWarnings = FALSE)

  if (is.null(file_name)){
    # Get the last version of annotation
    download.file(paste0("http://www.candidagenome.org/download/",
                         "chromosomal_feature_files/C_glabrata_CBS138/",
                         "C_glabrata_CBS138_current_chromosomal_feature.tab"),
                  destfile = "./Data/CGD_features_C_glabrata.tab",
                  method = "wget")

    # Read annotation file of S. cerevisiae
    annatation_CG <- read.csv("./Data/CGD_features_C_glabrata.tab", sep = "\t",
                             stringsAsFactors = F, quote = "", header = F,
                             skip = 8)
  } else {
    # Read annotation file of S. cerevisiae
    annatation_CG <- read.csv(file_name, sep = "\t", stringsAsFactors = F,
                             quote = "", header = F)
  }

  # Rename column
  colnames(annatation_CG) <- c("Feature name (mandatory)",
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
  return(annatation_CG)
}
