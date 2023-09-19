plot <- NPX_08_plasma %>%
 #CXCL5 boxplot
  olink_boxplot(variable = "SampleID", 
                olinkid_list = c("OID00520"),
                number_of_proteins_per_plot  = 1)
plot[[1]]