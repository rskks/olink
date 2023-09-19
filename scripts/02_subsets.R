library(OlinkAnalyze)
library(dplyr)
library(openxlsx)
library(ggplot2)

NPX_08_plasma <- NPX_08 %>%
     filter(Experiment == "Blood")
