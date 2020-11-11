###canada_testing_data - Canada###

column_mapping <- cfg_write(provided = c("id", "date", "age", "case_id", "country", "province", "region", "sex", "travel", "travelh"), 
                            standard = c("id", "date", "age", "case_id", "country", "geographic_location", "region", "sex", "travel", "travelh"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_testing_data/column_mapping.csv") 

age_levels <- canada_testing_data %>%
  dplyr::distinct(age) %>%
  rename(provided = age) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_levels, file = "/Users/sakelly/maps/canada_testing_data/age_levels.csv",  row.names = FALSE)


country_levels <- canada_testing_data %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_levels, file = "/Users/sakelly/maps/canada_testing_data/country_levels.csv",  row.names = FALSE)

province_levels <- canada_testing_data %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/canada_testing_data/province_levels.csv",  row.names = FALSE)

region_levels <- canada_testing_data %>%
  dplyr::distinct(region) %>%
  rename(provided = region) %>%
  tibble::add_column(standard = NA)
write.csv(region_levels, file = "/Users/sakelly/maps/canada_testing_data/region_levels.csv",  row.names = FALSE)

travel_levels <- canada_testing_data %>%
  dplyr::distinct(travel) %>%
  rename(provided = travel) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(travel_levels, file = "/Users/sakelly/maps/canada_testing_data/travel_levels.csv",  row.names = FALSE)

travelh_levels <- canada_testing_data %>%
  dplyr::distinct(travelh) %>%
  rename(provided = travelh) %>%
  tibble::add_column(standard = NA)
write.csv(travelh_levels, file = "/Users/sakelly/maps/canada_testing_data/travelh_levels.csv",  row.names = FALSE)
