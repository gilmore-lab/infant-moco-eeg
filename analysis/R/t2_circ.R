t2_circ = function(z, mu){
  # from Victor & Mast 1991
  M <- dim(z)[1]
  V_group <- (M/2)*(mean(z[,1]-mu[1]))^2+(mean(z[,2]-mu[2]))^2
  V_indiv <- (1/(2*(M-1)))*sum((z[,1]-mean(z[,1]))^2 + (z[,2]-mean(z[,2]))^2)
  statistic <- (1/M)*V_group/V_indiv
  df1 <- 2
  df2 <- 2*(M-2)
  pval <- 1-pf(M*statistic, df1, df2 )
  c(statistic, df1, df2, pval)
}