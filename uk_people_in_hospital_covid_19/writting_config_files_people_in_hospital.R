# Please do not touch the first lines of this code 
# uk_hospital_admissions_covid_9 <- uk_hospital_admissions_covid_9 %>%
#   tidyr::pivot_longer(cols = 2:5, 
#                       names_to = "area", 
#                       values_to = "counts_admssions_hospital")
# 
# write.csv(uk_hospital_admissions_covid_9, "/Users/gabrielburcea/rprojects/maps/uk_people_in_hospital_covid_19/uk_hospital_admissions_covid_19.csv", 
#           row.names = FALSE)

# area_levels <- uk_hospital_admissions_covid_9 %>%
#   dplyr::select(area) %>%
#   dplyr::distinct() 
# 
# write.csv(area_levels, "/Users/gabrielburcea/rprojects/maps/uk_people_in_hospital_covid_19/area_levels.csv", 
#           row.names = FALSE)


column_mappping <- cfg_write(provided = c("Date", "area", "people_in_hospital_count"),
                             standard = c("date", "geographical_location", "count"),
                             term_id = c(NA, "GAZ:00000448", NA),
                             units = c(NA, NA, NA), 
                             units_id = c(NA, NA, NA), 
                             value_mapping_file = c(NA, "area_levels", NA),
                             notes = c(NA, NA, NA), 
                             table = column_mapping,
                             path = "/Users/gabrielburcea/rprojects/maps/uk_people_in_hospital_covid_19/column_mapping.csv")

constant_values_people_in_hospital <- const_val_fct(column_name = c("country", "geographic_resolution", "case_type"),
                                                    term_id = c("ENVO:00000009","ENVO:00000004", NA), 
                                                    constant_values = c("United Kingdom","admin level 1 or 2?", "Covid hospitalised"), 
                                                    values_id = c(NA, NA, NA), 
                                                    units = c(NA, NA, NA), 
                                                    units_id = c(NA, NA, NA), 
                                                    notes = c(NA,NA, "counts of people admitted in hospital due to COVID tested positive"), 
                                                    table = constant_values_people_in_hospital,
                                                    path = "/Users/gabrielburcea/rprojects/maps/uk_people_in_hospital_covid_19/constant_values_people_in_hospital.csv")
  