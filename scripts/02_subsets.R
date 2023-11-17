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

NPX_09_Snomedia <- NPX_09_S %>%
  filter(Prepost != "NA")

NPX_09_Patient1 <- NPX_09 %>%
  filter(Patient == "1")

NPX_09_Patient1noplasma <- NPX_09_Patient1 %>%
  filter(Subset != "plasma")

NPX_09_Patient1noplasmanodilution <- NPX_09_Patient1noplasma %>%
  filter(Dilution == "none")

NPX_09_Patient2noplasmanodilutionXplasma <- NPX_09_Patient2noplasmanodilutionX %>%
  filter(Source == "plasma")

NPX_09_PlasmaNVEP_12 <- rbind(NPX_09_Patient2noplasmanodilutionXplasma, NPX_09_Patient1noplasmanodilution)

NPX_09_PlasmaEVP <- NPX_09_Plasma %>%
  filter (Subset != "plasma")

NPX_09_PlasmaEVPnodilution <- NPX_09_PlasmaEVP %>%
  filter(Dilution =="none")

NPX_09_PlasmaEVP5 <- NPX_09_PlasmaEVP %>%
  filter(Dilution =="5")

NPX_09_PlasmaEVP25 <- NPX_09_PlasmaEVP %>%
  filter(Dilution =="25")

NPX_09_PlasmaEVP100 <- NPX_09_PlasmaEVP %>%
  filter(Dilution =="100")

NPX_09_PlasmaEVP2 <- NPX_09_PlasmaEVP %>%
  filter(Dilution !="100")

NPX_09_PlasmaEVP3 <- NPX_09_PlasmaEVP %>%
  filter(Dilution !="25")

NPX_09_PlasmaEVP_C <- NPX_09_PlasmaEVP3
NPX_09_PlasmaEVP_C$Combined <- paste(NPX_09_PlasmaEVP3$Patient, NPX_09_PlasmaEVP3$Subset, sep = "_")

NPX_09_PlasmaEVP_C2 <- NPX_09_PlasmaEVP_C
NPX_09_PlasmaEVP_C2$Combined <- paste(NPX_09_PlasmaEVP_C$Combined, NPX_09_PlasmaEVP3$Prepost, sep = "_")
