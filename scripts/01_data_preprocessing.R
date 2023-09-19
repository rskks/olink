library(OlinkAnalyze)
library(dplyr)
library(openxlsx)
library(ggplot2)

#read Olink NPX data
NPX_08 <- read_NPX(file.choose())

mapping <- read.xlsx(file.choose())

NPX_08 <- NPX_08 %>%
  left_join(mapping, by = "SampleID")
