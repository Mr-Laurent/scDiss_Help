# scDiss_Help

Load an ldm (pre-loaded) object : 

setwd("C:/Path/To/scDissectorFolder/")
library(scDissector)
load("ldmMNPaddendum.rd")
run_scDissector(preloaded_data = ldm, clustering_data_path = "C:/Path/To/scDissectorFolder")

