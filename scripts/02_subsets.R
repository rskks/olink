library(OlinkAnalyze)
library(dplyr)
library(openxlsx)
library(ggplot2)

NPX_08_RNA <- NPX_08u %>%
     filter(Experiment == "Rna")
