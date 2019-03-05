library(tidyverse)
library(dplyr)
library(ggplot2)
library(gganimate)
library(gapminder)
library(gifski)
library(png)

gapminder %>%
  mutate(continent = fct_collapse(continent, Asia = c("Asia", "Oceania"))) %>% 
  filter(continent %in% c("Americas","Africa","Asia")) %>%
  ggplot(aes(x = gdpPercap, y = lifeExp, size = pop, color = continent)) +
  geom_point(alpha = 0.75, show.legend = FALSE) +
  scale_x_log10() +
  facet_wrap(~continent) +
  ggtitle("The World Gets Better Every Year: {round(frame_time,0)}") +
  labs(caption = "Source: Gapminder Dataset", x = "GDP Per Capita", y = "Life Expectancy") +
  transition_time(year) +
  ease_aes()  
  