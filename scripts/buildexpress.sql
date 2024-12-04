-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: buildexpress
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add usuario comum',1,'add_usuariocomum'),(2,'Can change usuario comum',1,'change_usuariocomum'),(3,'Can delete usuario comum',1,'delete_usuariocomum'),(4,'Can view usuario comum',1,'view_usuariocomum'),(5,'Can add categoria',2,'add_categoria'),(6,'Can change categoria',2,'change_categoria'),(7,'Can delete categoria',2,'delete_categoria'),(8,'Can view categoria',2,'view_categoria'),(9,'Can add endereco',3,'add_endereco'),(10,'Can change endereco',3,'change_endereco'),(11,'Can delete endereco',3,'delete_endereco'),(12,'Can view endereco',3,'view_endereco'),(13,'Can add loja',4,'add_loja'),(14,'Can change loja',4,'change_loja'),(15,'Can delete loja',4,'delete_loja'),(16,'Can view loja',4,'view_loja'),(17,'Can add produto',5,'add_produto'),(18,'Can change produto',5,'change_produto'),(19,'Can delete produto',5,'delete_produto'),(20,'Can view produto',5,'view_produto'),(21,'Can add avaliacao',6,'add_avaliacao'),(22,'Can change avaliacao',6,'change_avaliacao'),(23,'Can delete avaliacao',6,'delete_avaliacao'),(24,'Can view avaliacao',6,'view_avaliacao'),(25,'Can add wishlist',7,'add_wishlist'),(26,'Can change wishlist',7,'change_wishlist'),(27,'Can delete wishlist',7,'delete_wishlist'),(28,'Can view wishlist',7,'view_wishlist'),(29,'Can add lojista',8,'add_lojista'),(30,'Can change lojista',8,'change_lojista'),(31,'Can delete lojista',8,'delete_lojista'),(32,'Can view lojista',8,'view_lojista'),(33,'Can add plano',9,'add_plano'),(34,'Can change plano',9,'change_plano'),(35,'Can delete plano',9,'delete_plano'),(36,'Can view plano',9,'view_plano'),(37,'Can add motorista',10,'add_motorista'),(38,'Can change motorista',10,'change_motorista'),(39,'Can delete motorista',10,'delete_motorista'),(40,'Can view motorista',10,'view_motorista'),(41,'Can add log entry',11,'add_logentry'),(42,'Can change log entry',11,'change_logentry'),(43,'Can delete log entry',11,'delete_logentry'),(44,'Can view log entry',11,'view_logentry'),(45,'Can add permission',12,'add_permission'),(46,'Can change permission',12,'change_permission'),(47,'Can delete permission',12,'delete_permission'),(48,'Can view permission',12,'view_permission'),(49,'Can add group',13,'add_group'),(50,'Can change group',13,'change_group'),(51,'Can delete group',13,'delete_group'),(52,'Can view group',13,'view_group'),(53,'Can add content type',14,'add_contenttype'),(54,'Can change content type',14,'change_contenttype'),(55,'Can delete content type',14,'delete_contenttype'),(56,'Can view content type',14,'view_contenttype'),(57,'Can add session',15,'add_session'),(58,'Can change session',15,'change_session'),(59,'Can delete session',15,'delete_session'),(60,'Can view session',15,'view_session'),(61,'Can add carrinho',16,'add_carrinho'),(62,'Can change carrinho',16,'change_carrinho'),(63,'Can delete carrinho',16,'delete_carrinho'),(64,'Can view carrinho',16,'view_carrinho'),(65,'Can add itens carrinho',17,'add_itenscarrinho'),(66,'Can change itens carrinho',17,'change_itenscarrinho'),(67,'Can delete itens carrinho',17,'delete_itenscarrinho'),(68,'Can view itens carrinho',17,'view_itenscarrinho'),(69,'Can add item carrinho',18,'add_itemcarrinho'),(70,'Can change item carrinho',18,'change_itemcarrinho'),(71,'Can delete item carrinho',18,'delete_itemcarrinho'),(72,'Can view item carrinho',18,'view_itemcarrinho'),(73,'Can add crontab',19,'add_crontabschedule'),(74,'Can change crontab',19,'change_crontabschedule'),(75,'Can delete crontab',19,'delete_crontabschedule'),(76,'Can view crontab',19,'view_crontabschedule'),(77,'Can add interval',20,'add_intervalschedule'),(78,'Can change interval',20,'change_intervalschedule'),(79,'Can delete interval',20,'delete_intervalschedule'),(80,'Can view interval',20,'view_intervalschedule'),(81,'Can add periodic task',21,'add_periodictask'),(82,'Can change periodic task',21,'change_periodictask'),(83,'Can delete periodic task',21,'delete_periodictask'),(84,'Can view periodic task',21,'view_periodictask'),(85,'Can add periodic task track',22,'add_periodictasks'),(86,'Can change periodic task track',22,'change_periodictasks'),(87,'Can delete periodic task track',22,'delete_periodictasks'),(88,'Can view periodic task track',22,'view_periodictasks'),(89,'Can add solar event',23,'add_solarschedule'),(90,'Can change solar event',23,'change_solarschedule'),(91,'Can delete solar event',23,'delete_solarschedule'),(92,'Can view solar event',23,'view_solarschedule'),(93,'Can add clocked',24,'add_clockedschedule'),(94,'Can change clocked',24,'change_clockedschedule'),(95,'Can delete clocked',24,'delete_clockedschedule'),(96,'Can view clocked',24,'view_clockedschedule'),(97,'Can add selecao endereco usuario',25,'add_selecaoenderecousuario'),(98,'Can change selecao endereco usuario',25,'change_selecaoenderecousuario'),(99,'Can delete selecao endereco usuario',25,'delete_selecaoenderecousuario'),(100,'Can view selecao endereco usuario',25,'view_selecaoenderecousuario'),(101,'Can add cupom',26,'add_cupom'),(102,'Can change cupom',26,'change_cupom'),(103,'Can delete cupom',26,'delete_cupom'),(104,'Can view cupom',26,'view_cupom'),(105,'Can add pedido',27,'add_pedido'),(106,'Can change pedido',27,'change_pedido'),(107,'Can delete pedido',27,'delete_pedido'),(108,'Can view pedido',27,'view_pedido'),(109,'Can add entrega',28,'add_entrega'),(110,'Can change entrega',28,'change_entrega'),(111,'Can delete entrega',28,'delete_entrega'),(112,'Can view entrega',28,'view_entrega'),(113,'Can add entrega agendada',29,'add_entregaagendada'),(114,'Can change entrega agendada',29,'change_entregaagendada'),(115,'Can delete entrega agendada',29,'delete_entregaagendada'),(116,'Can view entrega agendada',29,'view_entregaagendada'),(117,'Can add entrega recusada',30,'add_entregarecusada'),(118,'Can change entrega recusada',30,'change_entregarecusada'),(119,'Can delete entrega recusada',30,'delete_entregarecusada'),(120,'Can view entrega recusada',30,'view_entregarecusada'),(121,'Can add entrega cancelada pelo motorista',31,'add_entregacanceladapelomotorista'),(122,'Can change entrega cancelada pelo motorista',31,'change_entregacanceladapelomotorista'),(123,'Can delete entrega cancelada pelo motorista',31,'delete_entregacanceladapelomotorista'),(124,'Can view entrega cancelada pelo motorista',31,'view_entregacanceladapelomotorista'),(125,'Can add avaliacao loja',32,'add_avaliacaoloja'),(126,'Can change avaliacao loja',32,'change_avaliacaoloja'),(127,'Can delete avaliacao loja',32,'delete_avaliacaoloja'),(128,'Can view avaliacao loja',32,'view_avaliacaoloja'),(129,'Can add avaliacao motorista',33,'add_avaliacaomotorista'),(130,'Can change avaliacao motorista',33,'change_avaliacaomotorista'),(131,'Can delete avaliacao motorista',33,'delete_avaliacaomotorista'),(132,'Can view avaliacao motorista',33,'view_avaliacaomotorista'),(133,'Can add resposta lojista',34,'add_respostalojista'),(134,'Can change resposta lojista',34,'change_respostalojista'),(135,'Can delete resposta lojista',34,'delete_respostalojista'),(136,'Can view resposta lojista',34,'view_respostalojista');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_ecommerce_usuariocomum_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_ecommerce_usuariocomum_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_usuariocomum` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-02 04:09:49.867511','1','joao@email.com',1,'[{\"added\": {}}]',8,2),(2,'2024-11-02 04:10:58.241541','1','joao@email.com',1,'[{\"added\": {}}]',10,2),(3,'2024-11-02 15:14:24.265595','1','joao@email.com',2,'[]',8,2),(4,'2024-11-02 21:27:53.868649','1','Av. Francisco Glicério, 245, Centro, Campinas - 13025067',3,'',3,2),(5,'2024-11-02 21:28:03.649184','2','joao2@gmail.com',3,'',8,2),(6,'2024-11-02 21:28:03.649224','1','joao@email.com',3,'',8,2),(7,'2024-11-02 21:29:11.306032','1','Basico',1,'[{\"added\": {}}]',9,2),(8,'2024-11-02 21:29:21.798052','2','Entrega',1,'[{\"added\": {}}]',9,2),(9,'2024-11-02 21:40:11.226131','3','jose@email.com',3,'',8,2),(10,'2024-11-02 21:42:06.715280','2','Av. Francisco Glicério, 245, Centro, Campinas - 450162211',3,'',3,2),(11,'2024-11-02 21:44:18.691931','3','Av. Francisco Glicério, 211, Centro, Campinas - 13045-603',3,'',3,2),(12,'2024-11-02 21:44:26.596097','4','joao@email.com',3,'',8,2),(13,'2024-11-03 19:17:45.741608','1','joao@email.com',3,'',10,2),(14,'2024-11-05 12:16:11.231676','2','Cimento CP II F 32 Todas as Obras 50kg Votoran',3,'',5,2),(15,'2024-11-05 12:16:11.231922','1','Cimento CP II F 32 Todas as Obras 50kg Votoran',3,'',5,2),(16,'2024-11-05 12:16:24.903982','3','Cimento',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',5,2),(17,'2024-11-05 16:15:16.385906','3','Cimento',3,'',5,2),(18,'2024-11-06 00:50:05.820812','1','Ferramentas e Equipamentos',1,'[{\"added\": {}}]',2,2),(19,'2024-11-06 00:51:49.096952','2','Churrasqueiras e Acessórios',1,'[{\"added\": {}}]',2,2),(20,'2024-11-06 00:53:39.887049','3','Tintas e Acabamentos',1,'[{\"added\": {}}]',2,2),(21,'2024-11-06 00:55:02.011691','4','Tubos e Conexões',1,'[{\"added\": {}}]',2,2),(22,'2024-11-06 00:55:13.787640','5','Coberturas e Telhas',1,'[{\"added\": {}}]',2,2),(23,'2024-11-06 00:56:27.627853','6','Blocos e Tijolos',1,'[{\"added\": {}}]',2,2),(24,'2024-11-06 00:57:44.561470','7','Cimentos e Argamassas',1,'[{\"added\": {}}]',2,2),(25,'2024-11-06 00:59:06.095291','8','Spas e Lazer',1,'[{\"added\": {}}]',2,2),(26,'2024-11-06 00:59:18.524327','9','Portas',1,'[{\"added\": {}}]',2,2),(27,'2024-11-06 00:59:48.175570','10','Janelas',1,'[{\"added\": {}}]',2,2),(28,'2024-11-06 01:00:00.723821','11','Pisos e Revestimentos',1,'[{\"added\": {}}]',2,2),(29,'2024-11-07 01:18:24.629040','2','Leroy Merlin',2,'[{\"changed\": {\"fields\": [\"Nome responsavel\", \"Logo\"]}}]',4,2),(30,'2024-11-07 01:25:16.271453','2','Leroy Merlin',2,'[{\"changed\": {\"fields\": [\"Logo\"]}}]',4,2),(31,'2024-11-07 03:22:24.626337','2','Leroy Merlin',2,'[{\"changed\": {\"fields\": [\"Logo\"]}}]',4,2),(32,'2024-11-08 21:43:31.138885','2','Churrasqueiras e Acessórios',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',2,2),(33,'2024-11-14 19:09:04.639520','1','Primeira compra no app',1,'[{\"added\": {}}]',26,2),(34,'2024-11-14 19:09:41.744647','1','Primeira compra no app',2,'[{\"changed\": {\"fields\": [\"Desconto\"]}}]',26,2),(35,'2024-11-14 19:09:47.357912','1','Primeira compra no app',2,'[]',26,2),(36,'2024-11-14 19:10:11.077257','2','Primeira compra na loja',1,'[{\"added\": {}}]',26,2),(37,'2024-11-14 19:10:50.935295','3','Compra acima de R$ 100',1,'[{\"added\": {}}]',26,2),(38,'2024-11-15 23:44:46.271390','1','20% - Primeira compra no app',2,'[{\"changed\": {\"fields\": [\"Titulo\"]}}]',26,2),(39,'2024-11-15 23:44:55.581088','2','10% - Primeira compra na loja',2,'[{\"changed\": {\"fields\": [\"Titulo\"]}}]',26,2),(40,'2024-11-15 23:45:02.051978','1','15% - Primeira compra no app',2,'[{\"changed\": {\"fields\": [\"Titulo\"]}}]',26,2),(41,'2024-11-15 23:45:11.132313','3','5% - Compra acima de R$ 100',2,'[{\"changed\": {\"fields\": [\"Titulo\"]}}]',26,2),(42,'2024-11-22 14:10:27.271833','2','pvmcastro@gmail.com',2,'[{\"changed\": {\"fields\": [\"Nome\", \"Telefone\", \"Cpf\"]}}]',1,2),(43,'2024-11-25 13:21:51.524179','1','Entrega 1: para pedro@email.com do pedido 2 - preparando o pedido',2,'[{\"changed\": {\"fields\": [\"Taxa de entrega\", \"Is active\"]}}]',28,2),(44,'2024-11-25 13:21:58.440468','2','Entrega 2: para pedro@email.com do pedido 2 - preparando o pedido',2,'[{\"changed\": {\"fields\": [\"Taxa de entrega\", \"Is active\"]}}]',28,2),(45,'2024-11-25 13:22:04.757206','3','Entrega 3: para pedro@email.com do pedido 4 - preparando o pedido',2,'[{\"changed\": {\"fields\": [\"Taxa de entrega\", \"Is active\"]}}]',28,2),(46,'2024-11-25 13:22:10.501978','4','Entrega 4: para pedro@email.com do pedido 5 - preparando o pedido',2,'[{\"changed\": {\"fields\": [\"Taxa de entrega\", \"Is active\"]}}]',28,2),(47,'2024-11-25 13:22:16.351642','6','Entrega 6: para pvmcastro@gmail.com do pedido 20 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(48,'2024-11-25 13:22:26.671818','7','Entrega 7: para pvmcastro@gmail.com do pedido 21 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(49,'2024-11-25 13:22:31.957582','8','Entrega 8: para pvmcastro@gmail.com do pedido 22 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(50,'2024-11-25 13:22:42.821126','10','Entrega 10: para pvmcastro@gmail.com do pedido 23 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(51,'2024-11-25 13:22:51.915107','12','Entrega 12: para pvmcastro@gmail.com do pedido 24 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(52,'2024-11-25 13:22:56.315769','13','Entrega 13: para pvmcastro@gmail.com do pedido 25 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(53,'2024-11-25 13:23:03.297309','15','Entrega 15: para pvmcastro@gmail.com do pedido 26 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(54,'2024-11-25 13:23:10.363738','17','Entrega 17: para pvmcastro@gmail.com do pedido 27 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(55,'2024-11-25 13:23:14.318221','18','Entrega 18: para pvmcastro@gmail.com do pedido 28 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(56,'2024-11-25 13:23:24.426854','19','Entrega 19: para pvmcastro@gmail.com do pedido 28 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(57,'2024-11-25 13:23:30.097487','20','Entrega 20: para pvmcastro@gmail.com do pedido 29 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(58,'2024-11-25 13:23:36.826119','22','Entrega 22: para pvmcastro@gmail.com do pedido 30 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(59,'2024-11-25 13:23:45.334493','24','Entrega 24: para pvmcastro@gmail.com do pedido 31 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(60,'2024-11-25 13:23:49.148112','25','Entrega 25: para pvmcastro@gmail.com do pedido 32 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(61,'2024-11-25 13:23:52.189316','26','Entrega 26: para pvmcastro@gmail.com do pedido 32 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(62,'2024-11-25 13:23:55.397666','27','Entrega 27: para pvmcastro@gmail.com do pedido 32 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(63,'2024-11-25 13:23:59.069847','28','Entrega 28: para pvmcastro@gmail.com do pedido 33 - aguardando confirmação da loja',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',28,2),(64,'2024-11-25 13:24:03.759912','29','Entrega 29: para pvmcastro@gmail.com do pedido 33 - aguardando confirmação da loja',2,'[]',28,2),(65,'2024-12-01 19:53:43.757377','8','Abacateiro',3,'',4,2),(66,'2024-12-01 19:54:02.947233','7','Janaina Construção',3,'',4,2),(67,'2024-12-02 14:22:25.080020','2','Usuário juliocesar@email.com avaliou salomao@email.com com 5 estrelas',3,'',33,2),(68,'2024-12-02 14:23:38.251887','2','Usuário juliocesar@email.com avaliou a loja Sodimac com 4 estrelas',3,'',32,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_clockedschedule`
--

LOCK TABLES `django_celery_beat_clockedschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_crontabschedule`
--

LOCK TABLES `django_celery_beat_crontabschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_intervalschedule`
--

LOCK TABLES `django_celery_beat_intervalschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictask`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `headers` longtext NOT NULL DEFAULT (_utf8mb3'{}'),
  `clocked_id` int DEFAULT NULL,
  `expire_seconds` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`),
  CONSTRAINT `django_celery_beat_periodictask_chk_1` CHECK ((`total_run_count` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_2` CHECK ((`priority` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_3` CHECK ((`expire_seconds` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictask`
--

LOCK TABLES `django_celery_beat_periodictask` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictasks`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictasks`
--

LOCK TABLES `django_celery_beat_periodictasks` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_solarschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_solarschedule`
--

LOCK TABLES `django_celery_beat_solarschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'admin','logentry'),(13,'auth','group'),(12,'auth','permission'),(14,'contenttypes','contenttype'),(24,'django_celery_beat','clockedschedule'),(19,'django_celery_beat','crontabschedule'),(20,'django_celery_beat','intervalschedule'),(21,'django_celery_beat','periodictask'),(22,'django_celery_beat','periodictasks'),(23,'django_celery_beat','solarschedule'),(6,'ecommerce','avaliacao'),(32,'ecommerce','avaliacaoloja'),(33,'ecommerce','avaliacaomotorista'),(16,'ecommerce','carrinho'),(2,'ecommerce','categoria'),(26,'ecommerce','cupom'),(3,'ecommerce','endereco'),(18,'ecommerce','itemcarrinho'),(17,'ecommerce','itenscarrinho'),(4,'ecommerce','loja'),(27,'ecommerce','pedido'),(5,'ecommerce','produto'),(25,'ecommerce','selecaoenderecousuario'),(1,'ecommerce','usuariocomum'),(7,'ecommerce','wishlist'),(8,'empresarial','lojista'),(9,'empresarial','plano'),(34,'empresarial','respostalojista'),(28,'entregas','entrega'),(29,'entregas','entregaagendada'),(31,'entregas','entregacanceladapelomotorista'),(30,'entregas','entregarecusada'),(10,'entregas','motorista'),(15,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'empresarial','0001_initial','2024-11-02 01:52:36.144235'),(2,'ecommerce','0001_initial','2024-11-02 01:52:38.714086'),(3,'contenttypes','0001_initial','2024-11-02 01:52:38.796432'),(4,'admin','0001_initial','2024-11-02 01:52:39.132104'),(5,'admin','0002_logentry_remove_auto_add','2024-11-02 01:52:39.150219'),(6,'admin','0003_logentry_add_action_flag_choices','2024-11-02 01:52:39.178161'),(7,'contenttypes','0002_remove_content_type_name','2024-11-02 01:52:39.318551'),(8,'auth','0001_initial','2024-11-02 01:52:39.894242'),(9,'auth','0002_alter_permission_name_max_length','2024-11-02 01:52:40.013975'),(10,'auth','0003_alter_user_email_max_length','2024-11-02 01:52:40.029936'),(11,'auth','0004_alter_user_username_opts','2024-11-02 01:52:40.041616'),(12,'auth','0005_alter_user_last_login_null','2024-11-02 01:52:40.065203'),(13,'auth','0006_require_contenttypes_0002','2024-11-02 01:52:40.073943'),(14,'auth','0007_alter_validators_add_error_messages','2024-11-02 01:52:40.095856'),(15,'auth','0008_alter_user_username_max_length','2024-11-02 01:52:40.116690'),(16,'auth','0009_alter_user_last_name_max_length','2024-11-02 01:52:40.140467'),(17,'auth','0010_alter_group_name_max_length','2024-11-02 01:52:40.187504'),(18,'auth','0011_update_proxy_permissions','2024-11-02 01:52:40.225639'),(19,'auth','0012_alter_user_first_name_max_length','2024-11-02 01:52:40.245392'),(20,'entregas','0001_initial','2024-11-02 01:52:40.326677'),(21,'sessions','0001_initial','2024-11-02 01:52:40.387509'),(22,'ecommerce','0002_usuariocomum_is_staff_usuariocomum_is_superuser','2024-11-02 03:49:55.320814'),(23,'ecommerce','0003_remove_endereco_usuarios','2024-11-05 13:07:58.520384'),(24,'empresarial','0002_lojista_is_staff_lojista_is_superuser','2024-11-05 13:07:58.647812'),(25,'entregas','0002_motorista_is_staff_motorista_is_superuser','2024-11-05 13:07:58.730478'),(26,'ecommerce','0004_loja_pedido_minimo','2024-11-06 13:52:44.846274'),(27,'ecommerce','0005_carrinho_itenscarrinho','2024-11-08 01:05:51.235940'),(28,'ecommerce','0006_produto_altura_produto_comprimento_produto_estoque_and_more','2024-11-10 00:17:06.975164'),(29,'django_celery_beat','0001_initial','2024-11-11 23:08:32.985981'),(30,'django_celery_beat','0002_auto_20161118_0346','2024-11-11 23:08:33.388656'),(31,'django_celery_beat','0003_auto_20161209_0049','2024-11-11 23:08:33.508004'),(32,'django_celery_beat','0004_auto_20170221_0000','2024-11-11 23:08:33.523505'),(33,'django_celery_beat','0005_add_solarschedule_events_choices','2024-11-11 23:08:33.540582'),(34,'django_celery_beat','0006_auto_20180322_0932','2024-11-11 23:08:33.732014'),(35,'django_celery_beat','0007_auto_20180521_0826','2024-11-11 23:08:33.851471'),(36,'django_celery_beat','0008_auto_20180914_1922','2024-11-11 23:08:33.913020'),(37,'django_celery_beat','0006_auto_20180210_1226','2024-11-11 23:08:33.948757'),(38,'django_celery_beat','0006_periodictask_priority','2024-11-11 23:08:34.115053'),(39,'django_celery_beat','0009_periodictask_headers','2024-11-11 23:08:34.392778'),(40,'django_celery_beat','0010_auto_20190429_0326','2024-11-11 23:08:34.676123'),(41,'django_celery_beat','0011_auto_20190508_0153','2024-11-11 23:08:34.862659'),(42,'django_celery_beat','0012_periodictask_expire_seconds','2024-11-11 23:08:35.032409'),(43,'django_celery_beat','0013_auto_20200609_0727','2024-11-11 23:08:35.071428'),(44,'django_celery_beat','0014_remove_clockedschedule_enabled','2024-11-11 23:08:35.115362'),(45,'django_celery_beat','0015_edit_solarschedule_events_choices','2024-11-11 23:08:35.123269'),(46,'django_celery_beat','0016_alter_crontabschedule_timezone','2024-11-11 23:08:35.143782'),(47,'django_celery_beat','0017_alter_crontabschedule_month_of_year','2024-11-11 23:08:35.162156'),(48,'django_celery_beat','0018_improve_crontab_helptext','2024-11-11 23:08:35.179119'),(49,'django_celery_beat','0019_alter_periodictasks_options','2024-11-11 23:08:35.185758'),(50,'ecommerce','0007_selecaoenderecousuario','2024-11-12 23:26:03.668866'),(51,'ecommerce','0008_cupom','2024-11-14 19:07:32.572134'),(52,'ecommerce','0009_alter_cupom_desconto_pedido','2024-11-15 21:27:03.104603'),(53,'entregas','0003_entrega_entregaagendada','2024-11-15 21:27:03.876191'),(54,'ecommerce','0010_pedido_cupom','2024-11-15 22:23:35.246017'),(55,'ecommerce','0011_alter_pedido_forma_pagamento','2024-11-15 22:25:51.240134'),(56,'entregas','0004_rename_tipo_entrega_entrega_forma_de_entrega_and_more','2024-11-17 00:04:12.042111'),(57,'ecommerce','0012_alter_pedido_status','2024-11-22 13:36:31.102880'),(58,'entregas','0005_alter_entrega_status','2024-11-22 13:36:31.151792'),(59,'entregas','0006_alter_entrega_forma_de_entrega','2024-11-24 23:14:45.725443'),(60,'entregas','0007_alter_entrega_motorista','2024-11-25 13:20:26.279243'),(61,'entregas','0008_motorista_entregas_aceitas_and_more','2024-11-30 23:28:34.540156'),(62,'entregas','0009_motorista_entregas_canceladas_and_more','2024-12-01 00:20:20.381724'),(63,'entregas','0010_rename_entregas_aceitas_motorista_entregas_realizadas_and_more','2024-12-01 15:40:00.776686'),(64,'ecommerce','0013_alter_pedido_status_avaliacaoloja_avaliacaomotorista','2024-12-01 21:13:30.820596'),(65,'entregas','0011_entrega_avaliou','2024-12-02 22:20:46.367649'),(66,'ecommerce','0014_alter_avaliacaoloja_nota','2024-12-03 11:30:47.235170'),(67,'empresarial','0003_respostalojista','2024-12-03 14:28:58.018833'),(68,'empresarial','0004_alter_respostalojista_avaliacao','2024-12-03 22:26:42.245656');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('hc6ok8jobbp32nkevnn3ryh3srsvrhul','e30:1t7GrU:W2QXAfxUfjlLcEVxLZx9MEawQrs80WQ3QVxNlkTUWVo','2024-11-16 16:20:28.182849'),('rvoenopa767ajccr367vcvg28i6ffdqc','e30:1t74xY:sot74af4hppDL-T9lQxrKOgIeMKN5WUzHrofX8rLc5o','2024-11-16 03:37:56.525528');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_avaliacao`
--

DROP TABLE IF EXISTS `ecommerce_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_avaliacao` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `conteudo` longtext NOT NULL,
  `nota` int NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `recomenda` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  `produto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_avaliacao_user_id_05b74083_fk_ecommerce` (`user_id`),
  KEY `ecommerce_avaliacao_produto_id_833f8d1a_fk_ecommerce_produto_id` (`produto_id`),
  CONSTRAINT `ecommerce_avaliacao_produto_id_833f8d1a_fk_ecommerce_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `ecommerce_produto` (`id`),
  CONSTRAINT `ecommerce_avaliacao_user_id_05b74083_fk_ecommerce` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_usuariocomum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_avaliacao`
--

LOCK TABLES `ecommerce_avaliacao` WRITE;
/*!40000 ALTER TABLE `ecommerce_avaliacao` DISABLE KEYS */;
INSERT INTO `ecommerce_avaliacao` VALUES (2,'Material Excelente','Uso há muitos anos esse cimento em minhas obras',5,'2024-12-03 12:21:26.384711',1,1,7),
(4,'Muito boa','Vale a pena',5,'2024-12-03 12:46:47.920344',1,1,6),(5,'Passei o fds nela','só coisa boa',4,'2024-12-03 13:07:35.075342',1,1,16),
(6,'Muito boa para churrascos','Chamei a turma e foi só resenha',5,'2024-12-04 14:34:48.219683',1,1,22),
(7,'Caguei confortavelmente','Não pensem duas vezes antes de comprar',3,'2024-12-04 15:11:48.320427',1,1,28),
(8,'Caixa dagua boa pra caramba meu','Eu e minha familia usamos de piscina nos fins de semana',4,'2024-12-04 15:40:45.356262',1,1,18),
(9,'Cumpre o que promete','Boa de serviço',2,'2024-12-04 16:37:34.208445',1,1,23);
/*!40000 ALTER TABLE `ecommerce_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_avaliacaoloja`
--

DROP TABLE IF EXISTS `ecommerce_avaliacaoloja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_avaliacaoloja` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nota` int NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `loja_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_avaliacaoloja_loja_id_b1ab27c2_fk_ecommerce_loja_id` (`loja_id`),
  KEY `ecommerce_avaliacaol_user_id_91436835_fk_ecommerce` (`user_id`),
  CONSTRAINT `ecommerce_avaliacaol_user_id_91436835_fk_ecommerce` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_usuariocomum` (`id`),
  CONSTRAINT `ecommerce_avaliacaoloja_loja_id_b1ab27c2_fk_ecommerce_loja_id` FOREIGN KEY (`loja_id`) REFERENCES `ecommerce_loja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_avaliacaoloja`
--

LOCK TABLES `ecommerce_avaliacaoloja` WRITE;
/*!40000 ALTER TABLE `ecommerce_avaliacaoloja` DISABLE KEYS */;
INSERT INTO `ecommerce_avaliacaoloja` VALUES (1,4,'2024-12-01 21:19:05.785993',3,4),(3,4,'2024-12-02 14:28:58.543159',3,1),(4,4,'2024-12-02 22:16:24.160837',2,1),(5,5,'2024-12-02 22:38:48.905644',1,1),(6,4,'2024-12-04 14:40:18.408760',3,1),(7,3,'2024-12-04 14:40:27.437215',2,1),(8,4,'2024-12-04 14:46:08.218557',2,1);
/*!40000 ALTER TABLE `ecommerce_avaliacaoloja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_avaliacaomotorista`
--

DROP TABLE IF EXISTS `ecommerce_avaliacaomotorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_avaliacaomotorista` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nota` int NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `motorista_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_avaliacaom_motorista_id_19fd873b_fk_entregas_` (`motorista_id`),
  KEY `ecommerce_avaliacaom_user_id_1c9ba65a_fk_ecommerce` (`user_id`),
  CONSTRAINT `ecommerce_avaliacaom_motorista_id_19fd873b_fk_entregas_` FOREIGN KEY (`motorista_id`) REFERENCES `entregas_motorista` (`id`),
  CONSTRAINT `ecommerce_avaliacaom_user_id_1c9ba65a_fk_ecommerce` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_usuariocomum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_avaliacaomotorista`
--

LOCK TABLES `ecommerce_avaliacaomotorista` WRITE;
/*!40000 ALTER TABLE `ecommerce_avaliacaomotorista` DISABLE KEYS */;
INSERT INTO `ecommerce_avaliacaomotorista` VALUES (1,5,'2024-12-01 21:19:05.773816',8,4),(3,4,'2024-12-02 14:28:58.526961',8,1),(4,5,'2024-12-02 22:16:24.143713',8,1),(5,5,'2024-12-02 22:38:48.883198',8,1),(6,5,'2024-12-04 14:40:18.387172',8,1),(7,5,'2024-12-04 14:40:27.415563',8,1),(8,5,'2024-12-04 14:46:08.199388',5,1);
/*!40000 ALTER TABLE `ecommerce_avaliacaomotorista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_carrinho`
--

DROP TABLE IF EXISTS `ecommerce_carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_carrinho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `datetime` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_carrinho_user_id_f00330cb_fk_ecommerce_usuariocomum_id` (`user_id`),
  CONSTRAINT `ecommerce_carrinho_user_id_f00330cb_fk_ecommerce_usuariocomum_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_usuariocomum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_carrinho`
--

LOCK TABLES `ecommerce_carrinho` WRITE;
/*!40000 ALTER TABLE `ecommerce_carrinho` DISABLE KEYS */;
INSERT INTO `ecommerce_carrinho` VALUES (1,'2024-11-08 02:03:16.830271','finalizado',0,1),(2,'2024-11-08 21:44:00.513134','abandonado',0,2),(3,'2024-11-11 23:36:12.324912','abandonado',0,2),(4,'2024-11-11 23:36:26.190782','finalizado',0,2),(5,'2024-11-12 23:36:18.864257','finalizado',0,2),(6,'2024-11-12 23:40:33.800543','finalizado',0,1),(7,'2024-11-12 23:43:02.336432','finalizado',0,1),(8,'2024-11-13 02:32:47.947901','finalizado',0,1),(9,'2024-11-13 02:35:35.999990','finalizado',0,1),(10,'2024-11-13 02:38:38.720134','finalizado',0,1),(11,'2024-11-13 02:47:46.059340','finalizado',0,1),(12,'2024-11-13 22:14:41.949278','finalizado',0,1),(13,'2024-11-13 22:20:03.908620','finalizado',0,1),(14,'2024-11-13 22:28:51.149187','finalizado',0,1),(15,'2024-11-14 16:48:47.835139','finalizado',0,1),(16,'2024-11-14 17:20:58.469392','finalizado',0,1),(17,'2024-11-14 17:26:41.513881','finalizado',0,1),(18,'2024-11-14 17:29:09.257678','finalizado',0,1),(19,'2024-11-14 17:31:55.925147','finalizado',0,1),(20,'2024-11-14 17:34:07.516375','finalizado',0,1),(21,'2024-11-14 17:40:24.795190','finalizado',0,1),(22,'2024-11-14 17:41:24.226923','finalizado',0,1),(23,'2024-11-14 17:48:51.479873','finalizado',0,1),(24,'2024-11-14 17:51:13.523429','finalizado',0,1),(25,'2024-11-14 17:53:30.302186','finalizado',0,1),(26,'2024-11-14 17:54:02.882161','finalizado',0,1),(27,'2024-11-14 18:07:19.407813','finalizado',0,2),(28,'2024-11-14 18:08:58.207374','finalizado',0,2),(29,'2024-11-14 18:09:43.890459','finalizado',0,1),(30,'2024-11-14 18:18:44.405189','finalizado',0,1),(31,'2024-11-14 18:22:36.646329','finalizado',0,1),(32,'2024-11-14 18:24:18.010020','finalizado',0,1),(33,'2024-11-14 18:26:13.775668','finalizado',0,1),(34,'2024-11-14 18:35:40.484544','finalizado',0,1),(35,'2024-11-14 18:45:45.992552','finalizado',0,1),(36,'2024-11-14 18:50:56.156165','finalizado',0,1),(37,'2024-11-14 19:51:55.873615','finalizado',0,1),(38,'2024-11-14 19:52:59.960904','finalizado',0,1),(39,'2024-11-14 19:53:41.837597','finalizado',0,1),(40,'2024-11-14 22:00:12.032156','finalizado',0,1),(41,'2024-11-14 22:04:23.702327','finalizado',0,1),(42,'2024-11-14 22:08:11.453758','finalizado',0,1),(43,'2024-11-14 22:19:00.476311','finalizado',0,1),(44,'2024-11-14 22:38:24.403959','finalizado',0,1),(45,'2024-11-15 21:27:46.304979','finalizado',0,1),(46,'2024-11-15 21:28:00.617399','finalizado',0,1),(47,'2024-11-15 22:22:21.399264','finalizado',0,1),(48,'2024-11-15 22:23:46.644796','finalizado',0,1),(49,'2024-11-15 22:25:14.805421','finalizado',0,1),(50,'2024-11-15 22:26:05.070623','finalizado',0,1),(51,'2024-11-15 22:47:16.622836','finalizado',0,1),(52,'2024-11-15 22:48:20.431937','finalizado',0,1),(53,'2024-11-15 22:50:11.964350','finalizado',0,1),(54,'2024-11-15 22:50:45.784113','finalizado',0,1),(55,'2024-11-15 22:51:44.116798','finalizado',0,1),(56,'2024-11-15 22:54:53.846091','finalizado',0,1),(57,'2024-11-15 23:05:38.665510','finalizado',0,1),(58,'2024-11-15 23:09:00.045748','finalizado',0,1),(59,'2024-11-15 23:37:55.268093','abandonado',0,1),(60,'2024-11-21 14:28:53.263235','abandonado',0,1),(61,'2024-11-21 14:31:02.707312','abandonado',0,1),(62,'2024-11-21 14:37:27.120145','abandonado',0,1),(63,'2024-11-21 23:37:57.961774','abandonado',0,1),(64,'2024-11-21 23:50:56.646724','abandonado',0,1),(65,'2024-11-22 13:36:52.067771','finalizado',0,1),(66,'2024-11-22 14:02:18.793224','finalizado',0,2),(67,'2024-11-22 14:06:34.879727','finalizado',0,2),(68,'2024-11-24 21:34:43.414369','finalizado',0,2),(69,'2024-11-24 21:38:26.683217','abandonado',0,2),(70,'2024-11-24 21:57:16.244412','finalizado',0,2),(71,'2024-11-24 22:01:31.282873','abandonado',0,2),(72,'2024-11-24 22:12:39.502745','abandonado',0,2),(73,'2024-11-24 22:15:22.420575','abandonado',0,2),(74,'2024-11-24 22:25:52.388218','finalizado',0,2),(75,'2024-11-24 22:34:47.234321','abandonado',0,2),(76,'2024-11-24 23:06:29.259713','abandonado',0,2),(77,'2024-11-24 23:12:11.264159','finalizado',0,2),(78,'2024-11-24 23:13:33.051248','finalizado',0,2),(79,'2024-11-24 23:14:56.602017','finalizado',0,2),(80,'2024-11-24 23:16:07.136195','abandonado',0,2),(81,'2024-11-24 23:16:54.332536','abandonado',0,2),(82,'2024-11-24 23:17:40.959893','finalizado',0,2),(83,'2024-11-24 23:19:00.863003','abandonado',0,2),(84,'2024-11-24 23:28:04.168921','finalizado',0,2),(85,'2024-11-24 23:56:29.971270','abandonado',0,2),(86,'2024-11-25 00:25:24.511219','abandonado',0,2),(87,'2024-11-25 00:34:02.014970','finalizado',0,2),(88,'2024-11-25 00:47:14.139401','finalizado',0,2),(89,'2024-11-25 00:50:17.704783','abandonado',0,2),(90,'2024-11-25 12:51:19.902210','finalizado',0,2),(91,'2024-11-25 18:31:43.833498','abandonado',0,2),(92,'2024-11-25 18:31:58.273021','finalizado',0,2),(93,'2024-11-25 18:34:41.649418','finalizado',0,2),(94,'2024-11-25 18:36:31.781438','finalizado',0,2),(95,'2024-11-25 18:37:51.250558','finalizado',0,2),(96,'2024-11-25 18:39:06.658177','finalizado',0,2),(97,'2024-11-25 18:40:29.475698','finalizado',0,2),(98,'2024-11-25 18:41:29.876222','finalizado',0,2),(99,'2024-11-25 19:17:58.355117','finalizado',0,2),(100,'2024-11-25 19:25:28.204179','finalizado',0,1),(101,'2024-11-26 10:12:29.368207','finalizado',0,1),(102,'2024-11-26 10:24:16.733970','finalizado',0,1),(103,'2024-11-26 11:27:53.659363','finalizado',0,1),(104,'2024-11-26 11:32:49.599064','finalizado',0,1),(105,'2024-11-26 11:49:47.595782','finalizado',0,1),(106,'2024-11-26 12:16:19.894224','finalizado',0,1),(107,'2024-11-26 14:07:18.698055','finalizado',0,1),(108,'2024-12-01 19:25:58.488981','finalizado',0,4),(109,'2024-12-01 19:43:29.517123','finalizado',0,4),(110,'2024-12-01 19:47:35.591305','finalizado',0,4),(111,'2024-12-01 19:54:30.951845','em andamento',1,4),(112,'2024-12-02 14:25:12.132961','finalizado',0,1),(113,'2024-12-02 22:06:27.575170','finalizado',0,1),(114,'2024-12-03 14:04:20.094331','abandonado',0,1),(115,'2024-12-04 14:35:34.083337','finalizado',0,1),(116,'2024-12-04 15:39:00.912154','finalizado',0,1),(117,'2024-12-04 16:38:12.164181','finalizado',0,1);
/*!40000 ALTER TABLE `ecommerce_carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_categoria`
--

DROP TABLE IF EXISTS `ecommerce_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_categoria`
--

LOCK TABLES `ecommerce_categoria` WRITE;
/*!40000 ALTER TABLE `ecommerce_categoria` DISABLE KEYS */;
INSERT INTO `ecommerce_categoria` VALUES (1,'Ferramentas e Equipamentos','categorias/Categoria000001.jpg'),(2,'Churrasqueiras e Acessórios','categorias/Categoria000002.jpeg'),(3,'Tintas e Acabamentos','categorias/Categoria000003.jpg'),(4,'Tubos e Conexões','categorias/Categoria000004.jpg'),(5,'Coberturas e Telhas','categorias/Categoria000005.jpg'),(6,'Blocos e Tijolos','categorias/Categoria000006.png'),(7,'Cimentos e Argamassas','categorias/Categoria000007.jpg'),(8,'Spas e Lazer','categorias/Categoria000008.png'),(9,'Portas','categorias/Categoria000009.jpg'),(10,'Janelas','categorias/Categoria000010.png'),(11,'Pisos e Revestimentos','categorias/Categoria000011.jpg');
/*!40000 ALTER TABLE `ecommerce_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_cupom`
--

DROP TABLE IF EXISTS `ecommerce_cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_cupom` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(40) NOT NULL,
  `desconto` decimal(3,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_cupom`
--

LOCK TABLES `ecommerce_cupom` WRITE;
/*!40000 ALTER TABLE `ecommerce_cupom` DISABLE KEYS */;
INSERT INTO `ecommerce_cupom` VALUES (1,'15% - Primeira compra no app',0.15),(2,'10% - Primeira compra na loja',0.10),(3,'5% - Compra acima de R$ 100',0.05);
/*!40000 ALTER TABLE `ecommerce_cupom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_endereco`
--

DROP TABLE IF EXISTS `ecommerce_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_endereco` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cep` varchar(15) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` int DEFAULT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_endereco`
--

LOCK TABLES `ecommerce_endereco` WRITE;
/*!40000 ALTER TABLE `ecommerce_endereco` DISABLE KEYS */;
INSERT INTO `ecommerce_endereco` VALUES (4,'13045-603','Av. Francisco Glicério',231,'Centro','Campinas','SP'),(5,'121351431','Av. Dr. Moraes Sales',244,'Centro','Campinas','SP'),(6,'1290801928','Av. Brasil',222,'Centro','Porto Alegre','RS'),(7,'13056471','Av. Francisco Glicério',99,'Centro','Campinas','SP'),(8,'1923801','Av. do Contorno',101,'Barão Geraldo','Campinas','SP'),(9,'asdfa','asdfas',12,'asdfa','asdfas','sd'),(10,'1238982','Rua do Campinho',101,'Campinho','Porto Seguro','BA'),(11,'1023809128','Rua do Gengibre',101,'Centro','Chapecó','SC'),(12,'1029381278','Rua Nossa Senhora de Fátima',233,'Taquaral','Campinas','SP'),(13,'12038109','Rua Luzitana',122,'Centro','Campinas','SP'),(14,'10298309182','Rua 14 de maio',1234,'Centro','Campinas','SP'),(15,'18273912983','Rua da Alegria',98,'Felicidade','Pouse Alegre','MG');
/*!40000 ALTER TABLE `ecommerce_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_itemcarrinho`
--

DROP TABLE IF EXISTS `ecommerce_itemcarrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_itemcarrinho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `carrinho_id` bigint NOT NULL,
  `produto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_itemcarrin_carrinho_id_aaca40b1_fk_ecommerce` (`carrinho_id`),
  KEY `ecommerce_itemcarrin_produto_id_35f3f2b6_fk_ecommerce` (`produto_id`),
  CONSTRAINT `ecommerce_itemcarrin_carrinho_id_aaca40b1_fk_ecommerce` FOREIGN KEY (`carrinho_id`) REFERENCES `ecommerce_carrinho` (`id`),
  CONSTRAINT `ecommerce_itemcarrin_produto_id_35f3f2b6_fk_ecommerce` FOREIGN KEY (`produto_id`) REFERENCES `ecommerce_produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_itemcarrinho`
--

LOCK TABLES `ecommerce_itemcarrinho` WRITE;
/*!40000 ALTER TABLE `ecommerce_itemcarrinho` DISABLE KEYS */;
INSERT INTO `ecommerce_itemcarrinho` VALUES (1,1,2,5),(2,1,2,6),(3,1,2,16),(6,5,1,5),(7,1,1,6),(9,1,3,5),(10,1,3,6),(11,2,3,7),(12,1,4,16),(13,1,4,6),(14,1,4,5),(15,1,6,5),(16,1,6,16),(17,1,7,5),(18,2,8,5),(19,1,8,16),(20,1,8,6),(21,1,9,5),(22,1,9,6),(23,1,9,14),(24,1,9,16),(25,1,10,5),(26,1,11,5),(27,1,12,5),(28,1,12,6),(29,1,13,5),(30,1,13,6),(31,1,14,5),(32,1,14,6),(33,1,15,6),(34,1,15,5),(35,1,16,5),(36,1,17,5),(37,1,18,5),(38,1,18,6),(39,1,19,5),(40,1,19,6),(41,1,20,5),(42,1,21,5),(43,1,21,6),(44,1,22,5),(45,1,23,5),(46,1,23,8),(47,1,23,10),(48,1,24,8),(49,1,25,6),(50,1,26,6),(51,1,5,6),(52,1,27,6),(53,1,28,6),(54,1,29,6),(55,1,30,6),(56,1,31,6),(57,1,32,6),(58,1,33,6),(59,1,34,5),(60,1,34,6),(61,2,34,15),(62,1,35,6),(63,4,35,8),(64,1,36,6),(65,1,37,6),(66,1,38,6),(67,1,39,6),(68,1,40,6),(69,1,41,6),(70,1,42,6),(71,1,43,6),(72,2,44,6),(73,1,44,8),(74,1,45,6),(75,1,46,7),(76,1,47,10),(77,2,47,14),(78,1,48,9),(79,5,48,12),(80,1,49,6),(81,1,49,5),(82,1,50,5),(83,1,50,6),(84,1,51,5),(85,2,51,7),(86,4,52,5),(87,1,53,5),(88,1,54,5),(89,1,55,5),(90,4,56,5),(91,1,56,6),(92,1,56,16),(93,1,57,6),(94,1,57,5),(95,1,58,5),(104,1,59,5),(107,1,60,21),(108,1,60,5),(109,1,60,27),(110,1,61,21),(113,1,62,5),(114,2,62,19),(115,1,62,26),(116,1,62,23),(117,1,62,18),(118,1,62,14),(119,1,62,10),(120,3,63,5),(121,1,64,23),(122,1,65,5),(123,1,66,5),(124,1,67,8),(125,1,67,7),(126,1,68,24),(127,1,69,16),(128,1,70,5),(129,1,71,5),(130,1,72,5),(131,1,73,5),(132,1,74,18),(133,1,75,5),(134,1,76,5),(135,1,77,5),(136,1,78,22),(137,1,79,6),(138,1,80,6),(139,1,81,8),(140,1,82,15),(141,1,83,7),(142,1,84,5),(143,1,85,11),(144,1,85,12),(145,1,85,5),(146,1,85,18),(147,1,86,10),(148,1,86,5),(149,1,87,5),(150,1,88,23),(151,1,89,25),(152,1,89,11),(153,3,89,17),(154,1,89,26),(155,1,89,22),(156,1,89,16),(157,2,90,5),(158,1,90,23),(159,1,90,16),(160,1,91,21),(161,1,92,6),(162,1,93,6),(163,1,94,6),(164,1,95,18),(165,1,96,19),(166,1,97,20),(167,1,98,7),(168,1,99,5),(169,2,100,5),(170,1,101,25),(171,1,101,6),(172,2,101,5),(173,4,101,20),(174,1,101,19),(175,1,101,18),(176,1,102,8),(177,1,102,18),(178,1,103,26),(179,1,103,10),(180,1,104,16),(181,1,104,5),(182,2,105,22),(183,1,105,6),(184,1,105,5),(185,4,106,14),(186,1,106,5),(187,1,106,18),(188,1,106,16),(189,2,106,27),(190,2,107,5),(191,1,107,9),(192,2,108,6),(193,1,109,5),(194,2,109,7),(195,1,110,18),(196,1,110,5),(197,20,112,17),(198,1,113,23),(199,1,113,6),(200,1,113,21),(201,1,114,18),(202,1,114,6),(203,1,115,22),(204,3,115,5),(205,1,115,23),(207,1,116,21),(208,2,117,28);
/*!40000 ALTER TABLE `ecommerce_itemcarrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_loja`
--

DROP TABLE IF EXISTS `ecommerce_loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_loja` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `nome_responsavel` varchar(100) NOT NULL,
  `cpf_responsavel` varchar(15) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `nota` decimal(3,2) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `endereco_id` bigint NOT NULL,
  `lojista_id` bigint DEFAULT NULL,
  `plano_id` bigint DEFAULT NULL,
  `pedido_minimo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_loja_endereco_id_fcda9550_fk_ecommerce_endereco_id` (`endereco_id`),
  KEY `ecommerce_loja_lojista_id_286e0157_fk_empresarial_lojista_id` (`lojista_id`),
  KEY `ecommerce_loja_plano_id_90a55971_fk_empresarial_plano_id` (`plano_id`),
  CONSTRAINT `ecommerce_loja_endereco_id_fcda9550_fk_ecommerce_endereco_id` FOREIGN KEY (`endereco_id`) REFERENCES `ecommerce_endereco` (`id`),
  CONSTRAINT `ecommerce_loja_lojista_id_286e0157_fk_empresarial_lojista_id` FOREIGN KEY (`lojista_id`) REFERENCES `empresarial_lojista` (`id`),
  CONSTRAINT `ecommerce_loja_plano_id_90a55971_fk_empresarial_plano_id` FOREIGN KEY (`plano_id`) REFERENCES `empresarial_plano` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_loja`
--

LOCK TABLES `ecommerce_loja` WRITE;
/*!40000 ALTER TABLE `ecommerce_loja` DISABLE KEYS */;
INSERT INTO `ecommerce_loja` VALUES (1,'TelhaNorte','Mariano da Silva Ferraz','12345432212','12345678901234','19998876767',5.00,'lojas/Loja000001.png',4,5,1,20.00),(2,'Leroy Merlin','Julia','1932912083','102394801923','0198309122',3.67,'lojas/Loja000002.png',5,6,1,50.00),(3,'Sodimac','Jalim Rabei Souza','2193871123','912873917293191','0129830192',4.00,'lojas/Loja000003.png',6,7,1,10.00),(4,'Obra Boa','Paulo Osório','12379182729','10928301928390','1927391272',NULL,'',10,8,2,NULL),(5,'Revlux','Marilene Chauí','1231922787319','120938012709','1928379112',NULL,'',11,9,2,NULL),(6,'Nosso Lar','Paulo Osório Pimenta','91823981223','1827318923891','1928193791828',NULL,'',12,10,2,NULL);
/*!40000 ALTER TABLE `ecommerce_loja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_pedido`
--

DROP TABLE IF EXISTS `ecommerce_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `carrinho_id` bigint NOT NULL,
  `endereco_user_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `cupom_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_pedido_carrinho_id_8c7429fc_fk_ecommerce_carrinho_id` (`carrinho_id`),
  KEY `ecommerce_pedido_endereco_user_id_87fcbbf1_fk_ecommerce` (`endereco_user_id`),
  KEY `ecommerce_pedido_user_id_37772138_fk_ecommerce_usuariocomum_id` (`user_id`),
  KEY `ecommerce_pedido_cupom_id_2214fc1c_fk_ecommerce_cupom_id` (`cupom_id`),
  CONSTRAINT `ecommerce_pedido_carrinho_id_8c7429fc_fk_ecommerce_carrinho_id` FOREIGN KEY (`carrinho_id`) REFERENCES `ecommerce_carrinho` (`id`),
  CONSTRAINT `ecommerce_pedido_cupom_id_2214fc1c_fk_ecommerce_cupom_id` FOREIGN KEY (`cupom_id`) REFERENCES `ecommerce_cupom` (`id`),
  CONSTRAINT `ecommerce_pedido_endereco_user_id_87fcbbf1_fk_ecommerce` FOREIGN KEY (`endereco_user_id`) REFERENCES `ecommerce_endereco` (`id`),
  CONSTRAINT `ecommerce_pedido_user_id_37772138_fk_ecommerce_usuariocomum_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_usuariocomum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_pedido`
--

LOCK TABLES `ecommerce_pedido` WRITE;
/*!40000 ALTER TABLE `ecommerce_pedido` DISABLE KEYS */;
INSERT INTO `ecommerce_pedido` VALUES (9,130.00,'pix','confirmado',0,'2024-11-22 14:02:32.539053',66,9,2,NULL),(10,63.20,'pix','confirmado',0,'2024-11-22 14:06:53.301662',67,9,2,1),(11,179.40,'pix','confirmado',0,'2024-11-24 21:35:07.987029',68,9,2,NULL),(12,3499.00,NULL,'em andamento',0,'2024-11-24 21:38:30.723489',69,9,2,NULL),(13,130.00,'pix','confirmado',0,'2024-11-24 21:57:34.507901',70,9,2,NULL),(14,100.00,NULL,'em andamento',0,'2024-11-24 22:02:35.087181',71,9,2,NULL),(15,100.00,NULL,'em andamento',0,'2024-11-24 22:12:44.725041',72,9,2,NULL),(16,85.00,NULL,'em andamento',0,'2024-11-24 22:15:26.301391',73,9,2,1),(17,430.08,'pix','confirmado',0,'2024-11-24 22:25:56.679861',74,9,2,NULL),(18,100.00,NULL,'em andamento',0,'2024-11-24 22:34:56.310170',75,9,2,NULL),(19,100.00,NULL,'em andamento',0,'2024-11-24 23:06:34.517831',76,9,2,NULL),(20,130.00,'pix','confirmado',0,'2024-11-24 23:12:14.435334',77,9,2,NULL),(21,2315.56,'pix','confirmado',0,'2024-11-24 23:13:40.527980',78,9,2,NULL),(22,1280.00,'credito','confirmado',0,'2024-11-24 23:15:02.301917',79,9,2,NULL),(23,1020.00,NULL,'em andamento',0,'2024-11-24 23:16:16.733464',80,9,2,1),(24,0.69,NULL,'em andamento',0,'2024-11-24 23:16:58.003369',81,9,2,NULL),(25,176.40,'credito','confirmado',0,'2024-11-24 23:17:50.801812',82,9,2,NULL),(26,31.90,NULL,'em andamento',0,'2024-11-24 23:19:08.286172',83,9,2,NULL),(27,130.00,'credito','confirmado',0,'2024-11-24 23:28:08.687233',84,9,2,NULL),(28,558.06,NULL,'em andamento',0,'2024-11-24 23:56:37.453165',85,9,2,NULL),(29,133.90,NULL,'em andamento',0,'2024-11-25 00:25:33.147920',86,9,2,NULL),(30,130.00,'credito','confirmado',0,'2024-11-25 00:34:05.973050',87,9,2,NULL),(31,3792.75,'pix','confirmado',0,'2024-11-25 00:47:22.797944',88,9,2,1),(32,9898.58,NULL,'em andamento',0,'2024-11-25 00:50:43.694142',89,9,2,NULL),(33,7010.90,'pix','confirmado',0,'2024-11-25 12:51:45.801807',90,9,2,1),(34,1200.00,'pix','confirmado',0,'2024-11-25 18:32:02.822361',92,9,2,NULL),(35,1200.00,'pix','confirmado',0,'2024-11-25 18:34:52.079847',93,9,2,NULL),(36,1280.00,'pix','confirmado',0,'2024-11-25 18:36:40.224502',94,9,2,NULL),(37,430.08,'pix','confirmado',0,'2024-11-25 18:37:55.811336',95,9,2,NULL),(38,219.00,'pix','confirmado',0,'2024-11-25 18:39:12.272020',96,9,2,NULL),(39,25.92,'pix','confirmado',0,'2024-11-25 18:40:36.839663',97,9,2,NULL),(40,66.90,'pix','confirmado',0,'2024-11-25 18:41:33.571391',98,9,2,NULL),(41,130.00,'pix','confirmado',0,'2024-11-25 19:18:09.428577',99,9,2,NULL),(50,2550.00,'pix','confirmado',0,'2024-12-01 19:27:28.119048',108,15,4,NULL),(51,243.80,'pix','finalizado',0,'2024-12-01 19:43:57.536400',109,15,4,NULL),(52,483.58,'credito','finalizado',0,'2024-12-01 19:47:53.456374',110,15,4,1),(54,5393.03,'pix','finalizado',0,'2024-12-02 22:07:44.257030',113,7,1,2),(55,6089.81,'credito','confirmado',1,'2024-12-04 14:38:28.472697',115,7,1,1),(56,245.83,'pix','finalizado',0,'2024-12-04 16:24:04.000221',116,8,1,NULL),(57,649.90,'pix','finalizado',0,'2024-12-04 16:38:36.778400',117,8,1,NULL);
/*!40000 ALTER TABLE `ecommerce_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_produto`
--

DROP TABLE IF EXISTS `ecommerce_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_produto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` longtext NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `peso` decimal(10,2) NOT NULL,
  `nota` decimal(3,2) DEFAULT NULL,
  `avaliacoes` int NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `categoria_id` bigint DEFAULT NULL,
  `loja_id` bigint NOT NULL,
  `altura` decimal(10,2) NOT NULL,
  `comprimento` decimal(10,2) NOT NULL,
  `estoque` int NOT NULL,
  `largura` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_produto_categoria_id_821ec574_fk_ecommerce` (`categoria_id`),
  KEY `ecommerce_produto_loja_id_e3aa4055_fk_ecommerce_loja_id` (`loja_id`),
  CONSTRAINT `ecommerce_produto_categoria_id_821ec574_fk_ecommerce` FOREIGN KEY (`categoria_id`) REFERENCES `ecommerce_categoria` (`id`),
  CONSTRAINT `ecommerce_produto_loja_id_e3aa4055_fk_ecommerce_loja_id` FOREIGN KEY (`loja_id`) REFERENCES `ecommerce_loja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_produto`
--

LOCK TABLES `ecommerce_produto` WRITE;
/*!40000 ALTER TABLE `ecommerce_produto` DISABLE KEYS */;
INSERT INTO `ecommerce_produto` VALUES (5,'Carrinho de mão','Bom pra carregar varias fita',100.00,40.00,NULL,0,'produtos/Produto000005.jpg',1,2,0.00,0.00,5,0.00),(6,'Churrasqueira Centaurus a Bafo Carvão 108x112cm Beta II Naterial','pra fazer aquela picanha na brasa',1200.00,140.00,5.00,1,'produtos/Produto000006.jpg',2,2,0.00,0.00,2,0.00),(7,'Cimento CP II F 32 Todas as Obras 50kg Votoran','Na hora de construir ou reformar, um item que não pode faltar é o cimento. É importante um produto de qualidade para não ter problemas futuros na obra. O Cimento CP II F 32 Todas as Obras 50 kg Votoran é ideal para reboco, contrapiso, concreto convencional e laje.',31.90,50.00,5.00,1,'produtos/Produto000007.jpg',7,2,0.00,0.00,2000,0.00),(8,'Tijolo Comum Vermelho 8,7x4,3x18,6cm Bauth','Os tijolos maciços podem ser utilizados na construção de paredes e se enquadram como alvenaria estrutural. Mas não devem ser usados em pisos. É uma ótima opção também para quem deseja manter um ambiente mais rústico deixando-os à mostra.\r\n\r\nUso Indicado 	Vedação\r\nTonalidade 	Vermelho\r\nUnidade de Venda 	por Unidade\r\nMarca 	Bauth',0.69,1.00,NULL,0,'produtos/Produto000008.jpeg',6,2,4.30,18.60,50000,8.70),(9,'Telha de Fibrocimento Ondulada 244x110cm 5mm Cinza Brasilit','Seus projetos precisam de produtos de qualidade para garantir segurança para sua casa. As telhas de fibrocimento são ideais, pois são resistentes e leves, o que faz com que não necessitem de estrutura reforçada e gera economia e facilidade no transporte e instalação. Produto 	Telha de Fibrocimento\r\nModelo 	Ondulada\r\nTipo 	Ondulada\r\nTipo da Calha 	Onda Alta\r\nMaterial 	Cimento\r\nTipo de Material 	Fibrocimento\r\nCor 	Cinza\r\nLargura 	110,00 cm\r\nComprimento 	2,44 m\r\nEspessura 	5,00 mm\r\nDimensão 	110x244 cm\r\nInclinação 	15 °\r\nCusto do Madeiramento 	Médio\r\nCusto da Manutenção 	Médio\r\nAcompanha Fixação 	Não\r\nQuantidade de Peças de Fixação 	2.5 peça(s)\r\nTipo de Fixação 	Parafuso\r\nPeso do Produto 	32,50 Kg\r\nMarca 	Brasilit\r\nGarantia do Fabricante 	5 ano(s)\r\nObservações sobre a Garantia do Fabricante 	Consulte condições de garantia, manutenção e utilização do produto no manual do fabricante.',48.90,32.50,NULL,0,'produtos/Produto000009.jpg',5,2,0.00,0.00,1500,0.00),(10,'Argamassa Flex ACIII Interno e Externo Cinza 20kg Fortaleza','Este produto é maleável e fácil de trabalhar, sendo ideal para assentar todo tipo de cerâmica, sejam os pisos naturais ou porcelanatos. Pode ser utilizado em local com alto tráfego, fachadas, paredes, piscinas, pisos e saunas. Tipo da Argamassa 	ACIII\r\nArgamassa para 	Assentamento Cerâmico\r\nAmbiente Indicado da Argamassa 	Interno e Externo\r\nUso da Argamassa 	Assentamento em pisos e revestimentos cerâmicos\r\nArgamassa Ideal para Peças até 	140 x 140 cm\r\nUso Indicado 	Assentamento e sopreposição\r\nProduto 	Argamassa\r\nTonalidade 	Cinza\r\nLocal(is) Indicado(s) 	Fachadas, Parede, Piscina, Piso e Sauna\r\nInformações do Rendimento 	Aplicação na base: 8,5 kg/m² e aplicação na base e no verso: 12 kg/m²\r\nRendimento em peças até 30x30cm (camada simples) 	8 Kg/m²\r\nRendimento em peças acima de 30x30cm (camada dupla) 	12 Kg/m²\r\nTempo de Secagem 	24 h\r\nPrazo de Validade na Embalagem 	18 meses\r\nTipo de Embalagem 	Saco\r\nAltura da Embalagem 	14,00 cm\r\nLargura da Embalagem 	34,00 cm\r\nProfundidade da Embalagem 	55,00 cm\r\nPeso do Produto na Embalagem 	20,00 Kg\r\nMarca 	Fortaleza',33.90,20.00,NULL,0,'produtos/Produto000010.jpg',7,2,0.00,0.00,1800,0.00),(11,'Cano PVC para Esgoto 100mm ou 4\" 3m Tigre','O Cano PVC da Marca Tigre de 3m e bitola de 4\" 100mm é a peça que você procura para o seu projeto hidráulico de esgoto. Material altamente resistente, durável e que garante eficiência no escoamento da água sem sofrer danos com facilidade. Uso Indicado 	Esgoto\r\nBitola em Polegadas 	4 \"\r\nBitola em Milímetros 	100 mm\r\nProduto 	Tubo Esgoto 100 Mm 3M\r\nAltura 	115,00 cm\r\nLargura 	115,00 cm\r\nProfundidade 	3,00 cm\r\nComprimento 	3,00 m\r\nDiâmetro 	100,00 cm\r\nEspessura 	1,80 mm\r\nDimensão 	115x115x3 cm\r\nMaterial 	Plástico\r\nTipo de Material 	PVC\r\nNorma Técnica 	NBR 5688\r\nMarca 	Tigre\r\nGarantia do Fabricante 	120 mes(es)\r\nReferência do Produto 	11031005',46.90,2.30,NULL,0,'produtos/Produto000011.jpeg',4,2,0.00,0.00,2500,0.00),(12,'Joelho 90° PVC Marrom Soldável 3/4\" 25mm Tigre','A conexão hidráulica Joelho 90° PVC da Marca Tigre com bitola de 3/4\" ou 25mm é a peça que você procura para o seu projeto hidráulico de água fria ideal. Produzido em PVC (policloreto de vinila), é resistente e durável contra o contato com a água por ser não corrosível. Uso Indicado 	Água Fria\r\nTipo 	Soldável\r\nBitola em Polegadas 	3/4 \"\r\nBitola em Milímetros 	25 mm\r\nProduto 	Joelho 90°\r\nMaterial 	Plástico\r\nTipo de Material 	PVC\r\nCor 	Marrom\r\nTonalidade 	Marrom\r\nNorma Técnica 	NBR 5648\r\nMarca 	Tigre\r\nProduto Acompanha Embalagem 	Não',1.16,0.04,NULL,0,'produtos/Produto000012.jpg',4,2,0.00,0.00,7000,0.00),(14,'Tinta Esmalte Base Água Coralit Acetinado Branco 3,6L Coral','Coralit Total é um esmalte base água de ultra aderência em multisuperfícies, sua fórmula garante um excelente acabamento e alta proteção. Possui uma película brilhante que facilita a limpeza da superfície, oferecendo ótimo rendimento e alto poder de cobertura. Ambiente Indicado 	Interno\r\nComposição Base 	Água\r\nTonalidade 	Branco\r\nAcabamento da Tinta 	Acetinado\r\nLitragem 	3,60 L\r\nSuperfície a ser Aplicada 	Madeira e Metal\r\nRendimento 	75 m²\r\nAcabado ou por demão? 	por Demão\r\nQuantidade de Demão 	2 a 3 demão(s)\r\nNível de Odor 	Sem Odor\r\nDurabilidade em Anos 	Até 10 anos\r\nMarca 	Coral\r\nLinha 	Coralit',139.90,4.70,NULL,0,'produtos/Produto000014.jpg',3,2,0.00,0.00,1150,0.00),(15,'Eletroduto Corrugado 1 \'\' 25Metros Laranja Tigre','Uso Indicado 	Laje ou Teto\r\nDiâmetro do Eletroduto 	1\r\nProduto Acompanha Embalagem 	Sim\r\nMetragem por Embalagem 	25,00 m\r\nMaterial 	Plástico\r\nTipo de Material 	PVC\r\nCor 	Laranja\r\nTonalidade 	Laranja\r\nResistência Mecânica 	Médio\r\nExtremidade 	com Rosca\r\nProduto 	Eletroduto\r\nTipo 	Flexível\r\nMarca 	Tigre\r\nReferência do Produto 	DN-16\r\nAtenção 	Antes de instalar, desligue a energia elétrica.',164.90,3.00,NULL,0,'produtos/Produto000015.jpg',4,2,0.00,0.00,350,0.00),(16,'Spa Inflável 795L com Bomba 220V e 120 Jatos PureSpa Bubbles Intex','Garanta relaxamento e bem-estar na sua casa com este SPA inflável! Ele proporciona uma massagem de bolhas relaxantes, aquece até 40º, é feito com tripla camada de PVC, possui display com multifunções e acompanha capa de proteção.\r\nProduto 	Spa Inflável\r\nCapacidade de Volume 	795,00 L\r\nCapacidade de Pessoas 	4 pessoa(s)\r\nContém Jato Bolhas 	Com Jato Bolhas\r\nQuantidade de Jatos de Ar 	120\r\nModelo 	PureSPA Bubbles\r\nMarca 	Intex\r\nAcompanha Filtro|Bomba 	Sim\r\nMaterial do Filtro|Bomba 	Plástico\r\nTensão Elétrica do Filtro|Bomba 	220V\r\nAquecimento da água 	ºC 40\r\nCapacidade de Filtragem 	1741 L/h\r\nAcompanha Capa 	Com Capa\r\nAcompanha Válvula 	com Válvula\r\nVálvula Acompanha Cesta 	Não\r\nCor 	Bege\r\nMaterial 	Plástico\r\nTipo de Material 	PVC\r\nFormato 	Redondo\r\nÁrea de Uso 	3,00 m²\r\nAltura 	71,00 cm\r\nLargura 	195,00 cm\r\nComprimento 	195,00 cm\r\nDimensão 	71x195x195 cm\r\nMontagem 	Desmontado\r\nTempo Estimado de Montagem 	60 min\r\nInstruções de Montagem 	Acompanha o produto\r\nComplexidade de Montagem 	Média: pode ser montada por mais de uma pessoa leiga\r\nPeso do Produto 	48,00 Kg\r\nGarantia do Fabricante 	12 mes(es)\r\nObservações sobre a Garantia do Fabricante 	Garantia apenas para defeitos de fabricação comprovados e dentro do prazo vigente.',3499.00,48.00,4.00,1,'produtos/Produto000016.jpg',8,2,0.00,0.00,1,0.00),(17,'Bloco Cerâmico Bloquinho 11,5x14x24cm Marrom Nova União','Bloco Cerâmico Bloquinho 11,5x14x24cm Marrom Nova União',0.96,2.00,NULL,0,'produtos/Produto000017.png',6,3,14.00,24.00,5000,11.50),(18,'Caixa De Água 1.000L Polietileno Tampa Encaixe Azul','A Caixa De Água 1.000L Polietileno Tampa Encaixe Azul possui sistema exclusivo de encaixe das tampas, que garante mais vedação e conservação da água. Resistência, flexibilidade, segurança, praticidade, sustentabilidade e tecnologia resume o reservatório. Um produto que é mais forte porque é feito sem emendas e com matéria-prima 100% virgem. Suporta variações climáticas e respeita todas as normas de fabricação exigidas pelo mercado.',410.00,18.81,4.00,1,'produtos/Produto000018.png',NULL,3,97.00,152.00,10,152.00),(19,'Pistola para Pintura Bauker 400W 220V Verde Bauker','A Bauker 400 W Pint Gun é uma ferramenta elétrica básica para quem gosta de manter sua casa impecável com as próprias mãos. Eficiente e muito fácil de usar, este produto ajudará você a maximizar o uso de tinta, que pode ser aplicada a qualquer tipo de superfície. Ele funciona perfeito para pintar grades, móveis, portas, paredes etc, sempre tomando a precaução de limpá-las antes. Também cobre de forma impecável e muito uniforme. Inclui copo medidor de viscosidade, 3 filtros, haste e escova de limpeza. Tem uma capacidade de 700 ml, é de origem alemã e tem uma garantia de 3 meses.',208.00,2.00,NULL,0,'produtos/Produto000019.png',3,3,29.00,32.00,5,13.00),(20,'Trincha para Pintura Acrílica e Látex 1.1/2\" REF-395/4 Marrom','Alguns acessórios fazem toda a diferença durante as obras, permitindo mais praticidade e agilidade nas etapas de pintura e acabamento, por exemplo: diferentes tipos de espátulas, pincéis, broxas, escovas e texturizadores. Já os sacos e caçambas para entulhos, películas protetoras, suportes para lixas e bandejas para tintas, são excelentes opções para garantir menos sujeira e mais organização. Para completar a limpeza, invista em estopas, palhas de aço e polidores.',15.90,0.03,NULL,0,'produtos/Produto000020.png',3,3,1.00,21.00,15,4.00),(21,'Furadeira de Impacto 12 Pol 13mm 500W 127V Vermelho 929.0040 0 Schulz','Furadeira de Impacto 12 Pol 13mm 500W 127V vermelha SCHULZ 929.0040-0\r\n\r\nExcelente relação custo benefício com rolamentos nos eixos do motor. Produzida com acabamento que proporciona muito mais conforto para suas mãos na hora do manuseio, a Furadeira de Impacto Plus Schulz 500w, possui rotação 2700 RPM. Oferece qualidade e precisão para seus trabalhos, com alta potência e impacto com poderoso motor de 500 watts com mandril de 1/2\"',235.00,1.65,NULL,0,'produtos/Produto000021.png',1,3,7.00,28.00,3,24.00),(22,'Churrasqueira à Gás 2 Queimadores 1 Bandeja e 1 Queimador Lateral Mr Beef','Churrasqueira à Gás 2 Queimadores 1 Bandeja e 1 Queimador Lateral Mr Beef',2290.00,31.00,5.00,1,'produtos/Produto000022.png',2,3,53.00,66.00,2,58.00),(23,'Betoneira Traco Max Mono 400L 1 220V CSM','Betoneira Traco Max Mono 400L 1 220V CSM Betoneira 400L é de fácil operação e transporte, entregando também simples operação e manutenção. Outro diferencial é o tambor com fundo reto, que melhora a mistura e evita o acúmulo de agregados. A betoneira 400 Litros MAX é adequada para todos os tipos de obras. Betoneira 400L de fácil operação e transporte, proporciona alta produtividade e oferece um excelente custo-benefício. A betoneira 1 Traço 400L conta com cone superior de 2,00 mm e cone inferior de 2,65 mm, entregando também simples operação e manutenção. Outro diferencial é o tambor com fundo reto, que melhora a mistura e evita o acúmulo de agregados. Produzida com pinhão e cremalheira produzidos em ferro fundido nodular, garante resistência e baixa manutenção. Possui também motor WEG e painel com redução de tensão de 24V na chave liga/desliga.',4359.00,153.55,2.00,1,'produtos/Produto000023.jpg',1,1,144.87,182.60,1,104.26),(24,'Telha de Pvc Terracota 3,28X0,88m Lux Telhas','Telha de Pvc Terracota 3,28X0,88m Lux Telhas\r\nLeves, Fáceis de manusear, Economia de tempo,Economia no madeiramento, Resistência térmica, Resistência acustica, Resistência a produtos quimicos, Tratada com anti-uv, Anti-mofo, durável, baixa manutenção, possibilita diferentes inclinações, qualidade surpreendente, As telhas de PVC não propagam chamas, Produto 100% reciclavel.',162.90,13.00,NULL,0,'produtos/Produto000024.jpg',5,1,5.00,3.28,18,0.86),(25,'Kit Porta Pivotante Solida Mdp Freijó Acabado Batente 14cm 210x100 Vert','Kit Porta Pivotante Solida Mdp Freijó Acabado Batente 14cm 210x100 Vert Produto acabado, não é necessário pintar, acompanha pivos inferior e superior Kit Porta Solida Pivotante acabada acompanha Pivos',1309.90,35.00,NULL,0,'produtos/Produto000025.jpg',9,1,215.00,105.00,11,8.00),(26,'Janela De Correr Alumínio Branco Grade Classic 4 Folhas 100x150x9 Alumifort Sasazaki','Janela De Correr Alumínio Branco Grade Classic 4 Folhas 100x150x9 Alumifort Sasazaki',2749.90,20.00,NULL,0,'produtos/Produto000026.jpg',10,1,100.00,150.00,1,9.00),(27,'Tinta Acrílica Premium Super Lavável Antimanchas Eggshell Branco Interior 18 Litros Coral','Tinta Acrílica Premium Super Lavável Antimanchas Eggshell Branco Interior 18 Litros Coral Tinta Premium Super Lavável Branco 18l Coral, O produto repele líquidos, facilita a limpeza de manchas e não tem cheiro. Seu acabamento Eggshell tem um nível de brilho mais próximo ao fosco, o que ajuda a disfarçar as imperfeições da parede, Paredes como novas por mais tempo. Tinta Premium Super Lavável Branco 18l Coral, É uma tinta acrílica de alto desempenho e alta durabilidade para ambientes internos, Com a exclusiva Tecnologia Ultra Resist, é 2x mais resistente à lavabilidade do que as tintas premium foscas. 30 minutos ao toque, 4 horas entre demãos, 4 horas final,2 a 3 Porém, dependendo do tipo de superfície e cor utilizada, pode ser necessário um número maior de demãos.,Recomenda-se ler as instruções da embalagem antes do uso.,Rolo de lã de pelo baixo, pistola, pincel ou trincha',649.90,34.90,NULL,0,'produtos/Produto000027.jpg',3,1,34.90,23.50,31,23.50),(28,'Vaso Sanitário com Caixa Acoplada Branco Duplo Acionamento 3/6L Saída Vertical Eco Plus Celite','Procurando o melhor para seu banheiro? O vaso sanitário com caixa acoplada Eco Plus da Celite apresenta saída de esgoto vertical e botão superior de duplo acionamento da descarga. Encontrou na Leroy Merlin a melhor opção!',269.90,100.00,3.00,1,'produtos/Produto000028.png',NULL,2,74.00,62.00,1,37.00);
/*!40000 ALTER TABLE `ecommerce_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_selecaoenderecousuario`
--

DROP TABLE IF EXISTS `ecommerce_selecaoenderecousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_selecaoenderecousuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `endereco_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_selecaoend_endereco_id_89a3d8f8_fk_ecommerce` (`endereco_id`),
  KEY `ecommerce_selecaoend_user_id_53efce88_fk_ecommerce` (`user_id`),
  CONSTRAINT `ecommerce_selecaoend_endereco_id_89a3d8f8_fk_ecommerce` FOREIGN KEY (`endereco_id`) REFERENCES `ecommerce_endereco` (`id`),
  CONSTRAINT `ecommerce_selecaoend_user_id_53efce88_fk_ecommerce` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_usuariocomum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_selecaoenderecousuario`
--

LOCK TABLES `ecommerce_selecaoenderecousuario` WRITE;
/*!40000 ALTER TABLE `ecommerce_selecaoenderecousuario` DISABLE KEYS */;
INSERT INTO `ecommerce_selecaoenderecousuario` VALUES (1,7,1),(2,8,1),(3,9,2),(4,15,4);
/*!40000 ALTER TABLE `ecommerce_selecaoenderecousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_usuariocomum`
--

DROP TABLE IF EXISTS `ecommerce_usuariocomum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_usuariocomum` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefone` (`telefone`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_usuariocomum`
--

LOCK TABLES `ecommerce_usuariocomum` WRITE;
/*!40000 ALTER TABLE `ecommerce_usuariocomum` DISABLE KEYS */;
INSERT INTO `ecommerce_usuariocomum` VALUES (1,'pbkdf2_sha256$870000$cBw8r1JqKHxBCinTsWZAbn$vH+1xyiheSx1uaTKm5Hla6NsGngyl4mo7DKy/S9Sxj8=','2024-12-04 16:27:25.508444','pedro@email.com','Pedro','19998998787','0563223249',1,0,0),(2,'pbkdf2_sha256$870000$PpnI37ezCa6LbUGXlToSVE$X0RExwAQy2OQlgyxTKmrn+OU9Ortk/DjmSoKBF/aw8U=','2024-12-03 12:35:36.243588','pvmcastro@gmail.com','Pedro','10928301923','190283091',1,1,1),(3,'pbkdf2_sha256$870000$12rasHhZxREkl5WlpgNjlD$DG3JCL+CEgc2rvEaS2td0uh+uHci+hFEIcbrNrM+FQU=','2024-11-02 14:57:36.966977','luis@email.com','Luis','19983834545','12345678901',1,0,0),
(4,'pbkdf2_sha256$870000$NZhvoaMSHvRp36izreWo0d$TpHpeXix7CbjFzKz8TsoiN7HmOWhHx9gAIOHq4+U0Jg=','2024-12-01 19:58:35.752437','juliocesar@email.com','Julio César','781279381922','1092830192',1,0,0);
/*!40000 ALTER TABLE `ecommerce_usuariocomum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecommerce_wishlist`
--

DROP TABLE IF EXISTS `ecommerce_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecommerce_wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `produto_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecommerce_wishlist_produto_id_a820e73f_fk_ecommerce_produto_id` (`produto_id`),
  KEY `ecommerce_wishlist_user_id_58cea77f_fk_ecommerce_usuariocomum_id` (`user_id`),
  CONSTRAINT `ecommerce_wishlist_produto_id_a820e73f_fk_ecommerce_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `ecommerce_produto` (`id`),
  CONSTRAINT `ecommerce_wishlist_user_id_58cea77f_fk_ecommerce_usuariocomum_id` FOREIGN KEY (`user_id`) REFERENCES `ecommerce_usuariocomum` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_wishlist`
--

LOCK TABLES `ecommerce_wishlist` WRITE;
/*!40000 ALTER TABLE `ecommerce_wishlist` DISABLE KEYS */;
INSERT INTO `ecommerce_wishlist` VALUES (3,6,2),(4,14,2),(7,5,2),(8,5,1),(12,6,1),(13,8,4),(14,16,4),(15,6,4),(16,22,1),(17,23,1),(18,21,1);
/*!40000 ALTER TABLE `ecommerce_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresarial_lojista`
--

DROP TABLE IF EXISTS `empresarial_lojista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresarial_lojista` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefone` (`telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresarial_lojista`
--

LOCK TABLES `empresarial_lojista` WRITE;
/*!40000 ALTER TABLE `empresarial_lojista` DISABLE KEYS */;
INSERT INTO `empresarial_lojista` VALUES (5,'pbkdf2_sha256$870000$A2P07tV6y5HWlqYfTlKCOk$k50Th/Eu1WhTUZl5ihXZ05i7z8wLC5eO+v8cKjKZSCo=','2024-12-02 22:36:24.393627','joao@email.com','João da Silva','19998998787',1,0,0),(6,'pbkdf2_sha256$870000$00ODMtb9F8YNY0gmRUepDw$NhMx2YkiKjugRUEzy0UE8E9AwtXBhqHEHfPt7y9mZmg=','2024-12-04 16:39:36.072551','julia@email.com','Julia','12909831029',1,0,0),(7,'pbkdf2_sha256$870000$JX05mNW7IvGduLmryd6Wws$CP7lCzLS4cg3p9zUpkdT8TCLHN/hj0uEyExXXqJQTWQ=','2024-12-04 16:26:28.596882','jalin@rabei.com','Jali Rabei','191019191981981',1,0,0),(8,'pbkdf2_sha256$870000$ZdINuZivjbM6mmtPLqUTDM$Io09az8k7ljDA7fvfUtHzipzrNF5iV6zqZtXrkNkSm8=','2024-11-28 13:22:37.093919','meire@email.com','Meire da Silva','19213801289',1,0,0),(9,'pbkdf2_sha256$870000$X6oLLEBdeJX0NxVIS9NcCO$m1slybHmwtcoTk+rIW9r9Sv/AZe2KJi6ENQoq3oJH74=','2024-11-30 18:37:26.424929','marilene@email.com','Marilene Chauí','19872819282',1,0,0),(10,'pbkdf2_sha256$870000$wFkt4Mw0tHew4v6uDm1FTd$pLmsBJjdyWg2W8iNyHjAzppZnvRkUa0i42i2lH7XQdY=','2024-11-30 19:04:05.025342','paulo@email.com','Paulo Pimenta','192873912828',1,0,0),(11,'pbkdf2_sha256$870000$oPofm8LzaFxf6hlYlzrlOJ$iIdo0OIizO9NNJ73IUSa3EFneRB24Qts8S3uPJnN6Ec=','2024-11-30 20:39:01.271291','janaina@email.com','Janaina','189237918',1,0,0),(12,'pbkdf2_sha256$870000$X80oMroJApOTDilGnxgK1v$Yp0L8hogBdeYuw0n4F25OiglEoIDLogxyzyVXIdqsKQ=','2024-11-30 20:47:23.625161','joaonascimento@email.com','Joao Nascimento','9182739812',1,0,0);
/*!40000 ALTER TABLE `empresarial_lojista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresarial_plano`
--

DROP TABLE IF EXISTS `empresarial_plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresarial_plano` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) NOT NULL,
  `comissao` decimal(5,3) NOT NULL,
  `mensalidade` decimal(10,2) NOT NULL,
  `taxa_pagamento_pelo_app` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresarial_plano`
--

LOCK TABLES `empresarial_plano` WRITE;
/*!40000 ALTER TABLE `empresarial_plano` DISABLE KEYS */;
INSERT INTO `empresarial_plano` VALUES (1,'Basico',0.080,80.00,0.032),(2,'Entrega',0.190,120.00,0.032);
/*!40000 ALTER TABLE `empresarial_plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresarial_respostalojista`
--

DROP TABLE IF EXISTS `empresarial_respostalojista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresarial_respostalojista` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `conteudo` longtext NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `avaliacao_id` bigint NOT NULL,
  `lojista_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `empresarial_resposta_avaliacao_id_1f2000ce_fk_ecommerce` (`avaliacao_id`),
  KEY `empresarial_resposta_lojista_id_4819d3d9_fk_empresari` (`lojista_id`),
  CONSTRAINT `empresarial_resposta_avaliacao_id_1f2000ce_fk_ecommerce` FOREIGN KEY (`avaliacao_id`) REFERENCES `ecommerce_avaliacao` (`id`),
  CONSTRAINT `empresarial_resposta_lojista_id_4819d3d9_fk_empresari` FOREIGN KEY (`lojista_id`) REFERENCES `empresarial_lojista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresarial_respostalojista`
--

LOCK TABLES `empresarial_respostalojista` WRITE;
/*!40000 ALTER TABLE `empresarial_respostalojista` DISABLE KEYS */;
INSERT INTO `empresarial_respostalojista` VALUES (1,'hahaha','2024-12-03 22:40:38.295667',4,6),(2,'A sua cagada é a nossa alegria!','2024-12-04 15:12:47.967689',7,6);
/*!40000 ALTER TABLE `empresarial_respostalojista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas_entrega`
--

DROP TABLE IF EXISTS `entregas_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas_entrega` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `forma_de_entrega` varchar(20) NOT NULL,
  `entrega_pelo_app` tinyint(1) NOT NULL,
  `taxa_de_entrega` decimal(10,2) DEFAULT NULL,
  `peso` decimal(10,2) NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `status` varchar(50) NOT NULL,
  `endereco_loja_id` bigint NOT NULL,
  `motorista_id` bigint DEFAULT NULL,
  `pedido_id` bigint NOT NULL,
  `avaliou` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entregas_entrega_endereco_loja_id_e4757bd2_fk_ecommerce` (`endereco_loja_id`),
  KEY `entregas_entrega_pedido_id_c2ffbecd_fk_ecommerce_pedido_id` (`pedido_id`),
  KEY `entregas_entrega_motorista_id_12f106c9_fk_entregas_motorista_id` (`motorista_id`),
  CONSTRAINT `entregas_entrega_endereco_loja_id_e4757bd2_fk_ecommerce` FOREIGN KEY (`endereco_loja_id`) REFERENCES `ecommerce_endereco` (`id`),
  CONSTRAINT `entregas_entrega_motorista_id_12f106c9_fk_entregas_motorista_id` FOREIGN KEY (`motorista_id`) REFERENCES `entregas_motorista` (`id`),
  CONSTRAINT `entregas_entrega_pedido_id_c2ffbecd_fk_ecommerce_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `ecommerce_pedido` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas_entrega`
--

LOCK TABLES `entregas_entrega` WRITE;
/*!40000 ALTER TABLE `entregas_entrega` DISABLE KEYS */;
INSERT INTO `entregas_entrega` VALUES (6,'expressa',1,30.00,40.00,0.00,0,'2024-11-24 23:12:14.444581','aguardando confirmação da loja',5,NULL,20,0),(7,'expressa',1,25.56,31.00,0.20,0,'2024-11-24 23:13:40.540309','aguardando confirmação da loja',6,NULL,21,0),(8,'expressa',1,80.00,140.00,0.00,0,'2024-11-24 23:15:02.315392','aguardando confirmação da loja',5,NULL,22,0),(9,'agendada',1,80.00,140.00,0.00,0,'2024-11-24 23:16:16.744205','aguardando confirmação da loja',5,NULL,23,0),(10,'agendada',1,80.00,140.00,0.00,0,'2024-11-24 23:16:27.237408','aguardando confirmação da loja',5,NULL,23,0),(11,'agendada',1,10.50,1.00,0.00,0,'2024-11-24 23:16:58.012345','aguardando confirmação da loja',5,NULL,24,0),(12,'agendada',1,10.50,1.00,0.00,0,'2024-11-24 23:17:13.612675','aguardando confirmação da loja',5,NULL,24,0),(13,'expressa',1,11.50,3.00,0.00,0,'2024-11-24 23:17:50.815025','aguardando confirmação da loja',5,NULL,25,0),(14,'agendada',1,35.00,50.00,0.00,0,'2024-11-24 23:19:08.294916','aguardando confirmação da loja',5,NULL,26,0),(15,'agendada',1,35.00,50.00,0.00,0,'2024-11-24 23:19:21.897292','aguardando confirmação da loja',5,NULL,26,0),(16,'agendada',1,30.00,40.00,0.00,0,'2024-11-24 23:28:08.700679','aguardando confirmação da loja',5,NULL,27,0),(17,'agendada',1,30.00,40.00,0.00,0,'2024-11-24 23:28:46.911471','aguardando confirmação da loja',5,NULL,27,0),(18,'expressa',1,31.17,42.34,0.00,0,'2024-11-24 23:56:37.467616','aguardando confirmação da loja',5,NULL,28,0),(19,'expressa',1,20.08,18.81,2.24,0,'2024-11-25 00:15:36.788357','aguardando confirmação da loja',6,NULL,28,0),(20,'expressa',1,40.00,60.00,0.00,0,'2024-11-25 00:25:33.163088','aguardando confirmação da loja',5,NULL,29,0),(21,'agendada',1,30.00,40.00,0.00,0,'2024-11-25 00:34:05.982456','aguardando confirmação da loja',5,NULL,30,0),(22,'agendada',1,30.00,40.00,0.00,0,'2024-11-25 00:46:06.310207','aguardando confirmação da loja',5,NULL,30,0),(23,'agendada',1,87.60,153.55,2.76,0,'2024-11-25 00:47:22.810564','aguardando confirmação da loja',4,NULL,31,0),(24,'agendada',1,87.60,153.55,2.76,0,'2024-11-25 00:47:56.022268','aguardando confirmação da loja',4,NULL,31,0),(25,'expressa',1,37.59,55.00,0.32,0,'2024-11-25 00:50:43.710759','aguardando confirmação da loja',4,NULL,32,0),(26,'expressa',1,35.15,50.30,0.00,0,'2024-11-25 00:50:43.722413','aguardando confirmação da loja',5,NULL,32,0),(27,'expressa',1,28.56,37.00,0.21,0,'2024-11-25 00:50:43.730850','aguardando confirmação da loja',6,NULL,32,0),(28,'expressa',1,74.00,128.00,0.00,0,'2024-11-25 12:51:45.817780','aguardando confirmação da loja',5,NULL,33,0),(29,'expressa',1,87.60,153.55,2.76,1,'2024-11-25 12:51:45.826611','aguardando confirmação da loja',4,NULL,33,0),(30,'expressa',1,80.00,140.00,0.00,1,'2024-11-25 18:32:02.836309','pedido preparado',5,NULL,34,0),(31,'expressa',1,80.00,140.00,0.00,1,'2024-11-25 18:34:52.090643','saiu para entrega',5,7,35,0),(32,'expressa',1,80.00,140.00,0.00,1,'2024-11-25 18:36:40.235251','preparando o pedido',5,NULL,36,0),(33,'expressa',1,20.08,18.81,2.24,1,'2024-11-25 18:37:55.822832','aguardando confirmação da loja',6,NULL,37,0),(34,'expressa',1,11.00,2.00,0.01,1,'2024-11-25 18:39:12.287607','aguardando confirmação da loja',6,NULL,38,0),(35,'expressa',1,10.02,0.03,0.00,1,'2024-11-25 18:40:36.849352','aguardando confirmação da loja',6,NULL,39,0),(36,'expressa',1,35.00,50.00,0.00,1,'2024-11-25 18:41:33.584257','preparando o pedido',5,NULL,40,0),(37,'expressa',1,30.00,40.00,0.00,1,'2024-11-25 19:18:09.439622','preparando o pedido',5,NULL,41,0),(57,'expressa',1,150.00,280.00,0.00,1,'2024-12-01 19:27:28.142886','entregue',5,5,50,0),(58,'expressa',1,80.00,140.00,0.00,1,'2024-12-01 19:43:57.550504','entregue',5,5,51,0),(59,'expressa',1,20.08,18.81,2.24,1,'2024-12-01 19:47:53.467937','entregue',6,8,52,0),(60,'expressa',1,30.00,40.00,0.00,1,'2024-12-01 19:47:53.480234','entregue',5,5,52,0),(62,'expressa',1,87.60,153.55,2.76,1,'2024-12-02 22:07:44.279160','entregue',4,8,54,1),(64,'expressa',1,10.83,1.65,0.00,1,'2024-12-02 22:07:44.302874','entregue',6,8,54,1),(65,'agendada',1,80.00,140.00,0.00,1,'2024-12-02 22:08:27.523110','entregue',5,8,54,1),(66,'expressa',1,25.56,31.00,0.20,1,'2024-12-04 14:38:28.485636','aguardando confirmação da loja',6,NULL,55,0),(67,'expressa',1,70.00,120.00,0.00,1,'2024-12-04 14:38:28.497235','entregue',5,5,55,1),(69,'agendada',1,87.60,153.55,2.76,1,'2024-12-04 14:39:26.357847','aguardando confirmação da loja',4,NULL,55,0),(70,'expressa',1,10.83,1.65,0.00,1,'2024-12-04 16:24:04.010180','entregue',6,8,56,0),(71,'expressa',1,110.10,200.00,0.34,1,'2024-12-04 16:38:36.788233','entregue',5,8,57,0);
/*!40000 ALTER TABLE `entregas_entrega` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualizar_estoque_apos_entrega` AFTER UPDATE ON `entregas_entrega` FOR EACH ROW BEGIN
    IF NEW.status = 'entregue' AND OLD.status != 'entregue' THEN
        UPDATE ecommerce_produto produto
        JOIN ecommerce_itemcarrinho ic ON ic.produto_id = produto.id
        JOIN ecommerce_carrinho carrinho ON carrinho.id = ic.carrinho_id
        JOIN ecommerce_pedido pedido ON pedido.carrinho_id = carrinho.id
        SET produto.estoque = produto.estoque - ic.quantidade
        WHERE pedido.id = NEW.pedido_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entregas_entregaagendada`
--

DROP TABLE IF EXISTS `entregas_entregaagendada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas_entregaagendada` (
  `entrega_ptr_id` bigint NOT NULL,
  `datetime_entrega` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`entrega_ptr_id`),
  CONSTRAINT `entregas_entregaagen_entrega_ptr_id_94054bd8_fk_entregas_` FOREIGN KEY (`entrega_ptr_id`) REFERENCES `entregas_entrega` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas_entregaagendada`
--

LOCK TABLES `entregas_entregaagendada` WRITE;
/*!40000 ALTER TABLE `entregas_entregaagendada` DISABLE KEYS */;
INSERT INTO `entregas_entregaagendada` VALUES (10,'2024-11-29 23:00:00.000000'),(12,'2024-11-29 23:00:00.000000'),(15,'2024-11-28 15:12:00.000000'),(17,'2024-11-29 23:00:00.000000'),(22,'2024-11-23 02:00:00.000000'),(24,'2024-11-30 01:12:00.000000'),(65,'2024-12-19 03:00:00.000000'),(69,'2024-12-27 02:00:00.000000');
/*!40000 ALTER TABLE `entregas_entregaagendada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas_entregacanceladapelomotorista`
--

DROP TABLE IF EXISTS `entregas_entregacanceladapelomotorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas_entregacanceladapelomotorista` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entrega_id` bigint NOT NULL,
  `motorista_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entregas_entregacanc_entrega_id_d8a855e8_fk_entregas_` (`entrega_id`),
  KEY `entregas_entregacanc_motorista_id_459a78ab_fk_entregas_` (`motorista_id`),
  CONSTRAINT `entregas_entregacanc_entrega_id_d8a855e8_fk_entregas_` FOREIGN KEY (`entrega_id`) REFERENCES `entregas_entrega` (`id`),
  CONSTRAINT `entregas_entregacanc_motorista_id_459a78ab_fk_entregas_` FOREIGN KEY (`motorista_id`) REFERENCES `entregas_motorista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas_entregacanceladapelomotorista`
--

LOCK TABLES `entregas_entregacanceladapelomotorista` WRITE;
/*!40000 ALTER TABLE `entregas_entregacanceladapelomotorista` DISABLE KEYS */;
INSERT INTO `entregas_entregacanceladapelomotorista` VALUES (3,37,5),(4,36,5),(5,32,5),(6,31,5),(7,30,5),(10,36,7),(11,32,7),(13,32,8);
/*!40000 ALTER TABLE `entregas_entregacanceladapelomotorista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas_entregarecusada`
--

DROP TABLE IF EXISTS `entregas_entregarecusada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas_entregarecusada` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entrega_id` bigint NOT NULL,
  `motorista_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entregas_entregarecu_entrega_id_92e7bd08_fk_entregas_` (`entrega_id`),
  KEY `entregas_entregarecu_motorista_id_74b9391c_fk_entregas_` (`motorista_id`),
  CONSTRAINT `entregas_entregarecu_entrega_id_92e7bd08_fk_entregas_` FOREIGN KEY (`entrega_id`) REFERENCES `entregas_entrega` (`id`),
  CONSTRAINT `entregas_entregarecu_motorista_id_74b9391c_fk_entregas_` FOREIGN KEY (`motorista_id`) REFERENCES `entregas_motorista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas_entregarecusada`
--

LOCK TABLES `entregas_entregarecusada` WRITE;
/*!40000 ALTER TABLE `entregas_entregarecusada` DISABLE KEYS */;
INSERT INTO `entregas_entregarecusada` VALUES (3,37,6),(4,36,6),(5,32,6),(6,31,6),(7,30,6),(11,37,7),(13,59,5),(15,67,8);
/*!40000 ALTER TABLE `entregas_entregarecusada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas_motorista`
--

DROP TABLE IF EXISTS `entregas_motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas_motorista` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `cnh` varchar(15) NOT NULL,
  `nota` double DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `entregas_realizadas` int NOT NULL,
  `entregas_recusadas` int NOT NULL,
  `entregas_canceladas` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefone` (`telefone`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `cnh` (`cnh`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas_motorista`
--

LOCK TABLES `entregas_motorista` WRITE;
/*!40000 ALTER TABLE `entregas_motorista` DISABLE KEYS */;
INSERT INTO `entregas_motorista` VALUES (2,'pbkdf2_sha256$870000$65yoBwaof4WaTiCV0cCrJx$BQ/7dS94XjR5fVeWO4eRyQ3Mdr6trnycC5Ur3lvz68g=',NULL,'felipe@email.com','Felipe Oliveira da Silva','19987985341','05936334506','89776523122',NULL,1,0,0,0,0,0),(3,'pbkdf2_sha256$870000$iqj3B927S77wlOYBA01Vvn$XgJlvnDriTFWFSwIrm6hQnDe3UTFeJz/ItzVGWZqMqo=','2024-11-02 16:24:43.012957','felipe12@email.com','Felipe Oliveira da Silva','19987985342','05936334507','175872671921',NULL,1,0,0,0,0,0),(4,'pbkdf2_sha256$870000$f67E9Jv5ALuxCdqxb3R9d1$6SEQ+uNMdw9V4TrwFnTCWCnxDOH4s00pnK6phmehQ9Y=','2024-11-05 11:32:42.443109','felipe13@email.com','Felipe Santeiro','19976441640','08889887612','12344624677',NULL,1,0,0,0,0,0),(5,'pbkdf2_sha256$870000$gJ31hrmRJy69RQjALoLddX$41N6cV73nh3qGkEq6HtL/bJ6VgzsMYM4Z/oeNKmx0A8=','2024-12-04 14:46:24.184707','marcos@email.com','Marcos Silva de Oliveira','1928379172','1092301923','019283018292',5,1,0,0,18,4,7),(6,'pbkdf2_sha256$870000$f3zhjY73T1s2FdR83Id39I$S7ZZYbsgDbGIdzzl4Q0EjYzeBd4OixwL7AtPP1Uo3PI=','2024-12-01 00:08:00.288199','mario@email.com','Mario Bros','0192830192','2084290384','102983091820',NULL,1,0,0,0,7,0),(7,'pbkdf2_sha256$870000$AUt6MMd1yILyddwSOs3ScH$2+1ooTjTmqXqhXHRavPE1TjmOxXW7qMeMjy+J/qO7hk=','2024-12-01 00:41:23.333231','matheus@email.com','Matheus Oliveira Caneta Azul','18231072938','1237401283049','9182734981',NULL,1,0,0,5,2,4),(8,'pbkdf2_sha256$870000$rVZqiZIhl76hdYAAQgVgC9$9x/z8VeSrIzUdUzDsj8LqThZFQr4ZijyAmbYFnjumWQ=','2024-12-04 16:40:05.114157','salomao@email.com','Salomão','19988927391','10239918283','918789379182',4.8333,1,0,0,7,2,2);
/*!40000 ALTER TABLE `entregas_motorista` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 13:50:13
