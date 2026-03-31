USE railway;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: admin_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:35:23
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: applied_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `applied_companies`
--

DROP TABLE IF EXISTS `applied_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applied_companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_email` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `apply_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applied_companies`
--

LOCK TABLES `applied_companies` WRITE;
/*!40000 ALTER TABLE `applied_companies` DISABLE KEYS */;
INSERT INTO `applied_companies` VALUES (1,'student@gmail.com',NULL,NULL,'2026-02-04'),(2,'student@gmail.com',NULL,NULL,'2026-02-06'),(3,'student@gmail.com',NULL,NULL,'2026-02-08'),(4,'student@gmail.com',NULL,NULL,'2026-02-10'),(5,'student@gmail.com',NULL,NULL,'2026-02-20'),(6,'student@gmail.com',NULL,NULL,'2026-03-01'),(7,'student@gmail.com',NULL,NULL,'2026-03-02'),(8,'student@gmail.com',NULL,NULL,'2026-03-02'),(9,'student@gmail.com',NULL,NULL,'2026-03-05'),(10,'student@gmail.com',NULL,NULL,'2026-03-14'),(11,'student@gmail.com',NULL,NULL,'2026-03-14'),(12,'student@gmail.com',NULL,NULL,'2026-03-14'),(13,'student@gmail.com',NULL,NULL,'2026-03-14'),(14,'student@gmail.com',NULL,NULL,'2026-03-14'),(15,'student@gmail.com',NULL,NULL,'2026-03-14'),(16,'student@gmail.com',NULL,NULL,'2026-03-15'),(17,'student@gmail.com',NULL,NULL,'2026-03-15'),(18,'student@gmail.com',NULL,NULL,'2026-03-15'),(19,'student@gmail.com',NULL,NULL,'2026-03-15'),(20,'student@gmail.com',NULL,NULL,'2026-03-15'),(21,'student@gmail.com',NULL,NULL,'2026-03-15'),(22,'student@gmail.com',NULL,NULL,'2026-03-15'),(23,'student@gmail.com',NULL,NULL,'2026-03-16'),(24,'student@gmail.com',NULL,NULL,'2026-03-16');
/*!40000 ALTER TABLE `applied_companies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:46:46
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: company_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `criteria` varchar(255) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Wipro','60% Throughout, BE/BTech/MCA/MTech','Testing','2026-03-20'),(2,'TCS','60% Throughout, BE/BTech/MCA/MTech','Analyst','2026-03-22'),(3,'Capgemini','60% Throughout, BE/BTech/MCA','Engineer Trainee','2026-03-18'),(4,'Knowledge Lens','60% Throughout, Only CSE & IT','Java Developer','2026-03-25');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:47:45
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: export_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `placed_students`
--

DROP TABLE IF EXISTS `placed_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `placed_students` (
  `prn` varchar(20) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `placed_date` date DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placed_students`
--

LOCK TABLES `placed_students` WRITE;
/*!40000 ALTER TABLE `placed_students` DISABLE KEYS */;
INSERT INTO `placed_students` VALUES ('101','Rahul','Sharma','rahul@gmail.com','TCS','2024-06-10','Developer'),('102','Amit','Verma','amit@gmail.com','Infosys','2024-07-01','Tester');
/*!40000 ALTER TABLE `placed_students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:48:24
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: job_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Software Engineer','Google','Hyderabad','Open'),(2,'Engineer Trainee','Capgemini','Bangalore','Open'),(3,'Analyst','TCS','Chennai','Closed'),(4,'Testing','Wipro','Mumbai','Open'),(6,'devloper','wipro','Andheri','Open');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:48:58
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: myprofile_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `student_profile`
--

DROP TABLE IF EXISTS `student_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` text,
  `marks10` float DEFAULT NULL,
  `marks12` float DEFAULT NULL,
  `diploma` float DEFAULT NULL,
  `graduation` float DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `skills` text,
  `resume_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_profile`
--

LOCK TABLES `student_profile` WRITE;
/*!40000 ALTER TABLE `student_profile` DISABLE KEYS */;
INSERT INTO `student_profile` VALUES (16,'Riya','Rajesh','kapur','Riya341@gmail.com','female','Nallsopara (E)',68,79,45,90,'IT','2000-06-04','9845678233','',NULL);
/*!40000 ALTER TABLE `student_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:49:40
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: placement_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sobha','test@gmail.com','123456789'),(2,'Rajo','Rajo@gmail.com','123456789'),(3,'Rano','Rano@gmail.com','2456789031');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:50:41
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: pms_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `package` varchar(50) DEFAULT NULL,
  `criteria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (6,NULL,NULL,'3.5 LPA','job'),(7,'Cisco','defender',NULL,'job'),(8,'Cisco','defender',NULL,'job'),(9,'Cisco','defender',NULL,'job'),(10,'rajrani manhotra ','Java Developer',NULL,'25-30'),(12,'rajrani manhotra ','Java Developer',NULL,'25-30');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:51:21
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: recruiter_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `recruiter`
--

DROP TABLE IF EXISTS `recruiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recruiter` (
  `recruiter_id` varchar(20) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`recruiter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recruiter`
--

LOCK TABLES `recruiter` WRITE;
/*!40000 ALTER TABLE `recruiter` DISABLE KEYS */;
INSERT INTO `recruiter` VALUES ('30003','admin123');
/*!40000 ALTER TABLE `recruiter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:52:20
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: recuriterdashboard_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `description` text,
  `posted_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Software Engineer','TCS','Development role','2026-03-23 05:30:26'),(2,'Web Developer','Infosys','Frontend + Backend','2026-03-23 05:30:26'),(3,'Java Developer','Wipro','Java projects','2026-03-23 05:30:26');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `tenth` double DEFAULT NULL,
  `twelfth` double DEFAULT NULL,
  `graduation` double DEFAULT NULL,
  `status` varchar(20) DEFAULT 'applied',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Rahul Sharma','rahul@gmail.com','CSE',85,88,8.2,'rejected'),(2,'Priya Singh','priya@gmail.com','IT',90,91,8.8,'applied'),(3,'Amit Verma','amit@gmail.com','ECE',78,80,7.5,'rejected'),(4,'Sneha Gupta','sneha@gmail.com','CSE',92,89,9.1,'shortlisted'),(5,'Rohit Kumar','rohit@gmail.com','ME',70,75,7,'applied'),(6,'Raj Manohtra','son348@gmail.com','Science',65,89,90,'applied'),(7,'Rambha Manohtra','Rambha456@gmail.com','Science',65,89,90,'applied'),(8,'Raghav Sharma','Raghav987@gmail.com','Arts',89,65,67,'applied'),(9,'Arvind Jaisawal','Arvind456@gmail.com','Science',56,89,78,'applied'),(10,'Suman Singh','suman123@gmail.com','Science',56,89,78,'applied'),(11,'Vinod Kapur','Vinod341@gmail.com','Management',68,79,45,'applied'),(12,'Manorma Goshai','Manorama512@gmail.com','Management',68,79,45,'applied'),(13,'Vikhas Manhotra','Vikash453@gmail.com','Management',68,79,45,'applied'),(14,'Ranju Kapur','Ranju128@gmail.com','Management',68,79,45,'applied'),(15,'Sonali Kapur','Sonali765@gmail.com','Management',68,79,45,'applied');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:52:55
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: register
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'Rambha','Rambha456@gmail.com',' 098765'),(8,'suman','suman123@gmail.com','123098'),(9,'Vinod','Vinod341@gmail.com','673409'),(10,'Manorama','Manorama512@gmail.com','983450'),(11,'Vikash','Vikash453@gmail.com','093412'),(12,'RanjuRaj','Ranju128@gmail.com','341209'),(13,'Sonali das','Sonali765@gmail.com','r34344'),(14,'Adiba','Adiba234@gmail.com','645211'),(15,'Somwar','Somwar234@gmail.com','348912'),(16,'Riya','Riya341@gmail.com','325120'),(17,'Rajeshwari','Rajeshwari265@gmail.com','645231');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:53:33
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: student_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `prn` int NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`prn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (98,'Raj','Ram','manohtra','test@gmail.com',NULL),(45098,'vikhas','Ram ','sing','vikahd@gmail.com',NULL),(200631,'Raj','Ram ','Sing','test@gmail.com',NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:54:19
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: studentlogin_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'sakshi456@gmai.com','098345'),(2,'Rat123@gmail.com','34857429'),(3,'Anita125@gmail.com','450986');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:54:59
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: test_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'10% of 200 = ?','10','20','30','40','20'),(2,1,'20 + 30 = ?','40','50','60','70','50'),(3,1,'50% of 100 = ?','25','50','75','100','50'),(4,1,'15 x 2 = ?','20','25','30','35','30'),(5,1,'Square of 5 = ?','10','20','25','30','25'),(6,1,'100 / 10 = ?','5','10','15','20','10'),(7,1,'12 + 8 = ?','18','19','20','21','20'),(8,1,'30 - 10 = ?','10','15','20','25','20'),(9,1,'5 x 5 = ?','10','20','25','30','25'),(10,1,'90 / 9 = ?','5','10','15','20','10'),(11,2,'Find odd one','Dog','Cat','Tiger','Car','Car'),(12,2,'Complete series: 2,4,6,?','7','8','9','10','8'),(13,2,'Sun rises in','East','West','North','South','East'),(14,2,'Opposite of Hot','Cold','Warm','Cool','None','Cold'),(15,2,'Odd one','Apple','Banana','Car','Mango','Car'),(16,2,'1,3,5,?','6','7','8','9','7'),(17,2,'Day after Monday','Tuesday','Wednesday','Thursday','Friday','Tuesday'),(18,2,'Odd one','Red','Blue','Chair','Green','Chair'),(19,2,'5,10,15,?','18','19','20','21','20'),(20,2,'Complete: A,B,C,?','D','E','F','G','D'),(21,3,'Synonym of Big','Small','Large','Tiny','Short','Large'),(22,3,'Opposite of Happy','Sad','Glad','Joy','Smile','Sad'),(23,3,'Plural of Child','Childs','Children','Childes','None','Children'),(24,3,'Correct spelling','Recieve','Receive','Receeve','Receve','Receive'),(25,3,'Verb in sentence','Run','Table','Chair','Book','Run'),(26,3,'Past of Go','Goed','Went','Gone','Going','Went'),(27,3,'Opposite of Fast','Quick','Slow','Speed','Run','Slow'),(28,3,'Synonym of Smart','Dull','Clever','Slow','Weak','Clever'),(29,3,'Article used before vowel','A','An','The','None','An'),(30,3,'Plural of Book','Books','Bookes','Bookies','None','Books'),(31,4,'Which is linear structure','Array','Tree','Graph','None','Array'),(32,4,'FIFO used in','Queue','Stack','Tree','Graph','Queue'),(33,4,'LIFO used in','Queue','Stack','Tree','Graph','Stack'),(34,4,'Search fastest','Binary','Linear','Jump','None','Binary'),(35,4,'Tree root at','Top','Bottom','Middle','None','Top'),(36,4,'Stack uses','Push','Pull','Insert','Add','Push'),(37,4,'Queue uses','Enqueue','Push','Insert','None','Enqueue'),(38,4,'Sorting example','Bubble','Search','Insert','Delete','Bubble'),(39,4,'Graph contains','Vertices','Nodes','Edges','All','All'),(40,4,'Array index starts','0','1','2','3','0'),(41,5,'SQL stands for','Structured Query Language','Simple Query','Statement Query','None','Structured Query Language'),(42,5,'Retrieve data','SELECT','GET','OPEN','FETCH','SELECT'),(43,5,'Filter records','WHERE','ORDER','GROUP','SORT','WHERE'),(44,5,'Join tables','JOIN','MERGE','CONNECT','LINK','JOIN'),(45,5,'Delete table','DROP','DELETE','REMOVE','CLEAR','DROP'),(46,5,'Insert data','INSERT','ADD','PUT','CREATE','INSERT'),(47,5,'Update data','UPDATE','CHANGE','MODIFY','EDIT','UPDATE'),(48,5,'Sort data','ORDER BY','SORT','GROUP','FILTER','ORDER BY'),(49,5,'Primary key','Unique','Duplicate','Null','None','Unique'),(50,5,'Database is','Collection','File','Folder','None','Collection'),(51,6,'Capital of India','Delhi','Mumbai','Chennai','Kolkata','Delhi'),(52,6,'National animal','Tiger','Lion','Dog','Cat','Tiger'),(53,6,'National bird','Peacock','Crow','Sparrow','Parrot','Peacock'),(54,6,'Sun is a','Star','Planet','Moon','Galaxy','Star'),(55,6,'Earth is','Planet','Star','Moon','Galaxy','Planet'),(56,6,'Colors in flag','3','4','5','6','3'),(57,6,'Independence year','1947','1950','1945','1960','1947'),(58,6,'Largest ocean','Pacific','Atlantic','Indian','Arctic','Pacific'),(59,6,'Currency India','Rupee','Dollar','Euro','Yen','Rupee'),(60,6,'Father of Nation','Gandhi','Nehru','Patel','Bose','Gandhi'),(61,1,'10% of 200 = ?','10','20','30','40','20'),(62,1,'25 + 35 = ?','50','55','60','65','60'),(63,1,'50% of 80 = ?','30','35','40','45','40'),(64,1,'15 x 2 = ?','25','30','35','40','30'),(65,1,'100 / 10 = ?','5','10','15','20','10'),(66,1,'12 + 8 = ?','18','19','20','21','20'),(67,1,'30 - 10 = ?','10','15','20','25','20'),(68,1,'5 x 5 = ?','10','20','25','30','25'),(69,1,'90 / 9 = ?','5','10','15','20','10'),(70,1,'Square of 9 = ?','72','81','90','99','81'),(71,1,'Simple Interest on 1000 at 10% for 1 year = ?','50','100','150','200','100'),(72,1,'Average of 10,20,30 = ?','15','20','25','30','20'),(73,1,'LCM of 4 and 6 = ?','8','10','12','14','12'),(74,1,'HCF of 18 and 24 = ?','3','6','9','12','6'),(75,1,'Profit% if CP=500 and SP=600 = ?','10%','15%','20%','25%','20%'),(76,1,'Time = Distance/Speed. 120km at 60kmph = ?','1hr','2hr','3hr','4hr','2hr'),(77,1,'Compound Interest on 1000 at 10% for 2 years = ?','200','210','220','240','210'),(78,1,'If 5 pens cost 50, cost of 1 pen = ?','5','8','10','12','10'),(79,1,'Solve: 3x = 21','5','6','7','8','7'),(80,1,'Percentage increase from 200 to 250 = ?','20%','25%','30%','35%','25%'),(81,1,'A train 100m long passes a pole in 5 sec. Speed = ?','10m/s','15m/s','20m/s','25m/s','20m/s'),(82,1,'Permutation 5P2 = ?','10','15','20','25','20'),(83,1,'Combination 5C2 = ?','5','10','15','20','10'),(84,1,'Probability of getting head in single toss = ?','1/3','1/4','1/2','1','1/2'),(85,1,'If A can do work in 10 days, work per day = ?','1/5','1/10','1/15','1/20','1/10'),(86,1,'Solve: x^2 - 9 = 0, x = ?','3','-3','±3','9','±3'),(87,1,'Ratio 20:50 simplify = ?','1:2','2:5','3:5','4:5','2:5'),(88,1,'If 20% of number is 40, number = ?','100','150','200','250','200'),(89,1,'Boat speed in still water 10kmph, stream 2kmph. Downstream speed = ?','8','10','12','14','12'),(90,1,'Area of circle radius 7 (π=22/7) = ?','144','154','164','174','154'),(91,1,'10% of 200 = ?','10','20','30','40','20'),(92,1,'25 + 35 = ?','50','55','60','65','60'),(93,1,'50% of 80 = ?','30','35','40','45','40'),(94,1,'15 x 2 = ?','25','30','35','40','30'),(95,1,'100 / 10 = ?','5','10','15','20','10'),(96,1,'12 + 8 = ?','18','19','20','21','20'),(97,1,'30 - 10 = ?','10','15','20','25','20'),(98,1,'5 x 5 = ?','10','20','25','30','25'),(99,1,'90 / 9 = ?','5','10','15','20','10'),(100,1,'Square of 9 = ?','72','81','90','99','81'),(101,1,'Simple Interest on 1000 at 10% for 1 year = ?','50','100','150','200','100'),(102,1,'Average of 10,20,30 = ?','15','20','25','30','20'),(103,1,'LCM of 4 and 6 = ?','8','10','12','14','12'),(104,1,'HCF of 18 and 24 = ?','3','6','9','12','6'),(105,1,'Profit% if CP=500 and SP=600 = ?','10%','15%','20%','25%','20%'),(106,1,'Time = Distance/Speed. 120km at 60kmph = ?','1hr','2hr','3hr','4hr','2hr'),(107,1,'Compound Interest on 1000 at 10% for 2 years = ?','200','210','220','240','210'),(108,1,'If 5 pens cost 50, cost of 1 pen = ?','5','8','10','12','10'),(109,1,'Solve: 3x = 21','5','6','7','8','7'),(110,1,'Percentage increase from 200 to 250 = ?','20%','25%','30%','35%','25%'),(111,1,'A train 100m long passes a pole in 5 sec. Speed = ?','10m/s','15m/s','20m/s','25m/s','20m/s'),(112,1,'Permutation 5P2 = ?','10','15','20','25','20'),(113,1,'Combination 5C2 = ?','5','10','15','20','10'),(114,1,'Probability of getting head in single toss = ?','1/3','1/4','1/2','1','1/2'),(115,1,'If A can do work in 10 days, work per day = ?','1/5','1/10','1/15','1/20','1/10'),(116,1,'Solve: x^2 - 9 = 0, x = ?','3','-3','±3','9','±3'),(117,1,'Ratio 20:50 simplify = ?','1:2','2:5','3:5','4:5','2:5'),(118,1,'If 20% of number is 40, number = ?','100','150','200','250','200'),(119,1,'Boat speed in still water 10kmph, stream 2kmph. Downstream speed = ?','8','10','12','14','12'),(120,1,'Area of circle radius 7 (π=22/7) = ?','144','154','164','174','154'),(121,2,'Series: 2,4,6,8,?','9','10','11','12','10'),(122,2,'Odd one out','Dog','Cat','Apple','Cow','Apple'),(123,2,'Find next: A,C,E,?','F','G','H','I','G'),(124,2,'5 x 5 = ?','20','25','30','35','25'),(125,2,'If today is Monday, after 2 days?','Tuesday','Wednesday','Thursday','Friday','Wednesday'),(126,2,'1,4,9,?','12','14','16','18','16'),(127,2,'Mirror of 6','6','9','8','0','9'),(128,2,'Find next: 10,20,30,?','35','40','50','60','40'),(129,2,'Odd one','Car','Bus','Bike','Mango','Mango'),(130,2,'2+3*2=?','8','10','12','6','8'),(131,2,'3,9,27,?','54','72','81','90','81'),(132,2,'Find missing: 5,10,20,40,?','60','70','80','90','80'),(133,2,'Clock angle at 3:30','75','90','105','120','75'),(134,2,'A is father of B. B is brother of C. A is?','Uncle','Father','Grandfather','Brother','Father'),(135,2,'Square of 15','200','225','250','275','225'),(136,2,'Series: 1,3,6,10,?','12','14','15','16','15'),(137,2,'Coding: CAT=24 then DOG=?','24','26','30','32','26'),(138,2,'If East becomes West, North becomes?','South','East','West','North','South'),(139,2,'Next: 2,6,12,20,?','28','30','32','40','30'),(140,2,'Find next: 7,14,28,?','35','42','56','60','56'),(141,2,'Find next: 1,2,4,8,16,?','24','30','32','64','32'),(142,2,'If 5 persons sit in row, middle position?','1','2','3','4','3'),(143,2,'Probability of dice getting 6','1/2','1/3','1/6','1/4','1/6'),(144,2,'Angle at 6:00','90','120','180','360','180'),(145,2,'Find HCF of 36 and 48','6','8','12','18','12'),(146,2,'Series: 11,13,17,19,?','21','23','25','27','23'),(147,2,'If 20% of number is 50, number=?','200','250','300','150','250'),(148,2,'Odd one','Triangle','Square','Circle','Cube','Cube'),(149,2,'Find next: 100,90,80,?','60','70','75','65','70'),(150,2,'Simplify: 12*12','124','132','144','156','144'),(151,3,'Synonym of Happy?','Sad','Joyful','Angry','Tired','Joyful'),(152,3,'Antonym of Hot?','Cold','Warm','Heat','Boil','Cold'),(153,3,'Fill in the blank: She ___ going to school.','is','are','am','be','is'),(154,3,'Correct spelling?','Recieve','Receive','Receeve','Recive','Receive'),(155,3,'Choose correct article: ___ apple','A','An','The','No article','An'),(156,3,'Plural of Child?','Childs','Children','Childrens','Childes','Children'),(157,3,'He ___ football yesterday.','play','played','plays','playing','played'),(158,3,'Opposite of Honest?','Kind','Truthful','Dishonest','Polite','Dishonest'),(159,3,'One word for “study of plants”','Zoology','Botany','Biology','Geology','Botany'),(160,3,'She is good ___ English.','in','at','on','for','at'),(161,3,'Identify error: She do not like tea.','She','do','not','like','do'),(162,3,'Choose correct sentence','He go to school','He goes to school','He going school','He gone school','He goes to school'),(163,3,'Idiom: Break the ice','To fight','To start conversation','To cry','To sleep','To start conversation'),(164,3,'Fill blank: If I ___ rich, I would travel.','am','was','were','be','were'),(165,3,'Active voice: The cake was eaten by Ram.','Ram ate the cake','Ram eats cake','Ram eating cake','Ram eat cake','Ram ate the cake'),(166,3,'Synonym of Rapid','Slow','Fast','Lazy','Late','Fast'),(167,3,'Antonym of Increase','Grow','Rise','Decrease','Boost','Decrease'),(168,3,'Choose correct preposition: Interested ___ music','on','in','at','for','in'),(169,3,'Direct speech: He said, \"I am tired.\"','He said he is tired','He said he was tired','He says he tired','He said I tired','He said he was tired'),(170,3,'Find correct meaning of “Optimistic”','Negative','Hopeful','Sad','Angry','Hopeful'),(171,3,'Choose correct sentence','Neither of them are ready','Neither of them is ready','Neither are ready','Them is ready','Neither of them is ready'),(172,3,'Error detection: Each of the boys have a pen.','Each','boys','have','pen','have'),(173,3,'Idiom: Once in a blue moon','Very often','Rarely','Daily','Weekly','Rarely'),(174,3,'Fill blank: Hardly ___ reached when it started raining.','I had','had I','I have','have I','had I'),(175,3,'Choose correct word: He has less/fewer friends.','Less','Fewer','Many','Much','Fewer'),(176,3,'Antonym of Generous','Kind','Selfish','Rich','Poor','Selfish'),(177,3,'Synonym of Abundant','Scarce','Plenty','Rare','Less','Plenty'),(178,3,'Choose correct tense: She ___ here for 5 years.','lives','lived','has lived','living','has lived'),(179,3,'Meaning of Procrastinate','Delay','Finish','Start','Improve','Delay'),(180,3,'Correct sentence','She is senior than me','She is senior to me','She senior to me','She more senior than me','She is senior to me'),(181,4,'Which data structure follows FIFO?','Stack','Queue','Tree','Graph','Queue'),(182,4,'Which data structure follows LIFO?','Queue','Array','Stack','Linked List','Stack'),(183,4,'Which search is faster for sorted array?','Linear Search','Binary Search','Bubble Sort','DFS','Binary Search'),(184,4,'Worst case time complexity of Linear Search?','O(1)','O(log n)','O(n)','O(n^2)','O(n)'),(185,4,'Which structure uses nodes and pointers?','Array','Linked List','Stack','Queue','Linked List'),(186,4,'Which traversal prints Root-Left-Right?','Inorder','Postorder','Preorder','Level order','Preorder'),(187,4,'Which sorting algorithm compares adjacent elements?','Merge Sort','Quick Sort','Bubble Sort','Heap Sort','Bubble Sort'),(188,4,'Which data structure is used in recursion?','Queue','Stack','Array','Tree','Stack'),(189,4,'Which data structure represents hierarchical data?','Array','Stack','Tree','Queue','Tree'),(190,4,'Binary Search works on?','Sorted Array','Unsorted Array','Linked List','Graph','Sorted Array'),(191,4,'Average time complexity of Binary Search?','O(n)','O(log n)','O(n^2)','O(1)','O(log n)'),(192,4,'Which algorithm uses Divide and Conquer?','Bubble Sort','Merge Sort','Linear Search','Selection Sort','Merge Sort'),(193,4,'Which traversal gives sorted output in BST?','Preorder','Postorder','Inorder','Level order','Inorder'),(194,4,'Worst case time complexity of Bubble Sort?','O(n)','O(log n)','O(n^2)','O(n log n)','O(n^2)'),(195,4,'Which data structure is best for implementing priority queue?','Stack','Heap','Array','Linked List','Heap'),(196,4,'Which algorithm is used to find shortest path?','DFS','BFS','Dijkstra','Bubble Sort','Dijkstra'),(197,4,'Which structure uses key-value pairs?','Stack','Queue','Hash Table','Tree','Hash Table'),(198,4,'Time complexity of accessing element in array?','O(n)','O(log n)','O(1)','O(n^2)','O(1)'),(199,4,'Which traversal uses queue?','DFS','BFS','Inorder','Postorder','BFS'),(200,4,'Which data structure is used for expression evaluation?','Queue','Tree','Stack','Graph','Stack'),(201,4,'Worst case time complexity of Quick Sort?','O(n)','O(log n)','O(n log n)','O(n^2)','O(n^2)'),(202,4,'Which tree is self-balancing?','Binary Tree','AVL Tree','Heap','BST','AVL Tree'),(203,4,'Which algorithm detects cycle in graph?','Dijkstra','BFS','DFS','Binary Search','DFS'),(204,4,'Time complexity of Heap Sort?','O(n)','O(log n)','O(n log n)','O(n^2)','O(n log n)'),(205,4,'Which data structure is used in BFS?','Stack','Queue','Heap','Tree','Queue'),(206,4,'Which algorithm technique is used in Fibonacci DP?','Greedy','Backtracking','Dynamic Programming','Divide & Conquer','Dynamic Programming'),(207,4,'Which data structure stores elements in levels?','Stack','Queue','Tree','Graph','Tree'),(208,4,'Space complexity of Merge Sort?','O(1)','O(log n)','O(n)','O(n^2)','O(n)'),(209,4,'Which data structure is best for undo operation?','Queue','Stack','Tree','Graph','Stack'),(210,4,'Which traversal is Left-Right-Root?','Inorder','Preorder','Postorder','Level order','Postorder'),(211,5,'What does DBMS stand for?','Data Backup System','Database Management System','Data Management Service','Database Machine System','Database Management System'),(212,5,'Which key uniquely identifies a record?','Foreign Key','Primary Key','Candidate Key','Super Key','Primary Key'),(213,5,'Which SQL command is used to retrieve data?','GET','SELECT','FETCH','OPEN','SELECT'),(214,5,'Which command is used to insert data?','ADD','INSERT','PUT','CREATE','INSERT'),(215,5,'Which clause is used to filter records?','ORDER BY','GROUP BY','WHERE','HAVING','WHERE'),(216,5,'Which command deletes all records but keeps table structure?','DELETE','REMOVE','DROP','TRUNCATE','TRUNCATE'),(217,5,'Which symbol is used for single line comment in SQL?','//','--','#','/*','--'),(218,5,'Which SQL statement updates data?','MODIFY','CHANGE','UPDATE','EDIT','UPDATE'),(219,5,'Which constraint ensures unique values?','NOT NULL','UNIQUE','CHECK','DEFAULT','UNIQUE'),(220,5,'Which command removes a table permanently?','DELETE','REMOVE','DROP','CLEAR','DROP'),(221,5,'Which JOIN returns matching rows from both tables?','LEFT JOIN','RIGHT JOIN','INNER JOIN','FULL JOIN','INNER JOIN'),(222,5,'Which clause groups records?','WHERE','GROUP BY','ORDER BY','HAVING','GROUP BY'),(223,5,'Which clause is used with GROUP BY to filter grouped data?','WHERE','HAVING','ORDER BY','LIMIT','HAVING'),(224,5,'Which function returns total number of rows?','SUM()','COUNT()','AVG()','MAX()','COUNT()'),(225,5,'Which normal form removes partial dependency?','1NF','2NF','3NF','BCNF','2NF'),(226,5,'ACID property A stands for?','Accuracy','Atomicity','Access','Availability','Atomicity'),(227,5,'Which JOIN returns all rows from left table?','RIGHT JOIN','INNER JOIN','LEFT JOIN','FULL JOIN','LEFT JOIN'),(228,5,'Which index improves query performance?','Clustered Index','Foreign Index','Primary Index','Unique Index','Clustered Index'),(229,5,'Which SQL keyword sorts result?','SORT','ORDER BY','GROUP BY','ARRANGE','ORDER BY'),(230,5,'Which normal form removes transitive dependency?','1NF','2NF','3NF','4NF','3NF'),(231,5,'Which command is used to create stored procedure?','MAKE PROCEDURE','CREATE PROCEDURE','NEW PROCEDURE','ADD PROCEDURE','CREATE PROCEDURE'),(232,5,'Which trigger executes before insert?','AFTER INSERT','BEFORE INSERT','INSERT FIRST','ON INSERT','BEFORE INSERT'),(233,5,'Which isolation level prevents dirty reads?','READ UNCOMMITTED','READ COMMITTED','REPEATABLE READ','SERIALIZABLE','READ COMMITTED'),(234,5,'Which join returns all rows from both tables?','LEFT JOIN','RIGHT JOIN','INNER JOIN','FULL JOIN','FULL JOIN'),(235,5,'Deadlock occurs when?','Single user access','Two transactions wait for each other','Table deleted','Index missing','Two transactions wait for each other'),(236,5,'Which command starts transaction?','BEGIN','START TRANSACTION','OPEN','INIT','START TRANSACTION'),(237,5,'Which property ensures data consistency after crash?','Atomicity','Consistency','Isolation','Durability','Durability'),(238,5,'Which view stores data physically?','Simple View','Virtual View','Materialized View','Normal View','Materialized View'),(239,5,'Which normal form removes multivalued dependency?','1NF','2NF','3NF','4NF','4NF'),(240,5,'Which clause limits number of rows in MySQL?','TOP','LIMIT','ROWNUM','FETCH','LIMIT'),(241,6,'Capital of India?','Mumbai','Delhi','Kolkata','Chennai','Delhi'),(242,6,'National animal of India?','Lion','Tiger','Elephant','Leopard','Tiger'),(243,6,'Largest planet in solar system?','Earth','Mars','Jupiter','Saturn','Jupiter'),(244,6,'Who is known as Father of Nation (India)?','Nehru','Gandhi','Subhash Bose','Patel','Gandhi'),(245,6,'Currency of USA?','Dollar','Euro','Rupee','Pound','Dollar'),(246,6,'How many continents are there?','5','6','7','8','7'),(247,6,'Which ocean is largest?','Indian','Pacific','Atlantic','Arctic','Pacific'),(248,6,'Independence year of India?','1945','1946','1947','1948','1947'),(249,6,'Taj Mahal is located in?','Delhi','Agra','Jaipur','Mumbai','Agra'),(250,6,'Red Planet is?','Venus','Mars','Jupiter','Saturn','Mars'),(251,6,'Who is current President of India (2026)?','Ram Nath Kovind','Droupadi Murmu','Narendra Modi','Amit Shah','Droupadi Murmu'),(252,6,'ISRO stands for?','Indian Space Research Organisation','International Space Research Org','Indian Satellite Research Org','None','Indian Space Research Organisation'),(253,6,'RBI headquarters is in?','Delhi','Mumbai','Chennai','Kolkata','Mumbai'),(254,6,'G20 is group of?','10 countries','15 countries','20 countries','25 countries','20 countries'),(255,6,'Who wrote National Anthem of India?','Tagore','Nehru','Gandhi','Tilak','Tagore'),(256,6,'Which gas is most abundant in atmosphere?','Oxygen','Nitrogen','Carbon Dioxide','Hydrogen','Nitrogen'),(257,6,'Article 370 related to which state?','Punjab','Jammu & Kashmir','Rajasthan','Kerala','Jammu & Kashmir'),(258,6,'UNO headquarters located in?','London','New York','Paris','Geneva','New York'),(259,6,'First Prime Minister of India?','Gandhi','Nehru','Patel','Rajendra Prasad','Nehru'),(260,6,'Which planet is closest to Sun?','Venus','Earth','Mercury','Mars','Mercury'),(261,6,'Which country won FIFA World Cup 2022?','France','Brazil','Argentina','Germany','Argentina'),(262,6,'COP28 climate summit held in which country?','India','USA','UAE','UK','UAE'),(263,6,'Which Indian mission reached Moon in 2023?','Chandrayaan-2','Chandrayaan-3','Mangalyaan','Gaganyaan','Chandrayaan-3'),(264,6,'BRICS includes which country?','USA','China','UK','Japan','China'),(265,6,'Which is longest river in world?','Nile','Amazon','Yangtze','Mississippi','Nile'),(266,6,'Which country is largest by area?','USA','China','Russia','Canada','Russia'),(267,6,'Which organ purifies blood in human body?','Heart','Liver','Kidney','Lungs','Kidney'),(268,6,'Who is CEO of Tesla (2026)?','Bill Gates','Elon Musk','Jeff Bezos','Sundar Pichai','Elon Musk'),(269,6,'Which Indian state has highest population?','UP','Maharashtra','Bihar','MP','UP'),(270,6,'Which organization gives Nobel Prize?','UN','WHO','Nobel Committee','IMF','Nobel Committee');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `questions` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'Quantitative Aptitude','Aptitude','Medium','30 min',10,'Percentages, Profit & Loss, Time & Work'),(2,'Logical Reasoning','Reasoning','Easy','25 min',10,'Puzzles, Series, Patterns'),(3,'Verbal Ability','English','Easy','20 min',10,'Grammar, Vocabulary, Comprehension'),(4,'Data Structures & Algorithms','Technical','Hard','40 min',10,'Arrays, Trees, Sorting, Complexity'),(5,'Database Management (SQL)','Technical','Medium','30 min',10,'Queries, Joins, Normalization'),(6,'General Knowledge','General','Easy','15 min',10,'Current Affairs & Static GK');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:55:44
