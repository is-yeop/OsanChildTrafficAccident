# Title     : TODO
# Objective : TODO
# Created by: yeop
# Created on: 2021/01/12

# font_import()

# ggmap settings
library(ggmap)
library(ggplot2)
library(yaml)
register_google(config::get("GOOGLE_MAP_API_KEY", file = "config.yml"))

# 오산 시청을 중심으로 13배 줌
map <- get_map(location = c(127.07729963862394, 37.15018706280286), zoom = 13, maptype = "roadmap", color = "bw")

Kindergarten <- read.csv(file = "data/13.오산시_어린이집_유치원현황.csv", header = TRUE, as.is = TRUE, encoding = "UTF-8")

theme_update(text=element_text(family=))

ggmap(map) +
  geom_point(
    data = Kindergarten,
    aes(x = as.numeric(시설위치_경도),
        y = as.numeric(시설위치_위도),
        color = 시설타입)
  ) +
  stat_density_2d_filled(data = Kindergarten,
                         aes(
                           x = as.numeric(시설위치_경도),
                           y = as.numeric(시설위치_위도),
                           fill = ..level..,
                           alpha = ..level..
                         ), geom = "polygon",
    )