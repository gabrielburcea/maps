### us_counties_statistics_states ###

column_mapping <- cfg_write(provided = c("date", "county", "state", "fips", "cases", "deaths"), 
                            standard = c("date", "county", "state", "fips", "cases", "deaths"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/us_counties_statistics_states/column_mapping.csv")

county_levels <- us_counties %>%
  dplyr::distinct(county) %>%
  rename(provided = county) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(county_levels, file = "/Users/sakelly/maps/us_counties_statistics_states/county_levels.csv",  row.names = FALSE)

state_levels <- us_counties %>%
  dplyr::distinct(state) %>%
  rename(provided = state) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(state_levels, file = "/Users/sakelly/maps/us_counties_statistics_states/state_levels.csv",  row.names = FALSE)

fips_levels <- us_counties %>%
  dplyr::distinct(fips) %>%
  rename(provided = fips) %>%
  tibble::add_column(standard = NA)
write.csv(fips_levels, file = "/Users/sakelly/maps/us_counties_statistics_states/fips_levels.csv",  row.names = FALSE)
