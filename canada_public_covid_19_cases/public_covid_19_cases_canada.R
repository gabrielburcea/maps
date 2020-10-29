column_mapping <- cfg_write(provided = c("case_id", "provincial_case_id", "age", "sex", "health_region", "province", "country", "date_report", "report_week", "has_travel_history", "locally_acquired", "case_source"), 
                            standard = c("case_id", "provincial_case_id", "age_band", "sex", "health_region", "geographic_location", "country", "date", "report_week", "has_travel_history", "locally_acquired", "case_source"),
                            term_id = c(NA, NA, "APOLLO_SV:00000241", "PATO:0000047", NA, "GAZ:00000448", NA, NA, NA, NA, NA, NA),
                            units = c(NA, NA, "year", NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, "UO:0000036", NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c(NA, NA, "age_levels.csv", "sex_levels.csv", "health_region_levels.csv", "province_levels.csv", "country_levels.csv", NA, "locally_acquired_levels.csv", NA, NA, NA),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/canada_public_covid_19_cases/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "case_type", "geographic_resolution", "case_count"), 
                                 term_id =  c('ENVO:00000009', NA, "ENVO:00000004", "STATO:0000047"),
                                 constant_values =  c("Canada", "cases", "admin level 4", "1"),
                                 values_id = c(NA, NA, "ENVO:00000008", NA), 
                                 units = c(NA, NA, NA, NA), 
                                 units_id = c(NA, NA, NA, NA), 
                                 notes = c(NA, NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/canada_public_covid_19_cases/constant_values.csv")
