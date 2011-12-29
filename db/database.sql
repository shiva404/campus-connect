-- MySQL dump 10.13  Distrib 5.1.58, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: fdb1
-- ------------------------------------------------------
-- Server version	5.1.58-1ubuntu1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `fdb1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fdb1` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `fdb1`;

--
-- Table structure for table `answer_ratings`
--

DROP TABLE IF EXISTS `answer_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `rating_type_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_rate` (`user_id`,`answer_id`,`rating_type_id`),
  KEY `fk_ans_id` (`answer_id`),
  KEY `fk_rat_type_id` (`rating_type_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_rate_quest` (`question_id`),
  CONSTRAINT `fk_ans_id` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rate_quest` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rat_type_id` FOREIGN KEY (`rating_type_id`) REFERENCES `rating_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_ratings`
--

LOCK TABLES `answer_ratings` WRITE;
/*!40000 ALTER TABLE `answer_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` text COLLATE utf8_unicode_ci,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_answers` (`user_id`),
  KEY `fk_question_asnwers` (`question_id`),
  CONSTRAINT `fk_user_answers` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloned_questions`
--

DROP TABLE IF EXISTS `cloned_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloned_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8_unicode_ci,
  `topic_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `FULL_TEXT_QUESTION` (`question`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloned_questions`
--

