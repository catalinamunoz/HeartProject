library(HeartProject)

bmi <- heart_disease %>% select( HeartDisease, BMI )

# BMI & heart disease
bmi_yes <- bmi %>% filter(HeartDisease == 'Yes')

# BMI & no heart disease
bmi_no <- bmi %>% filter(HeartDisease == 'No')

# t test to see difference in means between groups
t.test( bmi_yes$BMI,bmi_no$BMI, var.equal = TRUE)

sleep <- heart_disease %>% select( HeartDisease, SleepTime )

# sleep & heart disease
sleep_yes <- sleep %>% filter(HeartDisease == 'Yes')

# sleep and no heart disease
sleep_no <- sleep %>% filter(HeartDisease == 'No')

# t test to see difference in means between groups
t.test( sleep_yes$SleepTime,sleep_no$SleepTime, var.equal = TRUE)

# association test
hd_test<-chisq.test(table(heart_disease$Smoking, heart_disease$HeartDisease))

chisq.test(table(heart_disease$Smoking, heart_disease$HeartDisease))
chisq.test(table(heart_disease$Sex, heart_disease$HeartDisease))
chisq.test(table(heart_disease$GenHealth, heart_disease$HeartDisease))
chisq.test(table(heart_disease$AlcoholDrinking, heart_disease$HeartDisease))
chisq.test(table(heart_disease$Stroke, heart_disease$HeartDisease))
chisq.test(table(heart_disease$MentalHealth, heart_disease$HeartDisease))
chisq.test(table(heart_disease$DiffWalking, heart_disease$HeartDisease))
chisq.test(table(heart_disease$AgeCategory, heart_disease$HeartDisease))
chisq.test(table(heart_disease$SkinCancer, heart_disease$HeartDisease))
chisq.test(table(heart_disease$Diabetic, heart_disease$HeartDisease))
chisq.test(table(heart_disease$PhysicalActivity, heart_disease$HeartDisease))
chisq.test(table(heart_disease$Asthma, heart_disease$HeartDisease))
chisq.test(table(heart_disease$KidneyDisease, heart_disease$HeartDisease))

# from all tests, p-value < 2.2e-16

p.adjust(hd_test$p.value,method=p.adjust.methods)

