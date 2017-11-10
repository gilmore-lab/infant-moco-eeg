plot_results_by_harm <- function(df_moco, this_harm){
  chan_eff <- compute_chan_effects(df_moco, this_harm)
  df_chan_stats <- make_stats_df(chan_eff)
  
  plot_channel_effects(df_chan_stats, this_harm, group=this_group)
  
  print_stats_table(df_chan_stats, "Pattern")
  print_stats_table(df_chan_stats, "Speed")
  print_stats_table(df_chan_stats, "Patt*Spd")
  
  plot_channel_magnitudes(df_chan_stats, df_moco, "Pattern")
  plot_channel_magnitudes(df_chan_stats, df_moco, "Speed")
  plot_channel_magnitudes(df_chan_stats, df_moco, "Patt*Spd")
  "OK"
}