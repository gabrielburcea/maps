column_mapping <- cfg_write(provided = c("DATE", "PROVINCE", "REGION", "AGEGROUP", "SEX", "CASES"), 
                            standard = c("date", "geographic_location", "region", "age_band", "sex", "deaths"),
                            term_id = c(NA, "GAZ:00000448", NA, "APOLLO_SV:00000241","PATO:0000047", "STATO:0000047"),
                            units = c(NA, NA, NA, "year",NA, NA), 
                            units_id = c(NA, NA, NA, "UO:0000036",NA, NA), 
                            value_mapping_file = c(NA, "province_levels.csv", "region_levels.csv", "age_group_levels.csv","sex_levels.csv", NA),
                            notes = c(NA, NA, NA, NA,NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/belgium_covid19_age_sex/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "case_type", "geographic_resolution"), 
                                 term_id =  c('ENVO:00000009', NA, "ENVO:00000004"),
                                 constant_values =  c("Belgium","ENVO:00000004", "admin level 2"),
                                 values_id = c(NA, NA, "ENVO_00000006"), 
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/belgium_covid19_age_sex/constant_values.csv")
