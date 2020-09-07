library(tidyverse)


##############################################
#### Belgium - COVID19BE_MORT  ###############
column_mapping <- cfg_write(provided = c("DATE", "REGION", "AGEGROUP", "SEX", "DEATHS"),
                            standard = c("date", "region", "age_band", "gender", "deaths"),
                            notes = c(NA, NA, NA, NA, "pool"),
                            table = column_mapping,
                            path = "/Users/gabrielburcea/Rprojects/maps/belgium_cases_mort/column_mapping.csv")



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

area_name_levels <- coronavirus_cases_latest %>%
  dplyr::distinct(Area.name) %>%
  rename(provided = Area.name) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(area_name_levels, file = "/Users/sakelly/maps/uk_gov_corona_virus_latest/area_name_levels.csv",  row.names = FALSE)

area_type_levels <- coronavirus_cases_latest %>%
  dplyr::distinct(Area.type) %>%
  rename(provided = Area.type) %>%
  tibble::add_column(standard = NA)
write.csv(area_type_levels, file = "/Users/sakelly/maps/uk_gov_corona_virus_latest/area_type_levels.csv",  row.names = FALSE)


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

health_region_levels <- individual_level_mortality %>%
  dplyr::distinct(health_region) %>%
  rename(provided = health_region) %>%
  tibble::add_column(standard = NA)
write.csv(health_region_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/health_region_levels.csv",  row.names = FALSE)

province_levels <- individual_level_mortality %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/province_levels.csv",  row.names = FALSE)

country_levels <- individual_level_mortality %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_levels, file = "/Users/sakelly/maps/canada_individual_level_mortality/country_levels.csv",  row.names = FALSE)

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

health_region_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(health_region) %>%
  rename(provided = health_region) %>%
  tibble::add_column(standard = NA)
