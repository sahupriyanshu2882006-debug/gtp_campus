-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: smart_campus
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `application_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `application_type` varchar(50) DEFAULT NULL,
  `reason` text,
  `status` varchar(30) DEFAULT 'Pending',
  `application_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`application_id`),
  KEY `fk_application_student` (`student_id`),
  CONSTRAINT `fk_application_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (3,1,'Leave Application','Medical Leave','Pending','2026-06-07 09:19:43');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaints` (
  `complaint_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `description` text,
  `status` varchar(30) DEFAULT 'Pending',
  `is_anonymous` tinyint(1) DEFAULT NULL,
  `complaint_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`complaint_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `faculty_id` int NOT NULL AUTO_INCREMENT,
  `FACULTY_NAME` varchar(100) DEFAULT NULL,
  `DEPARTMENT` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `employee_id` varchar(30) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `organization_id` int DEFAULT NULL,
  PRIMARY KEY (`faculty_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `employee_id` (`employee_id`),
  KEY `fk_faculty_organization` (`organization_id`),
  CONSTRAINT `fk_faculty_organization` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `organization_id` int NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(200) DEFAULT NULL,
  `organization_type` varchar(50) DEFAULT NULL,
  `organization_email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`organization_id`),
  UNIQUE KEY `organizaton_email` (`organization_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `roll_no` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `enrollment_no` varchar(30) DEFAULT NULL,
  `university_name` varchar(200) DEFAULT NULL,
  `organization_id` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `roll_no` (`roll_no`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `enrollment_no` (`enrollment_no`),
  KEY `fk_student_org` (`organization_id`),
  CONSTRAINT `fk_student_org` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Priyanshu','CS101','pri@gmail.com','1234','CSE',2,'2006-08-28','9876543210',NULL,NULL,NULL);
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

-- Dump completed on 2026-06-18  2:29:43
