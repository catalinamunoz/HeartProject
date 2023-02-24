library(HeartProject)
library(ggplot2)
library(cowplot)
library(tidyverse)
library(kableExtra)

# get percentages
age_hd <- heart_disease %>%
  group_by(AgeCategory) %>%
  mutate(d = n()) %>%
  group_by(AgeCategory, HeartDisease) %>%
  summarise(Perc = n()/first(d)*100, .groups = "drop") %>%
  pivot_wider(
    id_cols = AgeCategory,
    names_from = HeartDisease,
    values_from = Perc)

# heart disease by age (percentage)
p1 <- ggplot(data = age_hd, aes(x=AgeCategory, y = Yes)) +
  geom_bar(stat="identity", color = "darkturquoise", fill = "darkturquoise") +
  labs(y = "Percentage", x = "Age Category") +
  ggtitle("A - Heart Disease by Age") +
  theme( axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  theme(text = element_text(size = 8))

# heart disease by gender
p2 <- ggplot(data= heart_disease, aes(x=Sex)) +
  geom_bar( position = position_dodge(), aes(fill = HeartDisease)) +
  labs(y = "Participant Count", x = "Gender") +
  ggtitle("B - Heart Disease by Gender") +
   guides(fill="none")

levels(heart_disease$Diabetic) <- c("No", "Borderline", "Yes", "During Pregnancy")

# heart disease by diabetes
p3 <- ggplot(data= heart_disease, aes(x=Diabetic)) +
  geom_bar( position = position_dodge(), aes(fill = HeartDisease) ) +
  labs(y = "Participant Count") +
  ggtitle("C - Heart Disease by Diabetes") +
  guides(fill="none")+
  theme( axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) + guides(fill="none")

# heart disease by walking difficulty
p4 <- ggplot(data= heart_disease, aes(x=DiffWalking)) +
  geom_bar( position = position_dodge(),aes(fill = HeartDisease)) +
  labs(y = "Participant Count") +
  ggtitle("D - Heart Disease by Walking Difficulty") +
  guides(fill="none")

# relevel factors
heart_disease$GenHealth <- ordered(heart_disease$GenHealth, levels = c("Poor", "Fair", "Good", "Very good", "Excellent"))

# heart disease by general health
p5 <- ggplot(data= heart_disease, aes(x=GenHealth)) +
  geom_bar( position = position_dodge(), aes(fill = HeartDisease)) +
  labs(y = "Participant Count") +
  ggtitle("E - Heart Disease by General Health") +
  guides(fill="none")

# heart disease by smoking
p6 <- ggplot(heart_disease, aes(x=Smoking)) +
  geom_bar( position = position_dodge(), aes(fill=HeartDisease) ) +
  labs(y = "Participant Count") +
  ggtitle("F - Heart Disease by Smoking") +
  guides(fill="none")

# heart disease by stroke
p7 <- ggplot(heart_disease, aes(x=Stroke)) +
  geom_bar( position = position_dodge(), aes(fill=HeartDisease) ) +
  labs(y = "Participant Count") +
  ggtitle("G - Heart Disease by Stroke") + theme(legend.key.size = unit(1, 'cm') ) +
  theme(legend.text=element_text(size=12))

# heart disease by alcohol drinking
p8 <- ggplot(heart_disease, aes(x=AlcoholDrinking)) +
  geom_bar( position = position_dodge(), aes(fill=HeartDisease) ) +
  labs(y = "Participant Count") +
  ggtitle("H - Heart Disease by Alcohol Consumption") +
  guides(fill="none")

# heart disease by physical activity
p9 <- ggplot(heart_disease, aes(x=PhysicalActivity)) +
  geom_bar( position = position_dodge(), aes(fill=HeartDisease) ) +
  labs(y = "Participant Count") +
  ggtitle("I - Heart Disease by Physical Activity") +
  guides(fill="none")

# heart disease by kidney disease
p10 <- ggplot(heart_disease, aes(x=KidneyDisease)) +
  geom_bar( position = position_dodge(), aes(fill=HeartDisease) ) +
  labs(y = "Participant Count") +
  ggtitle("J - Heart Disease by Kidney Disease") +
  guides(fill="none")

# heart disease by skin cancer
p11 <- ggplot(heart_disease, aes(x=SkinCancer)) +
  geom_bar( position = position_dodge(), aes(fill=HeartDisease) ) +
  labs(y = "Participant Count") +
  ggtitle("K - Heart Disease by Skin Cancer") +
  guides(fill="none")

# heart disease by asthma
p13 <- ggplot(heart_disease, aes(x=Asthma)) +
  geom_bar( position = position_dodge(), aes(fill=HeartDisease) ) +
  labs(y = "Participant Count") +
  ggtitle("L - Heart Disease by Asthma")+ guides(fill="none")

# heart disease by mental health
p14 <- ggplot(data = heart_disease, aes(x=MentalHealth)) +
  geom_bar( position = position_dodge(), aes(fill = HeartDisease)) +
  labs(y = "Participant Count") +
  ggtitle("M - Heart Disease by Mental Health") +
  theme(text = element_text(size = 8)) +
  theme(text = element_text(size = 8)) +
  theme(legend.key.size = unit(1, 'cm') ) + theme(legend.text=element_text(size=12))

# use cowplot to plot visualizations
plot_grid(p1, p2, p3, p4, p5, p6, p7, ncol = 3)
plot_grid(p8, p9, p10, p11, p13, p14, ncol = 3)

# Boxplots

# heart disease by Sleep time
p17 <- ggplot(data = heart_disease, aes(x=HeartDisease, y = SleepTime) ) +
  ggtitle("Heart Disease by Sleep Time") + labs(y="Sleep Time") +
  geom_boxplot(aes(fill=HeartDisease)) + guides(fill="none")

# heart disease by BMI
p16 <- ggplot(data = heart_disease, aes(x=HeartDisease, y = log(BMI) ) ) +
  ggtitle("Heart Disease by BMI") + labs(y="log(BMI)") +
  geom_boxplot(aes(fill=HeartDisease))

# plot grid
plot_grid(p17,p16)

### variable descriptions table
table <- data.frame(Variable =c("HeartDisease", "BMI",
                                "Smoking", "AlcoholDrinking", "Stroke",
                                "PhysicalHealth", "MentalHealth",
                                "DiffWalking", "Sex", "AgeCategory",
                                "Race", "Diabetic",
                                "PhysicalActivity", "GenHealth",
                                "SleepTime", "Asthma",
                                "KidneyDisease", "SkinCancer"),

                    Description=c("Has the respondent had coronary heart disease or myocardial infarction? (Yes/No)?",
                                  "Body Mass Index", "Have they smoked 100 cigarettes in their lifetime? (Yes/No)",
                                  "Are they a heavy drinker? Men: More than 14 drinks per week, Women: More than 7 (Yes/No)",
                                  "Have they had a stroke in their lifetime? (Yes/No)",
                                  "In the last 30 days, how would they classify their physical health? (Good, Fair, Bad)",
                                  "In the last 30 days, how would they classify their mental health? (Good, Fair, Bad)",
                                  "Is it difficult to walk or climb the stairs? (Yes/No)",
                                  "Male or Female",
                                  "13 level age category ranging from 18 to 80 years or older", "Race/Ethnicity",
                                  "Have they had diabetes? (Yes, No, Borderline, During Pregnancy)",
                                  "Have they reported exercise in the past 30 days? (Yes/No)",
                                  "In general, how good do they think their health is? (Poor, Fair, Good, Very Good, Excellent)",
                                  "How many hours of sleep do they get per day?",
                                  "Have they had asthma? (Yes/No)",
                                  "Have they had kidney disease? (Yes/No)",
                                  "Have they had skin cancer? (Yes/No)"),

                    Type = c("Factor", "Numeric","Factor","Factor","Factor","Factor",
                             "Factor","Factor","Factor","Factor","Factor","Factor",
                             "Factor","Factor","Numeric","Factor","Factor","Factor"))

kable(table) %>% kable_styling(font_size = 8, latex_options = "hold_position") %>% row_spec(0,bold=TRUE)
