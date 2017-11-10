print_stats_table <- function(df, cond, p_thresh = .0005) {
   df1 <- df %>% 
    filter(Cond == cond, Pvals < p_thresh) %>% 
    select(Chan, Fvals, FdfNum, FdfDen, Pvals, pes) 
  if (dim(df)[1]==0) {
    cat('No data to summarize for ', cond, '.\n', sep="")
  } else {
    cat('Partial eta-squared: ', min(df1$pes), '-', max(df1$pes), '.\n', sep='')
    kable(df1, caption='MANOVA and Partial Eta-squared results')
  }
}