### Italy ###
library(tidyverse)

column_mapping <- cfg_write(provided = c("report_date", "state", "region_code", "region_name", "lat", "long", "hospitalised_with_symptoms", "intensive_care", "total_hospitalised", "home_isolation", "total_positive", "variation_total_positive", "new_positive", "discharged", "deceased"), 
                            standard = c("report_date", "country", "region_code", "geographic_location", "latitude", "longitude", "hospitalised_with_symptoms", "intensive_care", "total_hospitalised", "home_isolation", "total_positive", "variation_total_positive", "case_count", "discharged", "deceased"),
                            term_id = c(NA, NA, NA, "GAZ:00000448", "OBI:0001620", "OBI:0001621", NA, NA, NA, NA, NA, NA, "STATO:0000047", NA, NA),
                            units = c(NA, NA, NA, NA,NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA,NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            value_mapping_file = c(NA, NA,  NA, "region_name_levels", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            notes = c(NA, "geographic location", NA, NA,"need to check what code?", "need to check what code?", NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/italy/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country" , "geographic_resolution", "clinical_data_item"), 
                                 term_id =  c('ENVO:00000009', "ENVO:00000004", "OGMS:0000123"),
                                 constant_values =  c("Italy", "admin level 1", "cases"), 
                                 values_id = c(NA, "ENVO:00000005", NA),
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, "this seems to have so many variables that may need further attention as to what it is the case_type could be deaths too"), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/italy/constant_values.csv")

region_name_levels <- covid_19_italy_situation_monitoring_by_region %>%
  dplyr::distinct(region_name) %>%
  rename(provided = region_name) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_name_levels, file = "/Users/sakelly/maps/italy/region_name_levels.csv", row.names = FALSE)
