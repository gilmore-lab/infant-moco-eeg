make_hires_plots <- function(df_moco, df_egi, params){
	t2_circ_list <- lapply(unique(df_moco$Channel), compute_t2_circ_across_spd, df_moco, harm=params$harmonic, bysubject=FALSE)
df_t2cacr <- data.frame(Chan <- 1:128, matrix(unlist(t2_circ_list), nrow=128, byrow=T))
names(df_t2cacr) <- c('Chan', 'T2', 'Pvals', 'df1', 'df2') 
df_t2cacr$xpos <- df_egi$xpos
df_t2cacr$ypos <- df_egi$ypos

# Cut pvals
pvals_cuts <- c(-.01,.0001, .0005, .001, .005, .01, .05, 1)
pvals_lbls <- c("<.0001","<.0005", "<.001", "<.005", "<.01", "<.05", "ns")

# Create cuts based on p-value levels
Pvals_cuts <- cut( df_t2cacr$Pvals, breaks=pvals_cuts, labels=pvals_lbls)
Pvals_cuts <- ordered( Pvals_cuts, levels = rev( pvals_lbls ) )
df_t2cacr$Pvals_cuts <- Pvals_cuts

# Topo plot and table
plot_t2_channel_effects_across(df_t2cacr, harm=params$harmonic, group=params$group, "T2circ", topoplot_fullpath, plot_titles=params$plot_titles)
fn <- paste('hires/', params$group, '-', params$harmonic, '-T2Circ.tiff', sep="")
ggsave(fn, width = 7, height = 5, units = "in", dpi = 300)

form <- cbind(Sr, Si) ~ Pattern*Speed + Error(iSess)
chan_eff <- compute_chan_effects(df_moco, params$harmonic, form)
df_chan_stats <- make_stats_df(chan_eff, df_egi)
plot_channel_effects(df_chan_stats, harm=params$harmonic, group=params$group, topoplot_fullpath, plot_titles=params$plot_titles)
fn <- paste('hires/', params$group, '-', params$harmonic, '-MANOVA.tiff', sep="")
ggsave(fn, width = 7, height = 5, units = "in", dpi = 300)

plot_channel_magnitudes(df_chan_stats, df_moco, params$group, params$harmonic, "Pattern", as.numeric(params$p_thresh), plot_titles=params$plot_titles)
fn <- paste('hires/', params$group, '-', params$harmonic, '-', 'Pattern-channel.tiff', sep="")
ggsave(fn, width = 7, height = 5, units = "in", dpi = 300)

plot_channel_magnitudes(df_chan_stats, df_moco, params$group, params$harmonic, "Speed", as.numeric(params$p_thresh), plot_titles=params$plot_titles)
fn <- paste('hires/', params$group, '-', params$harmonic, '-', 'Speed-channel.tiff', sep="")
ggsave(fn, width = 7, height = 5, units = "in", dpi = 300)

plot_channel_magnitudes(df_chan_stats, df_moco, params$group, params$harmonic, "Patt_Spd", as.numeric(params$p_thresh), plot_titles=params$plot_titles)
fn <- paste('hires/', params$group, '-', params$harmonic, '-', 'Patt_Spd-channel.tiff', sep="")
ggsave(fn, width = 7, height = 5, units = "in", dpi = 300)

plot_complex_domain_results(df_chan_stats, df_moco, "Pattern", params$group, params$harmonic, as.numeric(params$n_top), as.numeric(params$p_thresh), plot_titles=params$plot_titles)
fn <- paste('hires/', params$group, '-', params$harmonic, '-', 'Pattern-complex.tiff', sep="")
ggsave(fn, width = 7, height = 5, units = "in", dpi = 300)

plot_complex_domain_results(df_chan_stats, df_moco, "Speed", params$group, params$harmonic, as.numeric(params$n_top), as.numeric(params$p_thresh), plot_titles=params$plot_titles)
fn <- paste('hires/', params$group, '-', params$harmonic, '-', 'Speed-complex.tiff', sep="")
ggsave(fn,width = 7, height = 5, units = "in", dpi = 300)

plot_complex_domain_results(df_chan_stats, df_moco, "Patt_Spd", params$group, params$harmonic, as.numeric(params$n_top), as.numeric(params$p_thresh), plot_titles=params$plot_titles)
fn <- paste('hires/', params$group, '-', params$harmonic, '-', 'Patt_Spd-complex.tiff', sep="")
ggsave(fn, width = 7, height = 5, units = "in", dpi = 300)

}