#Loading Required Libraries:
library(tidyverse)
#Loading Dataset
chcListingsTotal <- read.csv(chcListingsTotal)

#1). Remove uneeded catagories, (chosen catagories and reasoning can be found in ReadMe)
# using the subset function:

chcListingsCut <- subset(chcListingsTotal, select= -c(name, host_name, number_of_reviews, last_review, reviews_per_month, number_of_reviews_ltm, license))

#2). Remove all duplicate ids, this to clean up any duplicate entries created via the merging of monthly Airbnb data.
# All newer entries instances are given priority over the other duplicates to ensure all entries have their most recent information.
# (This will be created into a seperate datasheet in-case the duplicates are required for a future deliverable. )
# This will be done using the dplyr distinct() function (this was used over the inbuilt !duplicate() fuction as id is a double value).

chcListingsCutNoDup <- distinct(chcListingsCut, id, .keep_all = TRUE)

# id was used to identify duplicates as it is the only key value for the individual listing.

#3). Export cleaned datasheet as a csv file. (using the in-built write.csv() function):

write.csv(chcListingsCutNoDup, "chcListingsCutNoDup.csv")

