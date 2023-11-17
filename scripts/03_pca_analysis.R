# t-test npx_data1
ttest_results_NPX09_PlasmaEVPnodilution <- olink_ttest(df = NPX_09_PlasmaEVPnodilution,
                                  variable = "Prepost")

# select names of the top #40 most significant proteins
ttest_sign_NPX09_PlasmaEVPnodilution <- ttest_results_NPX09_PlasmaEVPnodilution %>%
  head(n=50) %>%
  pull(OlinkID)
  
  

# volcano plot with annotated top #20 most significant proteins
olink_volcano_plot(p.val_tbl = ttest_results_NPX09_PlasmaEVPnodilution,
                   olinkid_list = ttest_sign_NPX09_PlasmaEVPnodilution) +
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
