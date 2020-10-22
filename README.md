### Adapter les matrices de sortie cellranger à scDissector

#### 1e étape : Télécharger le .zip du repository https://github.com/effiken/martin_et_al_cell_2019 , le dézipper

Il y a de petites adaptations à apporter aux fichiers :
Par exemple, je garde le dossier dézippé dans mon dossier de téléchergements (D:/Users/Thomas/Telechargement/martin_et_al_cell_2019-master )

- Aller dans le fichier umitab_utils.r
D:/Users/Thomas/Telechargement/martin_et_al_cell_2019-master/clustering/scripts/umitab_utils.r
A la fin, ligne 726, il faut remplacer le path personnel d'Effi par le tien

`human_ensmbl_to_geneSymbol_converter=function(ensembl_ids,table_path='/Users/kenige01/Documents/GitHub/scClustering/gene_id_converters/ensembl.txt'){`

Pour moi ça donne donc :
`human_ensmbl_to_geneSymbol_converter=function(ensembl_ids,table_path='D:/Users/Thomas/Telechargement/martin_et_al_cell_2019-master/clustering/gene_id_converters/ensembl.txt'){`


- Aller dans le fichier compile_data.r
D:/Users/Thomas/Telechargement/martin_et_al_cell_2019-master/clustering/scripts/compile_data.r
Au tout début, ligne 1, il faut remplacer le path personnel d'Effi par le tien

`source("~/Documents/Github/scClustering/umitab_utils.r")`

Pour moi ça donne donc :
`source("D:/Users/Thomas/Telechargement/martin_et_al_cell_2019-master/clustering/scripts/umitab_utils.r")`

***

#### 2e étape : Télécharger les fichiers d'output de cellranger count (le plus courant pour le single cell)
On doit avoir 3 fichiers :  matrix.mtx / barcodes.tsv / genes.tsv (cellranger V2) ou features.tsv (cellranger V3) 
Cellranger créée 2 output lors de l'alignement, un dossier nommé "raw_feature_bc_matrix" , l'autre "filtered_feature_bc_matrix" où un premier filtrage (un peu obscur) a déjà été fait par cellranger. Effi préfère utiliser les fichiers "raw" sur scDissector, mais bien souvent il n'y a que la sortie "filtered" qui est disponible sur les sites comme GEO
Il faut mettre ces fichiers dans un dossier nommé "Raw" ou "Filtered" selon l'origine, et qu'ils soient dézippés.
Le tout est mis dans un dossier (ici identifié Projet1) et en plus un dossier qui servira de sortie (ici outProjet1)

####

/Projet1   
⠀⠀⠀|___ /Filtered   
⠀⠀⠀⠀⠀⠀⠀⠀⠀|___ matrix.mtx  
⠀⠀⠀⠀⠀⠀⠀⠀⠀|___ barcodes.tsv  
⠀⠀⠀⠀⠀⠀⠀⠀⠀|___ features.tsv  
/outProjet1  


***

#### 3e étape : Transformation en objet.rd lisible par scDissector 
sur R, à adapter avec ton path, si par exemple le /Projet1 est dans D:/singlecell/ ça donne :

`source("D:/Users/Thomas/Telechargement/martin_et_al_cell_2019-master/clustering/scripts/umitab_utils.r")
source("D:/Users/Thomas/Telechargement/martin_et_al_cell_2019-master/clustering/scripts/compile_data.r")
compile_data(sample_IDs="Projet1" ,input_path="D:/singlecell/",output_path="D:/singlecell/outProjet1",filtered_or_raw="filtered")`

Si tu as plusieurs datasets à transformer en même temps :

`source("D:/Users/Thomas/Telechargement/martin_et_al_cell_2019-master/clustering/scripts/umitab_utils.r")
source("D:/Users/Thomas/Telechargement/martin_et_al_cell_2019-master/clustering/scripts/compile_data.r")
my_levels<-c("Projet1","Projet2","Projet3")
for( i in my_levels){
  compile_data(sample_IDs=as.vector(i) ,input_path="D:/singlecell/",output_path=paste0("D:/singlecell/out",i,sep=""),filtered_or_raw="filtered")
}
`
***

#### 4e étape : ajouter l'objet.rd au reste
prendre le Projet1.rd dans outProjet1 et le déposer dans le dossier avec les modèles de clustering
Ajouter son nom aux fichiers samples.csv et /metadata/sample_annots.csv

L'objet peut maintenant être reconnu par ScDissector, une fois lancé sur R
`library(scDissector)
run_scDissector()`

