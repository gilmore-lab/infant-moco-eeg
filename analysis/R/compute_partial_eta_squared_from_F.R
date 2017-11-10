compute_partial_eta_squared_from_F <- function(df) {
  require(dplyr)
  
  df <- df %>%
    mutate( pes = (FdfNum*Fvals)/(FdfNum*Fvals+FdfDen) )
}