# europe_coronavirus_covid_19_subnational_cases_1

column_mapping <- cfg_write(provided = c("Date", "iso3", "CountryName", "Region", "lat", "lon", "CumulativePositive", 
                                         "CumulativeDeceased", "CumulativeRecovered", "CurrentlyPositive", "Hospitalized", 
                                         "IntensiveCare", "EUcountry", "EUCPMcountry"), 
                            standard = c("date", "iso_code", "country_name", "region", "lat", "lon", "cumulative_positive", 
                                         "cumulative_deceased", "cumulative_recovered", "currently_positive", "hospitalized", 
                                         "intensive_care", "eu_country", "eu_cmp_country"), 
                            table = column_mapping, 
                            path = "/Users/gabrielburcea/Rprojects/maps/europe/column_mapping.csv")


iso3_level <- europe_coronavirus_covid_19_subnational_cases_1 %>% 
  dplyr::distinct(iso3) %>%
  dplyr::rename(provided = iso3) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(iso3_level, file = "/Users/gabrielburcea/Rprojects/maps/europe/iso3_level.csv")


country_name_levels <-  europe_coronavirus_covid_19_subnational_cases_1 %>% 
  dplyr::distinct(CountryName) %>%
  dplyr::rename(provided = CountryName) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/europe/country_name_levels.csv", row.names = FALSE)


region_levels <- europe_coronavirus_covid_19_subnational_cases_1 %>% 
  dplyr::distinct(Region) %>%
  dplyr::rename(provided = Region) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_levels, file = "/Users/gabrielburcea/Rprojects/maps/europe/region_levels.csv", row.names = FALSE)

lat_levels <- europe_coronavirus_covid_19_subnational_cases_1 %>% 
  dplyr::distinct(lat) %>%
  dplyr::rename(provided = lat) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(lat_levels, file = "/Users/gabrielburcea/Rprojects/maps/europe/lat_levels.csv", row.names = FALSE)

lon_levels <-  europe_coronavirus_covid_19_subnational_cases_1 %>% 
  dplyr::distinct(lon) %>%
  dplyr::rename(provided = lon) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(lon_levels, file = "/Users/gabrielburcea/Rprojects/maps/europe/lon_levels.csv", row.names = FALSE)

