#### UK gov - coron_virus_deaths_latest  ###############

column_mapping <- cfg_write(provided = c("Area.name", "Area.code", "Area.type", "Reporting.date", "Daily.change.in.deaths", "Cumulative.deaths"),
                            standard = c("area_name", "area_code", "area_type", "reporting_date", "daily_change_in_deaths", "cumulative_deaths"),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/column_mapping.csv")

area_name_levels <- coronavirus_deaths_latest %>%
  dplyr::distinct(Area.name) %>%
  rename(provided = Area.name) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(area_name_levels, file = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/area_name_levels.csv",  row.names = FALSE)

area_code_levels <- coronavirus_deaths_latest %>%
  dplyr::distinct(Area.code) %>%
  rename(provided = Area.code) %>%
  tibble::add_column(standard = NA)
write.csv(area_code_levels, file = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/area_code_levels.csv",  row.names = FALSE)

area_type_levels <- coronavirus_deaths_latest %>%
  dplyr::distinct(Area.type) %>%
  rename(provided = Area.type) %>%
  tibble::add_column(standard = NA)
write.csv(area_type_levels, file = "/Users/sakelly/maps/uk_gov_corona_virus_deaths_latest/area_type_levels.csv",  row.names = FALSE)


