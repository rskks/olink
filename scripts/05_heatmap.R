library (stringr)

first50 <- NPX_08_plasmau %>%
  pull(OlinkID) %>%
  unique() %>%
  head(10)

heatmap_data_NPX09_PlasmaEVPnodilution <- NPX_09_PlasmaEVPnodilution %>%
  filter(!str_detect(SampleID, 'CONT')) %>%
  filter(OlinkID %in% ttest_sign_NPX09_PlasmaEVPnodilution)

#Annotated
olink_heatmap_plot (heatmap_data_NPX09_PlasmaEVPnodilution, 
                    main = 'Plasma Patients 1,2&3',
                    variable_row_list = c('Prepost','Patient','Subset'), 
                    show_rownames = FALSE,
                    #show_colnames = FALSE,
                    fontsize_col = 20,
                    angle_col = c("45"),
                    colnames = "assay",
                    fontsize = 9)
#Unannotated
olink_heatmap_plot (heatmap_data_NPX08plasma, 
                    main = 'M059K Plasma Supermere treatment',
                    variable_row_list = c('Sample','Subset'), 
                    show_rownames = FALSE,
                    show_colnames = FALSE,
                    fontsize_col = 20,
                    angle_col = c("45"),
                    colnames = "assay",
                    fontsize = 10)
