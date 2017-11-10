compute_t2_circ_across_spd <- function(chan, df, harm, bysubject=TRUE) {
# compute_t2_circ <- function(chan, df, harm, bysubject=TRUE)
  # Computes T2circ statistics from Victor & Mast 1991, assumes
  # mean value is at origin.
  
  mu=c(0,0)
  
  # If bysubject, then evaluate T2circ on the basis of subject means
  if (bysubject) {
    df <- df %>%
      filter(Channel == chan, Harm == harm) %>%
      group_by(iSess) %>%
      summarise(mSr = mean(Sr), mSi = mean(Si)) 
    
    attach(df)
    t2_circ_stats <- t2_circ(cbind(mSr,mSi), mu)
    t2_circ_stat <- t2_circ_stats[1]
    t2_circ_df1 <- t2_circ_stats[2]
    t2_circ_df2 <- t2_circ_stats[3]
    t2_circ_pval <- t2_circ_stats[4]
    detach(df)
    
  } else { 
    df <- df %>%
      filter(Channel == chan, Harm == harm)
    
    attach(df)
    t2_circ_stats <- t2_circ(cbind(Sr,Si), c(0,0))
    
    t2_circ_stat <- t2_circ_stats[1]
    t2_circ_df1 <- t2_circ_stats[2]
    t2_circ_df2 <- t2_circ_stats[3]
    t2_circ_pval <- t2_circ_stats[4]
    detach(df)
  }
  
  c(t2_circ_stat, t2_circ_pval, t2_circ_df1, t2_circ_df2)
}