library(OlinkAnalyze)
library(dplyr)
library(openxlsx)
library(ggplot2)

#read Olink NPX data
NPX_09 <- read_NPX(file.choose())

mapping <- read.xlsx(file.choose())

NPX_08u <- NPX_08u %>%
  left_join(mapping, by = "SampleID")
