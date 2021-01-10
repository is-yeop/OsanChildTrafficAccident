# Title     : ggmap test
# Objective :
# Created by: yeop
# Created on: 2021/01/10

# ggmap settings
library(ggmap, ggplot2, geojsonR)
register_google(config::get("GOOGLE_MAP_API_KEY", file = "../config.yml"))

# ggmap(get_map(location = "south korea", zoom = 7))

map <- get_map(location = c(127.07729963862394, 37.15018706280286), zoom = 13, maptype = "roadmap", color = "bw")

illigal_parking <- read.csv(file = "../data/1.오산시_주정차단속(2018~2020).csv", header = TRUE, as.is = TRUE)

head(subset(illigal_parking, select = c("스쿨존여부", "단속위치_경도", "단속위치_위도")))

sub_illigal_parking <- subset(illigal_parking, select = c("스쿨존여부", "단속위치_경도", "단속위치_위도"))

ggmap(map) +
  geom_point(
    data = illigal_parking,
    aes(x = as.numeric(단속위치_경도),
        y = as.numeric(단속위치_위도),
        color = 스쿨존여부)) +
  stat_density_2d_filled(data = illigal_parking,
                         aes(
                           x = as.numeric(단속위치_경도),
                           y = as.numeric(단속위치_위도),
                           fill = ..level..,
                           alpha = ..level..
                         ), geom = "polygon")
