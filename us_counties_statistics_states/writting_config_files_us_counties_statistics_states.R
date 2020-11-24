### us_counties_statistics_states ###
library(tidyverse)
preprocessed <- read_csv("us_counties_statistics_states/preprocessed.csv")
column_mapping <- cfg_write(provided = c("clinical_finding", "case_count", "date", "county", "state", "fips"), 
                            standard = c("clinical_data_item", "case_count", "date", "geographic_location", "state", "fips"),
                            term_id =  c("OGMS:0000123", "STATO:0000047", NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c("clinical_finding_levels.csv", NA, NA, "county_levels.csv", "state_levels.csv", "fips_levels.csv"),
                            notes = c(NA, NA, NA, NA, NA, NA),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/us_counties_statistics_states/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("geographic_resolution"), 
                                 term_id =  c("ENVO:00000004"),
                                 constant_values =  c("admin level 2"),
                                 values_id = c("ENVO:00000006"), 
                                 units = c(NA), 
                                 units_id = c(NA), 
                                 notes = c(NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/us_counties_statistics_states/constant_values.csv")

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
write.csv(clinical_finding_levels, file = "/Users/sakelly/maps/us_counties_statistics_states/clinical_finding_levels.csv",  row.names = FALSE)
