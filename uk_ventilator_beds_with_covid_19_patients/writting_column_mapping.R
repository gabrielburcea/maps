# Please do not touch the bellow code  it will get the columns into rows
library(tidyverse)
# uk_ventiletor_beds_with_covid_patients <- uk_ventiletor_beds_with_covid_patients %>%
#   tidyr::pivot_longer(cols = 2:6, 
#                       names_to = "location", 
#                       values_to = "ventilator_beds_occupied")
# 
# write.csv(uk_ventiletor_beds_with_covid_patients, 
# "/Users/gabrielburcea/rprojects/maps/uk_ventilator_beds_with_covid_19_patients/uk_ventilator_beds_with_covid_19_patients.csv", row.names = FALSE)

location_levels <- uk_ventiletor_beds_with_covid_patients %>%
  dplyr::select(location) %>%
  dplyr::distinct()

write.csv(location_levels, 
           "/Users/gabrielburcea/rprojects/maps/uk_ventilator_beds_with_covid_19_patients/location_levels.csv", row.names = FALSE)

column_mapping <- cfg_write(provided = c("Date", "location", "ventilator_beds_occupied"),
                            standard = c("date", "geographical_resolution", "ventilator_beds_occupied"),
                            term_id = c(NA, "GAZ:00000448", NA),
                            units = c(NA, NA, NA),
                            units_id = c(NA, NA, NA),
                            value_mapping_file = c(NA, "location_levels", NA),
                            notes = c(NA, "This is rather a area of UK", NA),
                            table = column_mapping,
                            path = "/Users/gabrielburcea/rprojects/maps/uk_ventilator_beds_with_covid_19_patients/column_mapping.csv")

constant_values_uk_vent_beds <- const_val_fct(column_name = c("country", "geographic_resolution"), 
                                              term_id = c("ENVO:00000009", "ENVO:00000004" ), 
                                              constant_values = c("United Kingdom", "admin_level 2 ?"), 
                                              values_id = c(NA, NA), 
                                              units = c(NA, NA), 
                                              units_id = c(NA, NA), 
                                              notes = c(NA, NA), 
                                              table = constant_values_uk_vent_beds,
                                              path = "/Users/gabrielburcea/rprojects/maps/uk_ventilator_beds_with_covid_19_patients/constant_values_uk_vent_beds.csv")
