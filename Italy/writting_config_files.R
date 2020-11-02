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
