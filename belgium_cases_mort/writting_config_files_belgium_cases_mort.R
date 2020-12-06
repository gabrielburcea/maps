### belgium_cases_mort - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "REGION", "AGEGROUP", "SEX", "DEATHS"), 
                            standard = c("date", "geographic_location", "age_band", "sex", "case_count"),
                            term_id = c(NA, "GAZ:00000448", "APOLLO_SV:00000241","PATO:0000047", "STATO:0000047"),
                            units = c(NA, NA, "year",NA, NA), 
                            units_id = c(NA, NA, "UO:0000036",NA, NA), 
                            value_mapping_file = c(NA, "region_levels.csv", "age_group_levels.csv","sex_levels.csv", NA),
                            notes = c(NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/belgium_cases_mort/column_mapping.csv")

constant_values <- const_val_fct(column_name = c("country", "clinical_data_item", "geographic_resolution"), 
                                 term_id =  c('ENVO:00000009', "OGMS:0000123", "ENVO:00000004"),
                                 constant_values =  c("Belgium", "deaths", "admin level 2"),
                                 values_id = c(NA, NA, "ENVO_00000006"), 
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/belgium_cases_mort/constant_values.csv")

region_levels <- COVID19BE_MORT %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_levels, file = "/Users/sakelly/maps/belgium_cases_mort/region_levels.csv",  row.names = FALSE)

age_group_levels <- COVID19BE_MORT %>%
  dplyr::distinct(AGEGROUP) %>%
  rename(provided = AGEGROUP) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_group_levels, file = "/Users/sakelly/maps/belgium_cases_mort/age_group_levels.csv",  row.names = FALSE)

sex_levels <- COVID19BE_MORT %>%
  dplyr::distinct(SEX) %>%
  rename(provided = SEX) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = c("female", "male", "unknown"))
write.csv(sex_levels, file = "/Users/sakelly/maps/belgium_cases_mort/sex_levels.csv", row.names = FALSE)
