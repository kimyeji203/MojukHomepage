CREATE TABLE `gallery_board` (
  `gallery_bno` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_title` varchar(45) DEFAULT NULL,
  `gallery_content` varchar(45) DEFAULT NULL,
  `gallery_writer` varchar(45) DEFAULT NULL,
  `gallery_regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`gallery_bno`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8