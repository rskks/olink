library(OlinkAnalyze)
library(dplyr)
library(openxlsx)
library(ggplot2)

#read Olink NPX data
NPX_08u <- read_NPX(file.choose())

mapping <- read.xlsx(file.choose())

NPX_08u <- NPX_08u %>%
  left_join(mapping, by = "SampleID")

#same for NPX09
NPX_09 <- read_NPX(file.choose())

mapping_09 <- read.xlsx(file.choose())

NPX_09 <- NPX_09 %>%
  left_join(mapping_09, by = "SampleID")
