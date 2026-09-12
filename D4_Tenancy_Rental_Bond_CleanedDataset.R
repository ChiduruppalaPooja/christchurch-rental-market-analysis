##Read Tenancy_Renta_Bond
Tenancy_Rental_Bond_DATE_CLEANING <- read.csv("C:/Users/prash/OneDrive/Desktop/DATA201/Group Assignment/Tenancy_Rental_Bond_DATE_CLEANING.csv", header=TRUE)

# Drop columns Upper_Quartile_Rent, Lower_Quartile_Rent and Log_Std_Dev_Weekly_Rent
df_clean_column <- subset(Tenancy_Rental_Bond_DATE_CLEANING, select = -c(Upper_Quartile_Rent, Lower_Quartile_Rent, Log_Std_Dev_Weekly_Rent))


library(dplyr)
library(tidyr)

clean_df_na_Tenancy <- df_clean_column %>%
  # Convert both literal "NULL" text and "-99" into proper NA values
  mutate(across(where(is.character), ~na_if(., "NULL"))) %>%
  mutate(across(where(is.character), ~na_if(., "-99")))

#The R script has the following function to drop rows with na data commented in the script. We have decided not to remove any unavailable data at this stage. 
# Drop the rows
# drop_na(clean_df_na_Tenancy)
