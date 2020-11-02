### mexico ###

column_mapping <- cfg_write(provided = c("report_date", "state", "sex", "age", "date_of_start_of_symptoms", "status", "origin", "date_of_arrival_in_mexico", "report_url"), 
                            standard = c("date", "state", "sex", "age", "date_of_start_of_symptoms", "status", "origin", "date_of_arrival_in_mexico", "report_url"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/mexico/column_mapping.csv") 

state_levels <- covid19_mexico_daily_cases %>%
  dplyr::distinct(state) %>%
  rename(provided = state) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(state_levels, file = "/Users/sakelly/maps/mexico/state_levels.csv",  row.names = FALSE)

sex_levels <- covid19_mexico_daily_cases %>%
  dplyr::distinct(sex) %>%
  rename(provided = sex) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = c("male", "female"))
write.csv(sex_levels, file = "/Users/sakelly/maps/mexico/sex_levels.csv", row.names = FALSE)

status_levels <- covid19_mexico_daily_cases %>%
  dplyr::distinct(status) %>%
  rename(provided = status) %>%
  tibble::add_column(standard = NA)
write.csv(status_levels, file = "/Users/sakelly/maps/mexico/status_levels.csv", row.names = FALSE)

origin_levels <- covid19_mexico_daily_cases %>%
  dplyr::distinct(origin) %>%
  rename(provided = origin) %>%
  tibble::add_column(standard = NA)
write.csv(origin_levels, file = "/Users/sakelly/maps/mexico/origin_levels.csv", row.names = FALSE)
