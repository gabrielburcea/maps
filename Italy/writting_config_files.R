### Italy ###
library(tidyverse)

column_mapping <- cfg_write(provided = c("report_date", "state", "region_code", "region_name", "lat", "long", "hospitalised_with_symptoms", "intensive_care", "total_hospitalised", "home_isolation", "total_positive", "variation_total_positive", "new_positive", "discharged", "deceased"), 
                            standard = c("report_date", "country", "region_code", "geographic_resolution", "lat", "long", "hospitalised_with_symptoms", "intensive_care", "total_hospitalised", "home_isolation", "total_positive", "variation_total_positive", "new_positive", "discharged", "deceased"),
                            term_id = c(NA, NA, NA, "GAZ:00000448", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA,NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA,NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            value_mapping_file = c(NA, NA,  NA, "region_name_levels", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            notes = c(NA, "geographic location", NA, NA,"need to check what code?", "need to check what code?", NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/gabrielburcea/rprojects/maps/italy/column_mapping.csv")



constant_values <- const_val_fct(column_name = c("country" , "geographic_resolution", "clinical_data_item"), 
                                 term_id =  c('ENVO:00000009', "GAZ:00000448", "OGMS:0000123"),
                                 constant_values =  c("Italy", NA, "this seems to have so many variables that may need further attention as to what it is the case_type"), 
                                 values_id = c(NA, NA, NA),
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, "ask ontology team"), 
                                 table = constant_values,
                                 path = "/Users/gabrielburcea/rprojects/maps/italy/constant_values.csv")



### Italy ###
# region_name_levels <- covid_19_italy_situation_monitoring_by_region %>%
#   dplyr::distinct(region_name) %>%
#   rename(provided = region_name) %>%
#   tibble::add_column(standard = NA) %>%
#   mutate(standard = ifelse(is.na(standard), provided, standard))
#   
# write.csv(region_name_levels, file = "/Users/gabrielburcea/rprojects/maps/italy/region_name_levels.csv", row.names = FALSE)
