-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: likebjx
-- ------------------------------------------------------
-- Server version	5.7.32

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
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `prix` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_29A5EC2712469DE2` (`category_id`),
  CONSTRAINT `FK_29A5EC2712469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'boucles d\'oreilles en préhnite','La Préhnite apporte un sentiment renouvelé de vitalité et d\'énergie à ton esprit.',20,2,'bo-prehnite-646bece69ff25116826502.jpg',2,NULL),(2,'collier labis','Le lapis-lazuli, une pierre qui donne confiance et ouvrira notre esprit à de nouvelles solutions nous conduisant à la résolution .',100,2,'lapis-colier-640-646bedc28d2aa627864971.jpg',3,NULL),(5,'Grosse bague pierre ruby émeraude argent doré','Cette magnifique bague est sertie avec des émeraudes et rubis aux couleurs éclatantes; les deux pierres sont très précieuses et ils sont des symboles de l\'amour et de la passion.',150,4,'maxres-grosse-bague-6484fbf54703d830869837.jpg',4,NULL),(6,'Bague diamant laboratoire','Le diamant synthétique est un diamant dont les caractéristiques sont identiques aux diamants extraits des mines. Ils sont aussi beaux que les diamants naturels mais beaucoup moins chers et plus écologiques.',80,4,'maxresgrossebague-6484fdc683e9f100571410.jpg',4,NULL),(9,'Collier Spinelle en Argent Doré','La Spinelle est une pierre de protection, qui chasse les ondes négatives, mais aussi les cauchemars pour un sommeil plus apaisé.',180,2,'spinel-64850556d46f3734281779.jpg',3,'2023-06-30 23:53:40'),(10,'Bague Fleur Améthyste','Grosse bague artisanale sertie améthyste et émeraude en argent 925.',180,2,'sila-amethyste-bague-64850eb711e7f361622458.jpg',4,NULL),(11,'Bague Royale Spinelle Péridot','Bague sertie d\'une grosse pierre de péridot et spinelle rose monté sur argent massif 925.',120,6,'bague-peridot-tourmaline-649f309bcd3a7233019949.jpg',4,NULL),(12,'Bague Serpent Saphir Spinelle Rose','Bague ouverte en saphir et spinelle rose montée sur argent 925.',150,6,'bague-double-ouverte-649f3190abb2c482427185.jpg',4,NULL),(13,'Boucles d\'oreilles Ruby','Boucles d\'oreilles en ruby et argent 925.',150,6,'bo-ruby-649f323522552703236199.jpg',2,NULL),(14,'Boucles d\'oreilles Tourmaline','Boucles d\'oreilles tourmaline jaune et argent 925.',200,6,'bo-tourmaline-jaune-649f32766f018724677217.jpg',2,'2023-06-30 23:54:24'),(15,'Boucles d\'oreilles Péridot','Boucles d\'oreilles en  pierre péridot et tourmaline rose montées sur argent doré.',150,6,'bo-peridot-649f32d50e22b421611273.jpg',2,NULL),(16,'Collier Grosse Perle','Collier avec une grosse perle de l\'eau douce et des petits saphirs;\r\nla monture et la chaine sont en argent façon ancienne.',180,6,'collier-perle-649f336f1213c710033319.jpg',3,NULL),(17,'Bague Améthyste Citrine','Bague ouverte avec pierres améthyste et citrine, montée sur argent doré.',150,6,'bague-ame-citrine-649f33c329b4d129361712.jpg',4,NULL),(18,'Boucles d\'oreilles Tourmaline Rose','Boucles d\'oreilles longues en tourmaline rose et perles d\'eau douce.',200,6,'bo-long-649f34256a7e2806636642.jpg',2,NULL),(19,'Bague Ruby Améthyste','Bague ouverte en ruby et améthyste monture argent massif 925.',150,6,'bague-double-violet-649f3474115d5313650259.jpg',4,NULL),(20,'Bague Petit Ruby','Bague en ruby monté sur argent façon oxydée.',20,10,'bague-ruby-petit-649f34be22695226412881.jpg',4,NULL),(21,'Collier Tourmaline Rose','Collier tourmaline rose et argent 925.\r\nLongueur 42 cm.',120,6,'colier-tourmaline-rose-649f352f6e824432844921.jpg',3,'2023-06-30 23:55:00');
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-10 12:15:54
