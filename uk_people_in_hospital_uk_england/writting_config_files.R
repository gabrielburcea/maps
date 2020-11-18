# Please do not touch the code bellow as the original dataset has been reshaped and therefore code will not work after 
# people_in_hospital_covid_19_uk_england <- people_in_hospital_covid_19_uk_england %>%
#   tidyr::pivot_longer(cols = 2:11, 
#                       names_to = "area", 
#                       values_to = "people_in_hospital_count")
# 
# write.csv(people_in_hospital_covid_19_uk_england, "/Users/gabrielburcea/rprojects/maps/uk_people_in_hospital_uk_england/people_in_hospital_covid_19_uk_england.csv", 
#           row.names = FALSE)
# area_levels <- people_in_hospital_covid_19_uk_england %>%
#   dplyr::select(area) %>%
#   dplyr::distinct()
# 
# write.csv(area_levels, "/Users/gabrielburcea/rprojects/maps/uk_people_in_hospital_uk_england/area_levels.csv", row.names = FALSE)


column_mappping <- cfg_write(provided = c("Date", "area", "people_in_hospital_count"),
                             standard = c("date", "geographical_location", "count"),
                             term_id = c(NA, "GAZ:00000448", NA),
                             units = c(NA, NA, NA), 
                             units_id = c(NA, NA, NA), 
                             value_mapping_file = c(NA, "area_levels", NA),
                             notes = c(NA, NA, NA), 
                             table = column_mapping,
                             path = "/Users/gabrielburcea/rprojects/maps/uk_people_in_hospital_uk_england/column_mapping.csv")

constant_values_people_in_hospital <- const_val_fct(column_name = c("country", "geographic_resolution", "case_type"),
                                                    term_id = c("ENVO:00000009","ENVO:00000004", NA), 
                                                    constant_values = c("United Kingdom","admin level 1 or 2?", "Covid hospitalised"), 
                                                    values_id = c(NA, NA, NA), 
                                                    units = c(NA, NA, NA), 
                                                    units_id = c(NA, NA, NA), 
                                                    notes = c(NA,NA, "counts of people admitted in hospital due to COVID tested positive"), 
                                                    table = constant_values_people_in_hospital,
                                                    path = "/Users/gabrielburcea/rprojects/maps/uk_people_in_hospital_uk_england/constant_values_people_in_hospital.csv")
  
  
  
  
  
  