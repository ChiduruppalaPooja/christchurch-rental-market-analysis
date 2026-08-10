library(tidyverse)


#PART ONE: FILTER AND MERGE DATA SETS
# Filtering to christchuch only using dplyr from tidyverse
chcListingsJun2026 <- listingsJun2026 %>%
  filter(neighbourhood_group == "Christchurch City")

# Add Month and Year Variables
chcListingsJun2026 <- chcListingsJun2026 |> mutate(data_month = "June")
chcListingsJun2026 <- chcListingsJun2026|> mutate(data_year = "2026")

# Merge Datasets 
chcListingsTotal <- rbind(chcListingsOct2025, chcListingsNov2025, chcListingsDec2025, chcListingsJan2026, chcListingsFeb2026, chcListingsMar2026, chcListingsApr2026, chcListingsMay2026, chcListingsJun2026)

#PART 2: Export merged dataset as .csv
write.csv(chcListingsTotal, "chcListingsTotal.csv")


#PART 3: Record statistics of every column in data_set 
categories <- unique(chcListingsTotal$room_type) 
numberOfCategories <- length(categories)
print(categories)
print(numberOfCategories)

#Scan through Columns to find summary statistics
for (i in colnames(chcListingsTotal)) {
  if (class(chcListingsTotal[[i]]) == "character"){
    print(chcListingsTotal[[i]])
    print(length(unique(chcListingsTotal[[i]])))
  }
}


#PART 4: Recreate Graphs in last-weeks codeless module
#GRAPH 1: Histogram of Listing Prices
chcListingsTotalFilt <- chcListingsTotal %>%
  filter(price < 3000)

hist(chcListingsTotalFilt$price, breaks = 50, xlab = "Price of Listing (nzd)", main = "Histogram of listing prices in Christhcurch")

#GRAPH 2: Histogram of days since last reveiw
date_diffs <- c()
end_date <- as.POSIXlt("2026-06-21")
for (given_date in chcListingsTotal$last_review){
  if (!is.na(given_date) & given_date != ""){
    start_date <- as.POSIXct(given_date)
    time_diff <- difftime(end_date, start_date, units = "days")
    numeric_days <- as.numeric(time_diff)
    date_diffs <- c(date_diffs, numeric_days)
  }
}

#GRAPH 3: Histogram of number of reviews in the 90th percentile.
hist(date_diffs, xlab = "Days since last review", main = "Histrogram of days since last review")

chcListingsTop10Per <- chcListingsTotal %>%
  slice_max(order_by = number_of_reviews, prop = 0.1)
hist(chcListingsTop10Per$number_of_reviews, xlab = "Number of Reviews", main = "Histogram of 90th percentile of total reviews \n in a listing")



