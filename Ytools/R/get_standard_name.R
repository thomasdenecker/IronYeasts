# Get standard names of S. cerevisiae
#
# This is a function named 'standard_name_SC'
# which get stadard names of S. cerevisiae from SGD.
#

standard_name_SC <- function(annatations_SC,
                             column_name = "Standard gene name (optional)"){

  Standard_name_SC <- annatations_SC[, column_name]
  Standard_name_SC <- Standard_name_SC[!is.na(Standard_name_SC)]
  Standard_name_SC <- Standard_name_SC[!(Standard_name_SC == "")]

  return(Standard_name_SC)
}
