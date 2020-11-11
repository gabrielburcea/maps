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

