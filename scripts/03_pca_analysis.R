# t-test npx_data1
ttest_results_NPX1 <- olink_ttest(df = NPX_08_Isolation,
                                  variable = "Treatment")

# select names of the top #10 most significant proteins
ttest_sign_NPX1 <- ttest_results_NPX1 %>%
  head(n=10) %>%
  pull(OlinkID)

# volcano plot with annotated top #10 most significant proteins
olink_volcano_plot(p.val_tbl = ttest_results_NPX1,
                   olinkid_list = ttest_sign_NPX1) +
  scale_color_manual(values = c('turquoise3', 'red'))
