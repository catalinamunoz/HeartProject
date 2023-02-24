library(readr)
library(ROSE)

# read in data
heart_disease <- read_csv("data-raw/heart_2020.csv", show_col_types = FALSE)

# undersampling to make the dataset more balanced and less biased
count_hd <- 27373

proportion_hd <- count_hd / .50

undersampling <- ovun.sample(formula = HeartDisease ~ ., data = heart_disease, method="under", N = 54746, seed = 102)

heart_disease <- undersampling$data

# transform characters into factors
heart_disease$HeartDisease <- as.factor(heart_disease$HeartDisease)
heart_disease$Smoking <- as.factor(heart_disease$Smoking)
heart_disease$AlcoholDrinking <- as.factor(heart_disease$AlcoholDrinking)
heart_disease$Stroke <- as.factor(heart_disease$Stroke)
heart_disease$DiffWalking <- as.factor(heart_disease$DiffWalking)
heart_disease$Sex <- as.factor(heart_disease$Sex)
heart_disease$AgeCategory <- as.factor(heart_disease$AgeCategory)
heart_disease$Race <- as.factor(heart_disease$Race)
heart_disease$Diabetic <- as.factor(heart_disease$Diabetic)
heart_disease$PhysicalActivity <- as.factor(heart_disease$PhysicalActivity)
heart_disease$GenHealth <- as.factor(heart_disease$GenHealth)
heart_disease$Asthma <- as.factor(heart_disease$Asthma)
heart_disease$KidneyDisease <- as.factor(heart_disease$KidneyDisease)
heart_disease$SkinCancer <- as.factor(heart_disease$SkinCancer)

# Modify mental & physical health into factor to make them easier to interpret

# good: 0-5, fair: 6-14, bad: 15-30
heart_disease <- heart_disease %>% mutate(MentalHealth =
                                            case_when(MentalHealth >= 0 & MentalHealth<=5 ~ "Good",
                                                      MentalHealth >= 6 & MentalHealth<=14 ~ "Fair",
                                                      MentalHealth >= 15 & MentalHealth<=30 ~ "Bad"))

# good: 0-5, fair: 6-14, bad: 15-30
heart_disease <- heart_disease %>% mutate(PhysicalHealth =
                                            case_when(PhysicalHealth >= 0 & PhysicalHealth<=5 ~ "Good",
                                                      PhysicalHealth >= 6 & PhysicalHealth<=14 ~ "Fair",
                                                      PhysicalHealth >= 15 & PhysicalHealth<=30 ~ "Bad"))

heart_disease$MentalHealth <- as.factor(heart_disease$MentalHealth)
heart_disease$PhysicalHealth <- as.factor(heart_disease$PhysicalHealth)

# save data in data directory
usethis::use_data(heart_disease, overwrite = TRUE)
