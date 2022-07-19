Pour pouvoir utiliser ScDissector, il faut d'abord installer R et Rstudio

Les versions compatibles avec scDissector ne sont pas évidente, mais par exemple ça fonctionne sur R3.6.3 :

Windows : https://cran.r-project.org/bin/windows/base/old/3.6.3/R-3.6.3-win.exe

Mac : https://cran.r-project.org/bin/macosx/R-3.6.3.nn.pkg
Pour la dernière version : https://cran.r-project.org/bin/macosx/


Puis installer Rstudio, l'interface de codage :
https://rstudio.com/products/rstudio/download/#download


Une fois Rstudio ouvert, il faut installer les différents packages nécessaires à l'interface, le chargement d'objets et les dépendances de scDissector :

 ```
if (!requireNamespace("BiocManager",quietly=T))
  install.packages("BiocManager")

BiocManager::install('devtools')

library(devtools)
install.packages("Matrix.utils")
install_github("effiken/scDissector")
 ```
(scDissector provient du repository suivant : https://github.com/effiken/scDissector)

Pour faire fonctionner scDissector, il est existe différents fichiers dont des modèles pour clusteriser les cellules qui sont nécessaires :
```
scDiss_clus______ samples.csv
         |_______ model_NAME.rd
         |_______ model_NAME_cluster_set.txt  (optionnel)
         |_______ model_NAME_order.txt        (optionnel)
         |_______ model_NAME_annots.txt       (optionnel)
         |_______ model_versions.csv
         |_______ sample_sets.txt             (optionnel)
         |_______ n*( objects.rd)
         |_______ metadata _______sample_annots.csv

```



NOTE : 

Si il y a besoin d'une version Seurat, on peut l'installer comme suit :
/!\ L'installation de Seurat peut être très longue
```
BiocManager::install('igraph')
devtools::install_version(package = 'Seurat', version = package_version('3.2.1'))
``` 
