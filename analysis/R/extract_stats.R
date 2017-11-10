#'Error: Within.stats17' denominator df for Pattern
#'Error: Within.stats18' denominator df for Speed
#'Error: Within.stats19' denominator df for Patt*Spd
#'Error: Within.stats13' num df for Pattern
#'Error: Within.stats14' num df for Speed
#'Error: Within.stats15' num df for Patt*Spd
#'Error: Within.stats9'  F for Pattern
#'Error: Within.stats10' F for Speed
#'Error: Within.stats11' F for Patt*Spd
#'Error: Within.stats21' p for Pattern
#'Error: Within.stats22' p for Speed
#'Error: Within.stats23' p for Patt*Spd
extract_stats <- function(model_list) {
  ml = unlist(model_list)
  new_vals <- as.numeric( c( ml['Error: Within.stats9'], 
                             ml['Error: Within.stats10'], 
                             ml['Error: Within.stats11'], 
                             ml['Error: Within.stats13'], 
                             ml['Error: Within.stats14'], 
                             ml['Error: Within.stats15'],
                             ml['Error: Within.stats17'], 
                             ml['Error: Within.stats18'], 
                             ml['Error: Within.stats19'], 
                             ml['Error: Within.stats21'], 
                             ml['Error: Within.stats22'], 
                             ml['Error: Within.stats23']) )
  names(new_vals) <- c("F-Pattern", "F-Speed", "F-Patt*Spd", "df-Pattern", "df-Speed", "df-Patt*Spd", "df-Pattern-denom", "df-Speed-denom", "df-Patt*Spd-denom", "p-Pattern", "p-Speed", "p-Patt*Spd")
  rbind(new_vals)
}
