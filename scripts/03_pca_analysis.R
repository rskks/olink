# t-test npx_data1
ttest_results_NPX08_RNA2 <- olink_ttest(df = NPX_08_RNA2,
                                  variable = "Treatment")

# select names of the top #40 most significant proteins
ttest_sign_NPX08_RNA_RNAse <- ttest_results_NPX08_RNA_RNAse %>%
  head(n=50) %>%
  pull(OlinkID)
  
  

# volcano plot with annotated top #20 most significant proteins
olink_volcano_plot(p.val_tbl = ttest_results_NPX08_RNA_RNAse,
                   olinkid_list = ttest_sign_NPX08_RNA_RNAse) +
  scale_color_manual(values = c('turquoise3', 'red'))

# subset PCA
# Filter the data to include only "Healthy" and "CRC" subsets
Subset_filter <- c("Healthy","CRC")
filtered_data <- NPX_08_plasma %>%
  filter(Subset %in% Subset_filter)

# Perform the t-test on the filtered data
ttest_results_filtered <- olink_ttest(df = filtered_data, variable = "Subset")

# Select names of the top #10 most significant proteins
ttest_sign_filtered_plasma <- ttest_results_filtered %>%
  head(n = 10) %>%
  pull(OlinkID)

# Create a volcano plot with annotated top #20 most significant proteins
olink_volcano_plot(p.val_tbl = ttest_results_filtered,
                   olinkid_list = ttest_sign_filtered_plasma,
                   ) +
  scale_color_manual(values = c('turquoise3', 'red'))

# PCA plot
NPX_09_PlasmaEVP100 %>%
       filter(!str_detect(SampleID, 'CONTROL_SAMPLE')) %>% 
       olink_pca_plot(df = .,              
                       label_samples = TRUE, color_g = "QC_Warning")  
