### no_deaths_involving_covid19_care_homes_local_authority

# first need to flatten the dataset - datas as columns will be transformed into rows with pivot_longer function 
# use this with care - since once transformed then if attempt to run the bellow code, it will give error

deaths_involving_covid_19_care_homes <- deaths_involving_covid_19_care_homes %>%
  rename(area_code = 'Area Code', area_name = "Area Name") %>%
  tidyr::pivot_longer(cols = 3:17,
                      names_to = "Date",
                      values_to = "Counts")

flat_deaths_involving_covid_19_care_homes <- deaths_involving_covid_19_care_homes

# write.csv(flat_deaths_involving_covid_19_care_homes, file = "/Users/gabrielburcea/Rprojects/maps/no_deaths_involving_covid19_care_homes_local_authority/flat_deaths_involving_covid_19_care_homes.csv", row.names = FALSE)  


column_mapping <- 
  cfg_write(provided = c("area_code", "area_name", "Date", "Counts"), 
            standard = c("area_code", "area_name", "data", "counts"),
            notes = c(NA, NA, NA, "pool"),
            table = column_mapping, 
            path = "/Users/gabrielburcea/Rprojects/maps/no_deaths_involving_covid19_care_homes_local_authority/column_mapping.csv")




area_code_levels <- flat_deaths_involving_covid_19_care_homes %>%
  dplyr::distinct(area_code) %>%
  dplyr::rename(provided = area_code) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(area_code_levels, file = "/Users/gabrielburcea/Rprojects/maps/no_deaths_involving_covid19_care_homes_local_authority/area_code_levels.csv", row.names = FALSE)

area_name_levels <-  flat_deaths_involving_covid_19_care_homes %>%
  dplyr::distinct(area_name) %>%
  dplyr::rename(provided = area_name) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(area_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/no_deaths_involving_covid19_care_homes_local_authority/area_name_levels.csv", row.names = FALSE)



