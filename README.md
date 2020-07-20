# maps

merging Covid-19 data together 
the repository contains folders per datasets. Each folder's name is a copy of the dataset name. Additionally, each folder has a config files for mapping the ontologies according to panmap view protocol. Each folder will contain a column mapping in which all variables with the provided names will appear as rows under provided column. The provided column names will be 'recoded' to ontological name - a universal name. This is done for the purpose of interoperability and working with universal names,where possible, in the process of merging the datasets into one. 

## Standardising the generic/obvious variables
### Variable gender 
provided variable for Sex ->  gender 
provided categories for gender if M -> male 
                                  F -> female  
                                  NA -> unknown
### Variable Date    
provided variable Date -> date

### Variable age group
provided AGEGROUP -> agegroup

### Variable sample_count
provided variable for number tested -> sample_count

### Variable GPS location
provided variable latitude -> GPS_latitude
provided vartiable longitude -> GPS_longitude
    
## Columns to be added to datasets
### Data Types
Aggregate data -> pool
Individual data -> individual

### UK data 
Add a column that provides the name of the country the data was collected from
Column to be named -> location_country


