compute_generalized_eta_squared <- function(chan, df, harm) {
  require(ez)     # for ezANOVA
  require(dplyr)
  
  df <- df %>%
    filter(Channel == chan, Harm == harm)
  
  sr.anova <- ezANOVA(data=df, dv=Sr, wid=iSess, within = list(Pattern, Speed))
  si.anova <- ezANOVA(data=df, dv=Si, wid=iSess, within = list(Pattern, Speed))

  # Then extract generalized eta squared (ges) for both and take geometric mean
  sr.ges <- sr.anova$ANOVA[1:3,7]
  si.ges <- si.anova$ANOVA[1:3,7]
  
  # geometric mean or arithmetic?
  # ges <- (sr.ges * as.vector(si.ges))^(1/2)
  
  # Arithmetic 
  ges <- colMeans(rbind(sr.ges, si.ges))
  
  ges
}