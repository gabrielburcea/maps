### no_deaths_involving_covid19_care_homes_local_authority

# first need to flatten the dataset - datas as columns will be transformed into rows with pivot_longer function 
# use this with care - since once transformed then if attempt to run the bellow code, it will give error

# uk_care_home_deaths <- uk_care_home_deaths  %>%
#   rename(area_code = 'Area Code', area_name = "Area Name") %>%
#   tidyr::pivot_longer(cols = 3:17,
#                       names_to = "Date",
#                       values_to = "Counts")



# flat_deaths_involving_covid_19_care_homes <- deaths_involving_covid_19_care_homes

# write.csv(flat_deaths_involving_covid_19_care_homes, file = "/Users/gabrielburcea/Rprojects/maps/no_deaths_involving_covid19_care_homes_local_authority/flat_deaths_involving_covid_19_care_homes.csv", row.names = FALSE)  

# area_code_levels <- flat_deaths_involving_covid_19_care_homes %>%
#   dplyr::distinct(area_code) %>%
#   dplyr::rename(provided = area_code) %>%
#   tibble::add_column(standard = NA) %>%
#   dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))
# 
# write.csv(area_code_levels, file = "/Users/gabrielburcea/Rprojects/maps/no_deaths_involving_covid19_care_homes_local_authority/area_code_levels.csv", row.names = FALSE)
# 
# area_name_levels <-  flat_deaths_involving_covid_19_care_homes %>%
#   dplyr::distinct(area_name) %>%
#   dplyr::rename(provided = area_name) %>%
#   tibble::add_column(standard = NA) %>%
#   dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))
# 
# write.csv(area_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/no_deaths_involving_covid19_care_homes_local_authority/area_name_levels.csv", row.names = FALSE)



column_mappping <- cfg_write(provided = c("Area Code", "Area Name", "Date", "Counts"),
                             standard = c("area_code", "area_name", "date", "count"),
                             term_id = c(NA, "GAZ:00000448", NA, NA),
                             units = c(NA, NA, NA, NA), 
                             units_id = c(NA, NA, NA, NA), 
                             value_mapping_file = c(NA, "area_name_levels", NA, NA),
                             notes = c(NA, "local authority", NA, "counts of deaths by local authority"), 
                             table = column_mapping,
                             path = "/Users/gabrielburcea/rprojects/maps/no_deaths_involving_covid19_care_homes_local_authority/column_mapping.csv")

constant_values_people_in_hospital <- const_val_fct(column_name = c("country", "geographic_resolution", "case_type"),
                                                    term_id = c("ENVO:00000009","ENVO:00000004", NA), 
                                                    constant_values = c("United Kingdom","admin level 1 or 2?", "Covid deaths"), 
                                                    values_id = c(NA, NA, NA), 
                                                    units = c(NA, NA, NA), 
                                                    units_id = c(NA, NA, NA), 
                                                    notes = c(NA,NA, "counts of care home deaths due to Covid"), 
                                                    table = constant_values_people_in_hospital,
                                                    path = "/Users/gabrielburcea/rprojects/maps/no_deaths_involving_covid19_care_homes_local_authority/constant_values_care_home_deaths.csv")






