### us_coid_statistics_states ###

column_mapping <- cfg_write(provided = c("date", "state", "positive", "negative", "pending", "hospitalizedcurrently", "hospitalizedcumulative", "inicucurrently", "inicucumulative", "onventilatorcurrently", "onventilatorcumulative", "recovered", "dataqualitygrade", "lastupdateet", "hash", "datechecked", "death", "hospitalized", "total", "totaltestresults", "posneg", "fips", "deathincrease", "hopitalizedincrease", "negativeincrease", "positiveincrease", "totaltestresultsincrease"), 
                            standard = c("date", "state", "positive", "negative", "pending", "hospitalizedcurrently", "hospitalizedcumulative", "inicucurrently", "inicucumulative", "onventilatorcurrently", "onventilatorcumulative", "recovered", "dataqualitygrade", "lastupdateet", "hash", "datechecked", "death", "hospitalized", "total", "totaltestresults", "posneg", "fips", "deathincrease", "hopitalizedincrease", "negativeincrease", "positiveincrease", "totaltestresultsincrease"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/us_covid_statistics_states/column_mapping.csv")

state_levels <- covid_statistics_by_us_states_daily_updates %>%
  dplyr::distinct(state) %>%
  rename(provided = state) %>%
  tibble::add_column(standard = NA)
write.csv(state_levels, file = "/Users/sakelly/maps/us_covid_statistics_states/state_levels.csv",  row.names = FALSE)

hash_levels <- covid_statistics_by_us_states_daily_updates %>%
  dplyr::distinct(hash) %>%
  rename(provided = hash) %>%
  tibble::add_column(standard = NA)
write.csv(hash_levels, file = "/Users/sakelly/maps/us_covid_statistics_states/hash_levels.csv",  row.names = FALSE)

fips_levels <- covid_statistics_by_us_states_daily_updates %>%
  dplyr::distinct(fips) %>%
  rename(provided = fips) %>%
  tibble::add_column(standard = NA)
write.csv(fips_levels, file = "/Users/sakelly/maps/us_covid_statistics_states/fips_levels.csv",  row.names = FALSE)
