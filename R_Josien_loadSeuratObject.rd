Une fois le dossier "sc_data_files" installé, les objets seurats téléchargés 
" ~ " est à remplacer par le path complet vers le dossier

Pour visualiser les data de rate sur scDissector, le script R est le suivant :

```
setwd("~/sc_data_files/")
library(scDissector)
ldm=load_seurat_rds("~/seur2_RatSpleenMNP_18pcs.rds",model_name = "supergut_190111", 
                    clustering_data_path = "~/sc_data_files/")

run_scDissector(preloaded_data=ldm, clustering_data_path = "C:/Users/E134321B/Desktop/Work stuff/Trebuchet/clust_gut_copy/")
```
