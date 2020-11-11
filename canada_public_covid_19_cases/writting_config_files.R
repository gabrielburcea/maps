###public-covid-19-cases-canada - Canada###

column_mapping <- cfg_write(provided = c("case_id", "provincal_case_id", "age", "sex", "health_region", "province", "country", "date_report", "report_week", "has_travel_history", "locally_acquired", "case_source"), 
                            standard = c("case_id", "provincal_case_id", "age", "sex", "health_region", "geographic_location", "country", "date", "report_week", "has_travel_history", "locally_acquired", "case_source"), 
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_public_covid_19_cases/column_mapping.csv") 

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
