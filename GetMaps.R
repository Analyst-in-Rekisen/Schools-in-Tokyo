install.packages("ggmap")

#�p�b�P�[�W�̓ǂݍ���
library("ggmap")
 
#�n���ňܓx�o�x���O�[�O������擾:geocode�R�}���h
LonLatData <- geocode("2-25-12 koishikawa bunkyo-ku tokyo", source = "google")
#�O�[�O���}�b�v�摜�̎擾:get_googlemap�R�}���h
#�n�}�̎�ނ��w��:maptype�I�v�V����;"terrain", "satellite", "roadmap", "hybrid"���w��\
#�g��̎w��:zoom�I�v�V����;1-21�̐����Ŏw��\
GMapData <- get_googlemap(center = c(lon = LonLatData[1, 1], lat = LonLatData[1, 2]),
                          zoom = 16, size = c(640, 640), scale = 2, format = "png8",
                          maptype = "terrain", language = "jpn", sensor = FALSE,
                          messaging = FALSE, urlonly = FALSE, filename = "ggmapTemp",
                          color = "color", force = FALSE)
#�v���b�g
ggmap(GMapData)
 
#�n�}�̃v���b�g�R�}���h:qmap�R�}���h
#�f�[�^�`����ggplo2�`���ƂȂ�܂�


ggmap(GMapData) + geom_point(data=LonLatData, aes(x=lon, y=lat), color='red')