# t-test npx_data1
ttest_results_NPX1 <- olink_ttest(df = NPX_08_plasma,
                                  variable = "Treatment")

# select names of the top #20 most significant proteins
ttest_sign_NPX1 <- ttest_results_NPX1 %>%
  head(n=10) %>%
  pull(OlinkID)
  
  

# volcano plot with annotated top #20 most significant proteins
olink_volcano_plot(p.val_tbl = ttest_results_NPX1,
                   olinkid_list = ttest_sign_NPX1) +
  scale_color_manual(values = c('turquoise3', 'red'))

# subset PCA
# Filter the data to include only "Healthy" and "CRC" subsets
subset_filter <- c("Healthy", "CRC")
filtered_data <- NPX_08_plasma %>%
  filter(Subset %in% subset_filter)

# Perform the t-test on the filtered data
ttest_results_filtered <- olink_ttest(df = filtered_data, variable = "Subset")

# Select names of the top #20 most significant proteins
ttest_sign_filtered <- ttest_results_filtered %>%
  head(n = 10) %>%
  pull(OlinkID)

# Create a volcano plot with annotated top #20 most significant proteins
olink_volcano_plot(p.val_tbl = ttest_results_filtered,
                   olinkid_list = ttest_sign_filtered) +
  scale_color_manual(values = c('turquoise3', 'red'))
