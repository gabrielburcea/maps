column_mapping <- cfg_write(provided = c("dateRep", "day", "month", "year", "cases", "deaths", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"),
                            standard = c("date", "day", "month", "year", "cases", "deaths", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"),
                            term_id = c(NA, NA, NA, NA,NA, NA, "GAZ:00000448", NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c(NA, NA, NA, NA, NA, NA, "countriesAndTerritories_levels.csv", "geoId_levels.csv", "countryterritoryCode_levels.csv", NA, "continentExp_levels.csv"),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/sakelly/maps/ecdc_data/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "case_type", "geographic_resolution"), 
                                 term_id =  c('ENVO:00000009', NA, "ENVO:00000004"),
                                 constant_values =  c("Canada", "cases", "admin level 0"),
                                 values_id = c(NA, NA, "ENVO???"), 
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/ecdc_data/constant_values.csv")
