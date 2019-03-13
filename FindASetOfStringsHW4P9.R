# Find all the San and Santa s in the file

library(tidyverse)
library(readxl)
loc <- read_excel("data/ca_ozone/location.xls")
# define loc as the excel file
loc
# check that it's what it's supposed to  be

San <- c("Santa", "San")
# define variables that will be looked for
San_tas <- str_c(San, collapse = "|")
AllSans <- str_subset(loc$'Site Name', San_tas)
# find the sites in the excel (asigned as loc above) in the Site Name that has a San or Santa
AllSans
# show me what happened
