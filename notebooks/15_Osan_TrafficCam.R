# Title     : TODO
# Objective : TODO
# Created by: yeop
# Created on: 2021/01/12

# ggmap settings
library(ggmap, ggplot2, config)
register_google(config::get("GOOGLE_MAP_API_KEY", file = "config.yml"))

# 오산 시청을 중심으로 13배 줌
map <- get_map(location = c(127.07729963862394, 37.15018706280286), zoom = 13, maptype = "roadmap", color = "bw")

TrafficCam <- read.csv(file = "data/15.오산시_무인교통단속카메라.csv", header = TRUE, as.is = TRUE, encoding = "UTF-8")

ggmap(map) +
  geom_point(
    data = TrafficCam,
    aes(x = as.numeric(설치위치_경도),
        y = as.numeric(설치위치_위도),
        color = 단속구분)
  ) +
  stat_density_2d_filled(data = TrafficCam,
                         aes(
                           x = as.numeric(설치위치_경도),
                           y = as.numeric(설치위치_위도),
                           fill = ..level..,
                           alpha = ..level..
                         ), geom = "polygon",
    )