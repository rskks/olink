# calculate the p-value for the ANOVA
anova_results_oneway <- olink_anova(df = NPX_08_plasma, 
                                    variable = 'Subset')

# extracting the significant proteins
anova_results_oneway_significant <- anova_results_oneway %>%
  filter(Threshold == 'Significant') %>%
  pull(OlinkID)
anova_posthoc_oneway_results <- olink_anova_posthoc(df = NPX_08_plasma,
                                                    olinkid_list = anova_results_oneway_significant,
                                                    variable = 'Subset',
                                                    effect = 'Subset')


# olink_lmer
# Linear mixed model with two variables.
lmer_results_twoway <- olink_lmer(df = NPX_08_plasma, 
                                  variable = 'Subset',
                                  random = 'Subject')

# extracting the significant proteins
lmer_results_twoway_significant <- lmer_results_twoway %>%
  filter(Threshold == 'Significant', term == 'Subset') %>%
  pull(OlinkID)

# performing post-hoc analysis
lmer_posthoc_twoway_results <- olink_lmer_posthoc(df = NPX_08_plasma,
                                                  olinkid_list = lmer_results_twoway_significant,
                                                  variable = 'Subset',
                                                  random = 'Subject',
                                                  effect = 'Subset') 
