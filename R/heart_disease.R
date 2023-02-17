#' Key Indicators of Heart Disease
#'
#' A survey taken by adults 18 years and older across the United States for the
#' CDC's Behavioral Risk Factor Surveillance System. It contains data every
#' year from 2020 to 2022 and highlights factors that may directly or indirectly
#' cause heart disease.
#'
#' @format A data frame with 54,746 observations and 18 columns.
#' \describe{
#'    \item{HeartDisease}{Has the respondent had coronary heart disease or myocardial infarction? (Yes/No)}
#'    \item{BMI}{Body Mass Index}
#'    \item{Smoking}{ Have they smoked 100 cigarettes in their lifetime? (Yes/No)}
#'    \item{AlcoholDrinking}{Are they a heavy drinker? Men: More than 14 drinks per week, Women: More than 7 (Yes/No)}
#'    \item{Stroke}{Have they had a stroke in their lifetime? (Yes/No)}
#'    \item{PhysicalHealth}{How many days in the last 30 was their physical health bad?}
#'    \item{MentalHealth}{How many days in the last 30 was their mental health bad?}
#'    \item{DiffWalking}{Is it difficult to walk or climb the stairs? (Yes/No)}
#'    \item{Sex}{Male or Female}
#'    \item{AgeCategory}{13 level age category ranging from 18 to 80 years or older}
#'    \item{Race}{Race/Ethnicity}
#'    \item{Diabetic}{Have they had diabetes? (Yes, No, Borderline, During Pregnancy)}
#'    \item{PhysicalActivity}{Have they reported exercise in the past 30 days? (Yes/No)}
#'    \item{GenHealth}{In general, how good do they think their health is? (Poor, Fair, Good, Very Good, Excellent) }
#'    \item{SleepTime}{How many hours of sleep do they get per day?}
#'    \item{Asthma}{Have they had asthma? (Yes/No)}
#'    \item{KidneyDisease}{Have they had kidney disease? (Yes/No)}
#'    \item{SkinCancer}{Have they had skin cancer? (Yes/No)}
#' }
#' @source \url{https://www.kaggle.com/datasets/kamilpytlak/personal-key-indicators-of-heart-disease}
"heart_disease"
