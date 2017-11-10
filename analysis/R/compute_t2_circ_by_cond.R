compute_t2_circ_by_cond <- function(df, df_egi, harm, pattern, speed){
  t2_circ_list <- lapply(unique(df_moco$Channel), compute_t2_circ, df, harm, pattern, speed, bysubject=TRUE)
  df_t2cbtw <- data.frame(Chan <- 1:128, matrix(unlist(t2_circ_list), nrow=128, byrow=T))
  names(df_t2cbtw) <- c('Chan', 'T2Circ', 'Pvals', 'df1', 'df2') 
  df_t2cbtw$xpos <- df_egi$xpos
  df_t2cbtw$ypos <- df_egi$ypos
  
  # Cut pvals
  pvals_cuts <- c(-.01,.0001, .0005, .001, .005, .01, .05, 1)
  pvals_lbls <- c("<.0001","<.0005", "<.001", "<.005", "<.01", "<.05", "ns")
  
  # Create cuts based on p-value levels
  Pvals_cuts <- cut(df_t2cbtw$Pvals, breaks=pvals_cuts, labels=pvals_lbls)
  Pvals_cuts <- ordered( Pvals_cuts, levels = rev( pvals_lbls ) )
  df_t2cbtw$Pvals_cuts <- Pvals_cuts
  df_t2cbtw$Pattern = pattern
  df_t2cbtw$Speed = speed
  
  return(df_t2cbtw)
}