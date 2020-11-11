column_mapping <- cfg_write(provided = c("clinical_finding", "case_count", "date", "county", "state", "fips"), 
                            standard = c("clinical_finding", "case_count", "date", "geographic_location", "state", "fips"),
                            term_id =  c("OGMS:0000014", "STATO:0000047", NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c("clinical_finding_levels.csv", NA, "county_levels.csv", "state_levels.csv", "fips_levels.csv"),
                            notes = c(NA, NA, NA, NA, NA, NA),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/us_counties_statistics_states/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("geographic_resolution"), 
                                 term_id =  c("ENVO:00000004"),
                                 constant_values =  c("admin level 2"),
                                 values_id = c("ENVO:00000006"), 
                                 units = c(NA), 
                                 units_id = c(NA), 
                                 notes = c(NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/us_counties_statistics_state/constant_values.csv")
