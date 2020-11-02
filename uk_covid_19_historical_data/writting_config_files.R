#covid_19_uk_historical_data

column_mapping <- 
  cfg_write(provided = c("date", "country", "areacode", "area"), 
            standard = c("date", "country", "are_code", "area"), 
            table = column_mapping, 
            path = "/Users/gabrielburcea/Rprojects/maps/uk_covid_19_historical_data/column_mapping.csv")

country_levels <- covid_19_uk_historical_data %>%
  dplyr::distinct(country) %>%
  dplyr::rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(country_levels, file = "/Users/gabrielburcea/Rprojects/maps/uk_covid_19_historical_data/country_levels.csv", row.names = FALSE)


area_code_levels <- covid_19_uk_historical_data %>%
  dplyr::distinct(areacode) %>%
  dplyr::rename(provided = areacode) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(area_code_levels, file = "/Users/gabrielburcea/Rprojects/maps/uk_covid_19_historical_data/area_code_levels.csv", row.names = FALSE)

area_levels <- covid_19_uk_historical_data %>%
  dplyr::distinct(area) %>%
  dplyr::rename(provided = area) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(area_levels, file = "/Users/gabrielburcea/Rprojects/maps/uk_covid_19_historical_data/area_levels.csv", row.names = FALSE)


