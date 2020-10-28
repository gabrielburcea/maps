column_mapping <- cfg_write(provided = c("DATE", "PROVINCE", "REGION", "NR_REPORTING", "TOTAL_IN", "TOTAL_IN_ICU", "TOTAL_IN_RESP", "TOTAL_IN_ECMO", "NEW_IN", "NEW_OUT"), 
                            standard = c("date", "geographic_location", "region", "nr_reporting", "total_in", "total_in_icu", "total_in_resp", "total_in_ecmo", "new_in", "new_out"),
                            term_id = c(NA, "GAZ:00000448", NA, NA, NA, NA, NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            value_mapping_file = c(NA, "province_levels.csv", "region_levels.csv", NA, NA, NA, NA, NA, NA, NA),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/belgium_covid19_cases_hosp/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "case_type", "geographic_resolution"), 
                                 term_id =  c('ENVO:00000009', NA, "ENVO:00000004"),
                                 constant_values =  c("Belgium","cases", "admin level 2"),
                                 values_id = c(NA, NA, "ENVO_00000006"), 
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/belgium_covid19_cases_hosp/constant_values.csv")
