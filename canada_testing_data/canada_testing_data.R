column_mapping <- cfg_write(provided = c("id", "date", "age", "case_id", "country", "province", "region", "sex", "travel", "travelh"), 
                            standard = c("id", "date", "age_band", "case_id", "country", "geographic_location", "region", "sex", "travel", "travelh"),
                            term_id = c(NA, NA, "APOLLO_SV:00000241", NA, NA, "GAZ:00000448", NA, "PATO:0000047", NA, NA),
                            units = c(NA, NA, "year", NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, "UO:0000036", NA, NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c(NA, NA, "age_levels.csv", "country_levels.csv", "province_levels.csv", "region_levels.csv", "sex_levels.csv", "travel_levels.csv", "travelh_levels.csv"),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/canada_testing_data/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "clinical_finding", "geographic_resolution", "case_count"), 
                                 term_id =  c('ENVO:00000009', "OGMS:0000014", "ENVO:00000004", "STATO:0000047"),
                                 constant_values =  c("Canada", "cases", "admin level 1", "1"),
                                 values_id = c(NA, NA, "ENVO:00000005", NA), 
                                 units = c(NA, NA, NA, NA), 
                                 units_id = c(NA, NA, NA, NA), 
                                 notes = c(NA, NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/canada_testing_data/constant_values.csv")
