compute_chan_effects <- function(df, harm, form){
  maov_list = lapply(unique(df$Channel), manova_channel, df, harm, form)
  maov_summ = lapply(maov_list, summary)
}
