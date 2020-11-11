### us_counties_statistics_states ###

column_mapping <- cfg_write(provided = c("clinical_finding", "case_count", "date", "county", "state", "fips"), 
                            standard = c("clinical_finding", "case_count", "date", "geographic_location", "state", "fips"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/us_counties_statistics_states/column_mapping.csv")

county_levels <- preprocessed %>%
  dplyr::distinct(county) %>%
  rename(provided = county) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(county_levels, file = "/Users/sakelly/maps/us_counties_statistics_states/county_levels.csv",  row.names = FALSE)

state_levels <- preprocessed %>%
  dplyr::distinct(state) %>%
  rename(provided = state) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(state_levels, file = "/Users/sakelly/maps/us_counties_statistics_states/state_levels.csv",  row.names = FALSE)

fips_levels <- preprocessed %>%
  dplyr::distinct(fips) %>%
  rename(provided = fips) %>%
  tibble::add_column(standard = NA)
write.csv(fips_levels, file = "/Users/sakelly/maps/us_counties_statistics_states/fips_levels.csv",  row.names = FALSE)

clinical_finding_levels <- preprocessed %>%
  dplyr::distinct(clinical_finding) %>%
  rename(provided = clinical_finding) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(clinical_findings_levels, file = "/Users/sakelly/maps/us_counties_statistics_states/clinical_findings_levels.csv",  row.names = FALSE)
