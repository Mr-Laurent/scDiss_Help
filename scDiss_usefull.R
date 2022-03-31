
gn<-unlist(strsplit(c("XXX1,XXX2,XXX3,XXX4"),split=","))
setdiff(gn,rownames(ldm$dataset$umitab))
paste(intersect(gn,rownames(ldm$dataset$umitab)),collapse=",")


library(scDissector)
load('G:/Mon\ Drive/clustering_data_gut/ldmSupergutOct21.rd')
run_scDissector(preloaded_data = ldm2, clustering_data_path = "G:/Mon\ Drive/clustering_data_gut/")

load('G:/Mon\ Drive/UG_metacells/SupGut_11marV2_Local_Metacells_mc.rd')
run_scDissector(preloaded_data = ldm, clustering_data_path = "G:/Mon Drive/UG_metacells/")
