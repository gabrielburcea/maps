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

sex_levels <- individual_level_mortality %>%
  dplyr::distinct(sex) %>%
  rename(provided = sex) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(sex_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/sex_levels.csv", row.names = FALSE)

health_region_level <- individual_level_mortality %>%
  dplyr::distinct(health_region) %>%
  rename(provided = health_region) %>%
  tibble::add_column(standard = NA)
write.csv(health_region_level, file = "/Users/sakelly/maps/canada_individual_level_mortality/health_region_level.csv",  row.names = FALSE)

province_level <- individual_level_mortality %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_level, file = "/Users/sakelly/maps/canada_individual_level_mortality/province_level.csv",  row.names = FALSE)

country_level <- individual_level_mortality %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_level, file = "/Users/sakelly/maps/canada_individual_level_mortality/country_level.csv",  row.names = FALSE)

###public-covid-19-cases-canada - Canada###

column_mapping <- cfg_write(provided = c("case_id", "provincal_case_id", "age", "sex", "health_region", "province", "country", "date_report", "report_week", "has_travel_history", "locally_acquired", "case_source"), 
                            standard = c("case_id", "provincal_case_id", "age", "sex", "health_region", "province", "country", "date", "report_week", "has_travel_history", "locally_acquired", "case_source"), 
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_public_covid_19_cases/column_mapping.csv") 

age_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(age) %>%
  rename(provided = age) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/age_levels.csv",  row.names = FALSE)

sex_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(sex) %>%
  rename(provided = sex) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(sex_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/sex_levels.csv", row.names = FALSE)

health_region_level <- public_covid_19_cases_canada %>%
  dplyr::distinct(health_region) %>%
  rename(provided = health_region) %>%
  tibble::add_column(standard = NA)
write.csv(health_region_level, file = "/Users/sakelly/maps/canada_public_covid_19_cases/health_region_level.csv",  row.names = FALSE)

province_level <- public_covid_19_cases_canada %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_level, file = "/Users/sakelly/maps/canada_public_covid_19_cases/province_level.csv",  row.names = FALSE)

country_level <- public_covid_19_cases_canada %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_level, file = "/Users/sakelly/maps/canada_public_covid_19_cases/country_level.csv",  row.names = FALSE)

travel_history_level <- public_covid_19_cases_canada %>%
  dplyr::distinct(has_travel_history) %>%
  rename(provided = has_travel_history) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(travel_history_level, file = "/Users/sakelly/maps/canada_public_covid_19_cases/travel_history_level.csv",  row.names = FALSE)

locally_acquired_level <- public_covid_19_cases_canada %>%
  dplyr::distinct(locally_acquired) %>%
  rename(provided = locally_acquired) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(locally_acquired_level, file = "/Users/sakelly/maps/canada_public_covid_19_cases/locally_acquired_level.csv",  row.names = FALSE)

###canada_testing_data - Canada###

column_mapping <- cfg_write(provided = c("id", "date", "age", "case_id", "country", "province", "region", "sex", "travel", "travelh"), 
                            standard = c("id", "date", "age", "case_id", "country", "province", "region", "sex", "travel", "travelh"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_testing_data/column_mapping.csv") 

age_levels <- canada_testing_data %>%
  dplyr::distinct(age) %>%
  rename(provided = age) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_levels, file = "/Users/sakelly/maps/canada_testing_data/age_levels.csv",  row.names = FALSE)

country_level <- canada_testing_data %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_level, file = "/Users/sakelly/maps/canada_testing_data/country_level.csv",  row.names = FALSE)

province_level <- canada_testing_data %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_level, file = "/Users/sakelly/maps/canada_testing_data/province_level.csv",  row.names = FALSE)

region_level <- canada_testing_data %>%
  dplyr::distinct(region) %>%
  rename(provided = region) %>%
  tibble::add_column(standard = NA)
write.csv(region_level, file = "/Users/sakelly/maps/canada_testing_data/region_level.csv",  row.names = FALSE)

travel_level <- canada_testing_data %>%
  dplyr::distinct(travel) %>%
  rename(provided = travel) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(travel_level, file = "/Users/sakelly/maps/canada_testing_data/travel_level.csv",  row.names = FALSE)

travelh_level <- canada_testing_data %>%
  dplyr::distinct(travelh) %>%
  rename(provided = travelh) %>%
  tibble::add_column(standard = NA)
write.csv(travelh_level, file = "/Users/sakelly/maps/canada_testing_data/travelh_level.csv",  row.names = FALSE)

###canada_cumulative_case - Canada###

column_mapping <- cfg_write(provided = c("objectid", "hr_uid", "province", "engname", "frename", "casecount", "deaths", "recovered", "tests", "totalpop2019", "pop0to4_2019", "pop5to9_2019", "pop10to14_2019", "pop15to19_2019", "pop20to24_2019", "pop25to29_2019", "pop30to34_2019", "pop35to39_2019", "pop40to44_2019", "pop45to49_2019", "pop50to54_2019", "pop55to59_2019", "pop60to64_2019", "pop65to69_2019", "pop70to74_2019", "pop75to79_2019", "pop80to84_2019", "pop85older", "averageage_2019", "medianage_2019", "shape_area", "shape_length", "last_updated", "sourceurl", "globalid", "retreived_at"), 
                            standard = c("objectid", "hr_uid", "province", "engname", "frename", "casecount", "deaths", "recovered", "tests", "totalpop2019", "pop0to4_2019", "pop5to9_2019", "pop10to14_2019", "pop15to19_2019", "pop20to24_2019", "pop25to29_2019", "pop30to34_2019", "pop35to39_2019", "pop40to44_2019", "pop45to49_2019", "pop50to54_2019", "pop55to59_2019", "pop60to64_2019", "pop65to69_2019", "pop70to74_2019", "pop75to79_2019", "pop80to84_2019", "pop85older", "averageage_2019", "medianage_2019", "shape_area", "shape_length", "last_updated", "sourceurl", "globalid", "retreived_at"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_cumulative_case/column_mapping.csv") 

province_level <- canada_cumulative_case_count_by_new_hybrid_regional_health_boundaries %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_level, file = "/Users/sakelly/maps/canada_cumulative_case/province_level.csv",  row.names = FALSE)