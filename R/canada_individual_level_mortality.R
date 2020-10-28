column_mapping <- cfg_write(provided = c("death_id", "province_death_id", "case_id", "age", "sex", "health_region", "province", "country", "date_death_report", "death_source"), 
                            standard = c("death_id", "province_death_id", "case_id", "age", "sex", "health_region", "geographic_location", "country", "date_death_report", "death_source"),
                            term_id = c(NA, NA, NA, "PATO:0000011", "PATO:0000047", NA, "GAZ:00000448", NA, NA, NA),
                            units = c(NA, NA, NA, "year", NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, "UO:0000036", NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c(NA, NA, NA, "age_levels.csv", "sex_levels.csv", NA, "province_levels.csv", NA, NA, NA),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/canada_individual_level_mortality/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "case_type", "geographic_resolution", "case_count"), 
                                 term_id =  c('ENVO:00000009', NA, "ENVO:00000004", "STATO:0000047"),
                                 constant_values =  c("Canada", NA, "admin level 2", "1"),
                                 values_id = c(NA, NA, "ENVO_00000008", NA), 
                                 units = c(NA, NA, NA, NA), 
                                 units_id = c(NA, NA, NA, NA), 
                                 notes = c(NA, NA, NA), NA, 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/canada_individual_level_mortality/constant_values.csv")
