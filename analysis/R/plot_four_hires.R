plot_four_hires <- function(params){
	moco_fn <- paste("moco-3-pattern-", params$group, ".csv", sep="")
	egi_fn <- "egi.csv"
	
	moco_path <- paste(data_path, moco_fn, sep="")
	egi_path <- paste(data_path, egi_fn, sep="")
	topoplot_fullpath <- paste(figs_path, "topoplot.png", sep="")
	
	# path2figs <- paste('figs', params$harmonic, params$group, "", sep="/")
	
	df_moco <- read.csv(moco_path)
	df_egi <- read.csv(egi_path)
	
	df_moco <- read.csv(moco_path)
	df_egi <- read.csv(egi_path)
	
	params$harmonic = "1F1"
	make_hires_plots(df_moco, df_egi, params)
	
	params$harmonic = "2F1"
	make_hires_plots(df_moco, df_egi, params)
	
	params$harmonic = "3F1"
	make_hires_plots(df_moco, df_egi, params)
	
	params$harmonic = "1F2"
	make_hires_plots(df_moco, df_egi, params)
}