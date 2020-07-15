library(tidyverse)


##############################################
#### Belgium - COVID19BE_MORT  ###############
column_mapping <- cfg_write(provided = c("DATE", "REGION", "AGEGROUP", "SEX", "DEATHS"),
                            standard = c("date", "region", "age_band", "gender", "deaths"),
                            table = column_mapping,
                            path = "/Users/gabrielburcea/Rprojects/maps/belgium_cases_mort/config_files/column_mapping.csv")



region_levels <- COVID19BE_MORT %>%
  distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA)

write.csv(region_levels, file = "/Users/gabrielburcea/Rprojects/maps/belgium_cases_mort/config_files/region_levels.csv")


####################################################
######## nhs_pathways_covid_19_data_ccg_mapped #####
####################################################

column_mapping <- cfg_write(provided = c("SiteType", "Call Date", "Gender", "AgeBand", "CCGCode", "CCGName", "April20 mapped CCGCode", "April20 mapped CCGName", "TriageCount"),
                            standard = c("site_type", "date", "gender", "age_band", "ccg_code", "ccg_name", "code", "ccg_name_2", "count"),
                            table = column_mapping,
                            path = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_ccg_mapped/config_files/column_mapping.csv")



gender_levels <- NHS_Pathways_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(Gender) %>%
  rename(provided = Gender) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(gender_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_ccg_mapped/gender_levels.csv", row.names = FALSE)

age_band_levels <- NHS_Pathways_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(AgeBand) %>%
  rename(provided = AgeBand) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_band_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_ccg_mapped/age_band_levels.csv",  row.names = FALSE)


ccg_code_levels <- NHS_Pathways_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(CCGCode) %>%
  rename(provided = CCGCode) %>%
  tibble::add_column(standard = NA)


ccg_name_levels <- NHS_Pathways_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(CCGName) %>%
  rename(provided = CCGName) %>%
  tibble::add_column(standard = NA)
write.csv(ccg_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_ccg_mapped/ccg_name_levels.csv")


##############################################
#### UK gov - coronavirus-cases_latest  ###############

column_mapping <- cfg_write(provided = c("Area.name", "Area.code", "Area.type", "Specimen.date", "Daily.lab.confirmed.cases", "Previously.reported.daily.cases", "Change.in.daily.cases", "Cumulative.lab.confirmed.cases", "Previously.reported.cumulative.cases", "Change.in.cumulative.cases", "Cumulative.lab.confirmed.cases.rate"),
                            standard = c("location", "area_code", "area_type", "date", "daily_labconfirmed_cases", "previously_reported_daily_cases", "change_in_daily_cases", "cumulative_labconfirmed_cases", "previously_reported_cumulative_cases", "change_in_cumulative_cases", "cumulative_labconfirmed_cases"),
                            table = column_mapping,
                            path = "/Users/sakelly/maps/uk_gov_corona_virus_latest/column_mapping.csv")

area_name_level <- coronavirus_cases_latest %>%
  dplyr::distinct(Area.name) %>%
  rename(provided = Area.name) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(area_name_level, file = "/Users/sakelly/maps/uk_gov_corona_virus_latest/area_name_level.csv",  row.names = FALSE)

area_type_level <- coronavirus_cases_latest %>%
  dplyr::distinct(Area.type) %>%
  rename(provided = Area.type) %>%
  tibble::add_column(standard = NA)
write.csv(area_type_level, file = "/Users/sakelly/maps/uk_gov_corona_virus_latest/area_type_level.csv",  row.names = FALSE)

###canada-individual-level-mortality - Canada###

column_mapping <- cfg_write(provided = c("death_id", "province_death_id", "case_id", "age", "sex", "health_region", "province", "country", "date_death_report", "death_source", "additional_info", "additional_source"), 
                            standard = c("death_id", "province_death_id", "case_id", "age", "sex", "health_region", "province", "country", "date", "death_source", "additional_info", "additional_source"), 
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_individual_level_mortality/column_mapping.csv") 

age_levels <- individual_level_mortality %>%
  dplyr::distinct(age) %>%
  rename(provided = age) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/age_levels.csv",  row.names = FALSE)