# GSEA Heatmap from t-test results
gsea_results <- olink_pathway_enrichment(data = NPX_09_Patient2noplasmanodilution, 
                                         test_results = ttest_results_NPX09_Patient2noplasmanodilution)

try({ # This expression might fail if dependencies are not installed
  olink_pathway_heatmap(enrich_results = gsea_results, test_results = ttest_results_NPX09_Patient2noplasmanodilution)
})
