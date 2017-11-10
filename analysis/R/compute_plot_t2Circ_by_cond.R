compute_plot_t2Circ_by_cond <- function(df_moco, df_egi, params){
  # Should use mapply(), but in a hurry
  df_radial_2 <- compute_t2_circ_by_cond(df_moco, df_egi, params$harmonic, "radial", "2 deg/s")
  df_radial_4 <- compute_t2_circ_by_cond(df_moco, df_egi, params$harmonic, "radial", "4 deg/s")
  df_radial_8 <- compute_t2_circ_by_cond(df_moco, df_egi, params$harmonic, "radial", "8 deg/s")
  
  df_rot_2 <- compute_t2_circ_by_cond(df_moco, df_egi, params$harmonic, "rotation", "2 deg/s")
  df_rot_4 <- compute_t2_circ_by_cond(df_moco, df_egi, params$harmonic, "rotation", "4 deg/s")
  df_rot_8 <- compute_t2_circ_by_cond(df_moco, df_egi, params$harmonic, "rotation", "8 deg/s")
  
  df_trans_2 <- compute_t2_circ_by_cond(df_moco, df_egi, params$harmonic, "translation", "2 deg/s")
  df_trans_4 <- compute_t2_circ_by_cond(df_moco, df_egi, params$harmonic, "translation", "4 deg/s")
  df_trans_8 <- compute_t2_circ_by_cond(df_moco, df_egi, params$harmonic, "translation", "8 deg/s")
  
  df_list <- list(df_radial_2, df_radial_4, df_radial_8, df_rot_2, df_rot_4, df_rot_8, df_trans_2, df_trans_4, df_trans_8)
  
  df_t2_merge <- Reduce(function(x,y) merge(x,y, all=TRUE), df_list)
  
  # Topo plot and table
  plot_t2_channel_effects(df_t2_merge, harm=params$harmonic, group=params$group, "T2circ", topoplot_fullpath, plot_titles=params$plot_titles)
  
  return(df_t2_merge)
}