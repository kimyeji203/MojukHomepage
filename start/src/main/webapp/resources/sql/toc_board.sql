CREATE TABLE `toc_board` (
  `toc_bno` int(11) NOT NULL AUTO_INCREMENT,
  `toc_belong` varchar(45) DEFAULT NULL,
  `toc_title` varchar(45) DEFAULT NULL,
  `toc_content` varchar(45) DEFAULT NULL,
  `toc_writer` varchar(45) DEFAULT NULL,
  `toc_regdate` datetime DEFAULT NULL,
  PRIMARY KEY (`toc_bno`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8