write.csv(health_region_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/health_region_levels.csv",  row.names = FALSE)

province_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/province_levels.csv",  row.names = FALSE)

country_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/country_levels.csv",  row.names = FALSE)

travel_history_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(has_travel_history) %>%
  rename(provided = has_travel_history) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(travel_history_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/travel_history_levels.csv",  row.names = FALSE)

locally_acquired_levels <- public_covid_19_cases_canada %>%
  dplyr::distinct(locally_acquired) %>%
  rename(provided = locally_acquired) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(locally_acquired_levels, file = "/Users/sakelly/maps/canada_public_covid_19_cases/locally_acquired_levels.csv",  row.names = FALSE)

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


country_levels <- canada_testing_data %>%
  dplyr::distinct(country) %>%
  rename(provided = country) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(country_levels, file = "/Users/sakelly/maps/canada_testing_data/country_levels.csv",  row.names = FALSE)

province_levels <- canada_testing_data %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/canada_testing_data/province_levels.csv",  row.names = FALSE)

region_levels <- canada_testing_data %>%
  dplyr::distinct(region) %>%
  rename(provided = region) %>%
  tibble::add_column(standard = NA)
write.csv(region_levels, file = "/Users/sakelly/maps/canada_testing_data/region_levels.csv",  row.names = FALSE)

travel_levels <- canada_testing_data %>%
  dplyr::distinct(travel) %>%
  rename(provided = travel) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(travel_levels, file = "/Users/sakelly/maps/canada_testing_data/travel_levels.csv",  row.names = FALSE)

travelh_levels <- canada_testing_data %>%
  dplyr::distinct(travelh) %>%
  rename(provided = travelh) %>%
  tibble::add_column(standard = NA)
write.csv(travelh_levels, file = "/Users/sakelly/maps/canada_testing_data/travelh_levels.csv",  row.names = FALSE)

###canada_cumulative_case - Canada###

column_mapping <- cfg_write(provided = c("objectid", "hr_uid", "province", "engname", "frename", "casecount", "deaths", "recovered", "tests", "totalpop2019", "pop0to4_2019", "pop5to9_2019", "pop10to14_2019", "pop15to19_2019", "pop20to24_2019", "pop25to29_2019", "pop30to34_2019", "pop35to39_2019", "pop40to44_2019", "pop45to49_2019", "pop50to54_2019", "pop55to59_2019", "pop60to64_2019", "pop65to69_2019", "pop70to74_2019", "pop75to79_2019", "pop80to84_2019", "pop85older", "averageage_2019", "medianage_2019", "shape_area", "shape_length", "last_updated", "sourceurl", "globalid", "retreived_at"), 
                            standard = c("objectid", "hr_uid", "province", "engname", "frename", "casecount", "deaths", "recovered", "tests", "totalpop2019", "pop0to4_2019", "pop5to9_2019", "pop10to14_2019", "pop15to19_2019", "pop20to24_2019", "pop25to29_2019", "pop30to34_2019", "pop35to39_2019", "pop40to44_2019", "pop45to49_2019", "pop50to54_2019", "pop55to59_2019", "pop60to64_2019", "pop65to69_2019", "pop70to74_2019", "pop75to79_2019", "pop80to84_2019", "pop85older", "averageage_2019", "medianage_2019", "shape_area", "shape_length", "last_updated", "sourceurl", "globalid", "retreived_at"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/canada_cumulative_case/column_mapping.csv") 

province_levels <- canada_cumulative_case_count_by_new_hybrid_regional_health_boundaries %>%
  dplyr::distinct(province) %>%
  rename(provided = province) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/canada_cumulative_case/province_levels.csv",  row.names = FALSE)

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

### Italy ###

column_mapping <- cfg_write(provided = c("data", "stato", "codice_regione", "demoninazione_regione", "lat", "long", "ricoverati_con_sintomi", "terapia_intensiva", "totale_ospdalizzati", "isolamento_domicilaire", "totale_positivi", "variazione_totale_positivi", "nuovi_positivi", "dimessi_guariti", "deceduti", "total_casi", "tamponi", "casi_testati", "note_it", "note_en"), 
                            standard = c("data", "stato", "codice_regione", "demoninazione_regione", "GPS_latitude", "GPS_longitude", "ricoverati_con_sintomi", "terapia_intensiva", "totale_ospdalizzati", "isolamento_domicilaire", "totale_positivi", "variazione_totale_positivi", "nuovi_positivi", "dimessi_guariti", "deceduti", "total_casi", "tamponi", "casi_testati", "note_it", "note_en"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/italy/column_mapping.csv") 


denominazione_regione_levels <- covid_19_italy_situation_monitoring_by_region %>%
  dplyr::distinct(denominazione_regione) %>%
  rename(provided = denominazione_regione) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(stato_levels, file = "/Users/sakelly/maps/italy/denominazione_regione_levels.csv", row.names = FALSE)

### belgium_cases_mort - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "REGION", "AGEGROUP", "SEX", "DEATHS"), 
                            standard = c("date", "region", "agegroup", "sex", "deaths"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_cases_mort/column_mapping.csv")

region_levels <- COVID19BE_MORT %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_levels, file = "/Users/sakelly/maps/belgium_cases_mort/region_levels.csv",  row.names = FALSE)

age_group_levels <- COVID19BE_MORT %>%
  dplyr::distinct(AGEGROUP) %>%
  rename(provided = AGEGROUP) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_group_levels, file = "/Users/sakelly/maps/belgium_cases_mort/age_group_levels.csv",  row.names = FALSE)

sex_levels <- COVID19BE_MORT %>%
  dplyr::distinct(SEX) %>%
  rename(provided = SEX) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = c("female", "male", "unknown"))
write.csv(sex_levels, file = "/Users/sakelly/maps/belgium_cases_mort/sex_levels.csv", row.names = FALSE)


### belgium_covid19_age_sex - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "PROVINCE", "REGION", "AGEGROUP", "SEX", "CASES"), 
                            standard = c("date", "province", "region", "agegroup", "sex", "deaths"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_covid19_age_sex/column_mapping.csv")

province_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(PROVINCE) %>%
  rename(provided = PROVINCE) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/province_levels.csv",  row.names = FALSE)

region_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/region_levels.csv",  row.names = FALSE)

age_group_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(AGEGROUP) %>%
  rename(provided = AGEGROUP) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(age_group_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/age_group_levels.csv",  row.names = FALSE)

sex_levels <- COVID19BE_CASES_AGESEX %>%
  dplyr::distinct(SEX) %>%
  rename(provided = SEX) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = c("male", "female", "unknown"))
write.csv(sex_levels, file = "/Users/sakelly/maps/belgium_covid19_age_sex/sex_levels.csv", row.names = FALSE)

### belgium_covid19_cases_hosp - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "PROVINCE", "REGION", "NR_REPORTING", "TOTAL_IN", "TOTAL_IN_ICU", "TOTAL_IN_RESP", "TOTAL_IN_ECMO", "NEW_IN", "NEW_OUT"), 
                            standard = c("date", "province", "region", "nr_reporting", "total_in", "total_in_icu", "total_in_resp", "total_in_ecmo", "new_in", "new_out"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_covid19_cases_hosp/column_mapping.csv")

province_levels <- COVID19BE_HOSP %>%
  dplyr::distinct(PROVINCE) %>%
  rename(provided = PROVINCE) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(province_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_hosp/province_levels.csv",  row.names = FALSE)

region_levels <- COVID19BE_HOSP %>%
  dplyr::distinct(REGION) %>%
  rename(provided = REGION) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(region_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_hosp/region_levels.csv",  row.names = FALSE)

### belgium_covid19_cases_muni - BELGIUM ###

column_mapping <- cfg_write(provided = c("DATE", "NIS5", "TX_DESCR_NL", "TX_DESCR_FR", "TX_ADM_DSTR_DECSR_NL", "TX_ADM_DSTR_DESCR_FR", "TX_PROV_DESCR_NL", "TX_PROV_DESCR_FR", "TX_RGN_DESCR_NL", "TX_RGN_DESCR_FR", "CASES"), 
                            standard = c("date", "nis5", "tx_descr_nl", "tx_descr_fr", "tx_adm_dstr_descr", "tx_adm_dstr_descr_fr", "tx_prov_descr_nl", "tx_prov_descr_fr", "tx_rgn_descr_nl", "tx_rgn_descr_fr", "cases"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_covid19_cases_muni/column_mapping.csv")

tx_descr_nl_levels <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_DESCR_NL) %>%
  rename(provided = TX_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_descr_nl_levels.csv",  row.names = FALSE)

tx_descr_fr_levels <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_DESCR_FR) %>%
  rename(provided = TX_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_descr_fr_levels.csv",  row.names = FALSE)

tx_adm_dstr_descr_nl_levels <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_ADM_DSTR_DESCR_NL) %>%
  rename(provided = TX_ADM_DSTR_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_adm_dstr_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_adm_dstr_descr_nl_levels.csv",  row.names = FALSE)

tx_adm_dstr_descr_fr_levels <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_ADM_DSTR_DESCR_FR) %>%
  rename(provided = TX_ADM_DSTR_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_adm_dstr_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_adm_dstr_descr_fr_levels.csv",  row.names = FALSE)

tx_prov_descr_nl_levels <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_PROV_DESCR_NL) %>%
  rename(provided = TX_PROV_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_prov_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_prov_descr_nl_levels.csv",  row.names = FALSE)

tx_prov_descr_fr_levels <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_PROV_DESCR_FR) %>%
  rename(provided = TX_PROV_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_prov_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_prov_descr_fr_levels.csv",  row.names = FALSE)

tx_rgn_descr_nl_levels <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_RGN_DESCR_NL) %>%
  rename(provided = TX_RGN_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_rgn_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_rgn_descr_nl_levels.csv",  row.names = FALSE)

tx_rgn_descr_fr_levels <- COVID19BE_CASES_MUNI %>%
  dplyr::distinct(TX_RGN_DESCR_FR) %>%
  rename(provided = TX_RGN_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_rgn_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni/tx_rgn_descr_fr_levels.csv",  row.names = FALSE)


### belgium_covid19_cases_muni_cum - BELGIUM ###

column_mapping <- cfg_write(provided = c("NIS5", "TX_DESCR_NL", "TX_DESCR_FR", "TX_ADM_DSTR_DECSR_NL", "TX_ADM_DSTR_DESCR_FR", "TX_PROV_DESCR_NL", "TX_PROV_DESCR_FR", "TX_RGN_DESCR_NL", "TX_RGN_DESCR_FR", "CASES"), 
                            standard = c("nis5", "tx_descr_nl", "tx_descr_fr", "tx_adm_dstr_descr", "tx_adm_dstr_descr_fr", "tx_prov_descr_nl", "tx_prov_descr_fr", "tx_rgn_descr_nl", "tx_rgn_descr_fr", "cases"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/column_mapping.csv")

tx_descr_nl_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_DESCR_NL) %>%
  rename(provided = TX_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_descr_nl_levels.csv",  row.names = FALSE)

tx_descr_fr_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_DESCR_FR) %>%
  rename(provided = TX_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_descr_fr_levels.csv",  row.names = FALSE)

tx_adm_dstr_descr_nl_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_ADM_DSTR_DESCR_NL) %>%
  rename(provided = TX_ADM_DSTR_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_adm_dstr_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_adm_dstr_descr_nl_levels.csv",  row.names = FALSE)

tx_adm_dstr_descr_fr_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_ADM_DSTR_DESCR_FR) %>%
  rename(provided = TX_ADM_DSTR_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_adm_dstr_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_adm_dstr_descr_fr_levels.csv",  row.names = FALSE)

tx_prov_descr_nl_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_PROV_DESCR_NL) %>%
  rename(provided = TX_PROV_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_prov_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_prov_descr_nl_levels.csv",  row.names = FALSE)

tx_prov_descr_fr_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_PROV_DESCR_FR) %>%
  rename(provided = TX_PROV_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_prov_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_prov_descr_fr_levels.csv",  row.names = FALSE)

tx_rgn_descr_nl_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_RGN_DESCR_NL) %>%
  rename(provided = TX_RGN_DESCR_NL) %>%
  tibble::add_column(standard = NA)
write.csv(tx_rgn_descr_nl_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_rgn_descr_nl_levels.csv",  row.names = FALSE)

tx_rgn_descr_fr_levels <- COVID19BE_CASES_MUNI_CUM %>%
  dplyr::distinct(TX_RGN_DESCR_FR) %>%
  rename(provided = TX_RGN_DESCR_FR) %>%
  tibble::add_column(standard = NA)
write.csv(tx_rgn_descr_fr_levels, file = "/Users/sakelly/maps/belgium_covid19_cases_muni_cum/tx_rgn_descr_fr_levels.csv",  row.names = FALSE)

### ecdc data ###

column_mapping <- cfg_write(provided = c("dateRep", "day", "month", "year", "cases", "deaths", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"), 
                            standard = c("date", "day", "month", "year", "cases", "deaths", "countriesAndTerritories", "geoId", "countryterritoryCode", "popData2018", "continentExp"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/ecdc_data/column_mapping.csv")

countriesAndTerritories_levels <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(countriesAndTerritories) %>%
  rename(provided = countriesAndTerritories) %>%
  tibble::add_column(standard = NA)
write.csv(countriesAndTerritories_levels, file = "/Users/sakelly/maps/ecdc_data/countriesAndTerritories_levels.csv",  row.names = FALSE)

geoId_levels <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(geoId) %>%
  rename(provided = geoId) %>%
  tibble::add_column(standard = NA)
write.csv(geoId_levels, file = "/Users/sakelly/maps/ecdc_data/geoId_levels.csv",  row.names = FALSE)

countryterritoryCode_levels <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(countryterritoryCode) %>%
  rename(provided = countryterritoryCode) %>%
  tibble::add_column(standard = NA)
write.csv(countryterritoryCode_levels, file = "/Users/sakelly/maps/ecdc_data/countryterritoryCode_levels.csv",  row.names = FALSE)

continentExp_levels <- COVID19_geographic_distribution_worldwide %>%
  dplyr::distinct(continentExp) %>%
  rename(provided = continentExp) %>%
  tibble::add_column(standard = NA)
write.csv(continentExp_levels, file = "/Users/sakelly/maps/ecdc_data/continentExp_levels.csv",  row.names = FALSE)

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

### worldwide_owid-covid_data ###

column_mapping <- cfg_write(provided = c("iso_code", "continent", "location", "date", "total_cases", "new_cases", "total_deaths", "new_deaths", "total_cases_per_million", "new_cases_per_million", "total_deaths_per_million", "new_deaths_per_million", "total_tests", "new_tests", "total_tests_per_thousand", "new_tests_per_thousand", "new_tests_per_thousand", "new_tests_smoothed", "new_tests_smoothed_per_thousand", "tests_unit", "stringency_index", "population", "population_density", "median_age", "aged_65_older", "aged_70_older", "gdp_per_capita", "extreme_poverty", "cvd_death_rate", "diabetes_prevalence", "female_smokers", "male_smokers", "handwashing_facilities", "hospital_beds_per_thousand"), 
                            standard = c("iso_code", "continent", "location", "date", "total_cases", "new_cases", "total_deaths", "new_deaths", "total_cases_per_million", "new_cases_per_million", "total_deaths_per_million", "new_deaths_per_million", "total_tests", "new_tests", "total_tests_per_thousand", "new_tests_per_thousand", "new_tests_per_thousand", "new_tests_smoothed", "new_tests_smoothed_per_thousand", "tests_unit", "stringency_index", "population", "population_density", "median_age", "aged_65_older", "aged_70_older", "gdp_per_capita", "extreme_poverty", "cvd_death_rate", "diabetes_prevalence", "female_smokers", "male_smokers", "handwashing_facilities", "hospital_beds_per_thousand"),
                            table = column_mapping, 
                            path = "/Users/sakelly/maps/worldwide_owid-covid_data/column_mapping.csv")

iso_code_levels <- owid_covid_data %>%
  dplyr::distinct(iso_code) %>%
  rename(provided = iso_code) %>%
  tibble::add_column(standard = NA)
write.csv(iso_code_levels, file = "/Users/sakelly/maps/worldwide_owid-covid_data/iso_code_levels.csv",  row.names = FALSE)

continent_levels <- owid_covid_data %>%
  dplyr::distinct(continent) %>%
  rename(provided = continent) %>%
  tibble::add_column(standard = NA) %>%
  mutate(standard = ifelse(is.na(standard), provided, standard))
write.csv(continent_levels, file = "/Users/sakelly/maps/worldwide_owid-covid_data/continent_levels.csv",  row.names = FALSE)

location_levels <- owid_covid_data %>%
  dplyr::distinct(location) %>%
  rename(provided = location) %>%
  tibble::add_column(standard = NA)
write.csv(location_levels, file = "/Users/sakelly/maps/worldwide_owid-covid_data/location_levels.csv",  row.names = FALSE)



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


# X111_Online_Covid_19_data_2020_06_04

column_mapping <- cfg_write(provided = c("journeydate", "sex", "ageband", "ccgcode", "ccgname", "Total"), 
                            standard = c("journey_date", "sex", "age_band", "ccg_code", "ccg_name", "total"), 
                            table = column_mapping, 
                            path = "/Users/gabrielburcea/Rprojects/maps/nhs-111_online_covid19_data/column_mapping.csv")
  
sex_levels <- X111_Online_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(sex) %>%
  dplyr::rename(provided = sex) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(sex_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs-111_online_covid19_data/sex_levels.csv", row.names = FALSE)


age_band_levels <- X111_Online_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(ageband) %>%
  dplyr::rename(provided = ageband) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(age_band_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs-111_online_covid19_data/age_band_levels.csv", row.names = FALSE)

ccg_code_levels <-  X111_Online_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(ccgcode) %>%
  dplyr::rename(provided = ccgcode) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(ccg_code_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs-111_online_covid19_data/ccg_code_levels.csv", row.names = FALSE) 


ccg_name_levels <- X111_Online_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(ccgname) %>%
  dplyr::rename(provided = ccgname) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(ccg_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs-111_online_covid19_data/ccg_name_levels.csv", row.names = FALSE) 



# nhs_111_online_covid_19_data_ccg_mapped

column_mapping <- cfg_write(provided = c("journeydate", "gender", "ageband", "CCGcode", "CCGname", "April20 mapped CCGCode", "April20 mappedCCGName", "Total"), 
                            standard = c("journey_date", "sex", "age_band", "ccg_code", "ccg_name","april20_mapped_ccgcode", "april20_mapped_ccgname", "total"), 
                            table = column_mapping, 
                            path = "/Users/gabrielburcea/Rprojects/maps/nhs_111_online_covid_19_data_ccg_mapped/column_mapping.csv")

sex_levels <- X111_Online_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(gender) %>%
  dplyr::rename(provided = gender) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(sex_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_111_online_covid_19_data_ccg_mapped/sex_levels.csv", row.names = FALSE)


age_band_levels <- X111_Online_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(ageband) %>%
  dplyr::rename(provided = ageband) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(age_band_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_111_online_covid_19_data_ccg_mapped/age_band_levels.csv", row.names = FALSE)

ccg_code_levels <-  X111_Online_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(CCGCode) %>%
  dplyr::rename(provided = CCGCode) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(ccg_code_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_111_online_covid_19_data_ccg_mapped/ccg_code_levels.csv", row.names = FALSE) 


ccg_name_levels <- X111_Online_Covid_19_data_CCG_mapped %>%
  dplyr::distinct(CCGName) %>%
  dplyr::rename(provided = CCGName) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(ccg_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_111_online_covid_19_data_ccg_mapped/ccg_name_levels.csv", row.names = FALSE) 

### NHS_Patways_Covid_19_data_2020_06_04

column_mapping <- 
  cfg_write(provided = c("SiteType", "Call Date", "Sex", "AgeBand", "CCGCode", "CCGName", "TriageCount"), 
            standard = c("site_type", "call_date", "sex", "age_band", "ccg_code","ccg_name", "triage_count"), 
            table = column_mapping, 
            path = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/column_mapping.csv")

site_type_levels <- NHS_Pathways_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(SiteType) %>%
  dplyr::rename(provided = SiteType) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(site_type_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/csite_type_levels.csv", row.names = FALSE)

sex_levels <- NHS_Pathways_Covid_19_data_2020_06_04 %>%
  dplyr::distinct(Sex) %>%
  dplyr::rename(provided = Sex) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))


write.csv(sex_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/sex_levels.csv", row.names = FALSE)


age_band_levels <- NHS_Pathways_Covid_19_data_2020_06_04  %>%
  dplyr::distinct(AgeBand) %>%
  dplyr::rename(provided = AgeBand) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(age_band_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/age_band_levels.csv", row.names = FALSE)




ccg_code_levels <-  NHS_Pathways_Covid_19_data_2020_06_04  %>%
  dplyr::distinct(CCGCode) %>%
  dplyr::rename(provided = CCGCode) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))

write.csv(ccg_code_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/ccg_code_levels.csv", row.names = FALSE) 



ccg_name_levels <- NHS_Pathways_Covid_19_data_2020_06_04%>%
  dplyr::distinct(CCGName) %>%
  dplyr::rename(provided = CCGName) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = ifelse(is.na(standard), provided, standard))


write.csv(ccg_name_levels, file = "/Users/gabrielburcea/Rprojects/maps/nhs_pathways_covid_19_data_2020-06-04/ccg_name_levels.csv", row.names = FALSE) 


# no_deaths_all_causes_care_homes_local_authority 
# ons_deaths_across_england_wales_scotland_northern_ireland and all the ons data
# we need to ask further as to how to deal with this type of data 


# study survey data 

column_mapping <- cfg_write(provided = c("q1", "q2", "q3", 
                                         "q4_0", "q4_1", "q4_2", "q4_3",  "q4_4", "q4_5", "q4_6", "q4_7", "q4_8", 
                                         "q5_0","q5_1","q5_2","q5_3","q5_4","q5_5","q5_6","q5_7", "q5_8","q5_9", "q5_10",  "q5_other", "bmi", "q8", "q9", "q10",
                                         "q11_0", "q11_1" , "q11_2" , "q11_3" , "q11_4" , "q11_5" ,"q11_6" ,  "q11_7" , "q11_8" , "q11_9" , "q11_10" , "q11_11" , "q11_12" ,"q11_other", "q11_other_value",
                                         "q12", "q13", "q14a", "q14b", "q14c", "q15", "q16", "q17", "q18_0", "q18_1", "q18_2", "q18_3", "q18_4", "q18_5", "q18_6", 
                                         "q19_0", "q19_1", "q19_2", "q19_3", "q19_4", "q19_5", "q19_6", "q19_7", "q19_8", "q19_9","q19_10", "q20", "q21", 
                                         "q22", "q23", "q24", "q25", 
                                         "q26_0" ,  "q26_1", "q26_2","q26_3", "q26_4", "q26_5", "q26_6", "q26_7", "q26_8", "q26_9", "q26_10", "q26_11", "q26_12", "q26_13", "q26_14", "q26_15", "q26_16"), 
                            standard = c("agree_share", "sex", "date_birth", "no_say_birth","indigineous", "other_north_american", "european", 
                                         "caribbean", "latin_central_south_american", "african", "asian", "oceania", "not_visible_minority", "no_say_ethnicity", 
                                         "south_asian", "chinese", "black", "filipino", "arab", "south_east_asian", "west_asian", "korean", "japanese", "other_ethnicity", 
                                         "bmi","country_currently_live", "tested_positive_yes_no", "symptoms_experience", 
                                         "cough", "fever_more_38", "feverishchills", "throat_pain", "rhinits", "shorthness_of_breath", "nausea_vomitting", "headache", "general_weakness", 
                                         "pain_muscular_chest_abdominal_joint_est", "iritability", "confusion", "diarrhoea", "other", "other_value", 
                                         "first_symptoms_isolate", "addmitted_hospital", 
                                         "once_symptoms_days_until_admitted", "ventilator","days_symptoms_days_until_ventilator", 
                                         "current_health","if_recovered_returned_normal","medication_treat_covid",
                                         "remdesivir", "chloroquine_and_hydroxychloroquine", "hydroxychloroquine", "ritonavirlopinavir", 
                                         "ritonavirlopinavir_and_interferon-beta", "tocilizumab", 'none_of_the_above', 
                                         "no_travel", "Africa", "Asia", "Central America", "Europe", "Middle East", "North America", "Oceania", "South America", 
                                         "Caribbean", "Within Canada", "contact_person_fever_cough_traveled", "contact_with_covid_19_person",
                                         "prior_symptom_onset_visited_healthcare_facility", "if_no_attempted", "people_in_household", "pre-existing_conditions", 
                                         "autoimune", "cancer", "cardiovascular_disease", "cerebrovascular_disease", "chronic_lung_disease", "chronic_neurological_or_neuromuscular_disorder", 
                                         "diabetes", "obesity", "hypertension", "immunosuppression", "liver_disease", "post_partum_less_than_6_weeks", "pregnancy", "renal_disease", "current_smoker",
                                         "other", "other_value"), 
                            table = column_mapping, 
                            path = "/Users/gabrielburcea/Rprojects/maps/self_care_catalysts/column_mapping.csv")



sex_levels <- survey_data %>%
  dplyr::distinct(q2) %>%
  dplyr::rename(provided = q2) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = c("Female", "Male", "Other"))           

write.csv(sex_levels, file = "/Users/gabrielburcea/Rprojects/maps/self_care_catalysts/sex_levels.csv", row.names = FALSE)

once_symptoms_days_until_admitted_levels <- survey_data %>%
  dplyr::distinct(q14a) %>%
  dplyr::rename(provided = q14a) %>%
  tibble::add_column(standard = NA)

write.csv(once_symptoms_days_until_admitted_levels, file = "/Users/gabrielburcea/Rprojects/maps/self_care_catalysts/once_symptoms_days_until_admitted_levels.csv", row.names = FALSE)


days_symptoms_days_until_ventilator_levels <- survey_data %>%
  dplyr::distinct(q14c) %>%
  dplyr::rename(provided = q14c) %>%
  tibble::add_column(standard = NA)


write.csv(days_symptoms_days_until_ventilator_levels, file = "/Users/gabrielburcea/Rprojects/maps/self_care_catalysts/days_symptoms_days_until_ventilator_levels.csv", row.names = FALSE)

current_health_levels <- survey_data %>%
  dplyr::distinct(q15) %>%
  dplyr::rename(provided = q15) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = c(NA, NA, "Stable")) 

write.csv(current_health_levels, file = "/Users/gabrielburcea/Rprojects/maps/self_care_catalysts/current_health_levels.csv", row.names = FALSE)

if_recovered_returned_normal_levels <- survey_data %>%
  dplyr::distinct(q16) %>%
  dplyr::rename(provided = q16) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = c(NA, "1-4 days", "5-7 days",  "+14 days", "8-14 days"))


write.csv(if_recovered_returned_normal_levels, file = "/Users/gabrielburcea/Rprojects/maps/self_care_catalysts/if_recovered_returned_normal_levels.csv", row.names = FALSE)
  
people_in_household_levels <- survey_data %>% 
  dplyr::distinct(q24) %>%
  dplyr::rename(provided = q24) %>%
  tibble::add_column(standard = NA) %>%
  dplyr::mutate(standard = c("0 people", "3-5 people", "1-2 people", NA, ">7 people", "6-7 people"))

write.csv(people_in_household_levels, file = "/Users/gabrielburcea/Rprojects/maps/self_care_catalysts/people_in_household_levels.csv", row.names = FALSE)


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



