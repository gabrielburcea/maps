### belgium_covid19_age_sex - BELGIUM ###
library(tidyverse)
column_mapping <- cfg_write(provided = c("DATE", "PROVINCE", "REGION", "AGEGROUP", "SEX", "CASES"), 
                            standard = c("date", "geographic_location", "region", "age_band", "sex", "case_count"),
                            term_id = c(NA, "GAZ:00000448", NA, "APOLLO_SV:00000241","PATO:0000047", "STATO:0000047"),
                            units = c(NA, NA, NA, "year",NA, NA), 
                            units_id = c(NA, NA, NA, "UO:0000036",NA, NA), 
                            value_mapping_file = c(NA, "province_levels.csv", "region_levels.csv", "age_group_levels.csv","sex_levels.csv", NA),
                            notes = c(NA, NA, NA, NA,NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/belgium_covid19_age_sex/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "clinical_data_item", "geographic_resolution"), 
                                 term_id =  c('ENVO:00000009', "OGMS:0000123", "ENVO:00000004"),
                                 constant_values =  c("Belgium","ENVO:00000004", "admin level 2"),
                                 values_id = c(NA, NA, "ENVO_00000006"), 
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/belgium_covid19_age_sex/constant_values.csv")


province_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(PROVINCE) %>%
  rename(provided = PROVINCE) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/province_levels.csv",  row.names = FALSE)

region_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/region_levels.csv",  row.names = FALSE)

age_group_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(AGEGROUP) %>%
  rename(provided = AGEGROUP) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_group_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/age_group_levels.csv",  row.names = FALSE)

sex_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(SEX) %>%
  rename(provided = SEX) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = c("male", "female", "unknown"))
write.csv(sex_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/sex_levels.csv", row.names = FALSE)
