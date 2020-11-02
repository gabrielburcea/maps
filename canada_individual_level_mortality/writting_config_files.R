###canada-individual-level-mortality - Canada###

column_mapping <- cfg_write(provided = c("death_id", "province_death_id", "case_id", "age", "sex", "health_region", "province", "country", "date_death_report", "death_source", "additional_info", "additional_source"), 
                            standard = c("death_id", "province_death_id", "case_id", "age", "sex", "health_region", "province", "country", "date", "death_source", "additional_info", "additional_source"), 
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_individual_level_mortality/column_mapping.csv") 

age_levels <- individual_level_mortality %>%
  dplyr::distinct(age) %>%
  rename(provided = age) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/age_levels.csv",  row.names = FALSE)

sex_levels <- individual_level_mortality %>%
  dplyr::distinct(sex) %>%
  rename(provided = sex) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(sex_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/sex_levels.csv", row.names = FALSE)

health_region_levels <- individual_level_mortality %>%
  dplyr::distinct(health_region) %>%
  rename(provided = health_region) %>%
  tibble::add_column(standard = NA)
write.csv(health_region_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/health_region_levels.csv",  row.names = FALSE)

province_levels <- individual_level_mortality %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/province_levels.csv",  row.names = FALSE)

country_levels <- individual_level_mortality %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/country_levels.csv",  row.names = FALSE)
