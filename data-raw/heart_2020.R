library(readr)
library(ROSE)

# read in data
heart_disease <- read_csv("data-raw/heart_2020.csv", show_col_types = FALSE)

# data wrangling, undersampling to make the dataset more balanced and less biased
count_hd <- 27373

proportion_hd <- count_hd / .50

undersampling <- ovun.sample(formula = HeartDisease ~ ., data = heart_disease, method="under", N = 54746, seed = 102)

heart_disease <- undersampling$data

# save data in data directory
usethis::use_data(heart_disease, overwrite = TRUE)
