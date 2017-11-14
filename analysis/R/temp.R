

df_stats %>% 
  filter(Cond == "Pattern", Pvals < .01) %>%
  select(Chan) %>%
  unique() ->
  chans_below

chans_below <- as.numeric(unlist((chans_below)))

# Within participants...
df_below_thresh <- df_moco %>%
  filter(Channel %in% chans_below, Harm == "1F1") %>%
  group_by_(quote(Channel), quote(Speed), quote(iSess)) %>%
  summarise(sr.sub.mean=mean(Sr), 
            si.sub.mean=mean(Si),
            rms.amp.sub=sqrt(sr.sub.mean^2+si.sub.mean^2)) %>%
  # Average across participants  
  group_by_(quote(Channel), quote(Speed)) %>%
  summarise(sr.group.mean=mean(sr.sub.mean),
            si.group.mean=mean(si.sub.mean),
            sr.group.sd=sd(sr.sub.mean),
            si.group.sd=sd(si.sub.mean),
            rms.amp=sqrt(sr.group.mean^2 + si.group.mean^2),
            rms.amp.sem = mean(rms.amp.sub)/sqrt(n()),
            nsubs=n(),
            sr.group.sem=mean(sr.sub.mean)/sqrt(n()),
            si.group.sem=mean(si.sub.mean)/sqrt(n())
  )


limits <- aes(ymax = rms.amp + rms.amp.sem, ymin = rms.amp)
dodge <- position_dodge(width=0.8)
# pl_title <- paste(init_cap(""), " Group:\nChannels Meeting Criterion for ", "cond", " at ", this_harm, sep="")

# pl_theme_bar <- theme(plot.title = element_text(lineheight=.8, face ="bold", vjust=2, size = rel(2.0)),
#                       panel.background = element_rect(fill=NA),
#                       panel.grid.major = element_blank(),
#                       panel.grid.minor = element_blank(),
#                       panel.border = element_rect(fill=NA,color="black", size=.8,
#                                                   linetype="solid"),
#                       axis.title.x=element_text(vjust=-.6, size=rel(1.8)),
#                       axis.title.y=element_text(face="bold",vjust=1, size=rel(1.8)),
#                       axis.text=element_text(color="black", size=rel(1.0), angle=90),
#                       legend.title=element_blank(),
#                       legend.text=element_text(size=rel(1.6)), 
#                       legend.position="bottom",
#                       legend.background=element_blank())

# pl <- ggplot(df_below_thresh) +
#   aes_string(x="as.factor(Channel)", y="rms.amp", fill=Pattern) + 
#   geom_bar(stat="identity", width=0.8, position=dodge) +
#   geom_errorbar(limits, position=dodge, width=0.15) +
#   xlab("Channel") +
#   ylab(expression(paste("RMS amplitude (", mu, "V)", sep=""))) +
#   pl_theme_bar

ggplot(df_below_thresh) + 
  aes(as.factor(Channel), rms.amp, fill=Speed) + 
  geom_bar(stat="identity", width=0.8, position = dodge) +
  geom_errorbar(limits, position = dodge, width=0.15) +
  xlab("Channel") +
  ylab(expression(paste("RMS amplitude (", mu, "V)", sep="")))

# if (plot_titles) {
#   pl + ggtitle(pl_title)     
# } else {
#   pl
# }
