### worldwide_owid-covid_data ###

column_mapping <- cfg_write(provided = c("case_count", "clinical_finding", "iso_code", "continent", "location", "date", "total_cases", "total_deaths", "total_cases_per_million", "new_cases_per_million", "total_deaths_per_million", "new_deaths_per_million", "total_tests", "new_tests", "total_tests_per_thousand", "new_tests_per_thousand", "new_tests_per_thousand", "new_tests_smoothed", "new_tests_smoothed_per_thousand", "tests_unit", "stringency_index", "population", "population_density", "median_age", "aged_65_older", "aged_70_older", "gdp_per_capita", "extreme_poverty", "cvd_death_rate", "diabetes_prevalence", "female_smokers", "male_smokers", "handwashing_facilities", "hospital_beds_per_thousand"), 
                            standard = c("case_count", "clinical_finding", "iso_code", "continent", "location", "date", "total_cases", "total_deaths", "total_cases_per_million", "new_cases_per_million", "total_deaths_per_million", "new_deaths_per_million", "total_tests", "new_tests", "total_tests_per_thousand", "new_tests_per_thousand", "new_tests_per_thousand", "new_tests_smoothed", "new_tests_smoothed_per_thousand", "tests_unit", "stringency_index", "population", "population_density", "median_age", "aged_65_older", "aged_70_older", "gdp_per_capita", "extreme_poverty", "cvd_death_rate", "diabetes_prevalence", "female_smokers", "male_smokers", "handwashing_facilities", "hospital_beds_per_thousand"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/worldwide_owid-covid_data/column_mapping.csv")

iso_code_levels <- preprocessed %>%
  dplyr::distinct(iso_code) %>%
  rename(provided = iso_code) %>%
  tibble::add_column(standard = NA)
write.csv(iso_code_levels, file = "/Users/sakelly/maps/worldwide_owid-covid_data/iso_code_levels.csv",  row.names = FALSE)

continent_levels <- preprocessed %>%
  dplyr::distinct(continent) %>%
  rename(provided = continent) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(continent_levels, file = "/Users/sakelly/maps/worldwide_owid-covid_data/continent_levels.csv",  row.names = FALSE)

location_levels <- preprocessed %>%
  dplyr::distinct(location) %>%
  rename(provided = location) %>%
  tibble::add_column(standard = NA)
write.csv(location_levels, file = "/Users/sakelly/maps/worldwide_owid-covid_data/location_levels.csv",  row.names = FALSE)

clinical_finding_levels <- preprocessed %>%
  dplyr::distinct(clinical_finding) %>%
  rename(provided = clinical_finding) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(clinical_finding_levels, file = "/Users/sakelly/maps/worldwide_owid-covid_data/clinical_finding_levels.csv", row.names = FALSE)

