# mexico 


column_mapping <- maps::cfg_write(provided = c("report_date", "state", "sex", "age", "date_of_start_of_symptoms", "status", "origin", "date_of_arrival_in_mexico", "report_url"), 
                            standard = c("date", "state", "sex", "age", "date_of_start_of_symptoms", "status", "origin", "date_of_arrival_in_mexico", "report_url"),
                            term_id = c(NA, "GAZ:00000448", "PATO:0000047", "OBI:0001169",NA, NA, NA, NA, NA),
                            units = c(NA, NA, NA, NA,NA, NA, NA, NA, NA), 
                            units_id = c(NA, NA, NA, NA,NA, NA, NA, NA, NA), 
                            value_mapping_file = c(NA, "state_levels.csv", "sex_levels.csv", NA, "status_levels.csv", "origin_levels", NA, NA, NA),
                            notes = c(NA, "geographic location or locatio of?", NA, NA,"need to check what date?", "this is in spanish: suspected", NA, NA, NA), 
                            table = column_mapping,
                            path = "/Users/gabrielburcea/rprojects/maps/mexico/column_mapping.csv")



constant_values <- maps::const_val_fct(column_name = c("country" , "geographic_resolution", "case_type" ), 
                                 term_id =  c('ENVO:00000009', NA, NA),
                                 constant_values =  c("Mexico", NA, "symptoms"), 
                                 values_id = c(NA, NA, NA),
                                 units = c(NA, NA, NA), 
                                 units_id = c(NA, NA, NA), 
                                 notes = c(NA, NA, "ask ontology team"), 
                                 table = constant_values,
                                 path = "/Users/gabrielburcea/rprojects/maps/mexico/constant_values.csv")


# Italy 
constant_values <- const_val_fct(column_name = c("country", "data", "stato", "codice_regione", "demoninazione_regione", "lat", "long", "ricoverati_con_sintomi", "terapia_intensiva", "totale_ospdalizzati", "isolamento_domicilaire", "totale_positivi", "variazione_totale_positivi", "nuovi_positivi", "dimessi_guariti", "deceduti", "total_casi", "tamponi", "casi_testati", "note_it", "note_en"), 
                                 term_id =  c('ENVO:00000009', NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                                 constant_values =  c("Italy",NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                                 values_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                                 units = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA ), 
                                 units_id = c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                                 notes = c(NA, "talk", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), 
                                 table = constant_values,
                                 path = "/Users/gabrielburcea/rprojects/maps/italy/constant_values.csv")




