library (stringr)

first50 <- NPX_08_plasmau %>%
  pull(OlinkID) %>%
  unique() %>%
  head(10)

heatmap_data_NPX08plasma_b <- NPX_08_plasmau %>%
  filter(!str_detect(SampleID, 'CONT')) %>%
  filter(OlinkID %in% ttest_sign_NPX1)

olink_heatmap_plot (heatmap_data_NPX08plasma_b, 
                    variable_row_list = c('Subset'), 
                    show_rownames = FALSE,
                    #show_colnames = FALSE,
                    fontsize_col = 20,
                    angle_col = c("45"),
                    colnames = "assay",
                    fontsize = 9)