LOCK TABLES `cloned_questions` WRITE;
/*!40000 ALTER TABLE `cloned_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloned_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colleges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `college_name` varchar(100) DEFAULT NULL,
  `college_address` varchar(200) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES (3,'Acharya Institute of Technology\n','Soladevana Halli , Hesaraghatta Main road, Chickabanavara post Bangalore - 560090\n','+91 80 2839-6011\n','+91 80 2837-0290\n'),(4,'Alpha College of Engineering\n','30/2, Hennur Bagalur Road, Doddagubbi post Bangalore - 562149\n','+91 80 2844-5218\n','+91 80 2844-5219\n'),(5,'AMC Engineering College\n','18th Km, Bannerghatta road Bangalore - 560076\n','+91 80 7828-655\n','+91 80 7828-656\n'),(6,'APS College of Engineering\n','Kanakapura road, Somana Halli Bangalore - 560062\n','+91 80 2843-2108\n','+91 80 2843-2837\n'),(7,'Atria Institute Of Technology\n','ASKB Campus, 1 main AGÃ¢â‚¬â„¢s Colony, Anand Nagar, Hebbal P.O Bangalore - 560024\n','+91 80 2363-1298\n','+91 80 2363-2969\n'),(8,'Bangalore College Of Engineering & Technology\n','Chandapura, Anekal Bangalore South - 562145\n','+91 80 7835331\n','+91 80 7834877\n'),(9,'Bangalore Institute Of Technology\n','K.R Road, V.V Puram Bangalore - 560004\n','+91 80 2661-3237\n','+91 80 2242-6796\n'),(10,'BMS Institute Of Technology\n','P.B no.6443, Avalahalli, Doddaballapura Main Road, Yelahanka Bangalore - 560064\n','+91 80 2586-1576\n','+91 80 2856-7186\n'),(11,'Basava Academy Of Engineering\n','Gangnadana Halli Main Road, Near Peenya Dasarahalli, Nagasandra Post Bangalore - 560073\n','+91 80 2271-4160/ 2839-3613 / 14\n','XXX\n'),(12,'B.T.L Institute Of Technology\n','Bommasandra Bangalore\n','+91 80 7833370 / 7833055\n','+91 80 7833831\n'),(13,'B.N.M Institute Of Technology\n','P.B No 7087, 12th Main Road, 27th Cross Banashankari 2nd stage Bangalore - 560070\n','+91 80 2671-1780/ 782\n','+91 80 2671-0881\n'),(14,'Cambridge Institute Of Technology\n','K.R Puram Bangalore - 560036\n','+91 80 2561-8798 / 99\n','+91 80 2561-8798\n'),(15,'City Engineering College\n','Doddakalasandra, Kanakapura Main Road, Vasanthapura Banglore - 560062\n','Phone:+91 80 2666-9313\n','+91 80 2666-9314\n'),(16,'C.M.R. Institute Of Technology\n','132, AECS Layout, I.T Park road, Kundalahalli Bangalore - 560037\n','+91 80 2852-4486\n','+91 80 2852-4630\n'),(17,'Dayananda Sagar College Of Engineering\n','Shavige Malleshwra Hills, Kumaraswamy Layout Bangalore - 560078\n','+91 80 2666-2226\n','+91 80 2666-0789\n'),(18,'DR. Ambedkar Institute Of Technology\n','Outer Ring Road, Nr.Jnana Bharathi Campus, Mallathahalli Bangalore 560056\n','+91 80 2321-1505 / 507\n','+91 80 2321-7789\n'),(19,'Don Bosco Institute Of Technology\n','Kumbalagodu, Mysore road Bangalore - 560074\n','+91 80 2843-7031/ 29\n','+91 80 2843-7031\n'),(20,'East Point College Of Engg & Tech\n','147, Bidarahalli, Virgonagarpost Bangalore - 560049\n','+91 80 2847-3777\n','+91 80 2847-2999\n'),(21,'East Point College For Women\n','147, Bidarahalli, Virgonagarpost Bangalore - 560049\n','+91 80 2847-3777, +91 80 2847-2999\n','XXX\n'),(22,'East West Institute Of Technology\n','63, Off Magadi Road, Vishwaneedam Post Bangalore - 560091\n','+91 80 2328-6732\n','+91 80 2328-8244\n'),(23,'H.K.B.K. College Of Engineering\n','#22/1 Nagawara Bangalore - 560045\n','+91 80 2544-1722/ 3698 / 3690\n','+91 80 2544-3813\n'),(24,'Impact Institue Of Technology\n','Bangalore 560076\n','+91 80 2272-0805 / 2363-7144\n','XXX\n'),(25,'Islamiah Institute Of Technology\n','N.P Road Bangalore 560076\n','+91 80 2648-1744\n','+91 80 2648-3271\n'),(26,'J.S.S Academy Of Technical Education\n','Uttarahalli-Kengeri Main Road, Mylasandra Bangalore 560060\n','+91 80 2860-3425\n','+91 80 2860-3706\n'),(27,'K.N.S Institute Of Technology\n','Tirumenahalli, Hegdenagar, Kogilu Road, Jakkur P.O Bangalore 560064\n','+91 80 2856-7494\n','+91 80 2856-7359\n'),(28,'K.S.Institue Of Technology\n','#14, Raghuvanahalli, Kanakapura Road Bangalore\n','+91 80 2843-5724\n','+91 80 2843-5723\n'),(29,'M.S. Engineering College\n','Navarathna Agrahara, Sadahalli Bangalore 562110\n','+91 80 2361-3451\n','+91 80 4113-7900\n'),(30,'M.S.Ramaiah Institute Of Technology\n','Vidya Soudha, M S Ramaiah Nagar, MSRIT Paot Bangalore 560054\n','+91 80 2360-8455\n','+91 80 2360-3124\n'),(31,'M.V.J College Of Engineering\n','Channasandra, Near Whitefied, Kadugodi Post Bangalore 560067\n','+91 80 2845-2324\n','+91 80 2845-2443\n'),(32,'New Horizon College Of Engineering\n','Kadubisanahalli, Varthur Bangalore 560087\n','+91 80 6629-7777\n','+91 80 2844-0770\n'),(33,'NITTE Meenakshi Institute Of Technology\n','Govindapura, Yelahanka Bangalore 560064\n','+91 80 2216-7800 / 2216-7803\n','+91 80 2216-7805\n'),(34,'P.E.S. Institute Of Technology\n','100 ft Ring road, BSK 3rd stage Bangalore 560085\n','+91 80 2672-1983\n','+91 80 2672-0896\n'),(35,'P.E.S School of Engineering\n','Hosur road (1 km before Electronic city ) Bangalore\n','+91 80 6618-6609\n','+91 80 2852-1630\n'),(36,'Rajiv Gandhi Institute Of Technology\n','Cholanagar, R.T Nagar P.O Bangalore 560032\n','+91 80 6537-3782\n','+91 80 2354-2081\n'),(37,'Reva Institute Of Technology & Management\n','Kattigehalli, Jala Hobli, Yelahanka Bangalore 560064\n','+91 80 6568-7563 / 565\n','+91 80 2847-8534\n'),(38,'R.N.S Institute Of Technology\n','Channasandra, Uttarahalli - Kengeri Road, Subramanyapura post Bangalore 560061\n','+91 80 2860-3880 / 81\n','+91 80 2860-3882\n'),(39,'R.R Institute Of Technology\n','No 67, Chickabanavara, Near Chickabanavara Railwaystation Bangalore 560090\n','+91 80 2839-1555\n','+91 80 2839-6210\n'),(40,'R.V. College Of Engineering\n','R.V. Vidyanikethan Post, Mysore Road Bangalore - 560059\n','+91 80 6717-8000/ 21 / 99\n','+91 80 2860-0337/2914\n'),(41,'Sapthagiri College Of Engineering\n','14/5, Chickasandra, Hesaraghatta Main Road Bangalore - 560057\n','+91 80 2837-2801/ 02\n','+91 80 2837-2797\n'),(42,'Sai Vidya Institute Of Technology\n','Rajankunte, Doddaballapur Road Bangalore - 560064\n','+91 80 2846-8191/ 93 / 96\n','+91 80 2846-8193\n'),(43,'Sambhram Institute Of Technology\n','Amba Bhavani Temple Road, M.S Palya, Jalahalli East Bangalore - 560097\n','+91 80 6590-3384 / 2364-0612\n','+91 80 2364-1701\n'),(44,'SBSMIT\n','No 6162, Nelamangala Bangalore Rural Dist.\n','+91 80 7724344\n','+91 80 7723181\n'),(45,'SCT Institute Of Technology\n','Kaggadaspura Main road, Vignana Nagar, New Thippasandra Bangalore 5600075\n','+91 80 2524-0694 / 2524-5225\n','+91 80 2524-5200\n'),(46,'S.E.A College Of Engineering & Technology\n','Ektanagar, Basavanpura, Virgonagar Post, K.R. Puram Bangalore 560049\n','+91 80 2561-8696 / 2561-3418\n','+91 80 2561-8696\n'),(47,'SJB Institute Of Technology\n','#67, BGS Health & Education City, Kengeri Bangalore 560060\n','+91 80 2860-5445/ 6\n','+91 80 2860-3651\n'),(48,'S.K.S.J.T Institute\n','K.R. Circle Bangalore 56001\n','+91 80 2226-0126\n','XXX\n'),(49,'SIR M. Visvesvaraya Institute Of Technology\n','Krishnadevarayanagar, Hunasamaranahalli, via Yelahanka Bangalore 262157\n','+91 80 2847-7024 / 26\n','+91 80 2846-7081\n'),(50,'SRI Krishna Institute Of Technology\n','Hesaraghatta Main Road, Chimney Hills Bangalore 560090\n','+91 80 2372-1315 / 2839-2221\n','+91 80 2372-1477\n'),(51,'SRI Rajarajeshwari College Of Engineering\n','#14, Ramohalli Cross, Kumbalgodu, Mysore Road Bangalore 560074\n','+91 80 2843-7124 / 5695-8964\n','XXX\n'),(52,'SRI Revana Siddeshwara Institute Of Technology\n','Chickajala, Chokanahally, Bangalore North Bangalore 562157\n','+91 80 2846-7850\n','+91 80 2847-7384\n'),(53,'SRI Venkateshwara College Of Engineering\n','Vidyanagara Cross Bangalore 562157\n','+91 80 2847-7460\n','+91 80 2847-7461\n'),(54,'Sri Channabasaveshvara Intitute Of Technology\n','N.H. 206, B.H. Road, Gubbi Tumkur - 572 216 Karnataka, India.\n','08131 - 223818, 223365, 223177,223133\n','08131 - 223818\n'),(55,'T.John Institute Of Technology\n','86/1, Kammanahalli Gattige, Bannerghatta Road Bangalore 560083\n','+91 80 2842-9623\n','Fax:XXXXX\n'),(56,'The Oxford College Of Engineering\n','Bommanahalli Hosur Road Bangalore 560068\n','Phone:+91 80 2573-7285 / 288\n','Fax:+91 80 2573-0551\n'),(57,'University Of Vishweshwaraiah College Of Engineering\n','K.R. Circle Bangalore 56001\n','+91 80 2296-1803\n','XXXX\n'),(58,'Vemana Institute Of Technology\n','No 1 Mahayogi, Vemana Road, 3rd Block, Koramangala Bangalore 560034\n','+91 80 2553-4943\n','XXXX\n'),(59,'Vivekananda Institute Of Technology\n','Gudimavu, Kengeri Hobli, Kumbalgodu Post Bangalore 560074\n','+91 80 2843-7696/ 036/ 134\n','+91 80 2843-7944\n'),(60,'Yellamma Dasappa Institute Of Technology\n','Raghuvanahalli, 14th Km, kanakapura Road Bangalore 5600062\n','+91 80 2843-5829\n','XXX\n'),(61,'Amruta Institute Of Engineering & Management Science\n','Bidadi Industrial Area, Near Toyoto Kirloskar Motors, Off Mysore road Bangalore 560057\n','+91 80 2720-4740\n','XXXX\n'),(62,'Auden Technology & Management Academy\n','Vaderahalli, Harohalli, Kanakapur taluk Bangalore 562112\n','+91 80 2843-3403/ 4 / 6\n','+91 80 2843-3405\n'),(63,'Bhagwan Mahaveer Jain College Of Engineering\n','Jakkasandra PO, Kanakapura Taluk Bangalore Rural 562112\n','+91 80 2757-7200\n','+91 80 2757-7199\n'),(64,'Dr.Sri Sri Sri Shivakumar Maha Swamiji College Of Engineering\n','Byranayakanahalli, Nelamangala Taluk, Bangalore Rural\n','+91 80 2773-9251/ 52\n','+91 80 2773-9252\n'),(65,'Ghousia Engineering College\n','Bangalore - Mysore Road, Ramnagar - 571511 Bangalore District\n','+91 80 727-1353\n','+91 80 727-3474\n'),(66,'Government Engineering College\n','Mangudi, B.M Road, Ramnagar\n','08113-2720-4266\n','XXX\n'),(67,'Jana Vikas Institute Of Technology\n','Bidadi, Ramnagara Taluk Bangalore Rural District\n','+91 80 2728-2994\n','+91 80 2728-2998\n'),(68,'Nagarjuna College Of Engineering & Technology\n','Mudugurki, Venkatagiri Kote, Devanahalli Bangalore 562110\n','+91 80 2764-5990/ 2 / 3\n','+91 80 2764-5990\n'),(69,'R.L. Jalappa Institute Of Technology\n','Kodigehalli, Doddaballapur Bangalore Rural District\n','+91 80 7625381\n','+91 80 7625380\n'),(70,'Shiridi Sai Engineering College\n','Sai Leo Nagar, Samandur (PO), Anekal Bangalore 562106\n','+91 8110-7830221\n','+91 8110-7830355\n');
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text COLLATE utf8_unicode_ci,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_comments` (`user_id`),
  KEY `fk_question_comments` (`question_id`),
  CONSTRAINT `fk_user_comments` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_feedbacks` (`user_id`),
  CONSTRAINT `fk_user_feedbacks` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendrelation`
--

DROP TABLE IF EXISTS `friendrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendrelation` (
  `user_id1` int(11) NOT NULL,
  `user_id2` int(11) NOT NULL,
  PRIMARY KEY (`user_id1`,`user_id2`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendrelation`
--

LOCK TABLES `friendrelation` WRITE;
/*!40000 ALTER TABLE `friendrelation` DISABLE KEYS */;
INSERT INTO `friendrelation` VALUES (13,21),(13,22),(21,22);
/*!40000 ALTER TABLE `friendrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8_unicode_ci,
  `topic_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quest_user` (`user_id`),
  KEY `fk_quest_topic` (`topic_id`),
  CONSTRAINT `fk_quest_topic` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quest_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (159,'xyz',10,13,'2011-09-18 00:00:00','2011-09-18 00:00:00'),(160,'akjs keq ',13,13,'2011-09-18 17:08:22','2011-09-18 17:08:22'),(161,'hey sample question under aa',15,13,'2011-09-19 04:16:12','2011-09-19 04:16:12'),(162,'something on java',13,13,'2011-09-19 04:21:03','2011-09-19 04:21:03'),(163,'bdfkaligu uerq iug ',13,13,'2011-09-19 08:04:40','2011-09-19 08:04:40'),(164,'gdsh46w',17,22,'2011-09-19 08:06:05','2011-09-19 08:06:05'),(165,'this first question about the Design pattren',21,13,'2011-12-18 20:22:17','2011-12-18 20:22:17'),(166,'What is the syllabus for the test-1?',21,13,'2011-12-18 20:26:32','2011-12-18 20:26:32');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_types`
--

DROP TABLE IF EXISTS `rating_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_types`
--

LOCK TABLES `rating_types` WRITE;
/*!40000 ALTER TABLE `rating_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `threads` (
  `id` int(11) NOT NULL,
  `thread_name` varchar(255) DEFAULT NULL,
  `thread_description` text,
  `creator_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `privacy_level` int(3) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threads`
--

LOCK TABLES `threads` WRITE;
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `privacy` int(3) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (10,'Syllabus','Syllabus related','2011-09-18 00:00:00','2011-09-18 00:00:00',34,0,NULL,NULL,NULL),(11,'Placements','Placements related','2011-09-18 00:00:00','2011-09-18 00:00:00',34,0,NULL,NULL,NULL),(12,'Internals','Internals related','2011-09-18 00:00:00','2011-09-18 00:00:00',34,0,1,1,13),(13,'Java','Java related','2011-09-18 00:00:00','2011-09-18 00:00:00',34,12,1,1,13),(14,'aa','as','2011-09-18 07:29:14','2011-09-18 07:29:14',34,10,1,1,13),(15,'aa','sdf','2011-09-18 07:31:57','2011-09-18 07:31:57',34,11,1,0,13),(16,'Networks','Networks Internals syllabus','2011-09-18 11:33:36','2011-09-18 11:33:36',34,12,1,1,13),(17,'bskdhfg','kjsdhugi','2011-09-19 02:26:10','2011-09-19 02:26:10',34,10,1,1,22),(18,'something','fsjivjv','2011-09-19 03:50:50','2011-09-19 03:50:50',34,10,1,1,13),(19,'hkdf','fsavuote','2011-09-19 03:51:34','2011-09-19 03:51:34',34,11,1,1,13),(20,'vfksj','sfv','2011-09-19 03:55:16','2011-09-19 03:55:16',9999,9999,0,1,13),(21,'Design Pattrens','Forum about the design pattrens ','2011-12-18 20:21:43','2011-12-18 20:21:43',34,10,1,1,13);
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `usn` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `college_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (13,'shiva','kumar','shiva.n404@gmail.com','9535890448','shiva.n404','intuit123','2011-09-17 20:14:43','2011-09-17 20:14:43','1PI07IS107','34'),(21,'Anusha','Swamy','Anusha_Swamy@gmail.com','9988775544','anusha','intuit123','2011-09-18 19:07:28','2011-09-18 19:07:28','1PI07IS108','34'),(22,'Akshatha','Udupa','Akshtha_Udupa@gmail.com','2233445566','akshatha','intuit123','2011-09-18 19:15:22','2011-09-18 19:15:22','1PI07IS109','34'),(23,'Manjunath','Ghargi','manju.ghargi@gmail.com','1122334455','manju','intuit123','2011-09-19 06:48:53','2011-09-19 06:48:53','1BM07IS109','34'),(24,'Sagar','Manthe','sagar.m1990@gmail.com','1122334455','sagar','intuit123','2011-09-19 06:59:01','2011-09-19 06:59:01','1BM07IS102','4');
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

-- Dump completed on 2011-12-19  1:50:37
