if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("DECIPHER")
a
packageVersion("DECIPHER")

library('htmltools')
library('DECIPHER')
PF00009 <- readAAStringSet('PF00009.afa')
BrowseSeqs(PF00009, htmlFile = 'PF00009.html', openURL = FALSE)
includeHTML('./PF00009.html')
