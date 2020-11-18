column_mapping <- cfg_write(provided = c("case_count", "clinical_finding", "iso_code", "continent", "location", "date", "total_cases", "total_deaths", "total_cases_per_million", "new_cases_per_million", "total_deaths_per_million", "new_deaths_per_million", "total_tests", "new_tests", "total_tests_per_thousand", "new_tests_per_thousand", "new_tests_per_thousand", "new_tests_smoothed", "new_tests_smoothed_per_thousand", "tests_unit", "stringency_index", "population", "population_density", "median_age", "aged_65_older", "aged_70_older", "gdp_per_capita", "extreme_poverty", "cvd_death_rate", "diabetes_prevalence", "female_smokers", "male_smokers", "handwashing_facilities", "hospital_beds_per_thousand"), 
                            standard = c("case_count", "clinical_finding", "iso_code", "continent", "location", "date", "total_cases", "total_deaths", "total_cases_per_million", "new_cases_per_million", "total_deaths_per_million", "new_deaths_per_million", "total_tests", "new_tests", "total_tests_per_thousand", "new_tests_per_thousand", "new_tests_per_thousand", "new_tests_smoothed", "new_tests_smoothed_per_thousand", "tests_unit", "stringency_index", "population", "population_density", "median_age", "aged_65_older", "aged_70_older", "gdp_per_capita", "extreme_poverty", "cvd_death_rate", "diabetes_prevalence", "female_smokers", "male_smokers", "handwashing_facilities", "hospital_beds_per_thousand"),
                            term_id =  c("STATO:0000047", "OGMS:0000014", NA, NA, "GAZ:00000448", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/worldwide_owid-covid_data/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("geographic_resolution"), 
                                 term_id =  c("ENVO:00000004"),
                                 constant_values =  c("admin level 0"),
                                 values_id = c("ENVO:00000009"), 
                                 units = c(NA), 
                                 units_id = c(NA), 
                                 notes = c(NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/worldwide_owid-covid_data/constant_values.csv")
