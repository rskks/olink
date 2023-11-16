library(OlinkAnalyze)
library(dplyr)
library(openxlsx)
library(ggplot2)

NPX_08_plasma <- NPX_08u %>%
     filter(Experiment == "Blood")

NPX_09_S <- NPX_09 %>%
  filter(Subset == "S")

NPX_09_EV <- NPX_09 %>%
  filter(Subset == "EV")

NPX_09_EX <- NPX_09 %>%
  filter(Subset == "EX")

NPX_09_Plasma <- NPX_09 %>%
  filter(Source == "plasma")

NPX_09_IF <- NPX_09 %>%
  filter(Source == "interst flu")
