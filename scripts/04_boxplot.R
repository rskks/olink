plot <- NPX_08_plasma %>%
 #CXCL5 boxplot
  olink_boxplot(variable = "SampleID", 
                olinkid_list = c("OID00520"),
                number_of_proteins_per_plot  = 1)
plot[[1]]

  #Several proteins - CXCL5 + IL6

plot <- NPX_08_plasma %>%
  olink_boxplot(variable = "Subset", 
                olinkid_list = c("OID00520", "OID00666"),
                number_of_proteins_per_plot = 2)

plot[[1]]

  #All significant from the latest ttest
plot <- NPX_08_plasma %>%
  olink_boxplot(variable = "Subset", 
                olinkid_list = ttest_sign_Plasma,
                number_of_proteins_per_plot = length(ttest_sign_Plasma))

plot[[1]]

  #With ANOVA posthoc results

plot <- NPX_08_plasma %>%
       olink_boxplot(variable = "Subset", 
                                         olinkid_list = c("OID00520", "OID00666"),
                                         number_of_proteins_per_plot = 2,
                                         posthoc_results = anova_posthoc_oneway_results)
plot[[1]]

  #Change order
custom_subset_order_blood <- c ("Untreated", "LPS", "Healthy", "CRC", "Healthy no cells", "CRC no cells")
NPX_08_plasma$Subset <- factor(NPX_08_plasma$Subset, levels = custom_subset_order_blood)


  #With ANOV lmer posthoc results
plot <- NPX_08_plasma %>%
       olink_boxplot(variable = "Subset", 
                                         olinkid_list = c("OID00520", "OID00666"),
                                         number_of_proteins_per_plot = 2,
                                         posthoc_results = lmer_posthoc_twoway_results)
plot[[1]]

