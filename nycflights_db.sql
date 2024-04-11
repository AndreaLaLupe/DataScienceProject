DROP TABLE IF EXISTS `airports`;
CREATE TABLE `airports` (
  `faa` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `alt` int NOT NULL,
  `tz` varchar(50) NOT NULL,
  `dst` varchar(1) NOT NULL,
  `tzone` varchar(100) NOT NULL,
  PRIMARY KEY (`faa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `airlines`;
CREATE TABLE `airlines` (
  `carrier` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`carrier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `weather`;
CREATE TABLE `weather` (
  `origin` varchar(3) NOT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,
  `hour` int NOT NULL,
  `temp` double NOT NULL,
  `dewp` double NOT NULL,
  `humid` double NOT NULL,
  `wind_dir` int NOT NULL,
  `wind_speed` double NOT NULL,
  `wind_gust` double NOT NULL,
  `precip` double NOT NULL,
  `pressure` double NOT NULL,
  `visib` double NOT NULL,
  `time_hour` datetime NOT NULL,
  PRIMARY KEY (`origin`, `year`, `month`, `day`, `hour`, `temp`),
  CONSTRAINT `fk_weather_origin` FOREIGN KEY (`origin`) REFERENCES `airports` (`faa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `planes`;
CREATE TABLE `planes` (
  `tailnum` varchar(8) NOT NULL,
  `year` int DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `engines` int DEFAULT NULL,
  `seats` int DEFAULT NULL,
  `speed` int DEFAULT NULL,
  `engine` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tailnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `flights`;
CREATE TABLE `flights` (
  `year` int NOT NULL,
  `month` int NOT NULL,
  `day` int NOT NULL,
  `dep_time` int DEFAULT NULL,
  `sched_dep_time` int DEFAULT NULL,
  `dep_delay` double DEFAULT NULL,
  `arr_time` int DEFAULT NULL,
  `sched_arr_time` int DEFAULT NULL,
  `arr_delay` double DEFAULT NULL,
  `carrier` varchar(3) NOT NULL,
  `flight` int NOT NULL,
  `tailnum` varchar(8) DEFAULT NULL,
  `origin` varchar(3) NOT NULL,
  `dest` varchar(3) NOT NULL,
  `air_time` double DEFAULT NULL,
  `distance` int NOT NULL,
  `hour` int DEFAULT NULL,
  `minute` int DEFAULT NULL,
  `time_hour` datetime NOT NULL,
  PRIMARY KEY (`year`, `month`, `day`, `carrier`, `flight`, `origin`),
  CONSTRAINT `fk_flights_carrier` FOREIGN KEY (`carrier`) REFERENCES `airlines` (`carrier`),
  #CONSTRAINT `fk_flights_tailnum` FOREIGN KEY (`tailnum`) REFERENCES `planes` (`tailnum`),
  CONSTRAINT `fk_flights_origin` FOREIGN KEY (`origin`) REFERENCES `airports` (`faa`)
  #CONSTRAINT `fk_flights_dest` FOREIGN KEY (`dest`) REFERENCES `airports` (`faa`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;