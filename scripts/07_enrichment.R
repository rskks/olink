library(yulab.utils)
library(msigdbr)
library(clusterProfiler)

NPX_08_plasma_enrich <- NPX_08_plasma %>% filter(!grepl("control", SampleID, ignore.case = TRUE))
ttest_results <- olink_ttest(
  df = NPX_08_plasma,
  variable = "Treatment",
  alternative = "two.sided")

# This expression might fail if dependencies are not installed
  gsea_results_plasma <- olink_pathway_enrichment(data = NPX_08_plasma_enrich, 
                                           test_results = ttest_results_Plasma,
                                           ontology = "GO",
                                           organism = "human")
  
  lora_results_plasma <- olink_pathway_enrichment(data = NPX_08_plasma_enrich,
                                          test_results = ttest_results_Plasma, 
                                          method = "ORA")


#> Warning: replacing previous import 'utils::findMatches' by
#> 'S4Vectors::findMatches' when loading 'AnnotationDbi'