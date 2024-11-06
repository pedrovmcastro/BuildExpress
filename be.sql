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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add usuario comum',1,'add_usuariocomum'),(2,'Can change usuario comum',1,'change_usuariocomum'),(3,'Can delete usuario comum',1,'delete_usuariocomum'),(4,'Can view usuario comum',1,'view_usuariocomum'),(5,'Can add categoria',2,'add_categoria'),(6,'Can change categoria',2,'change_categoria'),(7,'Can delete categoria',2,'delete_categoria'),(8,'Can view categoria',2,'view_categoria'),(9,'Can add endereco',3,'add_endereco'),(10,'Can change endereco',3,'change_endereco'),(11,'Can delete endereco',3,'delete_endereco'),(12,'Can view endereco',3,'view_endereco'),(13,'Can add loja',4,'add_loja'),(14,'Can change loja',4,'change_loja'),(15,'Can delete loja',4,'delete_loja'),(16,'Can view loja',4,'view_loja'),(17,'Can add produto',5,'add_produto'),(18,'Can change produto',5,'change_produto'),(19,'Can delete produto',5,'delete_produto'),(20,'Can view produto',5,'view_produto'),(21,'Can add avaliacao',6,'add_avaliacao'),(22,'Can change avaliacao',6,'change_avaliacao'),(23,'Can delete avaliacao',6,'delete_avaliacao'),(24,'Can view avaliacao',6,'view_avaliacao'),(25,'Can add wishlist',7,'add_wishlist'),(26,'Can change wishlist',7,'change_wishlist'),(27,'Can delete wishlist',7,'delete_wishlist'),(28,'Can view wishlist',7,'view_wishlist'),(29,'Can add lojista',8,'add_lojista'),(30,'Can change lojista',8,'change_lojista'),(31,'Can delete lojista',8,'delete_lojista'),(32,'Can view lojista',8,'view_lojista'),(33,'Can add plano',9,'add_plano'),(34,'Can change plano',9,'change_plano'),(35,'Can delete plano',9,'delete_plano'),(36,'Can view plano',9,'view_plano'),(37,'Can add motorista',10,'add_motorista'),(38,'Can change motorista',10,'change_motorista'),(39,'Can delete motorista',10,'delete_motorista'),(40,'Can view motorista',10,'view_motorista'),(41,'Can add log entry',11,'add_logentry'),(42,'Can change log entry',11,'change_logentry'),(43,'Can delete log entry',11,'delete_logentry'),(44,'Can view log entry',11,'view_logentry'),(45,'Can add permission',12,'add_permission'),(46,'Can change permission',12,'change_permission'),(47,'Can delete permission',12,'delete_permission'),(48,'Can view permission',12,'view_permission'),(49,'Can add group',13,'add_group'),(50,'Can change group',13,'change_group'),(51,'Can delete group',13,'delete_group'),(52,'Can view group',13,'view_group'),(53,'Can add content type',14,'add_contenttype'),(54,'Can change content type',14,'change_contenttype'),(55,'Can delete content type',14,'delete_contenttype'),(56,'Can view content type',14,'view_contenttype'),(57,'Can add session',15,'add_session'),(58,'Can change session',15,'change_session'),(59,'Can delete session',15,'delete_session'),(60,'Can view session',15,'view_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-11-02 04:09:49.867511','1','joao@email.com',1,'[{\"added\": {}}]',8,2),(2,'2024-11-02 04:10:58.241541','1','joao@email.com',1,'[{\"added\": {}}]',10,2),(3,'2024-11-02 15:14:24.265595','1','joao@email.com',2,'[]',8,2),(4,'2024-11-02 21:27:53.868649','1','Av. Francisco Glicério, 245, Centro, Campinas - 13025067',3,'',3,2),(5,'2024-11-02 21:28:03.649184','2','joao2@gmail.com',3,'',8,2),(6,'2024-11-02 21:28:03.649224','1','joao@email.com',3,'',8,2),(7,'2024-11-02 21:29:11.306032','1','Basico',1,'[{\"added\": {}}]',9,2),(8,'2024-11-02 21:29:21.798052','2','Entrega',1,'[{\"added\": {}}]',9,2),(9,'2024-11-02 21:40:11.226131','3','jose@email.com',3,'',8,2),(10,'2024-11-02 21:42:06.715280','2','Av. Francisco Glicério, 245, Centro, Campinas - 450162211',3,'',3,2),(11,'2024-11-02 21:44:18.691931','3','Av. Francisco Glicério, 211, Centro, Campinas - 13045-603',3,'',3,2),(12,'2024-11-02 21:44:26.596097','4','joao@email.com',3,'',8,2),(13,'2024-11-03 19:17:45.741608','1','joao@email.com',3,'',10,2),(14,'2024-11-05 12:16:11.231676','2','Cimento CP II F 32 Todas as Obras 50kg Votoran',3,'',5,2),(15,'2024-11-05 12:16:11.231922','1','Cimento CP II F 32 Todas as Obras 50kg Votoran',3,'',5,2),(16,'2024-11-05 12:16:24.903982','3','Cimento',2,'[{\"changed\": {\"fields\": [\"Photo\"]}}]',5,2),(17,'2024-11-05 16:15:16.385906','3','Cimento',3,'',5,2),(18,'2024-11-06 00:50:05.820812','1','Ferramentas e Equipamentos',1,'[{\"added\": {}}]',2,2),(19,'2024-11-06 00:51:49.096952','2','Churrasqueiras e Acessórios',1,'[{\"added\": {}}]',2,2),(20,'2024-11-06 00:53:39.887049','3','Tintas e Acabamentos',1,'[{\"added\": {}}]',2,2),(21,'2024-11-06 00:55:02.011691','4','Tubos e Conexões',1,'[{\"added\": {}}]',2,2),(22,'2024-11-06 00:55:13.787640','5','Coberturas e Telhas',1,'[{\"added\": {}}]',2,2),(23,'2024-11-06 00:56:27.627853','6','Blocos e Tijolos',1,'[{\"added\": {}}]',2,2),(24,'2024-11-06 00:57:44.561470','7','Cimentos e Argamassas',1,'[{\"added\": {}}]',2,2),(25,'2024-11-06 00:59:06.095291','8','Spas e Lazer',1,'[{\"added\": {}}]',2,2),(26,'2024-11-06 00:59:18.524327','9','Portas',1,'[{\"added\": {}}]',2,2),(27,'2024-11-06 00:59:48.175570','10','Janelas',1,'[{\"added\": {}}]',2,2),(28,'2024-11-06 01:00:00.723821','11','Pisos e Revestimentos',1,'[{\"added\": {}}]',2,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (11,'admin','logentry'),(13,'auth','group'),(12,'auth','permission'),(14,'contenttypes','contenttype'),(6,'ecommerce','avaliacao'),(2,'ecommerce','categoria'),(3,'ecommerce','endereco'),(4,'ecommerce','loja'),(5,'ecommerce','produto'),(1,'ecommerce','usuariocomum'),(7,'ecommerce','wishlist'),(8,'empresarial','lojista'),(9,'empresarial','plano'),(10,'entregas','motorista'),(15,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'empresarial','0001_initial','2024-11-02 01:52:36.144235'),(2,'ecommerce','0001_initial','2024-11-02 01:52:38.714086'),(3,'contenttypes','0001_initial','2024-11-02 01:52:38.796432'),(4,'admin','0001_initial','2024-11-02 01:52:39.132104'),(5,'admin','0002_logentry_remove_auto_add','2024-11-02 01:52:39.150219'),(6,'admin','0003_logentry_add_action_flag_choices','2024-11-02 01:52:39.178161'),(7,'contenttypes','0002_remove_content_type_name','2024-11-02 01:52:39.318551'),(8,'auth','0001_initial','2024-11-02 01:52:39.894242'),(9,'auth','0002_alter_permission_name_max_length','2024-11-02 01:52:40.013975'),(10,'auth','0003_alter_user_email_max_length','2024-11-02 01:52:40.029936'),(11,'auth','0004_alter_user_username_opts','2024-11-02 01:52:40.041616'),(12,'auth','0005_alter_user_last_login_null','2024-11-02 01:52:40.065203'),(13,'auth','0006_require_contenttypes_0002','2024-11-02 01:52:40.073943'),(14,'auth','0007_alter_validators_add_error_messages','2024-11-02 01:52:40.095856'),(15,'auth','0008_alter_user_username_max_length','2024-11-02 01:52:40.116690'),(16,'auth','0009_alter_user_last_name_max_length','2024-11-02 01:52:40.140467'),(17,'auth','0010_alter_group_name_max_length','2024-11-02 01:52:40.187504'),(18,'auth','0011_update_proxy_permissions','2024-11-02 01:52:40.225639'),(19,'auth','0012_alter_user_first_name_max_length','2024-11-02 01:52:40.245392'),(20,'entregas','0001_initial','2024-11-02 01:52:40.326677'),(21,'sessions','0001_initial','2024-11-02 01:52:40.387509'),(22,'ecommerce','0002_usuariocomum_is_staff_usuariocomum_is_superuser','2024-11-02 03:49:55.320814'),(23,'ecommerce','0003_remove_endereco_usuarios','2024-11-05 13:07:58.520384'),(24,'empresarial','0002_lojista_is_staff_lojista_is_superuser','2024-11-05 13:07:58.647812'),(25,'entregas','0002_motorista_is_staff_motorista_is_superuser','2024-11-05 13:07:58.730478');
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
INSERT INTO `django_session` VALUES ('2ue6n2zmo58cvdday8t54i7s13jwljg1','.eJxVizsOwyAMQO_iuYqABGwydu4dkAFX0G8EyVT17lWlDO36Pi8IvK0lbF1aqBlmcHD4ZZHTVR5fIfelSedW-TbstA-n56X2lY979bcW7gVmSG50NBmFhjFqNWlCVGTMlKMWmy2hJ5uj10mLJYdkk-ezE61GTMl6eH8AUaI0pQ:1t8UQW:pjMh2mFXUc_iCC2ofXK7HjDTlqgE6N2s_p3hMg-yJXY','2024-11-20 01:01:40.235546'),('hc6ok8jobbp32nkevnn3ryh3srsvrhul','e30:1t7GrU:W2QXAfxUfjlLcEVxLZx9MEawQrs80WQ3QVxNlkTUWVo','2024-11-16 16:20:28.182849'),('rvoenopa767ajccr367vcvg28i6ffdqc','e30:1t74xY:sot74af4hppDL-T9lQxrKOgIeMKN5WUzHrofX8rLc5o','2024-11-16 03:37:56.525528');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_avaliacao`
--

LOCK TABLES `ecommerce_avaliacao` WRITE;
/*!40000 ALTER TABLE `ecommerce_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecommerce_avaliacao` ENABLE KEYS */;
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
INSERT INTO `ecommerce_categoria` VALUES (1,'Ferramentas e Equipamentos','categorias/Categoria000001.jpg'),
(2,'Churrasqueiras e Acessórios','categorias/Categoria000002.jpg'),
(3,'Tintas e Acabamentos','categorias/Categoria000003.jpg'),
(4,'Tubos e Conexões','categorias/Categoria000004.jpg'),
(5,'Coberturas e Telhas','categorias/Categoria000005.jpg'),
(6,'Blocos e Tijolos','categorias/Categoria000006.png'),
(7,'Cimentos e Argamassas','categorias/Categoria000007.jpg'),
(8,'Spas e Lazer','categorias/Categoria000008.png'),
(9,'Portas','categorias/Categoria000009.jpg'),
(10,'Janelas','categorias/Categoria000010.png'),
(11,'Pisos e Revestimentos','categorias/Categoria000011.jpg');
/*!40000 ALTER TABLE `ecommerce_categoria` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_endereco`
--

LOCK TABLES `ecommerce_endereco` WRITE;
/*!40000 ALTER TABLE `ecommerce_endereco` DISABLE KEYS */;
INSERT INTO `ecommerce_endereco` VALUES (4,'13045-603','Av. Francisco Glicério',231,'Centro','Campinas','SP'),
(5,'121351431','Av. Dr. Moraes Sales',244,'Centro','Campinas','SP'),
(6,'1290801928','Av. Brasil',222,'Centro','Porto Alegre','RS');
/*!40000 ALTER TABLE `ecommerce_endereco` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `ecommerce_loja_endereco_id_fcda9550_fk_ecommerce_endereco_id` (`endereco_id`),
  KEY `ecommerce_loja_lojista_id_286e0157_fk_empresarial_lojista_id` (`lojista_id`),
  KEY `ecommerce_loja_plano_id_90a55971_fk_empresarial_plano_id` (`plano_id`),
  CONSTRAINT `ecommerce_loja_endereco_id_fcda9550_fk_ecommerce_endereco_id` FOREIGN KEY (`endereco_id`) REFERENCES `ecommerce_endereco` (`id`),
  CONSTRAINT `ecommerce_loja_lojista_id_286e0157_fk_empresarial_lojista_id` FOREIGN KEY (`lojista_id`) REFERENCES `empresarial_lojista` (`id`),
  CONSTRAINT `ecommerce_loja_plano_id_90a55971_fk_empresarial_plano_id` FOREIGN KEY (`plano_id`) REFERENCES `empresarial_plano` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_loja`
--

LOCK TABLES `ecommerce_loja` WRITE;
/*!40000 ALTER TABLE `ecommerce_loja` DISABLE KEYS */;
INSERT INTO `ecommerce_loja` VALUES (1,'Submarino Tijolos','Mariano da Silva Ferraz','12345432212','12345678901234','19998876767',NULL,'',4,5,1),
(2,'Sujiro Kimimami','Benjamin Arrola','1932912083','102394801923','0198309122',NULL,'',5,6,1),
(3,'Jalim Rabei Ferramentas','Jalim Rabei Souza','2193871123','912873917293191','0129830192',NULL,'',6,7,1);
/*!40000 ALTER TABLE `ecommerce_loja` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `ecommerce_produto_categoria_id_821ec574_fk_ecommerce` (`categoria_id`),
  KEY `ecommerce_produto_loja_id_e3aa4055_fk_ecommerce_loja_id` (`loja_id`),
  CONSTRAINT `ecommerce_produto_categoria_id_821ec574_fk_ecommerce` FOREIGN KEY (`categoria_id`) REFERENCES `ecommerce_categoria` (`id`),
  CONSTRAINT `ecommerce_produto_loja_id_e3aa4055_fk_ecommerce_loja_id` FOREIGN KEY (`loja_id`) REFERENCES `ecommerce_loja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_produto`
--

LOCK TABLES `ecommerce_produto` WRITE;
/*!40000 ALTER TABLE `ecommerce_produto` DISABLE KEYS */;
INSERT INTO `ecommerce_produto` VALUES (5,'Carrinho de mão','Bom pra carregar varias fita',100.00,40.00,NULL,0,'produtos/Produto000005.jpg',1,2),
(6,'Churrasqueira Centaurus a Bafo Carvão 108x112cm Beta II Naterial','pra fazer aquela picanha na brasa',1200.00,140.00,NULL,0,'produtos/Produto000006.jpg',2,2),
(7,'Cimento CP II F 32 Todas as Obras 50kg Votoran','Na hora de construir ou reformar, um item que não pode faltar é o cimento. É importante um produto de qualidade para não ter problemas futuros na obra. O Cimento CP II F 32 Todas as Obras 50 kg Votoran é ideal para reboco, contrapiso, concreto convencional e laje.',31.90,50.00,NULL,0,'produtos/Produto000007.jpg',7,2),(8,'Tijolo Comum Vermelho 8,7x4,3x18,6cm Bauth','Os tijolos maciços podem ser utilizados na construção de paredes e se enquadram como alvenaria estrutural. Mas não devem ser usados em pisos. É uma ótima opção também para quem deseja manter um ambiente mais rústico deixando-os à mostra.\r\n\r\nAltura 	4,30 cm\r\nLargura 	8,70 cm\r\nComprimento 	18,60 cm\r\nDimensão 	8,7x4,3x18,6 cm\r\nUso Indicado 	Vedação\r\nTonalidade 	Vermelho\r\nPeso do Produto 	1,00 Kg\r\nUnidade de Venda 	por Unidade\r\nMarca 	Bauth',0.69,1.00,NULL,0,'produtos/Produto000008.jpeg',6,2),(9,'Telha de Fibrocimento Ondulada 244x110cm 5mm Cinza Brasilit','Seus projetos precisam de produtos de qualidade para garantir segurança para sua casa. As telhas de fibrocimento são ideais, pois são resistentes e leves, o que faz com que não necessitem de estrutura reforçada e gera economia e facilidade no transporte e instalação. Produto 	Telha de Fibrocimento\r\nModelo 	Ondulada\r\nTipo 	Ondulada\r\nTipo da Calha 	Onda Alta\r\nMaterial 	Cimento\r\nTipo de Material 	Fibrocimento\r\nCor 	Cinza\r\nLargura 	110,00 cm\r\nComprimento 	2,44 m\r\nEspessura 	5,00 mm\r\nDimensão 	110x244 cm\r\nInclinação 	15 °\r\nCusto do Madeiramento 	Médio\r\nCusto da Manutenção 	Médio\r\nAcompanha Fixação 	Não\r\nQuantidade de Peças de Fixação 	2.5 peça(s)\r\nTipo de Fixação 	Parafuso\r\nPeso do Produto 	32,50 Kg\r\nMarca 	Brasilit\r\nGarantia do Fabricante 	5 ano(s)\r\nObservações sobre a Garantia do Fabricante 	Consulte condições de garantia, manutenção e utilização do produto no manual do fabricante.',48.90,32.50,NULL,0,'produtos/Produto000009.jpg',5,2),(10,'Argamassa Flex ACIII Interno e Externo Cinza 20kg Fortaleza','Este produto é maleável e fácil de trabalhar, sendo ideal para assentar todo tipo de cerâmica, sejam os pisos naturais ou porcelanatos. Pode ser utilizado em local com alto tráfego, fachadas, paredes, piscinas, pisos e saunas. Tipo da Argamassa 	ACIII\r\nArgamassa para 	Assentamento Cerâmico\r\nAmbiente Indicado da Argamassa 	Interno e Externo\r\nUso da Argamassa 	Assentamento em pisos e revestimentos cerâmicos\r\nArgamassa Ideal para Peças até 	140 x 140 cm\r\nUso Indicado 	Assentamento e sopreposição\r\nProduto 	Argamassa\r\nTonalidade 	Cinza\r\nLocal(is) Indicado(s) 	Fachadas, Parede, Piscina, Piso e Sauna\r\nInformações do Rendimento 	Aplicação na base: 8,5 kg/m² e aplicação na base e no verso: 12 kg/m²\r\nRendimento em peças até 30x30cm (camada simples) 	8 Kg/m²\r\nRendimento em peças acima de 30x30cm (camada dupla) 	12 Kg/m²\r\nTempo de Secagem 	24 h\r\nPrazo de Validade na Embalagem 	18 meses\r\nTipo de Embalagem 	Saco\r\nAltura da Embalagem 	14,00 cm\r\nLargura da Embalagem 	34,00 cm\r\nProfundidade da Embalagem 	55,00 cm\r\nPeso do Produto na Embalagem 	20,00 Kg\r\nMarca 	Fortaleza',33.90,20.00,NULL,0,'produtos/Produto000010.jpg',7,2),(11,'Cano PVC para Esgoto 100mm ou 4\" 3m Tigre','O Cano PVC da Marca Tigre de 3m e bitola de 4\" 100mm é a peça que você procura para o seu projeto hidráulico de esgoto. Material altamente resistente, durável e que garante eficiência no escoamento da água sem sofrer danos com facilidade. Uso Indicado 	Esgoto\r\nBitola em Polegadas 	4 \"\r\nBitola em Milímetros 	100 mm\r\nProduto 	Tubo Esgoto 100 Mm 3M\r\nAltura 	115,00 cm\r\nLargura 	115,00 cm\r\nProfundidade 	3,00 cm\r\nComprimento 	3,00 m\r\nDiâmetro 	100,00 cm\r\nEspessura 	1,80 mm\r\nDimensão 	115x115x3 cm\r\nMaterial 	Plástico\r\nTipo de Material 	PVC\r\nNorma Técnica 	NBR 5688\r\nMarca 	Tigre\r\nGarantia do Fabricante 	120 mes(es)\r\nReferência do Produto 	11031005',46.90,2.30,NULL,0,'produtos/Produto000011.jpeg',4,2),(12,'Joelho 90° PVC Marrom Soldável 3/4\" 25mm Tigre','A conexão hidráulica Joelho 90° PVC da Marca Tigre com bitola de 3/4\" ou 25mm é a peça que você procura para o seu projeto hidráulico de água fria ideal. Produzido em PVC (policloreto de vinila), é resistente e durável contra o contato com a água por ser não corrosível. Uso Indicado 	Água Fria\r\nTipo 	Soldável\r\nBitola em Polegadas 	3/4 \"\r\nBitola em Milímetros 	25 mm\r\nProduto 	Joelho 90°\r\nMaterial 	Plástico\r\nTipo de Material 	PVC\r\nCor 	Marrom\r\nTonalidade 	Marrom\r\nNorma Técnica 	NBR 5648\r\nMarca 	Tigre\r\nProduto Acompanha Embalagem 	Não',1.16,0.04,NULL,0,'produtos/Produto000012.jpg',4,2),(13,'Adaptador PVC Marrom Roscável e Soldável 3/4\" 25mm Tigre','A conexão hidráulica Adaptador PVC da Marca Tigre com bitola de 3/4\" ou 25mm é a peça que você procura para o seu projeto hidráulico de água fria ideal. Aproveite! Uso Indicado 	Água Fria\r\nTipo 	Roscável e Soldável\r\nBitola em Polegadas 	3/4 \"\r\nBitola em Milímetros 	25 mm\r\nProduto 	Adaptador\r\nMaterial 	Plástico\r\nTipo de Material 	PVC\r\nCor 	Marrom\r\nTonalidade 	Marrom\r\nNorma Técnica 	NBR 5648\r\nMarca 	Tigre\r\nProduto Acompanha Embalagem 	Não\r\nReferência do Produto 	22.00.025.0',1.36,0.05,NULL,0,'produtos/Produto000013.jpg',4,2),(14,'Tinta Esmalte Base Água Coralit Acetinado Branco 3,6L Coral','Coralit Total é um esmalte base água de ultra aderência em multisuperfícies, sua fórmula garante um excelente acabamento e alta proteção. Possui uma película brilhante que facilita a limpeza da superfície, oferecendo ótimo rendimento e alto poder de cobertura. Ambiente Indicado 	Interno\r\nComposição Base 	Água\r\nTonalidade 	Branco\r\nAcabamento da Tinta 	Acetinado\r\nLitragem 	3,60 L\r\nSuperfície a ser Aplicada 	Madeira e Metal\r\nRendimento 	75 m²\r\nAcabado ou por demão? 	por Demão\r\nQuantidade de Demão 	2 a 3 demão(s)\r\nNível de Odor 	Sem Odor\r\nDurabilidade em Anos 	Até 10 anos\r\nMarca 	Coral\r\nLinha 	Coralit',139.90,4.70,NULL,0,'produtos/Produto000014.jpg',3,2),(15,'Eletroduto Corrugado 1 \'\' 25Metros Laranja Tigre','Uso Indicado 	Laje ou Teto\r\nDiâmetro do Eletroduto 	1\r\nProduto Acompanha Embalagem 	Sim\r\nMetragem por Embalagem 	25,00 m\r\nMaterial 	Plástico\r\nTipo de Material 	PVC\r\nCor 	Laranja\r\nTonalidade 	Laranja\r\nResistência Mecânica 	Médio\r\nExtremidade 	com Rosca\r\nProduto 	Eletroduto\r\nTipo 	Flexível\r\nMarca 	Tigre\r\nReferência do Produto 	DN-16\r\nAtenção 	Antes de instalar, desligue a energia elétrica.',164.90,3.00,NULL,0,'produtos/Produto000015.jpg',4,2),(16,'Spa Inflável 795L com Bomba 220V e 120 Jatos PureSpa Bubbles Intex','Garanta relaxamento e bem-estar na sua casa com este SPA inflável! Ele proporciona uma massagem de bolhas relaxantes, aquece até 40º, é feito com tripla camada de PVC, possui display com multifunções e acompanha capa de proteção.\r\nProduto 	Spa Inflável\r\nCapacidade de Volume 	795,00 L\r\nCapacidade de Pessoas 	4 pessoa(s)\r\nContém Jato Bolhas 	Com Jato Bolhas\r\nQuantidade de Jatos de Ar 	120\r\nModelo 	PureSPA Bubbles\r\nMarca 	Intex\r\nAcompanha Filtro|Bomba 	Sim\r\nMaterial do Filtro|Bomba 	Plástico\r\nTensão Elétrica do Filtro|Bomba 	220V\r\nAquecimento da água 	ºC 40\r\nCapacidade de Filtragem 	1741 L/h\r\nAcompanha Capa 	Com Capa\r\nAcompanha Válvula 	com Válvula\r\nVálvula Acompanha Cesta 	Não\r\nCor 	Bege\r\nMaterial 	Plástico\r\nTipo de Material 	PVC\r\nFormato 	Redondo\r\nÁrea de Uso 	3,00 m²\r\nAltura 	71,00 cm\r\nLargura 	195,00 cm\r\nComprimento 	195,00 cm\r\nDimensão 	71x195x195 cm\r\nMontagem 	Desmontado\r\nTempo Estimado de Montagem 	60 min\r\nInstruções de Montagem 	Acompanha o produto\r\nComplexidade de Montagem 	Média: pode ser montada por mais de uma pessoa leiga\r\nPeso do Produto 	48,00 Kg\r\nGarantia do Fabricante 	12 mes(es)\r\nObservações sobre a Garantia do Fabricante 	Garantia apenas para defeitos de fabricação comprovados e dentro do prazo vigente.',3499.00,48.00,NULL,0,'produtos/Produto000016.jpg',NULL,2);
/*!40000 ALTER TABLE `ecommerce_produto` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_usuariocomum`
--

LOCK TABLES `ecommerce_usuariocomum` WRITE;
/*!40000 ALTER TABLE `ecommerce_usuariocomum` DISABLE KEYS */;
INSERT INTO `ecommerce_usuariocomum` VALUES (1,'pbkdf2_sha256$870000$cBw8r1JqKHxBCinTsWZAbn$vH+1xyiheSx1uaTKm5Hla6NsGngyl4mo7DKy/S9Sxj8=','2024-11-05 11:33:14.076257','pedro@email.com','Pedro','19998998787','0563223249',1,0,0),(2,'pbkdf2_sha256$870000$PpnI37ezCa6LbUGXlToSVE$X0RExwAQy2OQlgyxTKmrn+OU9Ortk/DjmSoKBF/aw8U=','2024-11-06 00:45:27.359912','pvmcastro@gmail.com','','','',1,1,1),(3,'pbkdf2_sha256$870000$12rasHhZxREkl5WlpgNjlD$DG3JCL+CEgc2rvEaS2td0uh+uHci+hFEIcbrNrM+FQU=','2024-11-02 14:57:36.966977','luis@email.com','Luis','19983834545','12345678901',1,0,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecommerce_wishlist`
--

LOCK TABLES `ecommerce_wishlist` WRITE;
/*!40000 ALTER TABLE `ecommerce_wishlist` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresarial_lojista`
--

LOCK TABLES `empresarial_lojista` WRITE;
/*!40000 ALTER TABLE `empresarial_lojista` DISABLE KEYS */;
INSERT INTO `empresarial_lojista` VALUES (5,'pbkdf2_sha256$870000$A2P07tV6y5HWlqYfTlKCOk$k50Th/Eu1WhTUZl5ihXZ05i7z8wLC5eO+v8cKjKZSCo=',NULL,'joao@email.com','João da Silva','19998998787',1,0,0),(6,'pbkdf2_sha256$870000$00ODMtb9F8YNY0gmRUepDw$NhMx2YkiKjugRUEzy0UE8E9AwtXBhqHEHfPt7y9mZmg=','2024-11-06 01:01:40.230249','julia@email.com','Julia','12909831029',1,0,0),(7,'pbkdf2_sha256$870000$JX05mNW7IvGduLmryd6Wws$CP7lCzLS4cg3p9zUpkdT8TCLHN/hj0uEyExXXqJQTWQ=',NULL,'jalin@rabei.com','Jali Rabei','191019191981981',1,0,0);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telefone` (`telefone`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `cnh` (`cnh`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas_motorista`
--

LOCK TABLES `entregas_motorista` WRITE;
/*!40000 ALTER TABLE `entregas_motorista` DISABLE KEYS */;
INSERT INTO `entregas_motorista` VALUES (2,'pbkdf2_sha256$870000$65yoBwaof4WaTiCV0cCrJx$BQ/7dS94XjR5fVeWO4eRyQ3Mdr6trnycC5Ur3lvz68g=',NULL,'felipe@email.com','Felipe Oliveira da Silva','19987985341','05936334506','89776523122',NULL,1,0,0),(3,'pbkdf2_sha256$870000$iqj3B927S77wlOYBA01Vvn$XgJlvnDriTFWFSwIrm6hQnDe3UTFeJz/ItzVGWZqMqo=','2024-11-02 16:24:43.012957','felipe12@email.com','Felipe Oliveira da Silva','19987985342','05936334507','175872671921',NULL,1,0,0),(4,'pbkdf2_sha256$870000$f67E9Jv5ALuxCdqxb3R9d1$6SEQ+uNMdw9V4TrwFnTCWCnxDOH4s00pnK6phmehQ9Y=','2024-11-05 11:32:42.443109','felipe13@email.com','Felipe Santeiro','19976441640','08889887612','12344624677',NULL,1,0,0);
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

-- Dump completed on 2024-11-05 22:40:51
