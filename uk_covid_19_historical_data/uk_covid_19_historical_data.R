column_mapping <- cfg_write(provided = c("date", "country", "areacode", "area", "totalcases"),
                            standard = c("date", "country", "areacode", "geographic_location", "case_count"),
                            term_id = c(NA, NA, NA, "GAZ:00000448","STATO:0000047"),
                            units = c(NA, NA, NA, NA,NA), 
                            units_id = c(NA, NA, NA, NA,NA),
                            value_mapping_file = c(NA, "country_levels.csv", "area_code_levels.csv", "area_levels.csv", NA),
                            notes = c(NA, NA, NA, NA,NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/uk_covid_19_historical_data/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("case_type", "geographic_resolution"), 
                                 term_id =  c(NA, "ENVO:00000004"),
                                 constant_values =  c("cases", "admin level 1"),
                                 values_id = c(NA, "ENVO:00000005"), 
                                 units = c(NA, NA), 
                                 units_id = c(NA, NA), 
                                 notes = c(NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/uk_covid_19_historical_data/constant_values.csv")
