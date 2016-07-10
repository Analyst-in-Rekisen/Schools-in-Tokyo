install.packages("ggmap")

#パッケージの読み込み
library("ggmap")
 
#地名で緯度経度をグーグルから取得:geocodeコマンド
LonLatData <- geocode("2-25-12 koishikawa bunkyo-ku tokyo", source = "google")
#グーグルマップ画像の取得:get_googlemapコマンド
#地図の種類を指定:maptypeオプション;"terrain", "satellite", "roadmap", "hybrid"が指定可能
#拡大の指定:zoomオプション;1-21の整数で指定可能
GMapData <- get_googlemap(center = c(lon = LonLatData[1, 1], lat = LonLatData[1, 2]),
                          zoom = 16, size = c(640, 640), scale = 2, format = "png8",
                          maptype = "terrain", language = "jpn", sensor = FALSE,
                          messaging = FALSE, urlonly = FALSE, filename = "ggmapTemp",
                          color = "color", force = FALSE)
#プロット
ggmap(GMapData)
 
#地図のプロットコマンド:qmapコマンド
#データ形式はggplo2形式となります


ggmap(GMapData) + geom_point(data=LonLatData, aes(x=lon, y=lat), color='red')
