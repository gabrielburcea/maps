column_mapping <- cfg_write(provided = c("Area.name", "Area.code", "Area.type", "Reporting.date", "Daily.change.in.deaths", "Cumulative.deaths"),
                            standard = c("geographic_location", "area_code", "area_type", "date", "case_count", "cumulative_deaths"),
                            term_id =  c("GAZ:00000448", NA, NA, NA, "STATO:0000047", NA),
                            units = c(NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c("area_name_levels.csv", NA, NA, NA, NA, NA),
                            notes = c(NA, NA, NA, NA, NA, NA),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("geographic_resolution", "clinical_finding"), 
                                 term_id =  c("ENVO:00000004", "OGMS:0000014"),
                                 constant_values =  c("admin level 0", "deaths"),
                                 values_id = c("ENVO:00000009", NA), 
                                 units = c(NA, NA), 
                                 units_id = c(NA, NA), 
                                 notes = c(NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/constant_values.csv")
