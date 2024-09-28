-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 172.16.7.85    Database: Library
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `idauthor` int NOT NULL AUTO_INCREMENT,
  `authname` varchar(15) NOT NULL,
  `dob` date DEFAULT NULL,
  `info` mediumtext,
  PRIMARY KEY (`idauthor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Эрих М.Р.','1898-06-22','Знаменитый немецкий писатель, обладатель Ордена \"За заслуги перед Федеративной Республикой Германия\"'),(2,'Сапковский А.','1948-06-21','Современный польский публицист и писатель, специализирующийся в жанре фэнтези и фантастики'),(3,'Гоголь Н.В.','1809-04-01','Русский прозаик, новеллист и драматург украинского происхождения'),(4,'Куприн А.И.','1870-08-26','Знаменитый русский писатель-реалист,получивший народное признание'),(5,'Пушкин А.С.','1799-06-06','Русский поэт, драматург и прозаик, заложивший основы русского реалистического направления');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_has_awards`
--

DROP TABLE IF EXISTS `author_has_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_has_awards` (
  `author_idauthor` int NOT NULL,
  `awards_idawards` int NOT NULL,
  `data_author_has_awards` date NOT NULL,
  PRIMARY KEY (`author_idauthor`,`awards_idawards`,`data_author_has_awards`),
  KEY `fk_author_has_awards_awards1_idx` (`awards_idawards`),
  KEY `fk_author_has_awards_author1_idx` (`author_idauthor`),
  CONSTRAINT `fk_author_has_awards_author1` FOREIGN KEY (`author_idauthor`) REFERENCES `author` (`idauthor`),
  CONSTRAINT `fk_author_has_awards_awards1` FOREIGN KEY (`awards_idawards`) REFERENCES `awards` (`idawards`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_has_awards`
--

LOCK TABLES `author_has_awards` WRITE;
/*!40000 ALTER TABLE `author_has_awards` DISABLE KEYS */;
INSERT INTO `author_has_awards` VALUES (1,1,'1918-11-15'),(2,2,'1988-08-20');
/*!40000 ALTER TABLE `author_has_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `idawards` int NOT NULL AUTO_INCREMENT,
  `awname` varchar(45) NOT NULL,
  `awrang` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idawards`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (1,'Орден','Гос.'),(2,'Медаль','Общ.');
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id_book` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(45) NOT NULL,
  `nampages` int NOT NULL,
  `price` float(7,2) DEFAULT NULL,
  `genre_idgenre` int DEFAULT NULL,
  PRIMARY KEY (`id_book`),
  KEY `fk_book_genre_idx` (`genre_idgenre`),
  CONSTRAINT `fk_book_genre` FOREIGN KEY (`genre_idgenre`) REFERENCES `genre` (`idgenre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Мертвые души',323,450.00,5),(2,'Ведьмак',1364,1400.00,6),(3,'Три товарища',480,335.00,4),(4,'Гранатовый браслет ',51,300.00,1),(5,'Евгений Онегин',400,450.00,4);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_has_author`
--

DROP TABLE IF EXISTS `book_has_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_has_author` (
  `book_id_book` int NOT NULL,
  `author_idauthor` int NOT NULL,
  `book_ath_date` date DEFAULT NULL,
  PRIMARY KEY (`book_id_book`,`author_idauthor`),
  KEY `fk_book_has_author_author1_idx` (`author_idauthor`),
  KEY `fk_book_has_author_book1_idx` (`book_id_book`),
  CONSTRAINT `fk_book_has_author_author1` FOREIGN KEY (`author_idauthor`) REFERENCES `author` (`idauthor`),
  CONSTRAINT `fk_book_has_author_book1` FOREIGN KEY (`book_id_book`) REFERENCES `book` (`id_book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_has_author`
--

LOCK TABLES `book_has_author` WRITE;
/*!40000 ALTER TABLE `book_has_author` DISABLE KEYS */;
INSERT INTO `book_has_author` VALUES (1,3,'1835-12-25'),(2,2,'1993-09-12'),(3,1,'1936-02-23'),(4,4,'1910-10-08'),(5,5,'1823-01-11');
/*!40000 ALTER TABLE `book_has_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_has_pubhouse`
--

DROP TABLE IF EXISTS `book_has_pubhouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_has_pubhouse` (
  `book_id_book` int NOT NULL,
  `pubhouse_idpubhouse` int NOT NULL,
  `pubdate` date NOT NULL,
  PRIMARY KEY (`book_id_book`,`pubhouse_idpubhouse`,`pubdate`),
  KEY `fk_book_has_pubhouse_pubhouse1_idx` (`pubhouse_idpubhouse`),
  KEY `fk_book_has_pubhouse_book1_idx` (`book_id_book`),
  CONSTRAINT `fk_book_has_pubhouse_book1` FOREIGN KEY (`book_id_book`) REFERENCES `book` (`id_book`),
  CONSTRAINT `fk_book_has_pubhouse_pubhouse1` FOREIGN KEY (`pubhouse_idpubhouse`) REFERENCES `pubhouse` (`idpubhouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_has_pubhouse`
--

LOCK TABLES `book_has_pubhouse` WRITE;
/*!40000 ALTER TABLE `book_has_pubhouse` DISABLE KEYS */;
INSERT INTO `book_has_pubhouse` VALUES (3,1,'1997-02-22'),(4,2,'1997-12-07'),(2,3,'1983-07-26'),(1,4,'1984-05-11'),(5,4,'1973-11-20');
/*!40000 ALTER TABLE `book_has_pubhouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_emp` int NOT NULL AUTO_INCREMENT,
  `empname` varchar(25) NOT NULL,
  `dob` date DEFAULT NULL,
  `post_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_emp`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Хорошайлов Р.И.','1978-07-07','Библиотекарь'),(2,'Назарова О.В','1980-02-28','Архивариус'),(3,'Белорыбкина А.В.','1982-01-12','Ассистент '),(4,'Жиряков П.С.','1991-07-20','Специалист по информационным технологиям'),(5,'Леонова Е.В.','1999-12-01','Консультант по чтению');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `idgenre` int NOT NULL AUTO_INCREMENT,
  `gname` varchar(45) NOT NULL,
  PRIMARY KEY (`idgenre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Повесть'),(2,'Пьеса'),(3,'Сказка'),(4,'Роман'),(5,'Поэма'),(6,'Фэнтези');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pubhouse`
--

DROP TABLE IF EXISTS `pubhouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pubhouse` (
  `idpubhouse` int NOT NULL AUTO_INCREMENT,
  `pubname` varchar(45) NOT NULL,
  `address` mediumtext,
  PRIMARY KEY (`idpubhouse`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pubhouse`
--

LOCK TABLES `pubhouse` WRITE;
/*!40000 ALTER TABLE `pubhouse` DISABLE KEYS */;
INSERT INTO `pubhouse` VALUES (1,'Миф','Пер. Козихинский, 7, Москва'),(2,'Эксмо','Улица Зорге,1, Москва'),(3,'Аст','Пресненская наб.,6, Москва'),(4,'Азбука','Улица Зорге,1, Москва');
/*!40000 ALTER TABLE `pubhouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader`
--

DROP TABLE IF EXISTS `reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reader` (
  `id_reader` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(15) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` mediumtext NOT NULL,
  PRIMARY KEY (`id_reader`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader`
--

LOCK TABLES `reader` WRITE;
/*!40000 ALTER TABLE `reader` DISABLE KEYS */;
INSERT INTO `reader` VALUES (1,'Андреева Н.В.','1988-07-23','Ул. Котовского, д.8, кв.21'),(2,'Пронин В.А.','1999-03-12','Ул. Фабричная, д.10, кв.234'),(3,'Кочкин Е.И.','1975-08-10','Ул. Карла Маркса, д.114, кв.54'),(4,'Семочкина Н.А.','2000-09-01','Ул. Ясный берег, д.112, кв.128'),(5,'Милованова К.В.','2001-08-14','Ул. Ясный берег, д.64, кв.2');
/*!40000 ALTER TABLE `reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reader_has_book`
--

DROP TABLE IF EXISTS `reader_has_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reader_has_book` (
  `reader_id_reader` int NOT NULL,
  `book_id_book` int NOT NULL,
  `emploee_id_emp` int NOT NULL,
  `reader_has_book_date` date NOT NULL,
  `return_date` date NOT NULL,
  PRIMARY KEY (`reader_id_reader`,`book_id_book`,`emploee_id_emp`,`reader_has_book_date`),
  KEY `fk_reader_has_book_book1_idx` (`book_id_book`),
  KEY `fk_reader_has_book_reader1_idx` (`reader_id_reader`),
  KEY `fk_reader_has_book_employe1_idx` (`emploee_id_emp`),
  CONSTRAINT `fk_reader_has_book_book1` FOREIGN KEY (`book_id_book`) REFERENCES `book` (`id_book`),
  CONSTRAINT `fk_reader_has_book_employe1` FOREIGN KEY (`emploee_id_emp`) REFERENCES `employee` (`id_emp`),
  CONSTRAINT `fk_reader_has_book_reader1` FOREIGN KEY (`reader_id_reader`) REFERENCES `reader` (`id_reader`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reader_has_book`
--

LOCK TABLES `reader_has_book` WRITE;
/*!40000 ALTER TABLE `reader_has_book` DISABLE KEYS */;
INSERT INTO `reader_has_book` VALUES (1,5,4,'2024-03-04','2024-04-04'),(2,4,5,'2023-09-10','2023-10-10'),(3,3,3,'2023-01-24','2023-02-24'),(4,2,1,'2023-12-15','2024-01-15'),(5,1,2,'2024-03-23','2024-04-23');
/*!40000 ALTER TABLE `reader_has_book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-28 17:30:15
