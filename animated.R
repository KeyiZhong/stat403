library(purrr)
library(dplyr)
library(ggplot2)
library(usmap)
library(magick)
data <- read.csv("HoneyProduction9816.csv")
y = seq(1998,2016)
animated <- function(att) {
  for(i in 1:19){
    filtered_data = data %>% filter(year == y[i]) %>% select_("state",att)
    m <- plot_usmap(data = filtered_data, values = att, lines = "black") + 
      scale_fill_continuous(low = "yellow", high = "black",name = paste0(att,"(",y[i],")"), label = scales::comma) + 
      theme(legend.position = "right")
    png(paste0(att,"/",att, "_",y[i],".png"),width = 750,height = 750,res = 100)
    print(m)
    dev.off()
  }
  list.files(path = paste0("./",att), pattern = "*.png", full.names = T) %>% 
    map(image_read) %>%
    image_join() %>%
    image_animate(fps=2) %>%
    image_write(paste0(att,".gif"))
}

animated("numcol")
animated("yieldpercol")
animated("totalprod")
animated("priceperlb")




