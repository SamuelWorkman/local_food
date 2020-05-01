library(ggplot2)
library(ggthemes)
nord_fira <- theme_tufte() +
  theme(
    text = element_text(family = "firasans"),
    axis.text = element_text(family = "firasans"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.position="none")