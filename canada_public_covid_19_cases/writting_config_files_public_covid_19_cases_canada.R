###public-covid-19-cases-canada - Canada###
library(tidyverse)
column_mapping <- cfg_write(provided = c("case_id", "provincial_case_id", "age", "sex", "health_region", "province", "country", "date_report", "report_week", "has_travel_history", "locally_acquired", "case_source"), 
                            standard = c("case_id", "provincial_case_id", "age_band", "sex", "health_region", "geographic_location", "country", "date", "report_week", "has_travel_history", "locally_acquired", "case_source"),
                            term_id = c(NA, NA, "APOLLO_SV:00000241", "PATO:0000047", NA, "GAZ:00000448", NA, NA, NA, NA, NA, NA),
                            units = c(NA, NA, "year", NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, "UO:0000036", NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c(NA, NA, "age_levels.csv", "sex_levels.csv", "health_region_levels.csv", "province_levels.csv", "country_levels.csv", NA, "locally_acquired_levels.csv", NA, NA, NA),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/canada_public_covid_19_cases/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "clinical_data_item", "geographic_resolution", "case_count"), 
                                 term_id =  c('ENVO:00000009', "OGMS:0000123", "ENVO:00000004", "STATO:0000047"),
                                 constant_values =  c("Canada", "cases", "admin level 1", "1"),
                                 values_id = c(NA, NA, "ENVO:00000005", NA), 
                                 units = c(NA, NA, NA, NA), 
                                 units_id = c(NA, NA, NA, NA), 
                                 notes = c(NA, NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/canada_public_covid_19_cases/constant_values.csv")

age_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(age) %>%
  rename(provided = age) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/age_levels.csv",  row.names = FALSE)

sex_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(sex) %>%
  rename(provided = sex) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(sex_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/sex_levels.csv", row.names = FALSE)

health_region_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(health_region) %>%
  rename(provided = health_region) %>%
  tibble::add_column(standard = NA)
write.csv(health_region_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/health_region_levels.csv",  row.names = FALSE)

province_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/province_levels.csv",  row.names = FALSE)

country_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/country_levels.csv",  row.names = FALSE)

travel_history_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(has_travel_history) %>%
  rename(provided = has_travel_history) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(travel_history_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/travel_history_levels.csv",  row.names = FALSE)

locally_acquired_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(locally_acquired) %>%
  rename(provided = locally_acquired) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(locally_acquired_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/locally_acquired_levels.csv",  row.names = FALSE)
