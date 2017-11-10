compute_h_t2 <- function(chan, df, harm, pattern, speed, bysubject=TRUE) {
  require(DescTools) # for HotellingsT2Test
  
  # If bysubject, then evaluate T2 on the basis of subject means
  if (bysubject) {
    df <- df %>%
      filter(Channel == chan, Harm == harm, Pattern==pattern, Speed==speed) %>%
      group_by(iSess) %>%
      summarise(mSr = mean(Sr), mSi = mean(Si)) 
    
    attach(df)
    h_stat <- HotellingsT2Test(cbind(mSr,mSi), mu=c(0,0))$statistic
    h_pval <- HotellingsT2Test(cbind(mSr,mSi), mu=c(0,0))$p.val
    h_df1 <- HotellingsT2Test(cbind(mSr,mSi), mu=c(0,0))$parameter[1]
    h_df2 <- HotellingsT2Test(cbind(mSr,mSi), mu=c(0,0))$parameter[2]
    detach(df)
  } else { 
    df <- df %>%
      filter(Channel == chan, Harm == harm, Pattern == pattern, Speed == speed)
    
    attach(df)
    h_stat <- HotellingsT2Test(cbind(Sr,Si), mu=c(0,0))$statistic
    h_pval <- HotellingsT2Test(cbind(Sr,Si), mu=c(0,0))$p.val
    h_df1 <- HotellingsT2Test(cbind(Sr,Si), mu=c(0,0))$parameter[1]
    h_df2 <- HotellingsT2Test(cbind(Sr,Si), mu=c(0,0))$parameter[2]
    detach(df)
  }
  c(h_stat, h_pval, h_df1, h_df2)
}