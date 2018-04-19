library(databraryapi)
library(tidyverse)
login_db()
v146 <- download_session_csv(volume = 146)

tested <- v146 %>% dplyr::filter(exclusion1.reason == "", 
                       !(session.date == "materials"))

v146 %>% dplyr::filter(exclusion1.reason == "", 
                       !(session.date == "materials")) ->
  tested

# Calculate age before plotting

age.days <- with(tested, as.Date(session.date) - as.Date(participant.birthdate))
v146$age.weeks <- age.days/7

tested %>% ggplot(.) +
  aes(x = participant.gender, y = age.weeks,
      color = participant.race, group = participant.gender) +
  geom_violin() +
  geom_point()