library(geojson, ggmap, ggplot2, rgdal, geojsonR, config)
library("leaflet")
library("sp")
library(rgdal)

fileName <- "data/12.오산시_중학교_학군.geojson"
register_google(config::get("GOOGLE_MAP_API_KEY", file = "config.yml"))

# jsonData = readLines(fileName)


# geom_polygon(data = jsonData, aes(x=long, y = lat), geom = polygon)

# 오산 시청을 중심으로 13배 줌
map <- get_map(location = c(127.07729963862394, 37.15018706280286), zoom = 13, maptype = "roadmap", color = "bw")
