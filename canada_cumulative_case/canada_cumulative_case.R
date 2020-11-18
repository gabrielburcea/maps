column_mapping <- cfg_write(provided = c("case_count", "clinical_finding", "objectid", "hr_uid", "province", "engname", "frename", "recovered", "tests", "totalpop2019", "pop0to4_2019", "pop5to9_2019", "pop10to14_2019", "pop15to19_2019", "pop20to24_2019", "pop25to29_2019", "pop30to34_2019", "pop35to39_2019", "pop40to44_2019", "pop45to49_2019", "pop50to54_2019", "pop55to59_2019", "pop60to64_2019", "pop65to69_2019", "pop70to74_2019", "pop75to79_2019", "pop80to84_2019", "pop85older", "averageage_2019", "medianage_2019", "shape_area", "shape_length", "last_updated", "sourceurl", "globalid", "retreived_at", "date", "time"), 
                            standard = c("case_count", "clinical_finding", "objectid", "hr_uid", "geographic_location", "engname", "frename", "recovered", "tests", "totalpop2019", "pop0to4_2019", "pop5to9_2019", "pop10to14_2019", "pop15to19_2019", "pop20to24_2019", "pop25to29_2019", "pop30to34_2019", "pop35to39_2019", "pop40to44_2019", "pop45to49_2019", "pop50to54_2019", "pop55to59_2019", "pop60to64_2019", "pop65to69_2019", "pop70to74_2019", "pop75to79_2019", "pop80to84_2019", "pop85older", "averageage_2019", "medianage_2019", "shape_area", "shape_length", "last_updated", "sourceurl", "globalid", "retreived_at", "date", "time"),
                            term_id = c("STATO:0000047", "OGMS:0000014", NA, NA, "GAZ:00000448", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            value_mapping_file = c(NA, NA, "province_levels.csv", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            notes = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/canada_cumulative_case/column_mapping.csv")


constant_values <- const_val_fct(column_name = c("country", "clinical_finding", "geographic_resolution"), 
                                 term_id =  c('ENVO:00000009', "OGMS:0000014", "ENVO:00000004"),
                                 constant_values =  c("Canada", NA, "admin level 1"),
                                 values_id = c(NA, NA, "ENVO:00000005"), 
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/sakelly/maps/canada_cumulative_case/constant_values.csv")
