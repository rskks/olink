library(OlinkAnalyze)
library(dplyr)
library(openxlsx)
library(ggplot2)

#read Olink NPX data
NPX_08 <- read_NPX(filename = "/Users/olegtutanov/Documents/Programming/Olink/data/082023_NPX3.xlsx")

mapping <- read.xlsx(file.choose())

NPX_08 <- NPX_08 %>%
  left_join(mapping, by = "SampleID")