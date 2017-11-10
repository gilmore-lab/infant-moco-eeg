Plot_channel_harm <- function(df, chan, harm){
p <- df %>% 
    filter(Channel == chan, Harm == harm) %>% 
    select(iSess, Sr, Si, Pattern, Speed) %>% 
    ggplot() +
    aes(x = Sr, y = Si) +
    geom_point() +
    facet_grid(Speed ~ Pattern) +
    ggtitle(paste0("Channel ", chan, ": ", harm))
p
}