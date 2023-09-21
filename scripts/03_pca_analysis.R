# t-test npx_data1
ttest_results_Plasma <- olink_ttest(df = NPX_08_plasma,
                                  variable = "Treatment")

# select names of the top #40 most significant proteins
ttest_sign_Plasma <- ttest_results_Plasma %>%
  head(n=20) %>%
  pull(OlinkID)
  
  

# volcano plot with annotated top #20 most significant proteins
olink_volcano_plot(p.val_tbl = ttest_results_Bakeoff,
                   olinkid_list = ttest_sign_Bakeoff) +
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
  head(n = 20) %>%
  pull(OlinkID)

# Create a volcano plot with annotated top #20 most significant proteins
olink_volcano_plot(p.val_tbl = ttest_results_filtered,
                   olinkid_list = ttest_sign_filtered_plasma,
                   ) +
  scale_color_manual(values = c('turquoise3', 'red'))

