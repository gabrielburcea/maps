### belgium_covid19_cases_hosp - BELGIUM ###
library(tidyverse)
column_mapping <- cfg_write(provided = c("DATE", "PROVINCE", "REGION", "NR_REPORTING", "TOTAL_IN", "TOTAL_IN_ICU", "TOTAL_IN_RESP", "TOTAL_IN_ECMO", "NEW_IN", "NEW_OUT"), 
                            standard = c("date", "geographic_location", "region", "nr_reporting", "total_in", "total_in_icu", "total_in_resp", "total_in_ecmo", "case_count", "new_out"),
                            term_id = c(NA, "GAZ:00000448", NA, NA, NA, NA, NA, NA, "STATO:0000047", NA),
                            units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            value_mapping_file = c(NA, "province_levels.csv", "region_levels.csv", NA, NA, NA, NA, NA, NA, NA),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/belgium_covid19_cases_hosp/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "clinical_data_item", "geographic_resolution"), 
                                 term_id =  c("ENVO:00000009", "OGMS:0000123", "ENVO:00000004"),
                                 constant_values =  c("Belgium","cases", "admin level 3"),
                                 values_id = c(NA, NA, "ENVO:00000007"), 
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/belgium_covid19_cases_hosp/constant_values.csv")

province_levels <- COVID19BE_HOSP %>%
  dplyr::distinct(PROVINCE) %>%
  rename(provided = PROVINCE) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_hosp/province_levels.csv",  row.names = FALSE)

region_levels <- COVID19BE_HOSP %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_hosp/region_levels.csv",  row.names = FALSE)
