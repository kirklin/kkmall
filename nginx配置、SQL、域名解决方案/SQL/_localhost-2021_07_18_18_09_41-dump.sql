-- MySQL dump 10.13  Distrib 8.0.22, for osx10.16 (x86_64)
--
-- Host: 127.0.0.1    Database: kkmall_admin
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Current Database: `kkmall_admin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `kkmall_admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `kkmall_admin`;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_CRON_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `CRON_EXPRESSION`, `TIME_ZONE_ID`) VALUES ('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
INSERT INTO `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `JOB_CLASS_NAME`, `IS_DURABLE`, `IS_NONCONCURRENT`, `IS_UPDATE_DATA`, `REQUESTS_RECOVERY`, `JOB_DATA`) VALUES ('RenrenScheduler','TASK_1','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0y\�m\�xt\00 0/30 * * * ?sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤\���8\0I\0valuexq\0~\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
INSERT INTO `QRTZ_LOCKS` (`SCHED_NAME`, `LOCK_NAME`) VALUES ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
INSERT INTO `QRTZ_SCHEDULER_STATE` (`SCHED_NAME`, `INSTANCE_NAME`, `LAST_CHECKIN_TIME`, `CHECKIN_INTERVAL`) VALUES ('RenrenScheduler','KirkLindeMBP.lan1626599172344',1626602976803,15000);
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
INSERT INTO `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `NEXT_FIRE_TIME`, `PREV_FIRE_TIME`, `PRIORITY`, `TRIGGER_STATE`, `TRIGGER_TYPE`, `START_TIME`, `END_TIME`, `CALENDAR_NAME`, `MISFIRE_INSTR`, `JOB_DATA`) VALUES ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1626604200000,1626602400000,5,'WAITING','CRON',1622987046000,0,NULL,2,_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0y\�m\�xt\00 0/30 * * * ?sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤\���8\0I\0valuexq\0~\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job`
--

DROP TABLE IF EXISTS `schedule_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job`
--

LOCK TABLES `schedule_job` WRITE;
/*!40000 ALTER TABLE `schedule_job` DISABLE KEYS */;
INSERT INTO `schedule_job` (`job_id`, `bean_name`, `params`, `cron_expression`, `status`, `remark`, `create_time`) VALUES (1,'testTask','renren','0 0/30 * * * ?',0,'参数测试','2021-06-06 21:04:55');
/*!40000 ALTER TABLE `schedule_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job_log`
--

DROP TABLE IF EXISTS `schedule_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job_log`
--

LOCK TABLES `schedule_job_log` WRITE;
/*!40000 ALTER TABLE `schedule_job_log` DISABLE KEYS */;
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (1,1,'testTask','renren',0,NULL,0,'2021-06-06 22:00:00'),(2,1,'testTask','renren',0,NULL,1,'2021-06-07 14:00:00'),(3,1,'testTask','renren',0,NULL,0,'2021-06-07 14:30:00'),(4,1,'testTask','renren',0,NULL,1,'2021-06-07 15:00:00'),(5,1,'testTask','renren',0,NULL,1,'2021-06-08 12:30:00'),(6,1,'testTask','renren',0,NULL,0,'2021-06-08 13:30:00'),(7,1,'testTask','renren',0,NULL,1,'2021-06-08 14:00:00'),(8,1,'testTask','renren',0,NULL,1,'2021-06-08 14:30:00'),(9,1,'testTask','renren',0,NULL,0,'2021-06-08 15:30:00'),(10,1,'testTask','renren',0,NULL,1,'2021-06-08 16:00:00'),(11,1,'testTask','renren',0,NULL,2,'2021-06-08 16:30:00'),(12,1,'testTask','renren',0,NULL,3,'2021-06-08 17:00:00'),(13,1,'testTask','renren',0,NULL,1,'2021-06-08 17:30:00'),(14,1,'testTask','renren',0,NULL,1,'2021-06-08 20:30:00'),(15,1,'testTask','renren',0,NULL,1,'2021-06-08 21:00:00'),(16,1,'testTask','renren',0,NULL,2,'2021-06-08 21:30:00'),(17,1,'testTask','renren',0,NULL,1,'2021-06-08 22:00:00'),(18,1,'testTask','renren',0,NULL,1,'2021-06-09 10:30:00'),(19,1,'testTask','renren',0,NULL,2,'2021-06-09 11:00:00'),(20,1,'testTask','renren',0,NULL,2,'2021-06-09 11:30:00'),(21,1,'testTask','renren',0,NULL,1,'2021-06-09 12:30:00'),(22,1,'testTask','renren',0,NULL,1,'2021-06-09 13:00:00'),(23,1,'testTask','renren',0,NULL,2,'2021-06-09 13:30:00'),(24,1,'testTask','renren',0,NULL,1,'2021-06-09 14:00:00'),(25,1,'testTask','renren',0,NULL,5,'2021-06-09 14:30:00'),(26,1,'testTask','renren',0,NULL,4,'2021-06-09 15:00:00'),(27,1,'testTask','renren',0,NULL,10,'2021-06-09 15:30:00'),(28,1,'testTask','renren',0,NULL,4,'2021-06-09 16:00:00'),(29,1,'testTask','renren',0,NULL,3,'2021-06-09 16:30:00'),(30,1,'testTask','renren',0,NULL,6,'2021-06-09 17:00:00'),(31,1,'testTask','renren',0,NULL,3,'2021-06-09 17:30:00'),(32,1,'testTask','renren',0,NULL,3,'2021-06-09 18:00:00'),(33,1,'testTask','renren',0,NULL,1,'2021-06-09 18:30:00'),(34,1,'testTask','renren',0,NULL,3,'2021-06-09 21:00:00'),(35,1,'testTask','renren',0,NULL,2,'2021-06-09 21:30:00'),(36,1,'testTask','renren',0,NULL,8,'2021-06-09 22:00:00'),(37,1,'testTask','renren',0,NULL,1,'2021-06-10 12:00:00'),(38,1,'testTask','renren',0,NULL,1,'2021-06-10 12:30:00'),(39,1,'testTask','renren',0,NULL,1,'2021-06-10 13:00:00'),(40,1,'testTask','renren',0,NULL,1,'2021-06-10 13:30:00'),(41,1,'testTask','renren',0,NULL,2,'2021-06-10 14:00:00'),(42,1,'testTask','renren',0,NULL,0,'2021-06-10 14:30:00'),(43,1,'testTask','renren',0,NULL,1,'2021-06-10 15:00:00'),(44,1,'testTask','renren',0,NULL,3,'2021-06-10 15:30:00'),(45,1,'testTask','renren',0,NULL,2,'2021-06-10 16:00:00'),(46,1,'testTask','renren',0,NULL,2,'2021-06-10 16:30:00'),(47,1,'testTask','renren',0,NULL,1,'2021-06-10 17:00:00'),(48,1,'testTask','renren',0,NULL,5,'2021-06-10 17:30:00'),(49,1,'testTask','renren',0,NULL,3,'2021-06-10 18:00:00'),(50,1,'testTask','renren',0,NULL,1,'2021-06-10 18:30:00'),(51,1,'testTask','renren',0,NULL,2,'2021-06-10 19:00:00'),(52,1,'testTask','renren',0,NULL,15,'2021-06-10 19:30:00'),(53,1,'testTask','renren',0,NULL,6,'2021-06-10 20:00:00'),(54,1,'testTask','renren',0,NULL,1,'2021-06-10 20:30:00'),(55,1,'testTask','renren',0,NULL,25,'2021-06-10 21:00:00'),(56,1,'testTask','renren',0,NULL,2,'2021-06-10 21:30:00'),(57,1,'testTask','renren',0,NULL,4,'2021-06-10 22:00:00'),(58,1,'testTask','renren',0,NULL,1,'2021-06-14 11:30:00'),(59,1,'testTask','renren',0,NULL,2,'2021-06-14 12:00:00'),(60,1,'testTask','renren',0,NULL,1,'2021-06-14 12:30:00'),(61,1,'testTask','renren',0,NULL,0,'2021-06-14 13:00:00'),(62,1,'testTask','renren',0,NULL,0,'2021-06-14 13:30:00'),(63,1,'testTask','renren',0,NULL,2,'2021-06-14 14:00:00'),(64,1,'testTask','renren',0,NULL,0,'2021-06-14 14:30:00'),(65,1,'testTask','renren',0,NULL,1,'2021-06-14 15:00:00'),(66,1,'testTask','renren',0,NULL,2,'2021-06-14 15:30:00'),(67,1,'testTask','renren',0,NULL,1,'2021-06-14 16:00:00'),(68,1,'testTask','renren',0,NULL,0,'2021-06-14 16:30:00'),(69,1,'testTask','renren',0,NULL,0,'2021-06-14 17:00:00'),(70,1,'testTask','renren',0,NULL,6,'2021-06-14 17:30:00'),(71,1,'testTask','renren',0,NULL,2,'2021-06-14 18:00:00'),(72,1,'testTask','renren',0,NULL,13,'2021-06-14 18:30:00'),(73,1,'testTask','renren',0,NULL,12,'2021-06-14 19:00:00'),(74,1,'testTask','renren',0,NULL,3,'2021-06-14 19:30:00'),(75,1,'testTask','renren',0,NULL,3,'2021-06-14 20:00:00'),(76,1,'testTask','renren',0,NULL,5,'2021-06-14 20:30:00'),(77,1,'testTask','renren',0,NULL,1,'2021-06-14 21:00:00'),(78,1,'testTask','renren',0,NULL,3,'2021-06-14 21:30:00'),(79,1,'testTask','renren',0,NULL,2,'2021-06-14 22:00:00'),(80,1,'testTask','renren',0,NULL,3,'2021-06-15 11:30:00'),(81,1,'testTask','renren',0,NULL,2,'2021-06-15 12:00:00'),(82,1,'testTask','renren',0,NULL,2,'2021-06-15 12:30:00'),(83,1,'testTask','renren',0,NULL,5,'2021-06-15 13:00:00'),(84,1,'testTask','renren',0,NULL,1,'2021-06-15 13:30:00'),(85,1,'testTask','renren',0,NULL,6,'2021-06-15 15:00:00'),(86,1,'testTask','renren',0,NULL,6,'2021-06-15 15:30:00'),(87,1,'testTask','renren',0,NULL,4,'2021-06-15 16:00:00'),(88,1,'testTask','renren',0,NULL,4,'2021-06-15 16:30:00'),(89,1,'testTask','renren',0,NULL,7,'2021-06-15 17:00:00'),(90,1,'testTask','renren',0,NULL,8,'2021-06-15 17:30:00'),(91,1,'testTask','renren',0,NULL,5,'2021-06-15 18:00:00'),(92,1,'testTask','renren',0,NULL,4,'2021-06-15 18:30:00'),(93,1,'testTask','renren',0,NULL,2,'2021-06-15 19:00:00'),(94,1,'testTask','renren',0,NULL,2,'2021-06-15 19:30:00'),(95,1,'testTask','renren',0,NULL,7,'2021-06-19 20:30:00'),(96,1,'testTask','renren',0,NULL,16,'2021-06-20 00:00:00'),(97,1,'testTask','renren',0,NULL,5,'2021-06-20 00:30:00'),(98,1,'testTask','renren',0,NULL,3,'2021-06-20 01:00:00'),(99,1,'testTask','renren',0,NULL,2,'2021-06-20 01:30:00'),(100,1,'testTask','renren',0,NULL,10,'2021-06-21 14:30:00'),(101,1,'testTask','renren',0,NULL,3,'2021-06-21 15:00:00'),(102,1,'testTask','renren',0,NULL,7,'2021-06-21 15:30:01'),(103,1,'testTask','renren',0,NULL,3,'2021-06-21 16:00:00'),(104,1,'testTask','renren',0,NULL,0,'2021-06-21 16:30:00'),(105,1,'testTask','renren',0,NULL,4,'2021-06-21 17:00:00'),(106,1,'testTask','renren',0,NULL,5,'2021-06-21 17:30:00'),(107,1,'testTask','renren',0,NULL,10,'2021-06-21 18:00:00'),(108,1,'testTask','renren',0,NULL,14,'2021-06-21 18:30:00'),(109,1,'testTask','renren',0,NULL,0,'2021-06-21 19:00:00'),(110,1,'testTask','renren',0,NULL,11,'2021-06-21 19:30:00'),(111,1,'testTask','renren',0,NULL,2,'2021-06-21 20:00:00'),(112,1,'testTask','renren',0,NULL,2,'2021-06-21 20:30:00'),(113,1,'testTask','renren',0,NULL,12,'2021-06-21 21:00:00'),(114,1,'testTask','renren',0,NULL,7,'2021-06-21 21:30:00'),(115,1,'testTask','renren',0,NULL,7,'2021-06-21 22:00:00'),(116,1,'testTask','renren',0,NULL,7,'2021-06-22 11:30:00'),(117,1,'testTask','renren',0,NULL,2,'2021-06-22 12:00:00'),(118,1,'testTask','renren',0,NULL,9,'2021-06-22 12:30:00'),(119,1,'testTask','renren',0,NULL,1,'2021-06-22 13:00:00'),(120,1,'testTask','renren',0,NULL,3,'2021-06-22 14:30:00'),(121,1,'testTask','renren',0,NULL,5,'2021-06-22 15:00:00'),(122,1,'testTask','renren',0,NULL,4,'2021-06-22 15:30:00'),(123,1,'testTask','renren',0,NULL,1,'2021-06-22 16:00:00'),(124,1,'testTask','renren',0,NULL,22,'2021-06-22 16:30:00'),(125,1,'testTask','renren',0,NULL,2,'2021-06-22 18:30:00'),(126,1,'testTask','renren',0,NULL,4,'2021-06-22 19:00:00'),(127,1,'testTask','renren',0,NULL,2,'2021-06-22 19:30:00'),(128,1,'testTask','renren',0,NULL,7,'2021-06-22 20:00:00'),(129,1,'testTask','renren',0,NULL,14,'2021-06-22 20:30:00'),(130,1,'testTask','renren',0,NULL,4,'2021-06-22 21:00:00'),(131,1,'testTask','renren',0,NULL,12,'2021-06-22 21:30:00'),(132,1,'testTask','renren',0,NULL,10,'2021-06-22 22:00:00'),(133,1,'testTask','renren',0,NULL,11,'2021-06-23 11:00:00'),(134,1,'testTask','renren',0,NULL,10,'2021-06-23 11:30:00'),(135,1,'testTask','renren',0,NULL,3,'2021-06-23 12:00:00'),(136,1,'testTask','renren',0,NULL,5,'2021-06-23 12:30:00'),(137,1,'testTask','renren',0,NULL,3,'2021-06-23 13:00:00'),(138,1,'testTask','renren',0,NULL,9,'2021-06-23 13:30:00'),(139,1,'testTask','renren',0,NULL,15,'2021-06-23 14:00:00'),(140,1,'testTask','renren',0,NULL,13,'2021-06-23 18:30:00'),(141,1,'testTask','renren',0,NULL,5,'2021-06-23 19:00:00'),(142,1,'testTask','renren',0,NULL,4,'2021-06-23 19:30:00'),(143,1,'testTask','renren',0,NULL,3,'2021-06-23 20:00:00'),(144,1,'testTask','renren',0,NULL,7,'2021-06-23 20:30:00'),(145,1,'testTask','renren',0,NULL,5,'2021-06-23 21:00:00'),(146,1,'testTask','renren',0,NULL,5,'2021-06-24 16:00:00'),(147,1,'testTask','renren',0,NULL,3,'2021-06-24 16:30:00'),(148,1,'testTask','renren',0,NULL,5,'2021-06-24 17:00:00'),(149,1,'testTask','renren',0,NULL,3,'2021-06-24 17:30:00'),(150,1,'testTask','renren',0,NULL,1,'2021-06-24 21:30:00'),(151,1,'testTask','renren',0,NULL,1,'2021-06-24 22:00:00'),(152,1,'testTask','renren',0,NULL,1,'2021-06-25 10:30:00'),(153,1,'testTask','renren',0,NULL,1,'2021-06-25 11:00:00'),(154,1,'testTask','renren',0,NULL,1,'2021-06-25 11:30:00'),(155,1,'testTask','renren',0,NULL,0,'2021-06-25 12:00:00'),(156,1,'testTask','renren',0,NULL,2,'2021-06-25 12:30:00'),(157,1,'testTask','renren',0,NULL,2,'2021-06-25 13:00:00'),(158,1,'testTask','renren',0,NULL,1,'2021-06-25 14:00:00'),(159,1,'testTask','renren',0,NULL,1,'2021-06-25 14:30:00'),(160,1,'testTask','renren',0,NULL,1,'2021-06-25 15:00:00'),(161,1,'testTask','renren',0,NULL,1,'2021-06-25 15:30:00'),(162,1,'testTask','renren',0,NULL,5,'2021-06-25 16:00:00'),(163,1,'testTask','renren',0,NULL,3,'2021-06-25 16:30:00'),(164,1,'testTask','renren',0,NULL,2,'2021-06-25 17:00:00'),(165,1,'testTask','renren',0,NULL,2,'2021-06-25 17:30:00'),(166,1,'testTask','renren',0,NULL,1,'2021-06-25 18:00:00'),(167,1,'testTask','renren',0,NULL,1,'2021-06-25 19:30:00'),(168,1,'testTask','renren',0,NULL,1,'2021-06-25 20:00:00'),(169,1,'testTask','renren',0,NULL,3,'2021-06-25 20:30:00'),(170,1,'testTask','renren',0,NULL,2,'2021-06-25 21:00:00'),(171,1,'testTask','renren',0,NULL,2,'2021-06-25 21:30:00'),(172,1,'testTask','renren',0,NULL,2,'2021-06-25 22:00:00'),(173,1,'testTask','renren',0,NULL,2,'2021-06-26 11:30:00'),(174,1,'testTask','renren',0,NULL,2,'2021-06-26 12:00:00'),(175,1,'testTask','renren',0,NULL,6,'2021-06-26 12:30:00'),(176,1,'testTask','renren',0,NULL,12,'2021-06-26 13:00:00'),(177,1,'testTask','renren',0,NULL,15,'2021-06-26 13:30:00'),(178,1,'testTask','renren',0,NULL,5,'2021-06-26 14:30:00'),(179,1,'testTask','renren',0,NULL,6,'2021-06-26 15:00:00'),(180,1,'testTask','renren',0,NULL,1,'2021-06-26 15:30:00'),(181,1,'testTask','renren',0,NULL,4,'2021-06-26 16:00:00'),(182,1,'testTask','renren',0,NULL,2,'2021-06-26 16:30:00'),(183,1,'testTask','renren',0,NULL,3,'2021-06-26 17:00:00'),(184,1,'testTask','renren',0,NULL,6,'2021-06-26 17:30:00'),(185,1,'testTask','renren',0,NULL,1,'2021-06-26 18:00:00'),(186,1,'testTask','renren',0,NULL,3,'2021-06-26 18:30:00'),(187,1,'testTask','renren',0,NULL,2,'2021-06-26 19:00:00'),(188,1,'testTask','renren',0,NULL,2,'2021-06-26 19:30:00'),(189,1,'testTask','renren',0,NULL,1,'2021-06-26 20:00:00'),(190,1,'testTask','renren',0,NULL,1,'2021-06-26 20:30:00'),(191,1,'testTask','renren',0,NULL,1,'2021-06-26 21:00:00'),(192,1,'testTask','renren',0,NULL,0,'2021-06-26 21:30:00'),(193,1,'testTask','renren',0,NULL,2,'2021-06-26 22:00:00'),(194,1,'testTask','renren',0,NULL,3,'2021-06-27 15:30:00'),(195,1,'testTask','renren',0,NULL,20,'2021-06-27 16:00:00'),(196,1,'testTask','renren',0,NULL,1,'2021-07-06 17:00:00'),(197,1,'testTask','renren',0,NULL,2,'2021-07-06 17:30:00'),(198,1,'testTask','renren',0,NULL,1,'2021-07-06 18:00:00'),(199,1,'testTask','renren',0,NULL,1,'2021-07-06 18:30:00'),(200,1,'testTask','renren',0,NULL,2,'2021-07-06 19:00:00'),(201,1,'testTask','renren',0,NULL,1,'2021-07-06 19:30:00'),(202,1,'testTask','renren',0,NULL,2,'2021-07-06 20:00:00'),(203,1,'testTask','renren',0,NULL,1,'2021-07-06 20:30:00'),(204,1,'testTask','renren',0,NULL,1,'2021-07-06 21:00:00'),(205,1,'testTask','renren',0,NULL,1,'2021-07-06 21:30:00'),(206,1,'testTask','renren',0,NULL,1,'2021-07-06 22:00:00'),(207,1,'testTask','renren',0,NULL,0,'2021-07-06 22:30:00'),(208,1,'testTask','renren',0,NULL,1,'2021-07-06 23:00:00'),(209,1,'testTask','renren',0,NULL,1,'2021-07-06 23:30:00'),(210,1,'testTask','renren',0,NULL,4,'2021-07-07 00:00:00'),(211,1,'testTask','renren',0,NULL,1,'2021-07-08 18:00:00'),(212,1,'testTask','renren',0,NULL,1,'2021-07-08 18:30:00'),(213,1,'testTask','renren',0,NULL,2,'2021-07-08 19:00:00'),(214,1,'testTask','renren',0,NULL,1,'2021-07-08 19:30:00'),(215,1,'testTask','renren',0,NULL,1,'2021-07-08 20:00:00'),(216,1,'testTask','renren',0,NULL,1,'2021-07-08 20:30:00'),(217,1,'testTask','renren',0,NULL,1,'2021-07-08 21:00:00'),(218,1,'testTask','renren',0,NULL,1,'2021-07-08 21:30:00'),(219,1,'testTask','renren',0,NULL,1,'2021-07-08 22:00:00'),(220,1,'testTask','renren',0,NULL,1,'2021-07-08 22:30:00'),(221,1,'testTask','renren',0,NULL,0,'2021-07-08 23:00:00'),(222,1,'testTask','renren',0,NULL,2,'2021-07-08 23:30:00'),(223,1,'testTask','renren',0,NULL,57,'2021-07-09 00:00:00'),(224,1,'testTask','renren',0,NULL,3,'2021-07-09 00:30:00'),(225,1,'testTask','renren',0,NULL,1,'2021-07-09 01:00:00'),(226,1,'testTask','renren',0,NULL,2,'2021-07-09 11:30:00'),(227,1,'testTask','renren',0,NULL,2,'2021-07-09 12:00:00'),(228,1,'testTask','renren',0,NULL,1,'2021-07-09 12:30:00'),(229,1,'testTask','renren',0,NULL,3,'2021-07-09 13:00:00'),(230,1,'testTask','renren',0,NULL,1,'2021-07-09 13:30:00'),(231,1,'testTask','renren',0,NULL,2,'2021-07-09 14:00:00'),(232,1,'testTask','renren',0,NULL,2,'2021-07-09 14:30:00'),(233,1,'testTask','renren',0,NULL,1,'2021-07-09 15:00:00'),(234,1,'testTask','renren',0,NULL,3,'2021-07-09 15:30:00'),(235,1,'testTask','renren',0,NULL,1,'2021-07-09 18:30:00'),(236,1,'testTask','renren',0,NULL,1,'2021-07-09 19:00:00'),(237,1,'testTask','renren',0,NULL,2,'2021-07-09 19:30:00'),(238,1,'testTask','renren',0,NULL,2,'2021-07-09 20:00:00'),(239,1,'testTask','renren',0,NULL,1,'2021-07-09 20:30:00'),(240,1,'testTask','renren',0,NULL,1,'2021-07-09 21:00:00'),(241,1,'testTask','renren',0,NULL,4,'2021-07-09 21:30:00'),(242,1,'testTask','renren',0,NULL,2,'2021-07-09 22:00:00'),(243,1,'testTask','renren',0,NULL,0,'2021-07-09 22:30:00'),(244,1,'testTask','renren',0,NULL,2,'2021-07-09 23:00:00'),(245,1,'testTask','renren',0,NULL,1,'2021-07-10 12:30:00'),(246,1,'testTask','renren',0,NULL,1,'2021-07-10 13:00:00'),(247,1,'testTask','renren',0,NULL,1,'2021-07-10 13:30:00'),(248,1,'testTask','renren',0,NULL,3,'2021-07-10 14:00:00'),(249,1,'testTask','renren',0,NULL,1,'2021-07-10 14:30:00'),(250,1,'testTask','renren',0,NULL,1,'2021-07-10 15:00:00'),(251,1,'testTask','renren',0,NULL,4,'2021-07-10 15:30:00'),(252,1,'testTask','renren',0,NULL,4,'2021-07-10 16:00:00'),(253,1,'testTask','renren',0,NULL,0,'2021-07-16 17:00:00'),(254,1,'testTask','renren',0,NULL,9,'2021-07-16 17:30:00'),(255,1,'testTask','renren',0,NULL,3,'2021-07-16 18:00:00'),(256,1,'testTask','renren',0,NULL,4,'2021-07-16 18:30:00'),(257,1,'testTask','renren',0,NULL,2,'2021-07-16 19:00:00'),(258,1,'testTask','renren',0,NULL,1,'2021-07-16 19:30:00'),(259,1,'testTask','renren',0,NULL,0,'2021-07-16 20:00:00'),(260,1,'testTask','renren',0,NULL,3,'2021-07-16 20:30:00'),(261,1,'testTask','renren',0,NULL,1,'2021-07-16 21:00:00'),(262,1,'testTask','renren',0,NULL,3,'2021-07-16 21:30:00'),(263,1,'testTask','renren',0,NULL,2,'2021-07-16 22:00:00'),(264,1,'testTask','renren',0,NULL,1,'2021-07-16 22:30:00'),(265,1,'testTask','renren',0,NULL,4,'2021-07-16 23:00:00'),(266,1,'testTask','renren',0,NULL,2,'2021-07-16 23:30:00'),(267,1,'testTask','renren',0,NULL,7,'2021-07-17 12:00:00'),(268,1,'testTask','renren',0,NULL,4,'2021-07-17 12:30:00'),(269,1,'testTask','renren',0,NULL,0,'2021-07-17 13:00:00'),(270,1,'testTask','renren',0,NULL,0,'2021-07-17 13:30:00'),(271,1,'testTask','renren',0,NULL,3,'2021-07-17 14:00:00'),(272,1,'testTask','renren',0,NULL,1,'2021-07-17 14:30:00'),(273,1,'testTask','renren',0,NULL,5,'2021-07-17 15:00:00'),(274,1,'testTask','renren',0,NULL,2,'2021-07-17 15:30:00'),(275,1,'testTask','renren',0,NULL,3,'2021-07-17 16:00:00'),(276,1,'testTask','renren',0,NULL,1,'2021-07-17 16:30:00'),(277,1,'testTask','renren',0,NULL,3,'2021-07-17 17:00:00'),(278,1,'testTask','renren',0,NULL,2,'2021-07-17 17:30:00'),(279,1,'testTask','renren',0,NULL,1,'2021-07-17 18:00:00'),(280,1,'testTask','renren',0,NULL,5,'2021-07-17 18:30:00'),(281,1,'testTask','renren',0,NULL,16,'2021-07-17 19:00:00'),(282,1,'testTask','renren',0,NULL,4,'2021-07-17 19:30:00'),(283,1,'testTask','renren',0,NULL,2,'2021-07-17 20:00:00'),(284,1,'testTask','renren',0,NULL,1,'2021-07-17 20:30:00'),(285,1,'testTask','renren',0,NULL,2,'2021-07-17 21:00:00'),(286,1,'testTask','renren',0,NULL,11,'2021-07-17 21:30:00'),(287,1,'testTask','renren',0,NULL,2,'2021-07-17 22:00:00'),(288,1,'testTask','renren',0,NULL,5,'2021-07-17 22:30:00'),(289,1,'testTask','renren',0,NULL,1,'2021-07-17 23:00:00'),(290,1,'testTask','renren',0,NULL,3,'2021-07-17 23:30:00'),(291,1,'testTask','renren',0,NULL,24,'2021-07-18 00:00:00'),(292,1,'testTask','renren',0,NULL,5,'2021-07-18 00:30:00'),(293,1,'testTask','renren',0,NULL,2,'2021-07-18 10:02:06'),(294,1,'testTask','renren',0,NULL,3,'2021-07-18 10:30:00'),(295,1,'testTask','renren',0,NULL,2,'2021-07-18 11:00:00'),(296,1,'testTask','renren',0,NULL,3,'2021-07-18 11:30:00'),(297,1,'testTask','renren',0,NULL,2,'2021-07-18 12:00:00'),(298,1,'testTask','renren',0,NULL,2,'2021-07-18 12:30:00'),(299,1,'testTask','renren',0,NULL,0,'2021-07-18 13:00:00'),(300,1,'testTask','renren',0,NULL,1,'2021-07-18 13:30:00'),(301,1,'testTask','renren',0,NULL,3,'2021-07-18 14:00:00'),(302,1,'testTask','renren',0,NULL,5,'2021-07-18 14:30:00'),(303,1,'testTask','renren',0,NULL,2,'2021-07-18 15:00:00'),(304,1,'testTask','renren',0,NULL,5,'2021-07-18 15:30:00'),(305,1,'testTask','renren',0,NULL,25,'2021-07-18 16:00:00'),(306,1,'testTask','renren',0,NULL,14,'2021-07-18 17:00:00'),(307,1,'testTask','renren',0,NULL,11,'2021-07-18 17:30:00'),(308,1,'testTask','renren',0,NULL,8,'2021-07-18 18:00:00');
/*!40000 ALTER TABLE `schedule_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_captcha`
--

DROP TABLE IF EXISTS `sys_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_captcha`
--

LOCK TABLES `sys_captcha` WRITE;
/*!40000 ALTER TABLE `sys_captcha` DISABLE KEYS */;
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('15c43de6-5b07-4cfe-8eef-64701f2c8dd5','y35n6','2021-06-08 12:29:16'),('1e2ffd6a-004e-4f9f-867b-1a719e2c9ac2','ycyap','2021-06-14 21:54:24'),('242eba35-2a2a-46d7-8010-c265680283d8','854x8','2021-06-08 20:58:29'),('25389dd1-4f11-4f07-8e3c-827132e17d72','wnam2','2021-06-10 14:09:40'),('2c4d1a94-93bd-4208-8efe-2141764057c0','mc7ga','2021-06-08 20:58:11'),('4bd05dc0-487b-413f-80ff-68110ddbb71b','5dxfx','2021-07-08 18:37:47'),('598e27c5-bddf-411e-8723-7e4320076c3e','3dnce','2021-06-14 12:10:17'),('7203880a-2baa-4007-8c7d-3057bab20598','25fc7','2021-06-14 12:07:03'),('78ec9ac8-0740-4467-8a6f-40b385e9236d','77wnp','2021-06-14 21:54:25'),('7a199523-f985-4010-88c3-ec43647c8905','y484p','2021-06-14 20:50:43'),('800022c7-5469-481e-8740-e025b96d2902','53pya','2021-06-08 20:58:58'),('9717a271-09ac-4651-8896-e68ecb61f372','c8mx2','2021-06-26 12:14:45'),('a4275c72-d6b8-4ff9-8e54-e3560f801698','4nnyy','2021-06-14 12:12:33'),('abafec56-da20-4c07-8df2-1c9eeaa99342','f32yc','2021-06-09 11:38:48'),('ae9a90cf-0d3d-42b7-8b70-f5b9db8fc77d','m8aen','2021-06-26 22:15:28'),('b394972d-55fb-4d01-87d2-dc132c12b165','m646y','2021-06-27 15:13:33'),('b7a1fca0-c2f7-4c33-8040-324b47251f12','5n8p2','2021-06-06 21:56:50'),('cad06436-58a4-4b76-8f5b-46b491921131','658m2','2021-06-08 20:58:14'),('d5886d93-b3c6-44d5-87a2-2be82b5dc97e','873ny','2021-06-14 12:12:23'),('e3644e51-5c14-4247-8a4f-7aabe789473e','463mp','2021-06-14 12:05:41'),('eb7434b7-5486-4ce8-8bac-b6db89975b76','wwmy8','2021-06-14 12:09:27'),('s','3cann','2021-06-08 15:59:17'),('s2','ecnb5','2021-06-08 20:48:47');
/*!40000 ALTER TABLE `sys_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统配置信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` (`id`, `param_key`, `param_value`, `status`, `remark`) VALUES (1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'云存储配置信息');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (1,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":31,\"parentId\":0,\"name\":\"商品系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"editor\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2021-06-08 14:42:40'),(2,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":32,\"parentId\":31,\"name\":\"分类维护\",\"url\":\"product/category\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]',11,'0:0:0:0:0:0:0:1','2021-06-08 14:43:56'),(3,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":33,\"parentId\":31,\"name\":\"品牌管理\",\"url\":\"product/brand\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]',63,'0:0:0:0:0:0:0:1','2021-06-09 22:03:32');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (1,0,'系统管理',NULL,NULL,0,'system',0),(2,1,'管理员列表','sys/user',NULL,1,'admin',1),(3,1,'角色管理','sys/role',NULL,1,'role',2),(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),(5,1,'SQL监控','http://localhost:8080/renren-fast/druid/sql.html',NULL,1,'sql',4),(6,1,'定时任务','job/schedule',NULL,1,'job',5),(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),(27,1,'参数管理','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),(29,1,'系统日志','sys/log','sys:log:list',1,'log',7),(30,1,'文件上传','oss/oss','sys:oss:all',1,'oss',6),(31,0,'商品系统','','',0,'editor',0),(32,31,'分类维护','product/category','',1,'menu',0),(34,31,'品牌管理','product/brand','',1,'editor',0),(37,31,'平台属性','','',0,'system',0),(38,37,'属性分组','product/attrgroup','',1,'tubiao',0),(39,37,'规格参数','product/baseattr','',1,'log',0),(40,37,'销售属性','product/saleattr','',1,'zonghe',0),(41,31,'商品维护','product/spu','',0,'zonghe',0),(42,0,'优惠营销','','',0,'mudedi',0),(43,0,'库存系统','','',0,'shouye',0),(44,0,'订单系统','','',0,'config',0),(45,0,'用户系统','','',0,'admin',0),(46,0,'内容管理','','',0,'sousuo',0),(47,42,'优惠券管理','coupon/coupon','',1,'zhedie',0),(48,42,'发放记录','coupon/history','',1,'sql',0),(49,42,'专题活动','coupon/subject','',1,'tixing',0),(50,42,'秒杀活动','coupon/seckill','',1,'daohang',0),(51,42,'积分维护','coupon/bounds','',1,'geren',0),(52,42,'满减折扣','coupon/full','',1,'shoucang',0),(53,43,'仓库维护','ware/wareinfo','',1,'shouye',0),(54,43,'库存工作单','ware/task','',1,'log',0),(55,43,'商品库存','ware/sku','',1,'jiesuo',0),(56,44,'订单查询','order/order','',1,'zhedie',0),(57,44,'退货单处理','order/return','',1,'shanchu',0),(58,44,'等级规则','order/settings','',1,'system',0),(59,44,'支付流水查询','order/payment','',1,'job',0),(60,44,'退款流水查询','order/refund','',1,'mudedi',0),(61,45,'会员列表','member/member','',1,'geren',0),(62,45,'会员等级','member/level','',1,'tubiao',0),(63,45,'积分变化','member/growth','',1,'bianji',0),(64,45,'统计信息','member/statistics','',1,'sql',0),(65,46,'首页推荐','content/index','',1,'shouye',0),(66,46,'分类热门','content/category','',1,'zhedie',0),(67,46,'评论管理','content/comments','',1,'pinglun',0),(68,41,'spu管理','product/spu','',1,'config',0),(69,41,'发布商品','product/spuadd','',1,'bianji',0),(70,43,'采购单维护','','',0,'tubiao',0),(71,70,'采购需求','ware/purchaseitem','',1,'editor',0),(72,70,'采购单','ware/purchase','',1,'menu',0),(73,41,'商品管理','product/manager','',1,'zonghe',0),(74,42,'会员价格','coupon/memberprice','',1,'admin',0),(75,42,'每日秒杀','coupon/seckillsession','',1,'job',0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件上传';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

LOCK TABLES `sys_oss` WRITE;
/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `salt`, `email`, `mobile`, `status`, `create_user_id`, `create_time`) VALUES (1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','root@renren.io','13612345678',1,1,'2016-11-11 11:11:11');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_token`
--

DROP TABLE IF EXISTS `sys_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_token` (
  `user_id` bigint NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户Token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_token`
--

LOCK TABLES `sys_user_token` WRITE;
/*!40000 ALTER TABLE `sys_user_token` DISABLE KEYS */;
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (1,'4698fa37e8fe41d1226ccf268ef1db90','2021-07-19 05:37:48','2021-07-18 17:37:48');
/*!40000 ALTER TABLE `sys_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`user_id`, `username`, `mobile`, `password`, `create_time`) VALUES (1,'mark','13612345678','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `kkmall_oms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `kkmall_oms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `kkmall_oms`;

--
-- Table structure for table `mq_message`
--

DROP TABLE IF EXISTS `mq_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mq_message` (
  `message_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'JSON',
  `to_exchange` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `class_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message_status` int DEFAULT '0' COMMENT '0-新建 1-已发送 2-错误抵达 3-已抵达',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mq_message`
--

LOCK TABLES `mq_message` WRITE;
/*!40000 ALTER TABLE `mq_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `mq_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order`
--

DROP TABLE IF EXISTS `oms_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint DEFAULT NULL COMMENT 'member_id',
  `order_sn` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号',
  `coupon_id` bigint DEFAULT NULL COMMENT '使用的优惠券',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `member_username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `total_amount` decimal(18,4) DEFAULT NULL COMMENT '订单总额',
  `pay_amount` decimal(18,4) DEFAULT NULL COMMENT '应付总额',
  `freight_amount` decimal(18,4) DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(18,4) DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(18,4) DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(18,4) DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(18,4) DEFAULT NULL COMMENT '后台调整订单使用的折扣金额',
  `pay_type` tinyint DEFAULT NULL COMMENT '支付方式【1->支付宝；2->微信；3->银联； 4->货到付款；】',
  `source_type` tinyint DEFAULT NULL COMMENT '订单来源[0->PC订单；1->app订单]',
  `status` tinyint DEFAULT NULL COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
  `delivery_company` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int DEFAULT NULL COMMENT '可以获得的成长值',
  `bill_type` tinyint DEFAULT NULL COMMENT '发票类型[0->不开发票；1->电子发票；2->纸质发票]',
  `bill_header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单备注',
  `confirm_status` tinyint DEFAULT NULL COMMENT '确认收货状态[0->未确认；1->已确认]',
  `delete_status` tinyint DEFAULT NULL COMMENT '删除状态【0->未删除；1->已删除】',
  `use_integration` int DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12962 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order`
--

LOCK TABLES `oms_order` WRITE;
/*!40000 ALTER TABLE `oms_order` DISABLE KEYS */;
INSERT INTO `oms_order` (`id`, `member_id`, `order_sn`, `coupon_id`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES (4,14,'202107131708162051414874305601388545',NULL,'2021-07-13 17:08:16','kirklin',6299.0000,6302.0000,3.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,0,NULL,NULL,7,0,0,NULL,NULL,NULL,NULL,'xxx@gmail.com','LinKirk','15980253623',NULL,'湖北','武汉',NULL,'洪山区',NULL,NULL,0,NULL,NULL,'2021-07-13 17:08:16','2021-07-13 17:08:16','2021-07-13 17:08:16','2021-07-13 17:08:16'),(5,14,'202107141621177441415224871993171969',NULL,'2021-07-14 16:21:18','kirklin',6299.0000,6302.0000,3.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,4,NULL,NULL,7,0,0,NULL,NULL,NULL,NULL,'xxx@gmail.com','LinKirk','15980253623',NULL,'湖北','武汉',NULL,'洪山区',NULL,NULL,0,NULL,NULL,'2021-07-14 16:21:18','2021-07-14 16:21:18','2021-07-14 16:21:18','2021-07-14 16:21:18'),(6,14,'202107141934079151415273400811823105',NULL,'2021-07-14 19:34:08','kirklin',6299.0000,6302.0000,3.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,4,NULL,NULL,7,0,0,NULL,NULL,NULL,NULL,'xxx@gmail.com','LinKirk','15980253623',NULL,'湖北','武汉',NULL,'洪山区',NULL,NULL,0,NULL,NULL,'2021-07-14 19:34:08','2021-07-14 19:34:08','2021-07-14 19:34:08','2021-07-14 19:34:08'),(7,14,'202107150016360101415344486266118146',NULL,'2021-07-15 00:16:36','kirklin',6299.0000,6305.0000,6.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,4,NULL,NULL,7,0,0,NULL,NULL,NULL,NULL,'xxx@gmail.com','LinKirk','15980253666',NULL,'湖北','武汉',NULL,'洪山区',NULL,NULL,0,NULL,NULL,'2021-07-15 00:16:36','2021-07-15 00:16:36','2021-07-15 00:16:36','2021-07-15 00:16:36'),(8,14,'202107161613374701415947717195235330',NULL,'2021-07-16 16:13:37','kirklin',5999.0000,6005.0000,6.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,1,NULL,NULL,7,0,0,NULL,NULL,NULL,NULL,'xxx@gmail.com','LinKirk','15980253666',NULL,'湖北','武汉',NULL,'洪山区',NULL,NULL,0,NULL,NULL,'2021-07-16 16:13:37','2021-07-16 16:13:37','2021-07-16 16:13:37','2021-07-16 16:13:38'),(9,14,'202107181552570501416667290227900418',NULL,'2021-07-18 15:52:57','kirklin',6299.0000,6305.0000,6.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,4,NULL,NULL,7,0,0,NULL,NULL,NULL,NULL,'xxx@gmail.com','LinKirk','15980253666',NULL,'湖北','武汉',NULL,'洪山区',NULL,NULL,0,NULL,NULL,'2021-07-18 15:52:57','2021-07-18 15:52:57','2021-07-18 15:52:57','2021-07-18 15:52:57'),(12960,14,'2021071816484896414166813492077690896',NULL,'2021-07-18 16:48:49',NULL,5000.0000,5000.0000,NULL,NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12961,14,'202107181734206321416692806616023042',NULL,'2021-07-18 17:34:21','kirklin',12598.0000,12601.0000,3.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,4,NULL,NULL,7,0,0,NULL,NULL,NULL,NULL,'xxx@gmail.com','LinKirk','15980253623',NULL,'湖北','武汉',NULL,'洪山区',NULL,NULL,0,NULL,NULL,'2021-07-18 17:34:21','2021-07-18 17:34:21','2021-07-18 17:34:21','2021-07-18 17:34:21');
/*!40000 ALTER TABLE `oms_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order_item`
--

DROP TABLE IF EXISTS `oms_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint DEFAULT NULL COMMENT 'order_id',
  `order_sn` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'order_sn',
  `spu_id` bigint DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'spu_name',
  `spu_pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'spu_pic',
  `spu_brand` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '品牌',
  `category_id` bigint DEFAULT NULL COMMENT '商品分类id',
  `sku_id` bigint DEFAULT NULL COMMENT '商品sku编号',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品sku名字',
  `sku_pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品sku图片',
  `sku_price` decimal(18,4) DEFAULT NULL COMMENT '商品sku价格',
  `sku_quantity` int DEFAULT NULL COMMENT '商品购买的数量',
  `sku_attrs_vals` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品销售属性组合（JSON）',
  `promotion_amount` decimal(18,4) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(18,4) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(18,4) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(18,4) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int DEFAULT NULL COMMENT '赠送积分',
  `gift_growth` int DEFAULT NULL COMMENT '赠送成长值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单项信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order_item`
--

LOCK TABLES `oms_order_item` WRITE;
/*!40000 ALTER TABLE `oms_order_item` DISABLE KEYS */;
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `spu_id`, `spu_name`, `spu_pic`, `spu_brand`, `category_id`, `sku_id`, `sku_name`, `sku_pic`, `sku_price`, `sku_quantity`, `sku_attrs_vals`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`) VALUES (5,4,'202107131708162051414874305601388545',11,'华为 HUAWEI Mate 30 Pro',NULL,'9',225,1,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',6299.0000,1,'',0.0000,0.0000,0.0000,6299.0000,6299,6299),(6,5,'202107141621177441415224871993171969',11,'华为 HUAWEI Mate 30 Pro',NULL,'9',225,1,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',6299.0000,1,'',0.0000,0.0000,0.0000,6299.0000,6299,6299),(7,6,'202107141934079151415273400811823105',11,'华为 HUAWEI Mate 30 Pro',NULL,'9',225,1,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',6299.0000,1,'',0.0000,0.0000,0.0000,6299.0000,6299,6299),(8,7,'202107150016360101415344486266118146',11,'华为 HUAWEI Mate 30 Pro',NULL,'9',225,1,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',6299.0000,1,'',0.0000,0.0000,0.0000,6299.0000,6299,6299),(9,8,'202107161613374701415947717195235330',13,' Apple iPhone 11 (A2223) ',NULL,'12',225,9,' Apple iPhone 11 (A2223)  黑色 128GB 移动联通电信4G手机 双卡双待 最后几件优惠','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',5999.0000,1,'',0.0000,0.0000,0.0000,5999.0000,5999,5999),(10,9,'202107181552570501416667290227900418',11,'华为 HUAWEI Mate 30 Pro',NULL,'9',225,1,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',6299.0000,1,'',0.0000,0.0000,0.0000,6299.0000,6299,6299),(11,12960,'2021071816484896414166813492077690896',11,'华为 HUAWEI Mate 30 Pro',NULL,'9',225,NULL,NULL,NULL,NULL,1,NULL,0.0000,0.0000,0.0000,5000.0000,5000,5000),(12,12961,'202107181734206321416692806616023042',11,'华为 HUAWEI Mate 30 Pro',NULL,'9',225,1,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',6299.0000,2,'',0.0000,0.0000,0.0000,12598.0000,12598,12598);
/*!40000 ALTER TABLE `oms_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order_operate_history`
--

DROP TABLE IF EXISTS `oms_order_operate_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order_operate_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作人[用户；系统；后台管理员]',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` tinyint DEFAULT NULL COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单操作历史记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order_operate_history`
--

LOCK TABLES `oms_order_operate_history` WRITE;
/*!40000 ALTER TABLE `oms_order_operate_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `oms_order_operate_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order_return_apply`
--

DROP TABLE IF EXISTS `oms_order_return_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order_return_apply` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint DEFAULT NULL COMMENT 'order_id',
  `sku_id` bigint DEFAULT NULL COMMENT '退货商品id',
  `order_sn` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(18,4) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退货人电话',
  `status` tinyint(1) DEFAULT NULL COMMENT '申请状态[0->待处理；1->退货中；2->已完成；3->已拒绝]',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `sku_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品图片',
  `sku_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `sku_brand` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品品牌',
  `sku_attrs_vals` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '商品销售属性(JSON)',
  `sku_count` int DEFAULT NULL COMMENT '退货数量',
  `sku_price` decimal(18,4) DEFAULT NULL COMMENT '商品单价',
  `sku_real_price` decimal(18,4) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '原因',
  `description述` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `desc_pics` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货备注',
  `receive_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货电话',
  `company_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司收货地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单退货申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order_return_apply`
--

LOCK TABLES `oms_order_return_apply` WRITE;
/*!40000 ALTER TABLE `oms_order_return_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `oms_order_return_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order_return_reason`
--

DROP TABLE IF EXISTS `oms_order_return_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order_return_reason` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退货原因名',
  `sort` int DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='退货原因';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order_return_reason`
--

LOCK TABLES `oms_order_return_reason` WRITE;
/*!40000 ALTER TABLE `oms_order_return_reason` DISABLE KEYS */;
/*!40000 ALTER TABLE `oms_order_return_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_order_setting`
--

DROP TABLE IF EXISTS `oms_order_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_order_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `flash_order_overtime` int DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int DEFAULT NULL COMMENT '自动完成交易时间，不能申请退货（天）',
  `comment_overtime` int DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  `member_level` tinyint DEFAULT NULL COMMENT '会员等级【0-不限会员等级，全部通用；其他-对应的其他会员等级】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='订单配置信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_order_setting`
--

LOCK TABLES `oms_order_setting` WRITE;
/*!40000 ALTER TABLE `oms_order_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `oms_order_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_payment_info`
--

DROP TABLE IF EXISTS `oms_payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_payment_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_sn` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单号（对外业务号）',
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `alipay_trade_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付宝交易流水号',
  `total_amount` decimal(18,4) DEFAULT NULL COMMENT '支付总金额',
  `subject` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '交易内容',
  `payment_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认时间',
  `callback_content` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '回调内容',
  `callback_time` datetime DEFAULT NULL COMMENT '回调时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id` (`order_id`) USING BTREE,
  UNIQUE KEY `alipay_trade_no` (`alipay_trade_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='支付信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_payment_info`
--

LOCK TABLES `oms_payment_info` WRITE;
/*!40000 ALTER TABLE `oms_payment_info` DISABLE KEYS */;
INSERT INTO `oms_payment_info` (`id`, `order_sn`, `order_id`, `alipay_trade_no`, `total_amount`, `subject`, `payment_status`, `create_time`, `confirm_time`, `callback_content`, `callback_time`) VALUES (2,'202107161613374701415947717195235330',NULL,'2021071622001450870501339571',6005.0000,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oms_payment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oms_refund_info`
--

DROP TABLE IF EXISTS `oms_refund_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oms_refund_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_return_id` bigint DEFAULT NULL COMMENT '退款的订单',
  `refund` decimal(18,4) DEFAULT NULL COMMENT '退款金额',
  `refund_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款交易流水号',
  `refund_status` tinyint(1) DEFAULT NULL COMMENT '退款状态',
  `refund_channel` tinyint DEFAULT NULL COMMENT '退款渠道[1-支付宝，2-微信，3-银联，4-汇款]',
  `refund_content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='退款信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oms_refund_info`
--

LOCK TABLES `oms_refund_info` WRITE;
/*!40000 ALTER TABLE `oms_refund_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `oms_refund_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `kkmall_pms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `kkmall_pms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `kkmall_pms`;

--
-- Table structure for table `pms_attr`
--

DROP TABLE IF EXISTS `pms_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_attr` (
  `attr_id` bigint NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` char(30) DEFAULT NULL COMMENT '属性名',
  `search_type` tinyint DEFAULT NULL COMMENT '是否需要检索[0-不需要，1-需要]',
  `value_type` tinyint DEFAULT NULL COMMENT '值类型[0-为单个值，1-可以选择多个值]',
  `icon` varchar(255) DEFAULT NULL COMMENT '属性图标',
  `value_select` char(255) DEFAULT NULL COMMENT '可选值列表[用逗号分隔]',
  `attr_type` tinyint DEFAULT NULL COMMENT '属性类型[0-销售属性，1-基本属性',
  `enable` bigint DEFAULT NULL COMMENT '启用状态[0 - 禁用，1 - 启用]',
  `catelog_id` bigint DEFAULT NULL COMMENT '所属分类',
  `show_desc` tinyint DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】，在sku中仍然可以调整',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_attr`
--

LOCK TABLES `pms_attr` WRITE;
/*!40000 ALTER TABLE `pms_attr` DISABLE KEYS */;
INSERT INTO `pms_attr` (`attr_id`, `attr_name`, `search_type`, `value_type`, `icon`, `value_select`, `attr_type`, `enable`, `catelog_id`, `show_desc`) VALUES (7,'入网型号',0,0,'xxx','A2217;C3J;以官网信息为准',1,1,225,0),(8,'上市年份',0,0,'xxx','2018;2019',1,1,225,0),(9,'颜色',0,0,'xxx','黑色;白色;蓝色',0,1,225,0),(10,'内存',0,0,'xxx','4GB;6GB;8GB;12GB',0,1,225,0),(11,'机身颜色',0,0,'xxx','黑色;白色',1,1,225,1),(12,'版本',0,0,'xxx','',0,1,225,0),(13,'机身长度（mm）',0,0,'xx','158.3;135.9',1,1,225,0),(14,'机身材质工艺',0,1,'xxx','以官网信息为准;陶瓷;玻璃',1,1,225,0),(15,'CPU品牌',1,0,'xxx','高通(Qualcomm);海思（Hisilicon）;以官网信息为准',1,1,225,1),(16,'CPU型号',1,0,'xxx','骁龙665;骁龙845;骁龙855;骁龙730;HUAWEI Kirin 980;HUAWEI Kirin 970',1,1,225,0);
/*!40000 ALTER TABLE `pms_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_attr_attrgroup_relation`
--

DROP TABLE IF EXISTS `pms_attr_attrgroup_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_attr_attrgroup_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attr_id` bigint DEFAULT NULL COMMENT '属性id',
  `attr_group_id` bigint DEFAULT NULL COMMENT '属性分组id',
  `attr_sort` int DEFAULT NULL COMMENT '属性组内排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='属性&属性分组关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_attr_attrgroup_relation`
--

LOCK TABLES `pms_attr_attrgroup_relation` WRITE;
/*!40000 ALTER TABLE `pms_attr_attrgroup_relation` DISABLE KEYS */;
INSERT INTO `pms_attr_attrgroup_relation` (`id`, `attr_id`, `attr_group_id`, `attr_sort`) VALUES (23,7,1,NULL),(26,11,2,NULL),(27,13,2,NULL),(28,14,2,NULL),(29,15,7,NULL),(30,16,7,NULL),(31,8,1,0);
/*!40000 ALTER TABLE `pms_attr_attrgroup_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_attr_group`
--

DROP TABLE IF EXISTS `pms_attr_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_attr_group` (
  `attr_group_id` bigint NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `attr_group_name` char(20) DEFAULT NULL COMMENT '组名',
  `sort` int DEFAULT NULL COMMENT '排序',
  `descript` varchar(255) DEFAULT NULL COMMENT '描述',
  `icon` varchar(255) DEFAULT NULL COMMENT '组图标',
  `catelog_id` bigint DEFAULT NULL COMMENT '所属分类id',
  PRIMARY KEY (`attr_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='属性分组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_attr_group`
--

LOCK TABLES `pms_attr_group` WRITE;
/*!40000 ALTER TABLE `pms_attr_group` DISABLE KEYS */;
INSERT INTO `pms_attr_group` (`attr_group_id`, `attr_group_name`, `sort`, `descript`, `icon`, `catelog_id`) VALUES (1,'主体',0,'主体','dd',225),(2,'基本信息',0,'基本信息','xx',225),(4,'屏幕',0,'屏幕','xx',233),(7,'主芯片',0,'主芯片','xx',225);
/*!40000 ALTER TABLE `pms_attr_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_brand`
--

DROP TABLE IF EXISTS `pms_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_brand` (
  `brand_id` bigint NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` char(50) DEFAULT NULL COMMENT '品牌名',
  `logo` varchar(2000) DEFAULT NULL COMMENT '品牌logo地址',
  `descript` longtext COMMENT '介绍',
  `show_status` tinyint DEFAULT NULL COMMENT '显示状态[0-不显示；1-显示]',
  `first_letter` char(1) DEFAULT NULL COMMENT '检索首字母',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='品牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_brand`
--

LOCK TABLES `pms_brand` WRITE;
/*!40000 ALTER TABLE `pms_brand` DISABLE KEYS */;
INSERT INTO `pms_brand` (`brand_id`, `name`, `logo`, `descript`, `show_status`, `first_letter`, `sort`) VALUES (9,'华为','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/de2426bd-a689-41d0-865a-d45d1afa7cde_huawei.png','华为',1,'H',1),(10,'小米','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/1f9e6968-cf92-462e-869a-4c2331a4113f_xiaomi.png','小米',1,'M',1),(11,'oppo','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/5c8303f2-8b0c-4a5b-89a6-86513133d758_oppo.png','oppo',1,'O',1),(12,'Apple','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/819bb0b1-3ed8-4072-8304-78811a289781_apple.png','苹果',1,'A',1);
/*!40000 ALTER TABLE `pms_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_category`
--

DROP TABLE IF EXISTS `pms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_category` (
  `cat_id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` char(50) DEFAULT NULL COMMENT '分类名称',
  `parent_cid` bigint DEFAULT NULL COMMENT '父分类id',
  `cat_level` int DEFAULT NULL COMMENT '层级',
  `show_status` tinyint DEFAULT NULL COMMENT '是否显示[0-不显示，1显示]',
  `sort` int DEFAULT NULL COMMENT '排序',
  `icon` char(255) DEFAULT NULL COMMENT '图标地址',
  `product_unit` char(50) DEFAULT NULL COMMENT '计量单位',
  `product_count` int DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`cat_id`),
  KEY `parent_cid` (`parent_cid`)
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品三级分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_category`
--

LOCK TABLES `pms_category` WRITE;
/*!40000 ALTER TABLE `pms_category` DISABLE KEYS */;
INSERT INTO `pms_category` (`cat_id`, `name`, `parent_cid`, `cat_level`, `show_status`, `sort`, `icon`, `product_unit`, `product_count`) VALUES (1,'图书、音像、电子书刊',0,1,1,0,NULL,NULL,0),(2,'手机',0,1,1,0,'111q',NULL,0),(3,'家用电器',0,1,1,0,'aaa',NULL,0),(4,'数码',0,1,1,0,'aaa',NULL,0),(5,'家居家装',0,1,1,0,NULL,NULL,0),(6,'电脑办公',0,1,1,0,NULL,NULL,0),(7,'厨具',0,1,1,0,NULL,NULL,0),(8,'个护化妆',0,1,1,0,NULL,NULL,0),(9,'服饰内衣',0,1,1,0,NULL,NULL,0),(10,'钟表',0,1,1,0,NULL,NULL,0),(11,'鞋靴',0,1,1,0,NULL,NULL,0),(12,'母婴',0,1,1,0,NULL,NULL,0),(13,'礼品箱包',0,1,1,0,NULL,NULL,0),(14,'食品饮料、保健食品',0,1,1,0,NULL,NULL,0),(15,'珠宝',0,1,1,0,NULL,NULL,0),(16,'汽车用品',0,1,1,0,NULL,NULL,0),(17,'运动健康',0,1,1,0,NULL,NULL,0),(18,'玩具乐器',0,1,1,0,NULL,NULL,0),(19,'彩票、旅行、充值、票务',0,1,1,0,NULL,NULL,0),(20,'生鲜',0,1,1,0,NULL,NULL,0),(21,'整车',0,1,1,0,NULL,NULL,0),(22,'电子书刊',1,2,1,0,NULL,NULL,0),(23,'音像',1,2,1,0,NULL,NULL,0),(24,'英文原版',1,2,1,0,NULL,NULL,0),(25,'文艺',1,2,1,0,NULL,NULL,0),(26,'少儿',1,2,1,0,NULL,NULL,0),(27,'人文社科',1,2,1,0,NULL,NULL,0),(28,'经管励志',1,2,1,0,NULL,NULL,0),(29,'生活',1,2,1,0,NULL,NULL,0),(30,'科技',1,2,1,0,NULL,NULL,0),(31,'教育',1,2,1,0,NULL,NULL,0),(32,'港台图书',1,2,1,0,NULL,NULL,0),(33,'其他',1,2,1,0,NULL,NULL,0),(34,'手机通讯',2,2,1,0,NULL,NULL,0),(35,'运营商',2,2,1,0,NULL,NULL,0),(36,'手机配件',2,2,1,0,NULL,NULL,0),(37,'大 家 电',3,2,1,0,NULL,NULL,0),(38,'厨卫大电',3,2,1,0,NULL,NULL,0),(39,'厨房小电',3,2,1,0,NULL,NULL,0),(40,'生活电器',3,2,1,0,NULL,NULL,0),(41,'个护健康',3,2,1,0,NULL,NULL,0),(42,'五金家装',3,2,1,0,NULL,NULL,0),(43,'摄影摄像',4,2,1,0,NULL,NULL,0),(44,'数码配件',4,2,1,0,NULL,NULL,0),(45,'智能设备',4,2,1,0,NULL,NULL,0),(46,'影音娱乐',4,2,1,0,NULL,NULL,0),(47,'电子教育',4,2,1,0,NULL,NULL,0),(48,'虚拟商品',4,2,1,0,NULL,NULL,0),(49,'家纺',5,2,1,0,NULL,NULL,0),(50,'灯具',5,2,1,0,NULL,NULL,0),(51,'生活日用',5,2,1,0,NULL,NULL,0),(52,'家装软饰',5,2,1,0,NULL,NULL,0),(53,'宠物生活',5,2,1,0,NULL,NULL,0),(54,'电脑整机',6,2,1,0,NULL,NULL,0),(55,'电脑配件',6,2,1,0,NULL,NULL,0),(56,'外设产品',6,2,1,0,NULL,NULL,0),(57,'游戏设备',6,2,1,0,NULL,NULL,0),(58,'网络产品',6,2,1,0,NULL,NULL,0),(59,'办公设备',6,2,1,0,NULL,NULL,0),(60,'文具/耗材',6,2,1,0,NULL,NULL,0),(61,'服务产品',6,2,1,0,NULL,NULL,0),(62,'烹饪锅具',7,2,1,0,NULL,NULL,0),(63,'刀剪菜板',7,2,1,0,NULL,NULL,0),(64,'厨房配件',7,2,1,0,NULL,NULL,0),(65,'水具酒具',7,2,1,0,NULL,NULL,0),(66,'餐具',7,2,1,0,NULL,NULL,0),(67,'酒店用品',7,2,1,0,NULL,NULL,0),(68,'茶具/咖啡具',7,2,1,0,NULL,NULL,0),(69,'清洁用品',8,2,1,0,NULL,NULL,0),(70,'面部护肤',8,2,1,0,NULL,NULL,0),(71,'身体护理',8,2,1,0,NULL,NULL,0),(72,'口腔护理',8,2,1,0,NULL,NULL,0),(73,'女性护理',8,2,1,0,NULL,NULL,0),(74,'洗发护发',8,2,1,0,NULL,NULL,0),(75,'香水彩妆',8,2,1,0,NULL,NULL,0),(76,'女装',9,2,1,0,NULL,NULL,0),(77,'男装',9,2,1,0,NULL,NULL,0),(78,'内衣',9,2,1,0,NULL,NULL,0),(79,'洗衣服务',9,2,1,0,NULL,NULL,0),(80,'服饰配件',9,2,1,0,NULL,NULL,0),(81,'钟表',10,2,1,0,NULL,NULL,0),(82,'流行男鞋',11,2,1,0,NULL,NULL,0),(83,'时尚女鞋',11,2,1,0,NULL,NULL,0),(84,'奶粉',12,2,1,0,NULL,NULL,0),(85,'营养辅食',12,2,1,0,NULL,NULL,0),(86,'尿裤湿巾',12,2,1,0,NULL,NULL,0),(87,'喂养用品',12,2,1,0,NULL,NULL,0),(88,'洗护用品',12,2,1,0,NULL,NULL,0),(89,'童车童床',12,2,1,0,NULL,NULL,0),(90,'寝居服饰',12,2,1,0,NULL,NULL,0),(91,'妈妈专区',12,2,1,0,NULL,NULL,0),(92,'童装童鞋',12,2,1,0,NULL,NULL,0),(93,'安全座椅',12,2,1,0,NULL,NULL,0),(94,'潮流女包',13,2,1,0,NULL,NULL,0),(95,'精品男包',13,2,1,0,NULL,NULL,0),(96,'功能箱包',13,2,1,0,NULL,NULL,0),(97,'礼品',13,2,1,0,NULL,NULL,0),(98,'奢侈品',13,2,1,0,NULL,NULL,0),(99,'婚庆',13,2,1,0,NULL,NULL,0),(100,'进口食品',14,2,1,0,NULL,NULL,0),(101,'地方特产',14,2,1,0,NULL,NULL,0),(102,'休闲食品',14,2,1,0,NULL,NULL,0),(103,'粮油调味',14,2,1,0,NULL,NULL,0),(104,'饮料冲调',14,2,1,0,NULL,NULL,0),(105,'食品礼券',14,2,1,0,NULL,NULL,0),(106,'茗茶',14,2,1,0,NULL,NULL,0),(107,'时尚饰品',15,2,1,0,NULL,NULL,0),(108,'黄金',15,2,1,0,NULL,NULL,0),(109,'K金饰品',15,2,1,0,NULL,NULL,0),(110,'金银投资',15,2,1,0,NULL,NULL,0),(111,'银饰',15,2,1,0,NULL,NULL,0),(112,'钻石',15,2,1,0,NULL,NULL,0),(113,'翡翠玉石',15,2,1,0,NULL,NULL,0),(114,'水晶玛瑙',15,2,1,0,NULL,NULL,0),(115,'彩宝',15,2,1,0,NULL,NULL,0),(116,'铂金',15,2,1,0,NULL,NULL,0),(117,'木手串/把件',15,2,1,0,NULL,NULL,0),(118,'珍珠',15,2,1,0,NULL,NULL,0),(119,'维修保养',16,2,1,0,NULL,NULL,0),(120,'车载电器',16,2,1,0,NULL,NULL,0),(121,'美容清洗',16,2,1,0,NULL,NULL,0),(122,'汽车装饰',16,2,1,0,NULL,NULL,0),(123,'安全自驾',16,2,1,0,NULL,NULL,0),(124,'汽车服务',16,2,1,0,NULL,NULL,0),(125,'赛事改装',16,2,1,0,NULL,NULL,0),(126,'运动鞋包',17,2,1,0,NULL,NULL,0),(127,'运动服饰',17,2,1,0,NULL,NULL,0),(128,'骑行运动',17,2,1,0,NULL,NULL,0),(129,'垂钓用品',17,2,1,0,NULL,NULL,0),(130,'游泳用品',17,2,1,0,NULL,NULL,0),(131,'户外鞋服',17,2,1,0,NULL,NULL,0),(132,'户外装备',17,2,1,0,NULL,NULL,0),(133,'健身训练',17,2,1,0,NULL,NULL,0),(134,'体育用品',17,2,1,0,NULL,NULL,0),(135,'适用年龄',18,2,1,0,NULL,NULL,0),(136,'遥控/电动',18,2,1,0,NULL,NULL,0),(137,'毛绒布艺',18,2,1,0,NULL,NULL,0),(138,'娃娃玩具',18,2,1,0,NULL,NULL,0),(139,'模型玩具',18,2,1,0,NULL,NULL,0),(140,'健身玩具',18,2,1,0,NULL,NULL,0),(141,'动漫玩具',18,2,1,0,NULL,NULL,0),(142,'益智玩具',18,2,1,0,NULL,NULL,0),(143,'积木拼插',18,2,1,0,NULL,NULL,0),(144,'DIY玩具',18,2,1,0,NULL,NULL,0),(145,'创意减压',18,2,1,0,NULL,NULL,0),(146,'乐器',18,2,1,0,NULL,NULL,0),(147,'彩票',19,2,1,0,NULL,NULL,0),(148,'机票',19,2,1,0,NULL,NULL,0),(149,'酒店',19,2,1,0,NULL,NULL,0),(150,'旅行',19,2,1,0,NULL,NULL,0),(151,'充值',19,2,1,0,NULL,NULL,0),(152,'游戏',19,2,1,0,NULL,NULL,0),(153,'票务',19,2,1,0,NULL,NULL,0),(154,'产地直供',20,2,1,0,NULL,NULL,0),(155,'水果',20,2,1,0,NULL,NULL,0),(156,'猪牛羊肉',20,2,1,0,NULL,NULL,0),(157,'海鲜水产',20,2,1,0,NULL,NULL,0),(158,'禽肉蛋品',20,2,1,0,NULL,NULL,0),(159,'冷冻食品',20,2,1,0,NULL,NULL,0),(160,'熟食腊味',20,2,1,0,NULL,NULL,0),(161,'饮品甜品',20,2,1,0,NULL,NULL,0),(162,'蔬菜',20,2,1,0,NULL,NULL,0),(163,'全新整车',21,2,1,0,NULL,NULL,0),(164,'二手车',21,2,1,0,NULL,NULL,0),(165,'电子书',22,3,1,1,NULL,NULL,0),(166,'网络原创',22,3,1,0,NULL,NULL,0),(167,'数字杂志',22,3,1,2,NULL,NULL,0),(168,'多媒体图书',22,3,1,3,NULL,NULL,0),(169,'音乐',23,3,1,0,NULL,NULL,0),(170,'影视',23,3,1,0,NULL,NULL,0),(171,'教育音像',23,3,1,0,NULL,NULL,0),(172,'少儿',24,3,1,0,NULL,NULL,0),(173,'商务投资',24,3,1,0,NULL,NULL,0),(174,'英语学习与考试',24,3,1,0,NULL,NULL,0),(175,'文学',24,3,1,0,NULL,NULL,0),(176,'传记',24,3,1,0,NULL,NULL,0),(177,'励志',24,3,1,0,NULL,NULL,0),(178,'小说',25,3,1,0,NULL,NULL,0),(179,'文学',25,3,1,0,NULL,NULL,0),(180,'青春文学',25,3,1,0,NULL,NULL,0),(181,'传记',25,3,1,0,NULL,NULL,0),(182,'艺术',25,3,1,0,NULL,NULL,0),(183,'少儿',26,3,1,0,NULL,NULL,0),(184,'0-2岁',26,3,1,0,NULL,NULL,0),(185,'3-6岁',26,3,1,0,NULL,NULL,0),(186,'7-10岁',26,3,1,0,NULL,NULL,0),(187,'11-14岁',26,3,1,0,NULL,NULL,0),(188,'历史',27,3,1,0,NULL,NULL,0),(189,'哲学',27,3,1,0,NULL,NULL,0),(190,'国学',27,3,1,0,NULL,NULL,0),(191,'政治/军事',27,3,1,0,NULL,NULL,0),(192,'法律',27,3,1,0,NULL,NULL,0),(193,'人文社科',27,3,1,0,NULL,NULL,0),(194,'心理学',27,3,1,0,NULL,NULL,0),(195,'文化',27,3,1,0,NULL,NULL,0),(196,'社会科学',27,3,1,0,NULL,NULL,0),(197,'经济',28,3,1,0,NULL,NULL,0),(198,'金融与投资',28,3,1,0,NULL,NULL,0),(199,'管理',28,3,1,0,NULL,NULL,0),(200,'励志与成功',28,3,1,0,NULL,NULL,0),(201,'生活',29,3,1,0,NULL,NULL,0),(202,'健身与保健',29,3,1,0,NULL,NULL,0),(203,'家庭与育儿',29,3,1,0,NULL,NULL,0),(204,'旅游',29,3,1,0,NULL,NULL,0),(205,'烹饪美食',29,3,1,0,NULL,NULL,0),(206,'工业技术',30,3,1,0,NULL,NULL,0),(207,'科普读物',30,3,1,0,NULL,NULL,0),(208,'建筑',30,3,1,0,NULL,NULL,0),(209,'医学',30,3,1,0,NULL,NULL,0),(210,'科学与自然',30,3,1,0,NULL,NULL,0),(211,'计算机与互联网',30,3,1,0,NULL,NULL,0),(212,'电子通信',30,3,1,0,NULL,NULL,0),(213,'中小学教辅',31,3,1,0,NULL,NULL,0),(214,'教育与考试',31,3,1,0,NULL,NULL,0),(215,'外语学习',31,3,1,0,NULL,NULL,0),(216,'大中专教材',31,3,1,0,NULL,NULL,0),(217,'字典词典',31,3,1,0,NULL,NULL,0),(218,'艺术/设计/收藏',32,3,1,0,NULL,NULL,0),(219,'经济管理',32,3,1,0,NULL,NULL,0),(220,'文化/学术',32,3,1,0,NULL,NULL,0),(221,'少儿',32,3,1,0,NULL,NULL,0),(222,'工具书',33,3,1,0,NULL,NULL,0),(223,'杂志/期刊',33,3,1,0,NULL,NULL,0),(224,'套装书',33,3,1,0,NULL,NULL,0),(225,'手机',34,3,1,0,NULL,NULL,0),(226,'对讲机',34,3,1,0,NULL,NULL,0),(227,'合约机',35,3,1,0,NULL,NULL,0),(228,'选号中心',35,3,1,0,NULL,NULL,0),(229,'装宽带',35,3,1,0,NULL,NULL,0),(230,'办套餐',35,3,1,0,NULL,NULL,0),(231,'移动电源',36,3,1,0,NULL,NULL,0),(232,'电池/移动电源',36,3,1,0,NULL,NULL,0),(233,'蓝牙耳机',36,3,1,0,NULL,NULL,0),(234,'充电器/数据线',36,3,1,0,NULL,NULL,0),(235,'苹果周边',36,3,1,0,NULL,NULL,0),(236,'手机耳机',36,3,1,0,NULL,NULL,0),(237,'手机贴膜',36,3,1,0,NULL,NULL,0),(238,'手机存储卡',36,3,1,0,NULL,NULL,0),(239,'充电器',36,3,1,0,NULL,NULL,0),(240,'数据线',36,3,1,0,NULL,NULL,0),(241,'手机保护套',36,3,1,0,NULL,NULL,0),(242,'车载配件',36,3,1,0,NULL,NULL,0),(243,'iPhone 配件',36,3,1,0,NULL,NULL,0),(244,'手机电池',36,3,1,0,NULL,NULL,0),(245,'创意配件',36,3,1,0,NULL,NULL,0),(246,'便携/无线音响',36,3,1,0,NULL,NULL,0),(247,'手机饰品',36,3,1,0,NULL,NULL,0),(248,'拍照配件',36,3,1,0,NULL,NULL,0),(249,'手机支架',36,3,1,0,NULL,NULL,0),(250,'平板电视',37,3,1,0,NULL,NULL,0),(251,'空调',37,3,1,0,NULL,NULL,0),(252,'冰箱',37,3,1,0,NULL,NULL,0),(253,'洗衣机',37,3,1,0,NULL,NULL,0),(254,'家庭影院',37,3,1,0,NULL,NULL,0),(255,'DVD/电视盒子',37,3,1,0,NULL,NULL,0),(256,'迷你音响',37,3,1,0,NULL,NULL,0),(257,'冷柜/冰吧',37,3,1,0,NULL,NULL,0),(258,'家电配件',37,3,1,0,NULL,NULL,0),(259,'功放',37,3,1,0,NULL,NULL,0),(260,'回音壁/Soundbar',37,3,1,0,NULL,NULL,0),(261,'Hi-Fi专区',37,3,1,0,NULL,NULL,0),(262,'电视盒子',37,3,1,0,NULL,NULL,0),(263,'酒柜',37,3,1,0,NULL,NULL,0),(264,'燃气灶',38,3,1,0,NULL,NULL,0),(265,'油烟机',38,3,1,0,NULL,NULL,0),(266,'热水器',38,3,1,0,NULL,NULL,0),(267,'消毒柜',38,3,1,0,NULL,NULL,0),(268,'洗碗机',38,3,1,0,NULL,NULL,0),(269,'料理机',39,3,1,0,NULL,NULL,0),(270,'榨汁机',39,3,1,0,NULL,NULL,0),(271,'电饭煲',39,3,1,0,NULL,NULL,0),(272,'电压力锅',39,3,1,0,NULL,NULL,0),(273,'豆浆机',39,3,1,0,NULL,NULL,0),(274,'咖啡机',39,3,1,0,NULL,NULL,0),(275,'微波炉',39,3,1,0,NULL,NULL,0),(276,'电烤箱',39,3,1,0,NULL,NULL,0),(277,'电磁炉',39,3,1,0,NULL,NULL,0),(278,'面包机',39,3,1,0,NULL,NULL,0),(279,'煮蛋器',39,3,1,0,NULL,NULL,0),(280,'酸奶机',39,3,1,0,NULL,NULL,0),(281,'电炖锅',39,3,1,0,NULL,NULL,0),(282,'电水壶/热水瓶',39,3,1,0,NULL,NULL,0),(283,'电饼铛',39,3,1,0,NULL,NULL,0),(284,'多用途锅',39,3,1,0,NULL,NULL,0),(285,'电烧烤炉',39,3,1,0,NULL,NULL,0),(286,'果蔬解毒机',39,3,1,0,NULL,NULL,0),(287,'其它厨房电器',39,3,1,0,NULL,NULL,0),(288,'养生壶/煎药壶',39,3,1,0,NULL,NULL,0),(289,'电热饭盒',39,3,1,0,NULL,NULL,0),(290,'取暖电器',40,3,1,0,NULL,NULL,0),(291,'净化器',40,3,1,0,NULL,NULL,0),(292,'加湿器',40,3,1,0,NULL,NULL,0),(293,'扫地机器人',40,3,1,0,NULL,NULL,0),(294,'吸尘器',40,3,1,0,NULL,NULL,0),(295,'挂烫机/熨斗',40,3,1,0,NULL,NULL,0),(296,'插座',40,3,1,0,NULL,NULL,0),(297,'电话机',40,3,1,0,NULL,NULL,0),(298,'清洁机',40,3,1,0,NULL,NULL,0),(299,'除湿机',40,3,1,0,NULL,NULL,0),(300,'干衣机',40,3,1,0,NULL,NULL,0),(301,'收录/音机',40,3,1,0,NULL,NULL,0),(302,'电风扇',40,3,1,0,NULL,NULL,0),(303,'冷风扇',40,3,1,0,NULL,NULL,0),(304,'其它生活电器',40,3,1,0,NULL,NULL,0),(305,'生活电器配件',40,3,1,0,NULL,NULL,0),(306,'净水器',40,3,1,0,NULL,NULL,0),(307,'饮水机',40,3,1,0,NULL,NULL,0),(308,'剃须刀',41,3,1,0,NULL,NULL,0),(309,'剃/脱毛器',41,3,1,0,NULL,NULL,0),(310,'口腔护理',41,3,1,0,NULL,NULL,0),(311,'电吹风',41,3,1,0,NULL,NULL,0),(312,'美容器',41,3,1,0,NULL,NULL,0),(313,'理发器',41,3,1,0,NULL,NULL,0),(314,'卷/直发器',41,3,1,0,NULL,NULL,0),(315,'按摩椅',41,3,1,0,NULL,NULL,0),(316,'按摩器',41,3,1,0,NULL,NULL,0),(317,'足浴盆',41,3,1,0,NULL,NULL,0),(318,'血压计',41,3,1,0,NULL,NULL,0),(319,'电子秤/厨房秤',41,3,1,0,NULL,NULL,0),(320,'血糖仪',41,3,1,0,NULL,NULL,0),(321,'体温计',41,3,1,0,NULL,NULL,0),(322,'其它健康电器',41,3,1,0,NULL,NULL,0),(323,'计步器/脂肪检测仪',41,3,1,0,NULL,NULL,0),(324,'电动工具',42,3,1,0,NULL,NULL,0),(325,'手动工具',42,3,1,0,NULL,NULL,0),(326,'仪器仪表',42,3,1,0,NULL,NULL,0),(327,'浴霸/排气扇',42,3,1,0,NULL,NULL,0),(328,'灯具',42,3,1,0,NULL,NULL,0),(329,'LED灯',42,3,1,0,NULL,NULL,0),(330,'洁身器',42,3,1,0,NULL,NULL,0),(331,'水槽',42,3,1,0,NULL,NULL,0),(332,'龙头',42,3,1,0,NULL,NULL,0),(333,'淋浴花洒',42,3,1,0,NULL,NULL,0),(334,'厨卫五金',42,3,1,0,NULL,NULL,0),(335,'家具五金',42,3,1,0,NULL,NULL,0),(336,'门铃',42,3,1,0,NULL,NULL,0),(337,'电气开关',42,3,1,0,NULL,NULL,0),(338,'插座',42,3,1,0,NULL,NULL,0),(339,'电工电料',42,3,1,0,NULL,NULL,0),(340,'监控安防',42,3,1,0,NULL,NULL,0),(341,'电线/线缆',42,3,1,0,NULL,NULL,0),(342,'数码相机',43,3,1,0,NULL,NULL,0),(343,'单电/微单相机',43,3,1,0,NULL,NULL,0),(344,'单反相机',43,3,1,0,NULL,NULL,0),(345,'摄像机',43,3,1,0,NULL,NULL,0),(346,'拍立得',43,3,1,0,NULL,NULL,0),(347,'运动相机',43,3,1,0,NULL,NULL,0),(348,'镜头',43,3,1,0,NULL,NULL,0),(349,'户外器材',43,3,1,0,NULL,NULL,0),(350,'影棚器材',43,3,1,0,NULL,NULL,0),(351,'冲印服务',43,3,1,0,NULL,NULL,0),(352,'数码相框',43,3,1,0,NULL,NULL,0),(353,'存储卡',44,3,1,0,NULL,NULL,0),(354,'读卡器',44,3,1,0,NULL,NULL,0),(355,'滤镜',44,3,1,0,NULL,NULL,0),(356,'闪光灯/手柄',44,3,1,0,NULL,NULL,0),(357,'相机包',44,3,1,0,NULL,NULL,0),(358,'三脚架/云台',44,3,1,0,NULL,NULL,0),(359,'相机清洁/贴膜',44,3,1,0,NULL,NULL,0),(360,'机身附件',44,3,1,0,NULL,NULL,0),(361,'镜头附件',44,3,1,0,NULL,NULL,0),(362,'电池/充电器',44,3,1,0,NULL,NULL,0),(363,'移动电源',44,3,1,0,NULL,NULL,0),(364,'数码支架',44,3,1,0,NULL,NULL,0),(365,'智能手环',45,3,1,0,NULL,NULL,0),(366,'智能手表',45,3,1,0,NULL,NULL,0),(367,'智能眼镜',45,3,1,0,NULL,NULL,0),(368,'运动跟踪器',45,3,1,0,NULL,NULL,0),(369,'健康监测',45,3,1,0,NULL,NULL,0),(370,'智能配饰',45,3,1,0,NULL,NULL,0),(371,'智能家居',45,3,1,0,NULL,NULL,0),(372,'体感车',45,3,1,0,NULL,NULL,0),(373,'其他配件',45,3,1,0,NULL,NULL,0),(374,'智能机器人',45,3,1,0,NULL,NULL,0),(375,'无人机',45,3,1,0,NULL,NULL,0),(376,'MP3/MP4',46,3,1,0,NULL,NULL,0),(377,'智能设备',46,3,1,0,NULL,NULL,0),(378,'耳机/耳麦',46,3,1,0,NULL,NULL,0),(379,'便携/无线音箱',46,3,1,0,NULL,NULL,0),(380,'音箱/音响',46,3,1,0,NULL,NULL,0),(381,'高清播放器',46,3,1,0,NULL,NULL,0),(382,'收音机',46,3,1,0,NULL,NULL,0),(383,'MP3/MP4配件',46,3,1,0,NULL,NULL,0),(384,'麦克风',46,3,1,0,NULL,NULL,0),(385,'专业音频',46,3,1,0,NULL,NULL,0),(386,'苹果配件',46,3,1,0,NULL,NULL,0),(387,'学生平板',47,3,1,0,NULL,NULL,0),(388,'点读机/笔',47,3,1,0,NULL,NULL,0),(389,'早教益智',47,3,1,0,NULL,NULL,0),(390,'录音笔',47,3,1,0,NULL,NULL,0),(391,'电纸书',47,3,1,0,NULL,NULL,0),(392,'电子词典',47,3,1,0,NULL,NULL,0),(393,'复读机',47,3,1,0,NULL,NULL,0),(394,'延保服务',48,3,1,0,NULL,NULL,0),(395,'杀毒软件',48,3,1,0,NULL,NULL,0),(396,'积分商品',48,3,1,0,NULL,NULL,0),(397,'桌布/罩件',49,3,1,0,NULL,NULL,0),(398,'地毯地垫',49,3,1,0,NULL,NULL,0),(399,'沙发垫套/椅垫',49,3,1,0,NULL,NULL,0),(400,'床品套件',49,3,1,0,NULL,NULL,0),(401,'被子',49,3,1,0,NULL,NULL,0),(402,'枕芯',49,3,1,0,NULL,NULL,0),(403,'床单被罩',49,3,1,0,NULL,NULL,0),(404,'毯子',49,3,1,0,NULL,NULL,0),(405,'床垫/床褥',49,3,1,0,NULL,NULL,0),(406,'蚊帐',49,3,1,0,NULL,NULL,0),(407,'抱枕靠垫',49,3,1,0,NULL,NULL,0),(408,'毛巾浴巾',49,3,1,0,NULL,NULL,0),(409,'电热毯',49,3,1,0,NULL,NULL,0),(410,'窗帘/窗纱',49,3,1,0,NULL,NULL,0),(411,'布艺软饰',49,3,1,0,NULL,NULL,0),(412,'凉席',49,3,1,0,NULL,NULL,0),(413,'台灯',50,3,1,0,NULL,NULL,0),(414,'节能灯',50,3,1,0,NULL,NULL,0),(415,'装饰灯',50,3,1,0,NULL,NULL,0),(416,'落地灯',50,3,1,0,NULL,NULL,0),(417,'应急灯/手电',50,3,1,0,NULL,NULL,0),(418,'LED灯',50,3,1,0,NULL,NULL,0),(419,'吸顶灯',50,3,1,0,NULL,NULL,0),(420,'五金电器',50,3,1,0,NULL,NULL,0),(421,'筒灯射灯',50,3,1,0,NULL,NULL,0),(422,'吊灯',50,3,1,0,NULL,NULL,0),(423,'氛围照明',50,3,1,0,NULL,NULL,0),(424,'保暖防护',51,3,1,0,NULL,NULL,0),(425,'收纳用品',51,3,1,0,NULL,NULL,0),(426,'雨伞雨具',51,3,1,0,NULL,NULL,0),(427,'浴室用品',51,3,1,0,NULL,NULL,0),(428,'缝纫/针织用品',51,3,1,0,NULL,NULL,0),(429,'洗晒/熨烫',51,3,1,0,NULL,NULL,0),(430,'净化除味',51,3,1,0,NULL,NULL,0),(431,'相框/照片墙',52,3,1,0,NULL,NULL,0),(432,'装饰字画',52,3,1,0,NULL,NULL,0),(433,'节庆饰品',52,3,1,0,NULL,NULL,0),(434,'手工/十字绣',52,3,1,0,NULL,NULL,0),(435,'装饰摆件',52,3,1,0,NULL,NULL,0),(436,'帘艺隔断',52,3,1,0,NULL,NULL,0),(437,'墙贴/装饰贴',52,3,1,0,NULL,NULL,0),(438,'钟饰',52,3,1,0,NULL,NULL,0),(439,'花瓶花艺',52,3,1,0,NULL,NULL,0),(440,'香薰蜡烛',52,3,1,0,NULL,NULL,0),(441,'创意家居',52,3,1,0,NULL,NULL,0),(442,'宠物主粮',53,3,1,0,NULL,NULL,0),(443,'宠物零食',53,3,1,0,NULL,NULL,0),(444,'医疗保健',53,3,1,0,NULL,NULL,0),(445,'家居日用',53,3,1,0,NULL,NULL,0),(446,'宠物玩具',53,3,1,0,NULL,NULL,0),(447,'出行装备',53,3,1,0,NULL,NULL,0),(448,'洗护美容',53,3,1,0,NULL,NULL,0),(449,'笔记本',54,3,1,0,NULL,NULL,0),(450,'超极本',54,3,1,0,NULL,NULL,0),(451,'游戏本',54,3,1,0,NULL,NULL,0),(452,'平板电脑',54,3,1,0,NULL,NULL,0),(453,'平板电脑配件',54,3,1,0,NULL,NULL,0),(454,'台式机',54,3,1,0,NULL,NULL,0),(455,'服务器/工作站',54,3,1,0,NULL,NULL,0),(456,'笔记本配件',54,3,1,0,NULL,NULL,0),(457,'一体机',54,3,1,0,NULL,NULL,0),(458,'CPU',55,3,1,0,NULL,NULL,0),(459,'主板',55,3,1,0,NULL,NULL,0),(460,'显卡',55,3,1,0,NULL,NULL,0),(461,'硬盘',55,3,1,0,NULL,NULL,0),(462,'SSD固态硬盘',55,3,1,0,NULL,NULL,0),(463,'内存',55,3,1,0,NULL,NULL,0),(464,'机箱',55,3,1,0,NULL,NULL,0),(465,'电源',55,3,1,0,NULL,NULL,0),(466,'显示器',55,3,1,0,NULL,NULL,0),(467,'刻录机/光驱',55,3,1,0,NULL,NULL,0),(468,'散热器',55,3,1,0,NULL,NULL,0),(469,'声卡/扩展卡',55,3,1,0,NULL,NULL,0),(470,'装机配件',55,3,1,0,NULL,NULL,0),(471,'组装电脑',55,3,1,0,NULL,NULL,0),(472,'移动硬盘',56,3,1,0,NULL,NULL,0),(473,'U盘',56,3,1,0,NULL,NULL,0),(474,'鼠标',56,3,1,0,NULL,NULL,0),(475,'键盘',56,3,1,0,NULL,NULL,0),(476,'鼠标垫',56,3,1,0,NULL,NULL,0),(477,'摄像头',56,3,1,0,NULL,NULL,0),(478,'手写板',56,3,1,0,NULL,NULL,0),(479,'硬盘盒',56,3,1,0,NULL,NULL,0),(480,'插座',56,3,1,0,NULL,NULL,0),(481,'线缆',56,3,1,0,NULL,NULL,0),(482,'UPS电源',56,3,1,0,NULL,NULL,0),(483,'电脑工具',56,3,1,0,NULL,NULL,0),(484,'游戏设备',56,3,1,0,NULL,NULL,0),(485,'电玩',56,3,1,0,NULL,NULL,0),(486,'电脑清洁',56,3,1,0,NULL,NULL,0),(487,'网络仪表仪器',56,3,1,0,NULL,NULL,0),(488,'游戏机',57,3,1,0,NULL,NULL,0),(489,'游戏耳机',57,3,1,0,NULL,NULL,0),(490,'手柄/方向盘',57,3,1,0,NULL,NULL,0),(491,'游戏软件',57,3,1,0,NULL,NULL,0),(492,'游戏周边',57,3,1,0,NULL,NULL,0),(493,'路由器',58,3,1,0,NULL,NULL,0),(494,'网卡',58,3,1,0,NULL,NULL,0),(495,'交换机',58,3,1,0,NULL,NULL,0),(496,'网络存储',58,3,1,0,NULL,NULL,0),(497,'4G/3G上网',58,3,1,0,NULL,NULL,0),(498,'网络盒子',58,3,1,0,NULL,NULL,0),(499,'网络配件',58,3,1,0,NULL,NULL,0),(500,'投影机',59,3,1,0,NULL,NULL,0),(501,'投影配件',59,3,1,0,NULL,NULL,0),(502,'多功能一体机',59,3,1,0,NULL,NULL,0),(503,'打印机',59,3,1,0,NULL,NULL,0),(504,'传真设备',59,3,1,0,NULL,NULL,0),(505,'验钞/点钞机',59,3,1,0,NULL,NULL,0),(506,'扫描设备',59,3,1,0,NULL,NULL,0),(507,'复合机',59,3,1,0,NULL,NULL,0),(508,'碎纸机',59,3,1,0,NULL,NULL,0),(509,'考勤机',59,3,1,0,NULL,NULL,0),(510,'收款/POS机',59,3,1,0,NULL,NULL,0),(511,'会议音频视频',59,3,1,0,NULL,NULL,0),(512,'保险柜',59,3,1,0,NULL,NULL,0),(513,'装订/封装机',59,3,1,0,NULL,NULL,0),(514,'安防监控',59,3,1,0,NULL,NULL,0),(515,'办公家具',59,3,1,0,NULL,NULL,0),(516,'白板',59,3,1,0,NULL,NULL,0),(517,'硒鼓/墨粉',60,3,1,0,NULL,NULL,0),(518,'墨盒',60,3,1,0,NULL,NULL,0),(519,'色带',60,3,1,0,NULL,NULL,0),(520,'纸类',60,3,1,0,NULL,NULL,0),(521,'办公文具',60,3,1,0,NULL,NULL,0),(522,'学生文具',60,3,1,0,NULL,NULL,0),(523,'财会用品',60,3,1,0,NULL,NULL,0),(524,'文件管理',60,3,1,0,NULL,NULL,0),(525,'本册/便签',60,3,1,0,NULL,NULL,0),(526,'计算器',60,3,1,0,NULL,NULL,0),(527,'笔类',60,3,1,0,NULL,NULL,0),(528,'画具画材',60,3,1,0,NULL,NULL,0),(529,'刻录碟片/附件',60,3,1,0,NULL,NULL,0),(530,'上门安装',61,3,1,0,NULL,NULL,0),(531,'延保服务',61,3,1,0,NULL,NULL,0),(532,'维修保养',61,3,1,0,NULL,NULL,0),(533,'电脑软件',61,3,1,0,NULL,NULL,0),(534,'京东服务',61,3,1,0,NULL,NULL,0),(535,'炒锅',62,3,1,0,NULL,NULL,0),(536,'煎锅',62,3,1,0,NULL,NULL,0),(537,'压力锅',62,3,1,0,NULL,NULL,0),(538,'蒸锅',62,3,1,0,NULL,NULL,0),(539,'汤锅',62,3,1,0,NULL,NULL,0),(540,'奶锅',62,3,1,0,NULL,NULL,0),(541,'锅具套装',62,3,1,0,NULL,NULL,0),(542,'煲类',62,3,1,0,NULL,NULL,0),(543,'水壶',62,3,1,0,NULL,NULL,0),(544,'火锅',62,3,1,0,NULL,NULL,0),(545,'菜刀',63,3,1,0,NULL,NULL,0),(546,'剪刀',63,3,1,0,NULL,NULL,0),(547,'刀具套装',63,3,1,0,NULL,NULL,0),(548,'砧板',63,3,1,0,NULL,NULL,0),(549,'瓜果刀/刨',63,3,1,0,NULL,NULL,0),(550,'多功能刀',63,3,1,0,NULL,NULL,0),(551,'保鲜盒',64,3,1,0,NULL,NULL,0),(552,'烘焙/烧烤',64,3,1,0,NULL,NULL,0),(553,'饭盒/提锅',64,3,1,0,NULL,NULL,0),(554,'储物/置物架',64,3,1,0,NULL,NULL,0),(555,'厨房DIY/小工具',64,3,1,0,NULL,NULL,0),(556,'塑料杯',65,3,1,0,NULL,NULL,0),(557,'运动水壶',65,3,1,0,NULL,NULL,0),(558,'玻璃杯',65,3,1,0,NULL,NULL,0),(559,'陶瓷/马克杯',65,3,1,0,NULL,NULL,0),(560,'保温杯',65,3,1,0,NULL,NULL,0),(561,'保温壶',65,3,1,0,NULL,NULL,0),(562,'酒杯/酒具',65,3,1,0,NULL,NULL,0),(563,'杯具套装',65,3,1,0,NULL,NULL,0),(564,'餐具套装',66,3,1,0,NULL,NULL,0),(565,'碗/碟/盘',66,3,1,0,NULL,NULL,0),(566,'筷勺/刀叉',66,3,1,0,NULL,NULL,0),(567,'一次性用品',66,3,1,0,NULL,NULL,0),(568,'果盘/果篮',66,3,1,0,NULL,NULL,0),(569,'自助餐炉',67,3,1,0,NULL,NULL,0),(570,'酒店餐具',67,3,1,0,NULL,NULL,0),(571,'酒店水具',67,3,1,0,NULL,NULL,0),(572,'整套茶具',68,3,1,0,NULL,NULL,0),(573,'茶杯',68,3,1,0,NULL,NULL,0),(574,'茶壶',68,3,1,0,NULL,NULL,0),(575,'茶盘茶托',68,3,1,0,NULL,NULL,0),(576,'茶叶罐',68,3,1,0,NULL,NULL,0),(577,'茶具配件',68,3,1,0,NULL,NULL,0),(578,'茶宠摆件',68,3,1,0,NULL,NULL,0),(579,'咖啡具',68,3,1,0,NULL,NULL,0),(580,'其他',68,3,1,0,NULL,NULL,0),(581,'纸品湿巾',69,3,1,0,NULL,NULL,0),(582,'衣物清洁',69,3,1,0,NULL,NULL,0),(583,'清洁工具',69,3,1,0,NULL,NULL,0),(584,'驱虫用品',69,3,1,0,NULL,NULL,0),(585,'家庭清洁',69,3,1,0,NULL,NULL,0),(586,'皮具护理',69,3,1,0,NULL,NULL,0),(587,'一次性用品',69,3,1,0,NULL,NULL,0),(588,'洁面',70,3,1,0,NULL,NULL,0),(589,'乳液面霜',70,3,1,0,NULL,NULL,0),(590,'面膜',70,3,1,0,NULL,NULL,0),(591,'剃须',70,3,1,0,NULL,NULL,0),(592,'套装',70,3,1,0,NULL,NULL,0),(593,'精华',70,3,1,0,NULL,NULL,0),(594,'眼霜',70,3,1,0,NULL,NULL,0),(595,'卸妆',70,3,1,0,NULL,NULL,0),(596,'防晒',70,3,1,0,NULL,NULL,0),(597,'防晒隔离',70,3,1,0,NULL,NULL,0),(598,'T区护理',70,3,1,0,NULL,NULL,0),(599,'眼部护理',70,3,1,0,NULL,NULL,0),(600,'精华露',70,3,1,0,NULL,NULL,0),(601,'爽肤水',70,3,1,0,NULL,NULL,0),(602,'沐浴',71,3,1,0,NULL,NULL,0),(603,'润肤',71,3,1,0,NULL,NULL,0),(604,'颈部',71,3,1,0,NULL,NULL,0),(605,'手足',71,3,1,0,NULL,NULL,0),(606,'纤体塑形',71,3,1,0,NULL,NULL,0),(607,'美胸',71,3,1,0,NULL,NULL,0),(608,'套装',71,3,1,0,NULL,NULL,0),(609,'精油',71,3,1,0,NULL,NULL,0),(610,'洗发护发',71,3,1,0,NULL,NULL,0),(611,'染发/造型',71,3,1,0,NULL,NULL,0),(612,'香薰精油',71,3,1,0,NULL,NULL,0),(613,'磨砂/浴盐',71,3,1,0,NULL,NULL,0),(614,'手工/香皂',71,3,1,0,NULL,NULL,0),(615,'洗发',71,3,1,0,NULL,NULL,0),(616,'护发',71,3,1,0,NULL,NULL,0),(617,'染发',71,3,1,0,NULL,NULL,0),(618,'磨砂膏',71,3,1,0,NULL,NULL,0),(619,'香皂',71,3,1,0,NULL,NULL,0),(620,'牙膏/牙粉',72,3,1,0,NULL,NULL,0),(621,'牙刷/牙线',72,3,1,0,NULL,NULL,0),(622,'漱口水',72,3,1,0,NULL,NULL,0),(623,'套装',72,3,1,0,NULL,NULL,0),(624,'卫生巾',73,3,1,0,NULL,NULL,0),(625,'卫生护垫',73,3,1,0,NULL,NULL,0),(626,'私密护理',73,3,1,0,NULL,NULL,0),(627,'脱毛膏',73,3,1,0,NULL,NULL,0),(628,'其他',73,3,1,0,NULL,NULL,0),(629,'洗发',74,3,1,0,NULL,NULL,0),(630,'护发',74,3,1,0,NULL,NULL,0),(631,'染发',74,3,1,0,NULL,NULL,0),(632,'造型',74,3,1,0,NULL,NULL,0),(633,'假发',74,3,1,0,NULL,NULL,0),(634,'套装',74,3,1,0,NULL,NULL,0),(635,'美发工具',74,3,1,0,NULL,NULL,0),(636,'脸部护理',74,3,1,0,NULL,NULL,0),(637,'香水',75,3,1,0,NULL,NULL,0),(638,'底妆',75,3,1,0,NULL,NULL,0),(639,'腮红',75,3,1,0,NULL,NULL,0),(640,'眼影',75,3,1,0,NULL,NULL,0),(641,'唇部',75,3,1,0,NULL,NULL,0),(642,'美甲',75,3,1,0,NULL,NULL,0),(643,'眼线',75,3,1,0,NULL,NULL,0),(644,'美妆工具',75,3,1,0,NULL,NULL,0),(645,'套装',75,3,1,0,NULL,NULL,0),(646,'防晒隔离',75,3,1,0,NULL,NULL,0),(647,'卸妆',75,3,1,0,NULL,NULL,0),(648,'眉笔',75,3,1,0,NULL,NULL,0),(649,'睫毛膏',75,3,1,0,NULL,NULL,0),(650,'T恤',76,3,1,0,NULL,NULL,0),(651,'衬衫',76,3,1,0,NULL,NULL,0),(652,'针织衫',76,3,1,0,NULL,NULL,0),(653,'雪纺衫',76,3,1,0,NULL,NULL,0),(654,'卫衣',76,3,1,0,NULL,NULL,0),(655,'马甲',76,3,1,0,NULL,NULL,0),(656,'连衣裙',76,3,1,0,NULL,NULL,0),(657,'半身裙',76,3,1,0,NULL,NULL,0),(658,'牛仔裤',76,3,1,0,NULL,NULL,0),(659,'休闲裤',76,3,1,0,NULL,NULL,0),(660,'打底裤',76,3,1,0,NULL,NULL,0),(661,'正装裤',76,3,1,0,NULL,NULL,0),(662,'小西装',76,3,1,0,NULL,NULL,0),(663,'短外套',76,3,1,0,NULL,NULL,0),(664,'风衣',76,3,1,0,NULL,NULL,0),(665,'毛呢大衣',76,3,1,0,NULL,NULL,0),(666,'真皮皮衣',76,3,1,0,NULL,NULL,0),(667,'棉服',76,3,1,0,NULL,NULL,0),(668,'羽绒服',76,3,1,0,NULL,NULL,0),(669,'大码女装',76,3,1,0,NULL,NULL,0),(670,'中老年女装',76,3,1,0,NULL,NULL,0),(671,'婚纱',76,3,1,0,NULL,NULL,0),(672,'打底衫',76,3,1,0,NULL,NULL,0),(673,'旗袍/唐装',76,3,1,0,NULL,NULL,0),(674,'加绒裤',76,3,1,0,NULL,NULL,0),(675,'吊带/背心',76,3,1,0,NULL,NULL,0),(676,'羊绒衫',76,3,1,0,NULL,NULL,0),(677,'短裤',76,3,1,0,NULL,NULL,0),(678,'皮草',76,3,1,0,NULL,NULL,0),(679,'礼服',76,3,1,0,NULL,NULL,0),(680,'仿皮皮衣',76,3,1,0,NULL,NULL,0),(681,'羊毛衫',76,3,1,0,NULL,NULL,0),(682,'设计师/潮牌',76,3,1,0,NULL,NULL,0),(683,'衬衫',77,3,1,0,NULL,NULL,0),(684,'T恤',77,3,1,0,NULL,NULL,0),(685,'POLO衫',77,3,1,0,NULL,NULL,0),(686,'针织衫',77,3,1,0,NULL,NULL,0),(687,'羊绒衫',77,3,1,0,NULL,NULL,0),(688,'卫衣',77,3,1,0,NULL,NULL,0),(689,'马甲/背心',77,3,1,0,NULL,NULL,0),(690,'夹克',77,3,1,0,NULL,NULL,0),(691,'风衣',77,3,1,0,NULL,NULL,0),(692,'毛呢大衣',77,3,1,0,NULL,NULL,0),(693,'仿皮皮衣',77,3,1,0,NULL,NULL,0),(694,'西服',77,3,1,0,NULL,NULL,0),(695,'棉服',77,3,1,0,NULL,NULL,0),(696,'羽绒服',77,3,1,0,NULL,NULL,0),(697,'牛仔裤',77,3,1,0,NULL,NULL,0),(698,'休闲裤',77,3,1,0,NULL,NULL,0),(699,'西裤',77,3,1,0,NULL,NULL,0),(700,'西服套装',77,3,1,0,NULL,NULL,0),(701,'大码男装',77,3,1,0,NULL,NULL,0),(702,'中老年男装',77,3,1,0,NULL,NULL,0),(703,'唐装/中山装',77,3,1,0,NULL,NULL,0),(704,'工装',77,3,1,0,NULL,NULL,0),(705,'真皮皮衣',77,3,1,0,NULL,NULL,0),(706,'加绒裤',77,3,1,0,NULL,NULL,0),(707,'卫裤/运动裤',77,3,1,0,NULL,NULL,0),(708,'短裤',77,3,1,0,NULL,NULL,0),(709,'设计师/潮牌',77,3,1,0,NULL,NULL,0),(710,'羊毛衫',77,3,1,0,NULL,NULL,0),(711,'文胸',78,3,1,0,NULL,NULL,0),(712,'女式内裤',78,3,1,0,NULL,NULL,0),(713,'男式内裤',78,3,1,0,NULL,NULL,0),(714,'睡衣/家居服',78,3,1,0,NULL,NULL,0),(715,'塑身美体',78,3,1,0,NULL,NULL,0),(716,'泳衣',78,3,1,0,NULL,NULL,0),(717,'吊带/背心',78,3,1,0,NULL,NULL,0),(718,'抹胸',78,3,1,0,NULL,NULL,0),(719,'连裤袜/丝袜',78,3,1,0,NULL,NULL,0),(720,'美腿袜',78,3,1,0,NULL,NULL,0),(721,'商务男袜',78,3,1,0,NULL,NULL,0),(722,'保暖内衣',78,3,1,0,NULL,NULL,0),(723,'情侣睡衣',78,3,1,0,NULL,NULL,0),(724,'文胸套装',78,3,1,0,NULL,NULL,0),(725,'少女文胸',78,3,1,0,NULL,NULL,0),(726,'休闲棉袜',78,3,1,0,NULL,NULL,0),(727,'大码内衣',78,3,1,0,NULL,NULL,0),(728,'内衣配件',78,3,1,0,NULL,NULL,0),(729,'打底裤袜',78,3,1,0,NULL,NULL,0),(730,'打底衫',78,3,1,0,NULL,NULL,0),(731,'秋衣秋裤',78,3,1,0,NULL,NULL,0),(732,'情趣内衣',78,3,1,0,NULL,NULL,0),(733,'服装洗护',79,3,1,0,NULL,NULL,0),(734,'太阳镜',80,3,1,0,NULL,NULL,0),(735,'光学镜架/镜片',80,3,1,0,NULL,NULL,0),(736,'围巾/手套/帽子套装',80,3,1,0,NULL,NULL,0),(737,'袖扣',80,3,1,0,NULL,NULL,0),(738,'棒球帽',80,3,1,0,NULL,NULL,0),(739,'毛线帽',80,3,1,0,NULL,NULL,0),(740,'遮阳帽',80,3,1,0,NULL,NULL,0),(741,'老花镜',80,3,1,0,NULL,NULL,0),(742,'装饰眼镜',80,3,1,0,NULL,NULL,0),(743,'防辐射眼镜',80,3,1,0,NULL,NULL,0),(744,'游泳镜',80,3,1,0,NULL,NULL,0),(745,'女士丝巾/围巾/披肩',80,3,1,0,NULL,NULL,0),(746,'男士丝巾/围巾',80,3,1,0,NULL,NULL,0),(747,'鸭舌帽',80,3,1,0,NULL,NULL,0),(748,'贝雷帽',80,3,1,0,NULL,NULL,0),(749,'礼帽',80,3,1,0,NULL,NULL,0),(750,'真皮手套',80,3,1,0,NULL,NULL,0),(751,'毛线手套',80,3,1,0,NULL,NULL,0),(752,'防晒手套',80,3,1,0,NULL,NULL,0),(753,'男士腰带/礼盒',80,3,1,0,NULL,NULL,0),(754,'女士腰带/礼盒',80,3,1,0,NULL,NULL,0),(755,'钥匙扣',80,3,1,0,NULL,NULL,0),(756,'遮阳伞/雨伞',80,3,1,0,NULL,NULL,0),(757,'口罩',80,3,1,0,NULL,NULL,0),(758,'耳罩/耳包',80,3,1,0,NULL,NULL,0),(759,'假领',80,3,1,0,NULL,NULL,0),(760,'毛线/布面料',80,3,1,0,NULL,NULL,0),(761,'领带/领结/领带夹',80,3,1,0,NULL,NULL,0),(762,'男表',81,3,1,0,NULL,NULL,0),(763,'瑞表',81,3,1,0,NULL,NULL,0),(764,'女表',81,3,1,0,NULL,NULL,0),(765,'国表',81,3,1,0,NULL,NULL,0),(766,'日韩表',81,3,1,0,NULL,NULL,0),(767,'欧美表',81,3,1,0,NULL,NULL,0),(768,'德表',81,3,1,0,NULL,NULL,0),(769,'儿童手表',81,3,1,0,NULL,NULL,0),(770,'智能手表',81,3,1,0,NULL,NULL,0),(771,'闹钟',81,3,1,0,NULL,NULL,0),(772,'座钟挂钟',81,3,1,0,NULL,NULL,0),(773,'钟表配件',81,3,1,0,NULL,NULL,0),(774,'商务休闲鞋',82,3,1,0,NULL,NULL,0),(775,'正装鞋',82,3,1,0,NULL,NULL,0),(776,'休闲鞋',82,3,1,0,NULL,NULL,0),(777,'凉鞋/沙滩鞋',82,3,1,0,NULL,NULL,0),(778,'男靴',82,3,1,0,NULL,NULL,0),(779,'功能鞋',82,3,1,0,NULL,NULL,0),(780,'拖鞋/人字拖',82,3,1,0,NULL,NULL,0),(781,'雨鞋/雨靴',82,3,1,0,NULL,NULL,0),(782,'传统布鞋',82,3,1,0,NULL,NULL,0),(783,'鞋配件',82,3,1,0,NULL,NULL,0),(784,'帆布鞋',82,3,1,0,NULL,NULL,0),(785,'增高鞋',82,3,1,0,NULL,NULL,0),(786,'工装鞋',82,3,1,0,NULL,NULL,0),(787,'定制鞋',82,3,1,0,NULL,NULL,0),(788,'高跟鞋',83,3,1,0,NULL,NULL,0),(789,'单鞋',83,3,1,0,NULL,NULL,0),(790,'休闲鞋',83,3,1,0,NULL,NULL,0),(791,'凉鞋',83,3,1,0,NULL,NULL,0),(792,'女靴',83,3,1,0,NULL,NULL,0),(793,'雪地靴',83,3,1,0,NULL,NULL,0),(794,'拖鞋/人字拖',83,3,1,0,NULL,NULL,0),(795,'踝靴',83,3,1,0,NULL,NULL,0),(796,'筒靴',83,3,1,0,NULL,NULL,0),(797,'帆布鞋',83,3,1,0,NULL,NULL,0),(798,'雨鞋/雨靴',83,3,1,0,NULL,NULL,0),(799,'妈妈鞋',83,3,1,0,NULL,NULL,0),(800,'鞋配件',83,3,1,0,NULL,NULL,0),(801,'特色鞋',83,3,1,0,NULL,NULL,0),(802,'鱼嘴鞋',83,3,1,0,NULL,NULL,0),(803,'布鞋/绣花鞋',83,3,1,0,NULL,NULL,0),(804,'马丁靴',83,3,1,0,NULL,NULL,0),(805,'坡跟鞋',83,3,1,0,NULL,NULL,0),(806,'松糕鞋',83,3,1,0,NULL,NULL,0),(807,'内增高',83,3,1,0,NULL,NULL,0),(808,'防水台',83,3,1,0,NULL,NULL,0),(809,'婴幼奶粉',84,3,1,0,NULL,NULL,0),(810,'孕妈奶粉',84,3,1,0,NULL,NULL,0),(811,'益生菌/初乳',85,3,1,0,NULL,NULL,0),(812,'米粉/菜粉',85,3,1,0,NULL,NULL,0),(813,'果泥/果汁',85,3,1,0,NULL,NULL,0),(814,'DHA',85,3,1,0,NULL,NULL,0),(815,'宝宝零食',85,3,1,0,NULL,NULL,0),(816,'钙铁锌/维生素',85,3,1,0,NULL,NULL,0),(817,'清火/开胃',85,3,1,0,NULL,NULL,0),(818,'面条/粥',85,3,1,0,NULL,NULL,0),(819,'婴儿尿裤',86,3,1,0,NULL,NULL,0),(820,'拉拉裤',86,3,1,0,NULL,NULL,0),(821,'婴儿湿巾',86,3,1,0,NULL,NULL,0),(822,'成人尿裤',86,3,1,0,NULL,NULL,0),(823,'奶瓶奶嘴',87,3,1,0,NULL,NULL,0),(824,'吸奶器',87,3,1,0,NULL,NULL,0),(825,'暖奶消毒',87,3,1,0,NULL,NULL,0),(826,'儿童餐具',87,3,1,0,NULL,NULL,0),(827,'水壶/水杯',87,3,1,0,NULL,NULL,0),(828,'牙胶安抚',87,3,1,0,NULL,NULL,0),(829,'围兜/防溅衣',87,3,1,0,NULL,NULL,0),(830,'辅食料理机',87,3,1,0,NULL,NULL,0),(831,'食物存储',87,3,1,0,NULL,NULL,0),(832,'宝宝护肤',88,3,1,0,NULL,NULL,0),(833,'洗发沐浴',88,3,1,0,NULL,NULL,0),(834,'奶瓶清洗',88,3,1,0,NULL,NULL,0),(835,'驱蚊防晒',88,3,1,0,NULL,NULL,0),(836,'理发器',88,3,1,0,NULL,NULL,0),(837,'洗澡用具',88,3,1,0,NULL,NULL,0),(838,'婴儿口腔清洁',88,3,1,0,NULL,NULL,0),(839,'洗衣液/皂',88,3,1,0,NULL,NULL,0),(840,'日常护理',88,3,1,0,NULL,NULL,0),(841,'座便器',88,3,1,0,NULL,NULL,0),(842,'婴儿推车',89,3,1,0,NULL,NULL,0),(843,'餐椅摇椅',89,3,1,0,NULL,NULL,0),(844,'婴儿床',89,3,1,0,NULL,NULL,0),(845,'学步车',89,3,1,0,NULL,NULL,0),(846,'三轮车',89,3,1,0,NULL,NULL,0),(847,'自行车',89,3,1,0,NULL,NULL,0),(848,'电动车',89,3,1,0,NULL,NULL,0),(849,'扭扭车',89,3,1,0,NULL,NULL,0),(850,'滑板车',89,3,1,0,NULL,NULL,0),(851,'婴儿床垫',89,3,1,0,NULL,NULL,0),(852,'婴儿外出服',90,3,1,0,NULL,NULL,0),(853,'婴儿内衣',90,3,1,0,NULL,NULL,0),(854,'婴儿礼盒',90,3,1,0,NULL,NULL,0),(855,'婴儿鞋帽袜',90,3,1,0,NULL,NULL,0),(856,'安全防护',90,3,1,0,NULL,NULL,0),(857,'家居床品',90,3,1,0,NULL,NULL,0),(858,'睡袋/抱被',90,3,1,0,NULL,NULL,0),(859,'爬行垫',90,3,1,0,NULL,NULL,0),(860,'妈咪包/背婴带',91,3,1,0,NULL,NULL,0),(861,'产后塑身',91,3,1,0,NULL,NULL,0),(862,'文胸/内裤',91,3,1,0,NULL,NULL,0),(863,'防辐射服',91,3,1,0,NULL,NULL,0),(864,'孕妈装',91,3,1,0,NULL,NULL,0),(865,'孕期营养',91,3,1,0,NULL,NULL,0),(866,'孕妇护肤',91,3,1,0,NULL,NULL,0),(867,'待产护理',91,3,1,0,NULL,NULL,0),(868,'月子装',91,3,1,0,NULL,NULL,0),(869,'防溢乳垫',91,3,1,0,NULL,NULL,0),(870,'套装',92,3,1,0,NULL,NULL,0),(871,'上衣',92,3,1,0,NULL,NULL,0),(872,'裤子',92,3,1,0,NULL,NULL,0),(873,'裙子',92,3,1,0,NULL,NULL,0),(874,'内衣/家居服',92,3,1,0,NULL,NULL,0),(875,'羽绒服/棉服',92,3,1,0,NULL,NULL,0),(876,'亲子装',92,3,1,0,NULL,NULL,0),(877,'儿童配饰',92,3,1,0,NULL,NULL,0),(878,'礼服/演出服',92,3,1,0,NULL,NULL,0),(879,'运动鞋',92,3,1,0,NULL,NULL,0),(880,'皮鞋/帆布鞋',92,3,1,0,NULL,NULL,0),(881,'靴子',92,3,1,0,NULL,NULL,0),(882,'凉鞋',92,3,1,0,NULL,NULL,0),(883,'功能鞋',92,3,1,0,NULL,NULL,0),(884,'户外/运动服',92,3,1,0,NULL,NULL,0),(885,'提篮式',93,3,1,0,NULL,NULL,0),(886,'安全座椅',93,3,1,0,NULL,NULL,0),(887,'增高垫',93,3,1,0,NULL,NULL,0),(888,'钱包',94,3,1,0,NULL,NULL,0),(889,'手拿包',94,3,1,0,NULL,NULL,0),(890,'单肩包',94,3,1,0,NULL,NULL,0),(891,'双肩包',94,3,1,0,NULL,NULL,0),(892,'手提包',94,3,1,0,NULL,NULL,0),(893,'斜挎包',94,3,1,0,NULL,NULL,0),(894,'钥匙包',94,3,1,0,NULL,NULL,0),(895,'卡包/零钱包',94,3,1,0,NULL,NULL,0),(896,'男士钱包',95,3,1,0,NULL,NULL,0),(897,'男士手包',95,3,1,0,NULL,NULL,0),(898,'卡包名片夹',95,3,1,0,NULL,NULL,0),(899,'商务公文包',95,3,1,0,NULL,NULL,0),(900,'双肩包',95,3,1,0,NULL,NULL,0),(901,'单肩/斜挎包',95,3,1,0,NULL,NULL,0),(902,'钥匙包',95,3,1,0,NULL,NULL,0),(903,'电脑包',96,3,1,0,NULL,NULL,0),(904,'拉杆箱',96,3,1,0,NULL,NULL,0),(905,'旅行包',96,3,1,0,NULL,NULL,0),(906,'旅行配件',96,3,1,0,NULL,NULL,0),(907,'休闲运动包',96,3,1,0,NULL,NULL,0),(908,'拉杆包',96,3,1,0,NULL,NULL,0),(909,'登山包',96,3,1,0,NULL,NULL,0),(910,'妈咪包',96,3,1,0,NULL,NULL,0),(911,'书包',96,3,1,0,NULL,NULL,0),(912,'相机包',96,3,1,0,NULL,NULL,0),(913,'腰包/胸包',96,3,1,0,NULL,NULL,0),(914,'火机烟具',97,3,1,0,NULL,NULL,0),(915,'礼品文具',97,3,1,0,NULL,NULL,0),(916,'军刀军具',97,3,1,0,NULL,NULL,0),(917,'收藏品',97,3,1,0,NULL,NULL,0),(918,'工艺礼品',97,3,1,0,NULL,NULL,0),(919,'创意礼品',97,3,1,0,NULL,NULL,0),(920,'礼盒礼券',97,3,1,0,NULL,NULL,0),(921,'鲜花绿植',97,3,1,0,NULL,NULL,0),(922,'婚庆节庆',97,3,1,0,NULL,NULL,0),(923,'京东卡',97,3,1,0,NULL,NULL,0),(924,'美妆礼品',97,3,1,0,NULL,NULL,0),(925,'礼品定制',97,3,1,0,NULL,NULL,0),(926,'京东福卡',97,3,1,0,NULL,NULL,0),(927,'古董文玩',97,3,1,0,NULL,NULL,0),(928,'箱包',98,3,1,0,NULL,NULL,0),(929,'钱包',98,3,1,0,NULL,NULL,0),(930,'服饰',98,3,1,0,NULL,NULL,0),(931,'腰带',98,3,1,0,NULL,NULL,0),(932,'太阳镜/眼镜框',98,3,1,0,NULL,NULL,0),(933,'配件',98,3,1,0,NULL,NULL,0),(934,'鞋靴',98,3,1,0,NULL,NULL,0),(935,'饰品',98,3,1,0,NULL,NULL,0),(936,'名品腕表',98,3,1,0,NULL,NULL,0),(937,'高档化妆品',98,3,1,0,NULL,NULL,0),(938,'婚嫁首饰',99,3,1,0,NULL,NULL,0),(939,'婚纱摄影',99,3,1,0,NULL,NULL,0),(940,'婚纱礼服',99,3,1,0,NULL,NULL,0),(941,'婚庆服务',99,3,1,0,NULL,NULL,0),(942,'婚庆礼品/用品',99,3,1,0,NULL,NULL,0),(943,'婚宴',99,3,1,0,NULL,NULL,0),(944,'饼干蛋糕',100,3,1,0,NULL,NULL,0),(945,'糖果/巧克力',100,3,1,0,NULL,NULL,0),(946,'休闲零食',100,3,1,0,NULL,NULL,0),(947,'冲调饮品',100,3,1,0,NULL,NULL,0),(948,'粮油调味',100,3,1,0,NULL,NULL,0),(949,'牛奶',100,3,1,0,NULL,NULL,0),(950,'其他特产',101,3,1,0,NULL,NULL,0),(951,'新疆',101,3,1,0,NULL,NULL,0),(952,'北京',101,3,1,0,NULL,NULL,0),(953,'山西',101,3,1,0,NULL,NULL,0),(954,'内蒙古',101,3,1,0,NULL,NULL,0),(955,'福建',101,3,1,0,NULL,NULL,0),(956,'湖南',101,3,1,0,NULL,NULL,0),(957,'四川',101,3,1,0,NULL,NULL,0),(958,'云南',101,3,1,0,NULL,NULL,0),(959,'东北',101,3,1,0,NULL,NULL,0),(960,'休闲零食',102,3,1,0,NULL,NULL,0),(961,'坚果炒货',102,3,1,0,NULL,NULL,0),(962,'肉干肉脯',102,3,1,0,NULL,NULL,0),(963,'蜜饯果干',102,3,1,0,NULL,NULL,0),(964,'糖果/巧克力',102,3,1,0,NULL,NULL,0),(965,'饼干蛋糕',102,3,1,0,NULL,NULL,0),(966,'无糖食品',102,3,1,0,NULL,NULL,0),(967,'米面杂粮',103,3,1,0,NULL,NULL,0),(968,'食用油',103,3,1,0,NULL,NULL,0),(969,'调味品',103,3,1,0,NULL,NULL,0),(970,'南北干货',103,3,1,0,NULL,NULL,0),(971,'方便食品',103,3,1,0,NULL,NULL,0),(972,'有机食品',103,3,1,0,NULL,NULL,0),(973,'饮用水',104,3,1,0,NULL,NULL,0),(974,'饮料',104,3,1,0,NULL,NULL,0),(975,'牛奶乳品',104,3,1,0,NULL,NULL,0),(976,'咖啡/奶茶',104,3,1,0,NULL,NULL,0),(977,'冲饮谷物',104,3,1,0,NULL,NULL,0),(978,'蜂蜜/柚子茶',104,3,1,0,NULL,NULL,0),(979,'成人奶粉',104,3,1,0,NULL,NULL,0),(980,'月饼',105,3,1,0,NULL,NULL,0),(981,'大闸蟹',105,3,1,0,NULL,NULL,0),(982,'粽子',105,3,1,0,NULL,NULL,0),(983,'卡券',105,3,1,0,NULL,NULL,0),(984,'铁观音',106,3,1,0,NULL,NULL,0),(985,'普洱',106,3,1,0,NULL,NULL,0),(986,'龙井',106,3,1,0,NULL,NULL,0),(987,'绿茶',106,3,1,0,NULL,NULL,0),(988,'红茶',106,3,1,0,NULL,NULL,0),(989,'乌龙茶',106,3,1,0,NULL,NULL,0),(990,'花草茶',106,3,1,0,NULL,NULL,0),(991,'花果茶',106,3,1,0,NULL,NULL,0),(992,'养生茶',106,3,1,0,NULL,NULL,0),(993,'黑茶',106,3,1,0,NULL,NULL,0),(994,'白茶',106,3,1,0,NULL,NULL,0),(995,'其它茶',106,3,1,0,NULL,NULL,0),(996,'项链',107,3,1,0,NULL,NULL,0),(997,'手链/脚链',107,3,1,0,NULL,NULL,0),(998,'戒指',107,3,1,0,NULL,NULL,0),(999,'耳饰',107,3,1,0,NULL,NULL,0),(1000,'毛衣链',107,3,1,0,NULL,NULL,0),(1001,'发饰/发卡',107,3,1,0,NULL,NULL,0),(1002,'胸针',107,3,1,0,NULL,NULL,0),(1003,'饰品配件',107,3,1,0,NULL,NULL,0),(1004,'婚庆饰品',107,3,1,0,NULL,NULL,0),(1005,'黄金吊坠',108,3,1,0,NULL,NULL,0),(1006,'黄金项链',108,3,1,0,NULL,NULL,0),(1007,'黄金转运珠',108,3,1,0,NULL,NULL,0),(1008,'黄金手镯/手链/脚链',108,3,1,0,NULL,NULL,0),(1009,'黄金耳饰',108,3,1,0,NULL,NULL,0),(1010,'黄金戒指',108,3,1,0,NULL,NULL,0),(1011,'K金吊坠',109,3,1,0,NULL,NULL,0),(1012,'K金项链',109,3,1,0,NULL,NULL,0),(1013,'K金手镯/手链/脚链',109,3,1,0,NULL,NULL,0),(1014,'K金戒指',109,3,1,0,NULL,NULL,0),(1015,'K金耳饰',109,3,1,0,NULL,NULL,0),(1016,'投资金',110,3,1,0,NULL,NULL,0),(1017,'投资银',110,3,1,0,NULL,NULL,0),(1018,'投资收藏',110,3,1,0,NULL,NULL,0),(1019,'银吊坠/项链',111,3,1,0,NULL,NULL,0),(1020,'银手镯/手链/脚链',111,3,1,0,NULL,NULL,0),(1021,'银戒指',111,3,1,0,NULL,NULL,0),(1022,'银耳饰',111,3,1,0,NULL,NULL,0),(1023,'足银手镯',111,3,1,0,NULL,NULL,0),(1024,'宝宝银饰',111,3,1,0,NULL,NULL,0),(1025,'裸钻',112,3,1,0,NULL,NULL,0),(1026,'钻戒',112,3,1,0,NULL,NULL,0),(1027,'钻石项链/吊坠',112,3,1,0,NULL,NULL,0),(1028,'钻石耳饰',112,3,1,0,NULL,NULL,0),(1029,'钻石手镯/手链',112,3,1,0,NULL,NULL,0),(1030,'项链/吊坠',113,3,1,0,NULL,NULL,0),(1031,'手镯/手串',113,3,1,0,NULL,NULL,0),(1032,'戒指',113,3,1,0,NULL,NULL,0),(1033,'耳饰',113,3,1,0,NULL,NULL,0),(1034,'挂件/摆件/把件',113,3,1,0,NULL,NULL,0),(1035,'玉石孤品',113,3,1,0,NULL,NULL,0),(1036,'项链/吊坠',114,3,1,0,NULL,NULL,0),(1037,'耳饰',114,3,1,0,NULL,NULL,0),(1038,'手镯/手链/脚链',114,3,1,0,NULL,NULL,0),(1039,'戒指',114,3,1,0,NULL,NULL,0),(1040,'头饰/胸针',114,3,1,0,NULL,NULL,0),(1041,'摆件/挂件',114,3,1,0,NULL,NULL,0),(1042,'琥珀/蜜蜡',115,3,1,0,NULL,NULL,0),(1043,'碧玺',115,3,1,0,NULL,NULL,0),(1044,'红宝石/蓝宝石',115,3,1,0,NULL,NULL,0),(1045,'坦桑石',115,3,1,0,NULL,NULL,0),(1046,'珊瑚',115,3,1,0,NULL,NULL,0),(1047,'祖母绿',115,3,1,0,NULL,NULL,0),(1048,'葡萄石',115,3,1,0,NULL,NULL,0),(1049,'其他天然宝石',115,3,1,0,NULL,NULL,0),(1050,'项链/吊坠',115,3,1,0,NULL,NULL,0),(1051,'耳饰',115,3,1,0,NULL,NULL,0),(1052,'手镯/手链',115,3,1,0,NULL,NULL,0),(1053,'戒指',115,3,1,0,NULL,NULL,0),(1054,'铂金项链/吊坠',116,3,1,0,NULL,NULL,0),(1055,'铂金手镯/手链/脚链',116,3,1,0,NULL,NULL,0),(1056,'铂金戒指',116,3,1,0,NULL,NULL,0),(1057,'铂金耳饰',116,3,1,0,NULL,NULL,0),(1058,'小叶紫檀',117,3,1,0,NULL,NULL,0),(1059,'黄花梨',117,3,1,0,NULL,NULL,0),(1060,'沉香木',117,3,1,0,NULL,NULL,0),(1061,'金丝楠',117,3,1,0,NULL,NULL,0),(1062,'菩提',117,3,1,0,NULL,NULL,0),(1063,'其他',117,3,1,0,NULL,NULL,0),(1064,'橄榄核/核桃',117,3,1,0,NULL,NULL,0),(1065,'檀香',117,3,1,0,NULL,NULL,0),(1066,'珍珠项链',118,3,1,0,NULL,NULL,0),(1067,'珍珠吊坠',118,3,1,0,NULL,NULL,0),(1068,'珍珠耳饰',118,3,1,0,NULL,NULL,0),(1069,'珍珠手链',118,3,1,0,NULL,NULL,0),(1070,'珍珠戒指',118,3,1,0,NULL,NULL,0),(1071,'珍珠胸针',118,3,1,0,NULL,NULL,0),(1072,'机油',119,3,1,0,NULL,NULL,0),(1073,'正时皮带',119,3,1,0,NULL,NULL,0),(1074,'添加剂',119,3,1,0,NULL,NULL,0),(1075,'汽车喇叭',119,3,1,0,NULL,NULL,0),(1076,'防冻液',119,3,1,0,NULL,NULL,0),(1077,'汽车玻璃',119,3,1,0,NULL,NULL,0),(1078,'滤清器',119,3,1,0,NULL,NULL,0),(1079,'火花塞',119,3,1,0,NULL,NULL,0),(1080,'减震器',119,3,1,0,NULL,NULL,0),(1081,'柴机油/辅助油',119,3,1,0,NULL,NULL,0),(1082,'雨刷',119,3,1,0,NULL,NULL,0),(1083,'车灯',119,3,1,0,NULL,NULL,0),(1084,'后视镜',119,3,1,0,NULL,NULL,0),(1085,'轮胎',119,3,1,0,NULL,NULL,0),(1086,'轮毂',119,3,1,0,NULL,NULL,0),(1087,'刹车片/盘',119,3,1,0,NULL,NULL,0),(1088,'维修配件',119,3,1,0,NULL,NULL,0),(1089,'蓄电池',119,3,1,0,NULL,NULL,0),(1090,'底盘装甲/护板',119,3,1,0,NULL,NULL,0),(1091,'贴膜',119,3,1,0,NULL,NULL,0),(1092,'汽修工具',119,3,1,0,NULL,NULL,0),(1093,'改装配件',119,3,1,0,NULL,NULL,0),(1094,'导航仪',120,3,1,0,NULL,NULL,0),(1095,'安全预警仪',120,3,1,0,NULL,NULL,0),(1096,'行车记录仪',120,3,1,0,NULL,NULL,0),(1097,'倒车雷达',120,3,1,0,NULL,NULL,0),(1098,'蓝牙设备',120,3,1,0,NULL,NULL,0),(1099,'车载影音',120,3,1,0,NULL,NULL,0),(1100,'净化器',120,3,1,0,NULL,NULL,0),(1101,'电源',120,3,1,0,NULL,NULL,0),(1102,'智能驾驶',120,3,1,0,NULL,NULL,0),(1103,'车载电台',120,3,1,0,NULL,NULL,0),(1104,'车载电器配件',120,3,1,0,NULL,NULL,0),(1105,'吸尘器',120,3,1,0,NULL,NULL,0),(1106,'智能车机',120,3,1,0,NULL,NULL,0),(1107,'冰箱',120,3,1,0,NULL,NULL,0),(1108,'汽车音响',120,3,1,0,NULL,NULL,0),(1109,'车载生活电器',120,3,1,0,NULL,NULL,0),(1110,'车蜡',121,3,1,0,NULL,NULL,0),(1111,'补漆笔',121,3,1,0,NULL,NULL,0),(1112,'玻璃水',121,3,1,0,NULL,NULL,0),(1113,'清洁剂',121,3,1,0,NULL,NULL,0),(1114,'洗车工具',121,3,1,0,NULL,NULL,0),(1115,'镀晶镀膜',121,3,1,0,NULL,NULL,0),(1116,'打蜡机',121,3,1,0,NULL,NULL,0),(1117,'洗车配件',121,3,1,0,NULL,NULL,0),(1118,'洗车机',121,3,1,0,NULL,NULL,0),(1119,'洗车水枪',121,3,1,0,NULL,NULL,0),(1120,'毛巾掸子',121,3,1,0,NULL,NULL,0),(1121,'脚垫',122,3,1,0,NULL,NULL,0),(1122,'座垫',122,3,1,0,NULL,NULL,0),(1123,'座套',122,3,1,0,NULL,NULL,0),(1124,'后备箱垫',122,3,1,0,NULL,NULL,0),(1125,'头枕腰靠',122,3,1,0,NULL,NULL,0),(1126,'方向盘套',122,3,1,0,NULL,NULL,0),(1127,'香水',122,3,1,0,NULL,NULL,0),(1128,'空气净化',122,3,1,0,NULL,NULL,0),(1129,'挂件摆件',122,3,1,0,NULL,NULL,0),(1130,'功能小件',122,3,1,0,NULL,NULL,0),(1131,'车身装饰件',122,3,1,0,NULL,NULL,0),(1132,'车衣',122,3,1,0,NULL,NULL,0),(1133,'安全座椅',123,3,1,0,NULL,NULL,0),(1134,'胎压监测',123,3,1,0,NULL,NULL,0),(1135,'防盗设备',123,3,1,0,NULL,NULL,0),(1136,'应急救援',123,3,1,0,NULL,NULL,0),(1137,'保温箱',123,3,1,0,NULL,NULL,0),(1138,'地锁',123,3,1,0,NULL,NULL,0),(1139,'摩托车',123,3,1,0,NULL,NULL,0),(1140,'充气泵',123,3,1,0,NULL,NULL,0),(1141,'储物箱',123,3,1,0,NULL,NULL,0),(1142,'自驾野营',123,3,1,0,NULL,NULL,0),(1143,'摩托车装备',123,3,1,0,NULL,NULL,0),(1144,'清洗美容',124,3,1,0,NULL,NULL,0),(1145,'功能升级',124,3,1,0,NULL,NULL,0),(1146,'保养维修',124,3,1,0,NULL,NULL,0),(1147,'油卡充值',124,3,1,0,NULL,NULL,0),(1148,'车险',124,3,1,0,NULL,NULL,0),(1149,'加油卡',124,3,1,0,NULL,NULL,0),(1150,'ETC',124,3,1,0,NULL,NULL,0),(1151,'驾驶培训',124,3,1,0,NULL,NULL,0),(1152,'赛事服装',125,3,1,0,NULL,NULL,0),(1153,'赛事用品',125,3,1,0,NULL,NULL,0),(1154,'制动系统',125,3,1,0,NULL,NULL,0),(1155,'悬挂系统',125,3,1,0,NULL,NULL,0),(1156,'进气系统',125,3,1,0,NULL,NULL,0),(1157,'排气系统',125,3,1,0,NULL,NULL,0),(1158,'电子管理',125,3,1,0,NULL,NULL,0),(1159,'车身强化',125,3,1,0,NULL,NULL,0),(1160,'赛事座椅',125,3,1,0,NULL,NULL,0),(1161,'跑步鞋',126,3,1,0,NULL,NULL,0),(1162,'休闲鞋',126,3,1,0,NULL,NULL,0),(1163,'篮球鞋',126,3,1,0,NULL,NULL,0),(1164,'板鞋',126,3,1,0,NULL,NULL,0),(1165,'帆布鞋',126,3,1,0,NULL,NULL,0),(1166,'足球鞋',126,3,1,0,NULL,NULL,0),(1167,'乒羽网鞋',126,3,1,0,NULL,NULL,0),(1168,'专项运动鞋',126,3,1,0,NULL,NULL,0),(1169,'训练鞋',126,3,1,0,NULL,NULL,0),(1170,'拖鞋',126,3,1,0,NULL,NULL,0),(1171,'运动包',126,3,1,0,NULL,NULL,0),(1172,'羽绒服',127,3,1,0,NULL,NULL,0),(1173,'棉服',127,3,1,0,NULL,NULL,0),(1174,'运动裤',127,3,1,0,NULL,NULL,0),(1175,'夹克/风衣',127,3,1,0,NULL,NULL,0),(1176,'卫衣/套头衫',127,3,1,0,NULL,NULL,0),(1177,'T恤',127,3,1,0,NULL,NULL,0),(1178,'套装',127,3,1,0,NULL,NULL,0),(1179,'乒羽网服',127,3,1,0,NULL,NULL,0),(1180,'健身服',127,3,1,0,NULL,NULL,0),(1181,'运动背心',127,3,1,0,NULL,NULL,0),(1182,'毛衫/线衫',127,3,1,0,NULL,NULL,0),(1183,'运动配饰',127,3,1,0,NULL,NULL,0),(1184,'折叠车',128,3,1,0,NULL,NULL,0),(1185,'山地车/公路车',128,3,1,0,NULL,NULL,0),(1186,'电动车',128,3,1,0,NULL,NULL,0),(1187,'其他整车',128,3,1,0,NULL,NULL,0),(1188,'骑行服',128,3,1,0,NULL,NULL,0),(1189,'骑行装备',128,3,1,0,NULL,NULL,0),(1190,'平衡车',128,3,1,0,NULL,NULL,0),(1191,'鱼竿鱼线',129,3,1,0,NULL,NULL,0),(1192,'浮漂鱼饵',129,3,1,0,NULL,NULL,0),(1193,'钓鱼桌椅',129,3,1,0,NULL,NULL,0),(1194,'钓鱼配件',129,3,1,0,NULL,NULL,0),(1195,'钓箱鱼包',129,3,1,0,NULL,NULL,0),(1196,'其它',129,3,1,0,NULL,NULL,0),(1197,'泳镜',130,3,1,0,NULL,NULL,0),(1198,'泳帽',130,3,1,0,NULL,NULL,0),(1199,'游泳包防水包',130,3,1,0,NULL,NULL,0),(1200,'女士泳衣',130,3,1,0,NULL,NULL,0),(1201,'男士泳衣',130,3,1,0,NULL,NULL,0),(1202,'比基尼',130,3,1,0,NULL,NULL,0),(1203,'其它',130,3,1,0,NULL,NULL,0),(1204,'冲锋衣裤',131,3,1,0,NULL,NULL,0),(1205,'速干衣裤',131,3,1,0,NULL,NULL,0),(1206,'滑雪服',131,3,1,0,NULL,NULL,0),(1207,'羽绒服/棉服',131,3,1,0,NULL,NULL,0),(1208,'休闲衣裤',131,3,1,0,NULL,NULL,0),(1209,'抓绒衣裤',131,3,1,0,NULL,NULL,0),(1210,'软壳衣裤',131,3,1,0,NULL,NULL,0),(1211,'T恤',131,3,1,0,NULL,NULL,0),(1212,'户外风衣',131,3,1,0,NULL,NULL,0),(1213,'功能内衣',131,3,1,0,NULL,NULL,0),(1214,'军迷服饰',131,3,1,0,NULL,NULL,0),(1215,'登山鞋',131,3,1,0,NULL,NULL,0),(1216,'雪地靴',131,3,1,0,NULL,NULL,0),(1217,'徒步鞋',131,3,1,0,NULL,NULL,0),(1218,'越野跑鞋',131,3,1,0,NULL,NULL,0),(1219,'休闲鞋',131,3,1,0,NULL,NULL,0),(1220,'工装鞋',131,3,1,0,NULL,NULL,0),(1221,'溯溪鞋',131,3,1,0,NULL,NULL,0),(1222,'沙滩/凉拖',131,3,1,0,NULL,NULL,0),(1223,'户外袜',131,3,1,0,NULL,NULL,0),(1224,'帐篷/垫子',132,3,1,0,NULL,NULL,0),(1225,'睡袋/吊床',132,3,1,0,NULL,NULL,0),(1226,'登山攀岩',132,3,1,0,NULL,NULL,0),(1227,'户外配饰',132,3,1,0,NULL,NULL,0),(1228,'背包',132,3,1,0,NULL,NULL,0),(1229,'户外照明',132,3,1,0,NULL,NULL,0),(1230,'户外仪表',132,3,1,0,NULL,NULL,0),(1231,'户外工具',132,3,1,0,NULL,NULL,0),(1232,'望远镜',132,3,1,0,NULL,NULL,0),(1233,'旅游用品',132,3,1,0,NULL,NULL,0),(1234,'便携桌椅床',132,3,1,0,NULL,NULL,0),(1235,'野餐烧烤',132,3,1,0,NULL,NULL,0),(1236,'军迷用品',132,3,1,0,NULL,NULL,0),(1237,'救援装备',132,3,1,0,NULL,NULL,0),(1238,'滑雪装备',132,3,1,0,NULL,NULL,0),(1239,'极限户外',132,3,1,0,NULL,NULL,0),(1240,'冲浪潜水',132,3,1,0,NULL,NULL,0),(1241,'综合训练器',133,3,1,0,NULL,NULL,0),(1242,'其他大型器械',133,3,1,0,NULL,NULL,0),(1243,'哑铃',133,3,1,0,NULL,NULL,0),(1244,'仰卧板/收腹机',133,3,1,0,NULL,NULL,0),(1245,'其他中小型器材',133,3,1,0,NULL,NULL,0),(1246,'瑜伽舞蹈',133,3,1,0,NULL,NULL,0),(1247,'甩脂机',133,3,1,0,NULL,NULL,0),(1248,'踏步机',133,3,1,0,NULL,NULL,0),(1249,'武术搏击',133,3,1,0,NULL,NULL,0),(1250,'健身车/动感单车',133,3,1,0,NULL,NULL,0),(1251,'跑步机',133,3,1,0,NULL,NULL,0),(1252,'运动护具',133,3,1,0,NULL,NULL,0),(1253,'羽毛球',134,3,1,0,NULL,NULL,0),(1254,'乒乓球',134,3,1,0,NULL,NULL,0),(1255,'篮球',134,3,1,0,NULL,NULL,0),(1256,'足球',134,3,1,0,NULL,NULL,0),(1257,'网球',134,3,1,0,NULL,NULL,0),(1258,'排球',134,3,1,0,NULL,NULL,0),(1259,'高尔夫',134,3,1,0,NULL,NULL,0),(1260,'台球',134,3,1,0,NULL,NULL,0),(1261,'棋牌麻将',134,3,1,0,NULL,NULL,0),(1262,'轮滑滑板',134,3,1,0,NULL,NULL,0),(1263,'其他',134,3,1,0,NULL,NULL,0),(1264,'0-6个月',135,3,1,0,NULL,NULL,0),(1265,'6-12个月',135,3,1,0,NULL,NULL,0),(1266,'1-3岁',135,3,1,0,NULL,NULL,0),(1267,'3-6岁',135,3,1,0,NULL,NULL,0),(1268,'6-14岁',135,3,1,0,NULL,NULL,0),(1269,'14岁以上',135,3,1,0,NULL,NULL,0),(1270,'遥控车',136,3,1,0,NULL,NULL,0),(1271,'遥控飞机',136,3,1,0,NULL,NULL,0),(1272,'遥控船',136,3,1,0,NULL,NULL,0),(1273,'机器人',136,3,1,0,NULL,NULL,0),(1274,'轨道/助力',136,3,1,0,NULL,NULL,0),(1275,'毛绒/布艺',137,3,1,0,NULL,NULL,0),(1276,'靠垫/抱枕',137,3,1,0,NULL,NULL,0),(1277,'芭比娃娃',138,3,1,0,NULL,NULL,0),(1278,'卡通娃娃',138,3,1,0,NULL,NULL,0),(1279,'智能娃娃',138,3,1,0,NULL,NULL,0),(1280,'仿真模型',139,3,1,0,NULL,NULL,0),(1281,'拼插模型',139,3,1,0,NULL,NULL,0),(1282,'收藏爱好',139,3,1,0,NULL,NULL,0),(1283,'炫舞毯',140,3,1,0,NULL,NULL,0),(1284,'爬行垫/毯',140,3,1,0,NULL,NULL,0),(1285,'户外玩具',140,3,1,0,NULL,NULL,0),(1286,'戏水玩具',140,3,1,0,NULL,NULL,0),(1287,'电影周边',141,3,1,0,NULL,NULL,0),(1288,'卡通周边',141,3,1,0,NULL,NULL,0),(1289,'网游周边',141,3,1,0,NULL,NULL,0),(1290,'摇铃/床铃',142,3,1,0,NULL,NULL,0),(1291,'健身架',142,3,1,0,NULL,NULL,0),(1292,'早教启智',142,3,1,0,NULL,NULL,0),(1293,'拖拉玩具',142,3,1,0,NULL,NULL,0),(1294,'积木',143,3,1,0,NULL,NULL,0),(1295,'拼图',143,3,1,0,NULL,NULL,0),(1296,'磁力棒',143,3,1,0,NULL,NULL,0),(1297,'立体拼插',143,3,1,0,NULL,NULL,0),(1298,'手工彩泥',144,3,1,0,NULL,NULL,0),(1299,'绘画工具',144,3,1,0,NULL,NULL,0),(1300,'情景玩具',144,3,1,0,NULL,NULL,0),(1301,'减压玩具',145,3,1,0,NULL,NULL,0),(1302,'创意玩具',145,3,1,0,NULL,NULL,0),(1303,'钢琴',146,3,1,0,NULL,NULL,0),(1304,'电子琴/电钢琴',146,3,1,0,NULL,NULL,0),(1305,'吉他/尤克里里',146,3,1,0,NULL,NULL,0),(1306,'打击乐器',146,3,1,0,NULL,NULL,0),(1307,'西洋管弦',146,3,1,0,NULL,NULL,0),(1308,'民族管弦乐器',146,3,1,0,NULL,NULL,0),(1309,'乐器配件',146,3,1,0,NULL,NULL,0),(1310,'电脑音乐',146,3,1,0,NULL,NULL,0),(1311,'工艺礼品乐器',146,3,1,0,NULL,NULL,0),(1312,'口琴/口风琴/竖笛',146,3,1,0,NULL,NULL,0),(1313,'手风琴',146,3,1,0,NULL,NULL,0),(1314,'双色球',147,3,1,0,NULL,NULL,0),(1315,'大乐透',147,3,1,0,NULL,NULL,0),(1316,'福彩3D',147,3,1,0,NULL,NULL,0),(1317,'排列三',147,3,1,0,NULL,NULL,0),(1318,'排列五',147,3,1,0,NULL,NULL,0),(1319,'七星彩',147,3,1,0,NULL,NULL,0),(1320,'七乐彩',147,3,1,0,NULL,NULL,0),(1321,'竞彩足球',147,3,1,0,NULL,NULL,0),(1322,'竞彩篮球',147,3,1,0,NULL,NULL,0),(1323,'新时时彩',147,3,1,0,NULL,NULL,0),(1324,'国内机票',148,3,1,0,NULL,NULL,0),(1325,'国内酒店',149,3,1,0,NULL,NULL,0),(1326,'酒店团购',149,3,1,0,NULL,NULL,0),(1327,'度假',150,3,1,0,NULL,NULL,0),(1328,'景点',150,3,1,0,NULL,NULL,0),(1329,'租车',150,3,1,0,NULL,NULL,0),(1330,'火车票',150,3,1,0,NULL,NULL,0),(1331,'旅游团购',150,3,1,0,NULL,NULL,0),(1332,'手机充值',151,3,1,0,NULL,NULL,0),(1333,'游戏点卡',152,3,1,0,NULL,NULL,0),(1334,'QQ充值',152,3,1,0,NULL,NULL,0),(1335,'电影票',153,3,1,0,NULL,NULL,0),(1336,'演唱会',153,3,1,0,NULL,NULL,0),(1337,'话剧歌剧',153,3,1,0,NULL,NULL,0),(1338,'音乐会',153,3,1,0,NULL,NULL,0),(1339,'体育赛事',153,3,1,0,NULL,NULL,0),(1340,'舞蹈芭蕾',153,3,1,0,NULL,NULL,0),(1341,'戏曲综艺',153,3,1,0,NULL,NULL,0),(1342,'东北',154,3,1,0,NULL,NULL,0),(1343,'华北',154,3,1,0,NULL,NULL,0),(1344,'西北',154,3,1,0,NULL,NULL,0),(1345,'华中',154,3,1,0,NULL,NULL,0),(1346,'华东',154,3,1,0,NULL,NULL,0),(1347,'华南',154,3,1,0,NULL,NULL,0),(1348,'西南',154,3,1,0,NULL,NULL,0),(1349,'苹果',155,3,1,0,NULL,NULL,0),(1350,'橙子',155,3,1,0,NULL,NULL,0),(1351,'奇异果/猕猴桃',155,3,1,0,NULL,NULL,0),(1352,'车厘子/樱桃',155,3,1,0,NULL,NULL,0),(1353,'芒果',155,3,1,0,NULL,NULL,0),(1354,'蓝莓',155,3,1,0,NULL,NULL,0),(1355,'火龙果',155,3,1,0,NULL,NULL,0),(1356,'葡萄/提子',155,3,1,0,NULL,NULL,0),(1357,'柚子',155,3,1,0,NULL,NULL,0),(1358,'香蕉',155,3,1,0,NULL,NULL,0),(1359,'牛油果',155,3,1,0,NULL,NULL,0),(1360,'梨',155,3,1,0,NULL,NULL,0),(1361,'菠萝/凤梨',155,3,1,0,NULL,NULL,0),(1362,'桔/橘',155,3,1,0,NULL,NULL,0),(1363,'柠檬',155,3,1,0,NULL,NULL,0),(1364,'草莓',155,3,1,0,NULL,NULL,0),(1365,'桃/李/杏',155,3,1,0,NULL,NULL,0),(1366,'更多水果',155,3,1,0,NULL,NULL,0),(1367,'水果礼盒/券',155,3,1,0,NULL,NULL,0),(1368,'牛肉',156,3,1,0,NULL,NULL,0),(1369,'羊肉',156,3,1,0,NULL,NULL,0),(1370,'猪肉',156,3,1,0,NULL,NULL,0),(1371,'内脏类',156,3,1,0,NULL,NULL,0),(1372,'鱼类',157,3,1,0,NULL,NULL,0),(1373,'虾类',157,3,1,0,NULL,NULL,0),(1374,'蟹类',157,3,1,0,NULL,NULL,0),(1375,'贝类',157,3,1,0,NULL,NULL,0),(1376,'海参',157,3,1,0,NULL,NULL,0),(1377,'海产干货',157,3,1,0,NULL,NULL,0),(1378,'其他水产',157,3,1,0,NULL,NULL,0),(1379,'海产礼盒',157,3,1,0,NULL,NULL,0),(1380,'鸡肉',158,3,1,0,NULL,NULL,0),(1381,'鸭肉',158,3,1,0,NULL,NULL,0),(1382,'蛋类',158,3,1,0,NULL,NULL,0),(1383,'其他禽类',158,3,1,0,NULL,NULL,0),(1384,'水饺/馄饨',159,3,1,0,NULL,NULL,0),(1385,'汤圆/元宵',159,3,1,0,NULL,NULL,0),(1386,'面点',159,3,1,0,NULL,NULL,0),(1387,'火锅丸串',159,3,1,0,NULL,NULL,0),(1388,'速冻半成品',159,3,1,0,NULL,NULL,0),(1389,'奶酪黄油',159,3,1,0,NULL,NULL,0),(1390,'熟食',160,3,1,0,NULL,NULL,0),(1391,'腊肠/腊肉',160,3,1,0,NULL,NULL,0),(1392,'火腿',160,3,1,0,NULL,NULL,0),(1393,'糕点',160,3,1,0,NULL,NULL,0),(1394,'礼品卡券',160,3,1,0,NULL,NULL,0),(1395,'冷藏果蔬汁',161,3,1,0,NULL,NULL,0),(1396,'冰激凌',161,3,1,0,NULL,NULL,0),(1397,'其他',161,3,1,0,NULL,NULL,0),(1398,'叶菜类',162,3,1,0,NULL,NULL,0),(1399,'茄果瓜类',162,3,1,0,NULL,NULL,0),(1400,'根茎类',162,3,1,0,NULL,NULL,0),(1401,'鲜菌菇',162,3,1,0,NULL,NULL,0),(1402,'葱姜蒜椒',162,3,1,0,NULL,NULL,0),(1403,'半加工蔬菜',162,3,1,0,NULL,NULL,0),(1404,'微型车',163,3,1,0,NULL,NULL,0),(1405,'小型车',163,3,1,0,NULL,NULL,0),(1406,'紧凑型车',163,3,1,0,NULL,NULL,0),(1407,'中型车',163,3,1,0,NULL,NULL,0),(1408,'中大型车',163,3,1,0,NULL,NULL,0),(1409,'豪华车',163,3,1,0,NULL,NULL,0),(1410,'MPV',163,3,1,0,NULL,NULL,0),(1411,'SUV',163,3,1,0,NULL,NULL,0),(1412,'跑车',163,3,1,0,NULL,NULL,0),(1413,'微型车（二手）',164,3,1,0,NULL,NULL,0),(1414,'小型车（二手）',164,3,1,0,NULL,NULL,0),(1415,'紧凑型车（二手）',164,3,1,0,NULL,NULL,0),(1416,'中型车（二手）',164,3,1,0,NULL,NULL,0),(1417,'中大型车（二手）',164,3,1,0,NULL,NULL,0),(1418,'豪华车（二手）',164,3,1,0,NULL,NULL,0),(1419,'MPV（二手）',164,3,1,0,NULL,NULL,0),(1420,'SUV（二手）',164,3,1,0,NULL,NULL,0),(1421,'跑车（二手）',164,3,1,0,NULL,NULL,0),(1422,'皮卡（二手）',164,3,1,0,NULL,NULL,0),(1423,'面包车（二手）',164,3,1,0,NULL,NULL,0),(1431,'dsa323',1,2,1,NULL,NULL,NULL,NULL),(1432,'fdsffdsadddd大萨达',1431,3,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_category_brand_relation`
--

DROP TABLE IF EXISTS `pms_category_brand_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_category_brand_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  `catelog_id` bigint DEFAULT NULL COMMENT '分类id',
  `brand_name` varchar(255) DEFAULT NULL,
  `catelog_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='品牌分类关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_category_brand_relation`
--

LOCK TABLES `pms_category_brand_relation` WRITE;
/*!40000 ALTER TABLE `pms_category_brand_relation` DISABLE KEYS */;
INSERT INTO `pms_category_brand_relation` (`id`, `brand_id`, `catelog_id`, `brand_name`, `catelog_name`) VALUES (13,9,225,'华为','手机'),(15,9,250,'华为','平板电视'),(16,9,449,'华为','笔记本'),(17,10,449,'小米','笔记本'),(18,10,225,'小米','手机'),(19,10,231,'小米','移动电源'),(20,10,233,'小米','蓝牙耳机'),(21,10,250,'小米','平板电视'),(22,10,449,'小米','笔记本'),(23,11,225,'oppo','手机'),(24,11,227,'oppo','合约机'),(25,12,225,'Apple','手机'),(26,12,243,'Apple','iPhone 配件'),(27,12,366,'Apple','智能手表');
/*!40000 ALTER TABLE `pms_category_brand_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_comment_replay`
--

DROP TABLE IF EXISTS `pms_comment_replay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_comment_replay` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `comment_id` bigint DEFAULT NULL COMMENT '评论id',
  `reply_id` bigint DEFAULT NULL COMMENT '回复id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品评价回复关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_comment_replay`
--

LOCK TABLES `pms_comment_replay` WRITE;
/*!40000 ALTER TABLE `pms_comment_replay` DISABLE KEYS */;
/*!40000 ALTER TABLE `pms_comment_replay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_product_attr_value`
--

DROP TABLE IF EXISTS `pms_product_attr_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_product_attr_value` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint DEFAULT NULL COMMENT '商品id',
  `attr_id` bigint DEFAULT NULL COMMENT '属性id',
  `attr_name` varchar(200) DEFAULT NULL COMMENT '属性名',
  `attr_value` varchar(200) DEFAULT NULL COMMENT '属性值',
  `attr_sort` int DEFAULT NULL COMMENT '顺序',
  `quick_show` tinyint DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu属性值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_product_attr_value`
--

LOCK TABLES `pms_product_attr_value` WRITE;
/*!40000 ALTER TABLE `pms_product_attr_value` DISABLE KEYS */;
INSERT INTO `pms_product_attr_value` (`id`, `spu_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`, `quick_show`) VALUES (55,13,7,'入网型号','A2217',NULL,0),(56,13,8,'上市年份','2018',NULL,0),(57,13,13,'机身长度（mm）','158.3',NULL,0),(58,13,14,'机身材质工艺','以官网信息为准',NULL,0),(59,13,15,'CPU品牌','以官网信息为准',NULL,1),(60,13,16,'CPU型号','A13仿生',NULL,1),(61,11,7,'入网型号','LIO-AL00',NULL,1),(62,11,8,'上市年份','2019',NULL,0),(63,11,11,'机身颜色','黑色',NULL,1),(64,11,13,'机身长度（mm）','158.3',NULL,1),(65,11,14,'机身材质工艺','玻璃;陶瓷',NULL,0),(66,11,15,'CPU品牌','海思（Hisilicon）',NULL,1),(67,11,16,'CPU型号','HUAWEI Kirin 970',NULL,1);
/*!40000 ALTER TABLE `pms_product_attr_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_sku_images`
--

DROP TABLE IF EXISTS `pms_sku_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_sku_images` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint DEFAULT NULL COMMENT 'sku_id',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `img_sort` int DEFAULT NULL COMMENT '排序',
  `default_img` int DEFAULT NULL COMMENT '默认图[0 - 不是默认图，1 - 是默认图]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='sku图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_sku_images`
--

LOCK TABLES `pms_sku_images` WRITE;
/*!40000 ALTER TABLE `pms_sku_images` DISABLE KEYS */;
INSERT INTO `pms_sku_images` (`id`, `sku_id`, `img_url`, `img_sort`, `default_img`) VALUES (1,1,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,0),(2,1,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg',NULL,0),(3,1,'',NULL,0),(4,1,'',NULL,0),(5,1,'',NULL,0),(6,1,'',NULL,0),(7,1,'',NULL,0),(8,1,'',NULL,0),(9,1,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg',NULL,0),(10,1,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',NULL,1),(11,2,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,1),(12,2,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg',NULL,0),(13,2,'',NULL,0),(14,2,'',NULL,0),(15,2,'',NULL,0),(16,2,'',NULL,0),(17,2,'',NULL,0),(18,2,'',NULL,0),(19,2,'',NULL,0),(20,2,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',NULL,0),(21,3,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,1),(22,3,'',NULL,0),(23,3,'',NULL,0),(24,3,'',NULL,0),(25,3,'',NULL,0),(26,3,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg',NULL,0),(27,3,'',NULL,0),(28,3,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg',NULL,0),(29,3,'',NULL,0),(30,3,'',NULL,0),(31,4,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,1),(32,4,'',NULL,0),(33,4,'',NULL,0),(34,4,'',NULL,0),(35,4,'',NULL,0),(36,4,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg',NULL,0),(37,4,'',NULL,0),(38,4,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg',NULL,0),(39,4,'',NULL,0),(40,4,'',NULL,0),(41,5,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,1),(42,5,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg',NULL,0),(43,5,'',NULL,0),(44,5,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg',NULL,0),(45,5,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg',NULL,0),(46,5,'',NULL,0),(47,5,'',NULL,0),(48,5,'',NULL,0),(49,5,'',NULL,0),(50,5,'',NULL,0),(51,6,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,1),(52,6,'',NULL,0),(53,6,'',NULL,0),(54,6,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg',NULL,0),(55,6,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg',NULL,0),(56,6,'',NULL,0),(57,6,'',NULL,0),(58,6,'',NULL,0),(59,6,'',NULL,0),(60,6,'',NULL,0),(61,7,'',NULL,0),(62,7,'',NULL,0),(63,7,'',NULL,0),(64,7,'',NULL,0),(65,7,'',NULL,0),(66,7,'',NULL,0),(67,7,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg',NULL,0),(68,7,'',NULL,0),(69,7,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg',NULL,0),(70,7,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',NULL,1),(71,8,'',NULL,0),(72,8,'',NULL,0),(73,8,'',NULL,0),(74,8,'',NULL,0),(75,8,'',NULL,0),(76,8,'',NULL,0),(77,8,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg',NULL,0),(78,8,'',NULL,0),(79,8,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg',NULL,0),(80,8,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',NULL,1),(81,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,0),(82,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',NULL,1),(83,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg',NULL,0),(84,10,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,0),(85,10,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',NULL,1),(86,10,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg',NULL,0),(87,11,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,0),(88,11,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',NULL,1),(89,11,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg',NULL,0),(90,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,1),(91,13,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,1),(92,14,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,1),(93,15,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(94,16,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(95,17,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(96,18,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(97,19,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(98,20,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(99,21,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg',NULL,0),(100,21,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',NULL,1),(101,21,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg',NULL,0),(102,22,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg',NULL,0),(103,22,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',NULL,1),(104,22,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg',NULL,0),(105,23,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg',NULL,0),(106,23,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',NULL,1),(107,23,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg',NULL,0),(108,24,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(109,25,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(110,26,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1);
/*!40000 ALTER TABLE `pms_sku_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_sku_info`
--

DROP TABLE IF EXISTS `pms_sku_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_sku_info` (
  `sku_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'skuId',
  `spu_id` bigint DEFAULT NULL COMMENT 'spuId',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku名称',
  `sku_desc` varchar(2000) DEFAULT NULL COMMENT 'sku介绍描述',
  `catalog_id` bigint DEFAULT NULL COMMENT '所属分类id',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  `sku_default_img` varchar(255) DEFAULT NULL COMMENT '默认图片',
  `sku_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `sku_subtitle` varchar(2000) DEFAULT NULL COMMENT '副标题',
  `price` decimal(18,4) DEFAULT NULL COMMENT '价格',
  `sale_count` bigint DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='sku信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_sku_info`
--

LOCK TABLES `pms_sku_info` WRITE;
/*!40000 ALTER TABLE `pms_sku_info` DISABLE KEYS */;
INSERT INTO `pms_sku_info` (`sku_id`, `spu_id`, `sku_name`, `sku_desc`, `catalog_id`, `brand_id`, `sku_default_img`, `sku_title`, `sku_subtitle`, `price`, `sale_count`) VALUES (1,11,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg','华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》',6299.0000,0),(2,11,'华为 HUAWEI Mate 30 Pro 星河银 8GB+128GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg','华为 HUAWEI Mate 30 Pro 星河银 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》',5799.0000,0),(3,11,'华为 HUAWEI Mate 30 Pro 亮黑色 8GB+256GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg','华为 HUAWEI Mate 30 Pro 亮黑色 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》',6299.0000,0),(4,11,'华为 HUAWEI Mate 30 Pro 亮黑色 8GB+128GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg','华为 HUAWEI Mate 30 Pro 亮黑色 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》',5799.0000,0),(5,11,'华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+256GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg','华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》',6299.0000,0),(6,11,'华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+128GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg','华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》',5799.0000,0),(7,11,'华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+256GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg','华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》',6299.0000,0),(8,11,'华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+128GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg','华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》',5799.0000,0),(9,13,' Apple iPhone 11 (A2223)  黑色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',' Apple iPhone 11 (A2223)  黑色 128GB 移动联通电信4G手机 双卡双待 最后几件优惠','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5999.0000,0),(10,13,' Apple iPhone 11 (A2223)  黑色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',' Apple iPhone 11 (A2223)  黑色 256GB 移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',6799.0000,0),(11,13,' Apple iPhone 11 (A2223)  黑色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',' Apple iPhone 11 (A2223)  黑色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5499.0000,0),(12,13,' Apple iPhone 11 (A2223)  白色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',' Apple iPhone 11 (A2223)  白色 128GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5999.0000,0),(13,13,' Apple iPhone 11 (A2223)  白色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',' Apple iPhone 11 (A2223)  白色 256GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',6799.0000,0),(14,13,' Apple iPhone 11 (A2223)  白色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',' Apple iPhone 11 (A2223)  白色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5499.0000,0),(15,13,' Apple iPhone 11 (A2223)  绿色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  绿色 128GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5999.0000,0),(16,13,' Apple iPhone 11 (A2223)  绿色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  绿色 256GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',6799.0000,0),(17,13,' Apple iPhone 11 (A2223)  绿色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  绿色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5499.0000,0),(18,13,' Apple iPhone 11 (A2223)  黄色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  黄色 128GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5999.0000,0),(19,13,' Apple iPhone 11 (A2223)  黄色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  黄色 256GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',6799.0000,0),(20,13,' Apple iPhone 11 (A2223)  黄色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  黄色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5499.0000,0),(21,13,' Apple iPhone 11 (A2223)  红色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',' Apple iPhone 11 (A2223)  红色 128GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5999.0000,0),(22,13,' Apple iPhone 11 (A2223)  红色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',' Apple iPhone 11 (A2223)  红色 256GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',6799.0000,0),(23,13,' Apple iPhone 11 (A2223)  红色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',' Apple iPhone 11 (A2223)  红色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5499.0000,0),(24,13,' Apple iPhone 11 (A2223)  紫色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  紫色 128GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5999.0000,0),(25,13,' Apple iPhone 11 (A2223)  紫色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  紫色 256GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',6799.0000,0),(26,13,' Apple iPhone 11 (A2223)  紫色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  紫色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！',5499.0000,0);
/*!40000 ALTER TABLE `pms_sku_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_sku_sale_attr_value`
--

DROP TABLE IF EXISTS `pms_sku_sale_attr_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_sku_sale_attr_value` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint DEFAULT NULL COMMENT 'sku_id',
  `attr_id` bigint DEFAULT NULL COMMENT 'attr_id',
  `attr_name` varchar(200) DEFAULT NULL COMMENT '销售属性名',
  `attr_value` varchar(200) DEFAULT NULL COMMENT '销售属性值',
  `attr_sort` int DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='sku销售属性&值';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_sku_sale_attr_value`
--

LOCK TABLES `pms_sku_sale_attr_value` WRITE;
/*!40000 ALTER TABLE `pms_sku_sale_attr_value` DISABLE KEYS */;
INSERT INTO `pms_sku_sale_attr_value` (`id`, `sku_id`, `attr_id`, `attr_name`, `attr_value`, `attr_sort`) VALUES (1,1,9,'颜色','星河银',NULL),(2,1,12,'版本','8GB+256GB',NULL),(3,2,9,'颜色','星河银',NULL),(4,2,12,'版本','8GB+128GB',NULL),(5,3,9,'颜色','亮黑色',NULL),(6,3,12,'版本','8GB+256GB',NULL),(7,4,9,'颜色','亮黑色',NULL),(8,4,12,'版本','8GB+128GB',NULL),(9,5,9,'颜色','翡冷翠',NULL),(10,5,12,'版本','8GB+256GB',NULL),(11,6,9,'颜色','翡冷翠',NULL),(12,6,12,'版本','8GB+128GB',NULL),(13,7,9,'颜色','罗兰紫',NULL),(14,7,12,'版本','8GB+256GB',NULL),(15,8,9,'颜色','罗兰紫',NULL),(16,8,12,'版本','8GB+128GB',NULL),(17,9,9,'颜色','黑色',NULL),(18,9,12,'版本','128GB ',NULL),(19,10,9,'颜色','黑色',NULL),(20,10,12,'版本','256GB',NULL),(21,11,9,'颜色','黑色',NULL),(22,11,12,'版本','64GB',NULL),(23,12,9,'颜色','白色',NULL),(24,12,12,'版本','128GB ',NULL),(25,13,9,'颜色','白色',NULL),(26,13,12,'版本','256GB',NULL),(27,14,9,'颜色','白色',NULL),(28,14,12,'版本','64GB',NULL),(29,15,9,'颜色','绿色',NULL),(30,15,12,'版本','128GB ',NULL),(31,16,9,'颜色','绿色',NULL),(32,16,12,'版本','256GB',NULL),(33,17,9,'颜色','绿色',NULL),(34,17,12,'版本','64GB',NULL),(35,18,9,'颜色','黄色',NULL),(36,18,12,'版本','128GB ',NULL),(37,19,9,'颜色','黄色',NULL),(38,19,12,'版本','256GB',NULL),(39,20,9,'颜色','黄色',NULL),(40,20,12,'版本','64GB',NULL),(41,21,9,'颜色','红色',NULL),(42,21,12,'版本','128GB ',NULL),(43,22,9,'颜色','红色',NULL),(44,22,12,'版本','256GB',NULL),(45,23,9,'颜色','红色',NULL),(46,23,12,'版本','64GB',NULL),(47,24,9,'颜色','紫色',NULL),(48,24,12,'版本','128GB ',NULL),(49,25,9,'颜色','紫色',NULL),(50,25,12,'版本','256GB',NULL),(51,26,9,'颜色','紫色',NULL),(52,26,12,'版本','64GB',NULL);
/*!40000 ALTER TABLE `pms_sku_sale_attr_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_spu_comment`
--

DROP TABLE IF EXISTS `pms_spu_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_spu_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint DEFAULT NULL COMMENT 'sku_id',
  `spu_id` bigint DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) DEFAULT NULL COMMENT '商品名字',
  `member_nick_name` varchar(255) DEFAULT NULL COMMENT '会员昵称',
  `star` tinyint(1) DEFAULT NULL COMMENT '星级',
  `member_ip` varchar(64) DEFAULT NULL COMMENT '会员ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `show_status` tinyint(1) DEFAULT NULL COMMENT '显示状态[0-不显示，1-显示]',
  `spu_attributes` varchar(255) DEFAULT NULL COMMENT '购买时属性组合',
  `likes_count` int DEFAULT NULL COMMENT '点赞数',
  `reply_count` int DEFAULT NULL COMMENT '回复数',
  `resources` varchar(1000) DEFAULT NULL COMMENT '评论图片/视频[json数据；[{type:文件类型,url:资源路径}]]',
  `content` text COMMENT '内容',
  `member_icon` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `comment_type` tinyint DEFAULT NULL COMMENT '评论类型[0 - 对商品的直接评论，1 - 对评论的回复]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_spu_comment`
--

LOCK TABLES `pms_spu_comment` WRITE;
/*!40000 ALTER TABLE `pms_spu_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pms_spu_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_spu_images`
--

DROP TABLE IF EXISTS `pms_spu_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_spu_images` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint DEFAULT NULL COMMENT 'spu_id',
  `img_name` varchar(200) DEFAULT NULL COMMENT '图片名',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `img_sort` int DEFAULT NULL COMMENT '顺序',
  `default_img` tinyint DEFAULT NULL COMMENT '是否默认图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_spu_images`
--

LOCK TABLES `pms_spu_images` WRITE;
/*!40000 ALTER TABLE `pms_spu_images` DISABLE KEYS */;
INSERT INTO `pms_spu_images` (`id`, `spu_id`, `img_name`, `img_url`, `img_sort`, `default_img`) VALUES (71,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,NULL),(72,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg',NULL,NULL),(73,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/89e324b9-d0cf-4f4f-8e81-94bb219910b3_2b1837c6c50add30.jpg',NULL,NULL),(74,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg',NULL,NULL),(75,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg',NULL,NULL),(76,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg',NULL,NULL),(77,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg',NULL,NULL),(78,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg',NULL,NULL),(79,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg',NULL,NULL),(80,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',NULL,NULL),(88,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg',NULL,NULL),(89,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,NULL),(90,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,NULL),(91,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',NULL,NULL),(92,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg',NULL,NULL),(93,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',NULL,NULL),(94,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg',NULL,NULL);
/*!40000 ALTER TABLE `pms_spu_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_spu_info`
--

DROP TABLE IF EXISTS `pms_spu_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_spu_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `spu_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `spu_description` varchar(1000) DEFAULT NULL COMMENT '商品描述',
  `catalog_id` bigint DEFAULT NULL COMMENT '所属分类id',
  `brand_id` bigint DEFAULT NULL COMMENT '品牌id',
  `weight` decimal(18,4) DEFAULT NULL,
  `publish_status` tinyint DEFAULT NULL COMMENT '上架状态[0 - 下架，1 - 上架]',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_spu_info`
--

LOCK TABLES `pms_spu_info` WRITE;
/*!40000 ALTER TABLE `pms_spu_info` DISABLE KEYS */;
INSERT INTO `pms_spu_info` (`id`, `spu_name`, `spu_description`, `catalog_id`, `brand_id`, `weight`, `publish_status`, `create_time`, `update_time`) VALUES (11,'华为 HUAWEI Mate 30 Pro','华为 HUAWEI Mate 30 Pro',225,9,0.1980,1,'2019-11-26 10:10:57','2021-06-26 12:13:51'),(13,' Apple iPhone 11 (A2223) ',' Apple iPhone 11 (A2223) ',225,12,0.1940,1,'2019-11-27 05:37:30','2021-06-26 12:13:52');
/*!40000 ALTER TABLE `pms_spu_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_spu_info_desc`
--

DROP TABLE IF EXISTS `pms_spu_info_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_spu_info_desc` (
  `spu_id` bigint NOT NULL COMMENT '商品id',
  `decript` longtext COMMENT '商品介绍',
  PRIMARY KEY (`spu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu信息介绍';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_spu_info_desc`
--

LOCK TABLES `pms_spu_info_desc` WRITE;
/*!40000 ALTER TABLE `pms_spu_info_desc` DISABLE KEYS */;
INSERT INTO `pms_spu_info_desc` (`spu_id`, `decript`) VALUES (11,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/702b76e6-ce3e-4268-8216-a12db5607347_73366cc235d68202.jpg,https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38956d81-5dff-4abd-8ce8-144908e869d8_528211b97272d88a.jpg'),(13,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/ffc5a377-b037-4f26-84a0-df5b1c7cf42d_f205d9c99a2b4b01.jpg');
/*!40000 ALTER TABLE `pms_spu_info_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `kkmall_sms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `kkmall_sms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `kkmall_sms`;

--
-- Table structure for table `sms_coupon`
--

DROP TABLE IF EXISTS `sms_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_type` tinyint(1) DEFAULT NULL COMMENT '优惠卷类型[0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券]',
  `coupon_img` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠券图片',
  `coupon_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠卷名字',
  `num` int DEFAULT NULL COMMENT '数量',
  `amount` decimal(18,4) DEFAULT NULL COMMENT '金额',
  `per_limit` int DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(18,4) DEFAULT NULL COMMENT '使用门槛',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `use_type` tinyint(1) DEFAULT NULL COMMENT '使用类型[0->全场通用；1->指定分类；2->指定商品]',
  `note` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `publish_count` int DEFAULT NULL COMMENT '发行数量',
  `use_count` int DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int DEFAULT NULL COMMENT '领取数量',
  `enable_start_time` datetime DEFAULT NULL COMMENT '可以领取的开始日期',
  `enable_end_time` datetime DEFAULT NULL COMMENT '可以领取的结束日期',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '优惠码',
  `member_level` tinyint(1) DEFAULT NULL COMMENT '可以领取的会员等级[0->不限等级，其他-对应等级]',
  `publish` tinyint(1) DEFAULT NULL COMMENT '发布状态[0-未发布，1-已发布]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='优惠券信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_coupon`
--

LOCK TABLES `sms_coupon` WRITE;
/*!40000 ALTER TABLE `sms_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_coupon_history`
--

DROP TABLE IF EXISTS `sms_coupon_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_coupon_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_id` bigint DEFAULT NULL COMMENT '优惠券id',
  `member_id` bigint DEFAULT NULL COMMENT '会员id',
  `member_nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员名字',
  `get_type` tinyint(1) DEFAULT NULL COMMENT '获取方式[0->后台赠送；1->主动领取]',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `use_type` tinyint(1) DEFAULT NULL COMMENT '使用状态[0->未使用；1->已使用；2->已过期]',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint DEFAULT NULL COMMENT '订单id',
  `order_sn` bigint DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='优惠券领取历史记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_coupon_history`
--

LOCK TABLES `sms_coupon_history` WRITE;
/*!40000 ALTER TABLE `sms_coupon_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_coupon_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_coupon_spu_category_relation`
--

DROP TABLE IF EXISTS `sms_coupon_spu_category_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_coupon_spu_category_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_id` bigint DEFAULT NULL COMMENT '优惠券id',
  `category_id` bigint DEFAULT NULL COMMENT '产品分类id',
  `category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '产品分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='优惠券分类关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_coupon_spu_category_relation`
--

LOCK TABLES `sms_coupon_spu_category_relation` WRITE;
/*!40000 ALTER TABLE `sms_coupon_spu_category_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_coupon_spu_category_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_coupon_spu_relation`
--

DROP TABLE IF EXISTS `sms_coupon_spu_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_coupon_spu_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_id` bigint DEFAULT NULL COMMENT '优惠券id',
  `spu_id` bigint DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'spu_name',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='优惠券与产品关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_coupon_spu_relation`
--

LOCK TABLES `sms_coupon_spu_relation` WRITE;
/*!40000 ALTER TABLE `sms_coupon_spu_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_coupon_spu_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_home_adv`
--

DROP TABLE IF EXISTS `sms_home_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_home_adv` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名字',
  `pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `click_count` int DEFAULT NULL COMMENT '点击数',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '广告详情连接地址',
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `sort` int DEFAULT NULL COMMENT '排序',
  `publisher_id` bigint DEFAULT NULL COMMENT '发布者',
  `auth_id` bigint DEFAULT NULL COMMENT '审核者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='首页轮播广告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_home_adv`
--

LOCK TABLES `sms_home_adv` WRITE;
/*!40000 ALTER TABLE `sms_home_adv` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_home_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_home_subject`
--

DROP TABLE IF EXISTS `sms_home_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_home_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专题名字',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专题标题',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专题副标题',
  `status` tinyint(1) DEFAULT NULL COMMENT '显示状态',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详情连接',
  `sort` int DEFAULT NULL COMMENT '排序',
  `img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专题图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='首页专题表【jd首页下面很多专题，每个专题链接新的页面，展示专题商品信息】';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_home_subject`
--

LOCK TABLES `sms_home_subject` WRITE;
/*!40000 ALTER TABLE `sms_home_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_home_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_home_subject_spu`
--

DROP TABLE IF EXISTS `sms_home_subject_spu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_home_subject_spu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '专题名字',
  `subject_id` bigint DEFAULT NULL COMMENT '专题id',
  `spu_id` bigint DEFAULT NULL COMMENT 'spu_id',
  `sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='专题商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_home_subject_spu`
--

LOCK TABLES `sms_home_subject_spu` WRITE;
/*!40000 ALTER TABLE `sms_home_subject_spu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_home_subject_spu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_member_price`
--

DROP TABLE IF EXISTS `sms_member_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_member_price` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint DEFAULT NULL COMMENT 'sku_id',
  `member_level_id` bigint DEFAULT NULL COMMENT '会员等级id',
  `member_level_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员等级名',
  `member_price` decimal(18,4) DEFAULT NULL COMMENT '会员对应价格',
  `add_other` tinyint(1) DEFAULT NULL COMMENT '可否叠加其他优惠[0-不可叠加优惠，1-可叠加]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品会员价格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_member_price`
--

LOCK TABLES `sms_member_price` WRITE;
/*!40000 ALTER TABLE `sms_member_price` DISABLE KEYS */;
INSERT INTO `sms_member_price` (`id`, `sku_id`, `member_level_id`, `member_level_name`, `member_price`, `add_other`) VALUES (1,1,2,'铜牌会员',8788.0000,1),(2,1,3,'银牌会员',8688.0000,1),(3,1,4,'金牌会员',8588.0000,1),(4,1,5,'钻石会员',8288.0000,1),(5,2,2,'铜牌会员',8766.0000,1),(6,2,3,'银牌会员',8666.0000,1),(7,2,4,'金牌会员',8566.0000,1),(8,2,5,'钻石会员',8266.0000,1),(9,3,2,'铜牌会员',5888.0000,1),(10,3,3,'银牌会员',5788.0000,1),(11,3,4,'金牌会员',5688.0000,1),(12,3,5,'钻石会员',5588.0000,1),(13,4,2,'铜牌会员',5888.0000,1),(14,4,3,'银牌会员',5788.0000,1),(15,4,4,'金牌会员',5688.0000,1),(16,4,5,'钻石会员',5588.0000,1),(17,5,2,'铜牌会员',5888.0000,1),(18,5,3,'银牌会员',5788.0000,1),(19,5,4,'金牌会员',5688.0000,1),(20,5,5,'钻石会员',5588.0000,1),(21,6,2,'铜牌会员',5888.0000,1),(22,6,3,'银牌会员',5788.0000,1),(23,6,4,'金牌会员',5688.0000,1),(24,6,5,'钻石会员',5588.0000,1),(25,7,2,'铜牌会员',5888.0000,1),(26,7,3,'银牌会员',5788.0000,1),(27,7,4,'金牌会员',5688.0000,1),(28,7,5,'钻石会员',5588.0000,1),(29,8,2,'铜牌会员',5888.0000,1),(30,8,3,'银牌会员',5788.0000,1),(31,8,4,'金牌会员',5688.0000,1),(32,8,5,'钻石会员',5588.0000,1),(33,9,2,'铜牌会员',4088.0000,1),(34,9,3,'银牌会员',3988.0000,1),(35,9,4,'金牌会员',3888.0000,1),(36,9,5,'钻石会员',3288.0000,1);
/*!40000 ALTER TABLE `sms_member_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_seckill_promotion`
--

DROP TABLE IF EXISTS `sms_seckill_promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_seckill_promotion` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动标题',
  `start_time` datetime DEFAULT NULL COMMENT '开始日期',
  `end_time` datetime DEFAULT NULL COMMENT '结束日期',
  `status` tinyint DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` bigint DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='秒杀活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_seckill_promotion`
--

LOCK TABLES `sms_seckill_promotion` WRITE;
/*!40000 ALTER TABLE `sms_seckill_promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_seckill_promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_seckill_session`
--

DROP TABLE IF EXISTS `sms_seckill_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_seckill_session` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '场次名称',
  `start_time` datetime DEFAULT NULL COMMENT '每日开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '每日结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='秒杀活动场次';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_seckill_session`
--

LOCK TABLES `sms_seckill_session` WRITE;
/*!40000 ALTER TABLE `sms_seckill_session` DISABLE KEYS */;
INSERT INTO `sms_seckill_session` (`id`, `name`, `start_time`, `end_time`, `status`, `create_time`) VALUES (3,'22:00','2021-07-18 00:00:00','2021-07-18 23:59:00',1,'2021-07-18 15:28:06');
/*!40000 ALTER TABLE `sms_seckill_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_seckill_sku_notice`
--

DROP TABLE IF EXISTS `sms_seckill_sku_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_seckill_sku_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint DEFAULT NULL COMMENT 'member_id',
  `sku_id` bigint DEFAULT NULL COMMENT 'sku_id',
  `session_id` bigint DEFAULT NULL COMMENT '活动场次id',
  `subcribe_time` datetime DEFAULT NULL COMMENT '订阅时间',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `notice_type` tinyint(1) DEFAULT NULL COMMENT '通知方式[0-短信，1-邮件]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='秒杀商品通知订阅';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_seckill_sku_notice`
--

LOCK TABLES `sms_seckill_sku_notice` WRITE;
/*!40000 ALTER TABLE `sms_seckill_sku_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_seckill_sku_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_seckill_sku_relation`
--

DROP TABLE IF EXISTS `sms_seckill_sku_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_seckill_sku_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `promotion_id` bigint DEFAULT NULL COMMENT '活动id',
  `promotion_session_id` bigint DEFAULT NULL COMMENT '活动场次id',
  `sku_id` bigint DEFAULT NULL COMMENT '商品id',
  `seckill_price` decimal(10,0) DEFAULT NULL COMMENT '秒杀价格',
  `seckill_count` decimal(10,0) DEFAULT NULL COMMENT '秒杀总量',
  `seckill_limit` decimal(10,0) DEFAULT NULL COMMENT '每人限购数量',
  `seckill_sort` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='秒杀活动商品关联';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_seckill_sku_relation`
--

LOCK TABLES `sms_seckill_sku_relation` WRITE;
/*!40000 ALTER TABLE `sms_seckill_sku_relation` DISABLE KEYS */;
INSERT INTO `sms_seckill_sku_relation` (`id`, `promotion_id`, `promotion_session_id`, `sku_id`, `seckill_price`, `seckill_count`, `seckill_limit`, `seckill_sort`) VALUES (3,NULL,3,1,5000,10,1,0);
/*!40000 ALTER TABLE `sms_seckill_sku_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_sku_full_reduction`
--

DROP TABLE IF EXISTS `sms_sku_full_reduction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_sku_full_reduction` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint DEFAULT NULL COMMENT 'spu_id',
  `full_price` decimal(18,4) DEFAULT NULL COMMENT '满多少',
  `reduce_price` decimal(18,4) DEFAULT NULL COMMENT '减多少',
  `add_other` tinyint(1) DEFAULT NULL COMMENT '是否参与其他优惠',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品满减信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_sku_full_reduction`
--

LOCK TABLES `sms_sku_full_reduction` WRITE;
/*!40000 ALTER TABLE `sms_sku_full_reduction` DISABLE KEYS */;
INSERT INTO `sms_sku_full_reduction` (`id`, `sku_id`, `full_price`, `reduce_price`, `add_other`) VALUES (1,1,10000.0000,80.0000,NULL),(2,2,10000.0000,80.0000,NULL),(3,3,10000.0000,80.0000,NULL),(4,4,10000.0000,80.0000,NULL),(5,5,10000.0000,80.0000,NULL),(6,6,10000.0000,80.0000,NULL),(7,7,10000.0000,80.0000,NULL),(8,8,10000.0000,80.0000,NULL),(9,9,6666.0000,200.0000,NULL);
/*!40000 ALTER TABLE `sms_sku_full_reduction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_sku_ladder`
--

DROP TABLE IF EXISTS `sms_sku_ladder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_sku_ladder` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint DEFAULT NULL COMMENT 'spu_id',
  `full_count` int DEFAULT NULL COMMENT '满几件',
  `discount` decimal(4,2) DEFAULT NULL COMMENT '打几折',
  `price` decimal(18,4) DEFAULT NULL COMMENT '折后价',
  `add_other` tinyint(1) DEFAULT NULL COMMENT '是否叠加其他优惠[0-不可叠加，1-可叠加]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品阶梯价格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_sku_ladder`
--

LOCK TABLES `sms_sku_ladder` WRITE;
/*!40000 ALTER TABLE `sms_sku_ladder` DISABLE KEYS */;
INSERT INTO `sms_sku_ladder` (`id`, `sku_id`, `full_count`, `discount`, `price`, `add_other`) VALUES (1,1,3,0.92,NULL,1),(2,1,3,0.92,NULL,1),(3,2,5,0.92,NULL,1),(4,2,5,0.92,NULL,1),(5,3,3,0.92,NULL,0),(6,3,3,0.92,NULL,0),(7,4,3,0.92,NULL,0),(8,4,3,0.92,NULL,0),(9,5,3,0.92,NULL,0),(10,5,3,0.92,NULL,0),(11,6,3,0.92,NULL,0),(12,6,3,0.92,NULL,0),(13,7,3,0.92,NULL,1),(14,7,3,0.92,NULL,1),(15,8,3,0.92,NULL,1),(16,8,3,0.92,NULL,1),(17,9,4,0.80,NULL,0),(18,9,4,0.80,NULL,0);
/*!40000 ALTER TABLE `sms_sku_ladder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_spu_bounds`
--

DROP TABLE IF EXISTS `sms_spu_bounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_spu_bounds` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint DEFAULT NULL,
  `grow_bounds` decimal(18,4) DEFAULT NULL COMMENT '成长积分',
  `buy_bounds` decimal(18,4) DEFAULT NULL COMMENT '购物积分',
  `work` tinyint(1) DEFAULT NULL COMMENT '优惠生效情况[1111（四个状态位，从右到左）;0 - 无优惠，成长积分是否赠送;1 - 无优惠，购物积分是否赠送;2 - 有优惠，成长积分是否赠送;3 - 有优惠，购物积分是否赠送【状态位0：不赠送，1：赠送】]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='商品spu积分设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_spu_bounds`
--

LOCK TABLES `sms_spu_bounds` WRITE;
/*!40000 ALTER TABLE `sms_spu_bounds` DISABLE KEYS */;
INSERT INTO `sms_spu_bounds` (`id`, `spu_id`, `grow_bounds`, `buy_bounds`, `work`) VALUES (1,1,500.0000,2000.0000,NULL),(2,2,500.0000,2000.0000,NULL),(3,3,500.0000,2000.0000,NULL),(4,5,500.0000,500.0000,NULL);
/*!40000 ALTER TABLE `sms_spu_bounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `kkmall_ums`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `kkmall_ums` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `kkmall_ums`;

--
-- Table structure for table `ums_growth_change_history`
--

DROP TABLE IF EXISTS `ums_growth_change_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_growth_change_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint DEFAULT NULL COMMENT 'member_id',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `change_count` int DEFAULT NULL COMMENT '改变的值（正负计数）',
  `note` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `source_type` tinyint DEFAULT NULL COMMENT '积分来源[0-购物，1-管理员修改]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='成长值变化历史记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_growth_change_history`
--

LOCK TABLES `ums_growth_change_history` WRITE;
/*!40000 ALTER TABLE `ums_growth_change_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_growth_change_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_integration_change_history`
--

DROP TABLE IF EXISTS `ums_integration_change_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_integration_change_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint DEFAULT NULL COMMENT 'member_id',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `change_count` int DEFAULT NULL COMMENT '变化的值',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `source_tyoe` tinyint DEFAULT NULL COMMENT '来源[0->购物；1->管理员修改;2->活动]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='积分变化历史记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_integration_change_history`
--

LOCK TABLES `ums_integration_change_history` WRITE;
/*!40000 ALTER TABLE `ums_integration_change_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_integration_change_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member`
--

DROP TABLE IF EXISTS `ums_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level_id` bigint DEFAULT NULL COMMENT '会员等级id',
  `username` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `header` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `gender` tinyint DEFAULT NULL COMMENT '性别',
  `birth` date DEFAULT NULL COMMENT '生日',
  `city` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所在城市',
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '职业',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个性签名',
  `source_type` tinyint DEFAULT NULL COMMENT '用户来源',
  `integration` int DEFAULT NULL COMMENT '积分',
  `growth` int DEFAULT NULL COMMENT '成长值',
  `status` tinyint DEFAULT NULL COMMENT '启用状态',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `social_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '社交账号ID',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '社交账号Token',
  `expires_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '社交账号Token过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='会员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member`
--

LOCK TABLES `ums_member` WRITE;
/*!40000 ALTER TABLE `ums_member` DISABLE KEYS */;
INSERT INTO `ums_member` (`id`, `level_id`, `username`, `password`, `nickname`, `mobile`, `email`, `header`, `gender`, `birth`, `city`, `job`, `sign`, `source_type`, `integration`, `growth`, `status`, `create_time`, `social_uid`, `access_token`, `expires_in`) VALUES (1,1,'kk','$2a$10$OfJUHmZqTTbGirzFLTKi6OWU1A1MQ9P07KLrZqPBaddfoCD/HGsda','firenay','15980253623','xxx@gmail.com',NULL,0,'2020-06-25','福建 福州','JAVA',NULL,NULL,NULL,NULL,0,'2020-06-25 13:09:14',NULL,NULL,NULL),(2,1,'sentinel','$2a$10$j5XRpUeGq7AYIFk7pqdvyebK.Bo5MvasCxk.8RuBWsHFcq5RzXKEC','sentinel','15980253623','xxx@gmail.com',NULL,1,'2020-06-25','福建 福州','JAVA',NULL,NULL,NULL,NULL,0,'2020-06-25 13:15:33',NULL,NULL,NULL),(13,1,'LinKirk',NULL,'LinKirk',NULL,NULL,NULL,0,'2021-07-09','福建 福州','IT',NULL,NULL,NULL,NULL,0,'2021-07-09 19:49:29','5703891740','2.00','157679999'),(14,1,'kirklin','$2a$10$OfJUHmZqTTbGirzFLTKi6OWU1A1MQ9P07KLrZqPBaddfoCD/HGsda','kirklin','15980253623','xxx@gmail.com',NULL,1,'2021-07-09','福建 福州','JAVA',NULL,NULL,NULL,NULL,0,'2021-07-09 19:52:31',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ums_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_collect_spu`
--

DROP TABLE IF EXISTS `ums_member_collect_spu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_collect_spu` (
  `id` bigint NOT NULL COMMENT 'id',
  `member_id` bigint DEFAULT NULL COMMENT '会员id',
  `spu_id` bigint DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'spu_name',
  `spu_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'spu_img',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='会员收藏的商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_collect_spu`
--

LOCK TABLES `ums_member_collect_spu` WRITE;
/*!40000 ALTER TABLE `ums_member_collect_spu` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_collect_spu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_collect_subject`
--

DROP TABLE IF EXISTS `ums_member_collect_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_collect_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `subject_id` bigint DEFAULT NULL COMMENT 'subject_id',
  `subject_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subject_name',
  `subject_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subject_img',
  `subject_urll` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='会员收藏的专题活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_collect_subject`
--

LOCK TABLES `ums_member_collect_subject` WRITE;
/*!40000 ALTER TABLE `ums_member_collect_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_collect_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_level`
--

DROP TABLE IF EXISTS `ums_member_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_level` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '等级名称',
  `growth_point` int DEFAULT NULL COMMENT '等级需要的成长值',
  `default_status` tinyint DEFAULT NULL COMMENT '是否为默认等级[0->不是；1->是]',
  `free_freight_point` decimal(18,4) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` tinyint DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_member_price` tinyint DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` tinyint DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='会员等级';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_level`
--

LOCK TABLES `ums_member_level` WRITE;
/*!40000 ALTER TABLE `ums_member_level` DISABLE KEYS */;
INSERT INTO `ums_member_level` (`id`, `name`, `growth_point`, `default_status`, `free_freight_point`, `comment_growth_point`, `priviledge_free_freight`, `priviledge_member_price`, `priviledge_birthday`, `note`) VALUES (1,'普通会员',0,1,188.0000,10,0,0,1,'初级会员'),(2,'铜牌会员',2000,0,159.0000,20,0,1,1,'铜牌会员'),(3,'银牌会员',5000,0,129.0000,50,0,1,1,'银牌会员'),(4,'金牌会员',8000,0,88.0000,0,1,1,1,'金牌会员'),(5,'钻石会员',12000,0,48.0000,80,1,1,1,'钻石会员');
/*!40000 ALTER TABLE `ums_member_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_login_log`
--

DROP TABLE IF EXISTS `ums_member_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_login_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint DEFAULT NULL COMMENT 'member_id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'city',
  `login_type` tinyint(1) DEFAULT NULL COMMENT '登录类型[1-web，2-app]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='会员登录记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_login_log`
--

LOCK TABLES `ums_member_login_log` WRITE;
/*!40000 ALTER TABLE `ums_member_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_receive_address`
--

DROP TABLE IF EXISTS `ums_member_receive_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_receive_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint DEFAULT NULL COMMENT 'member_id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区',
  `detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址(街道)',
  `areacode` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省市区代码',
  `default_status` tinyint(1) DEFAULT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='会员收货地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_receive_address`
--

LOCK TABLES `ums_member_receive_address` WRITE;
/*!40000 ALTER TABLE `ums_member_receive_address` DISABLE KEYS */;
INSERT INTO `ums_member_receive_address` (`id`, `member_id`, `name`, `phone`, `post_code`, `province`, `city`, `region`, `detail_address`, `areacode`, `default_status`) VALUES (1,1,'LinKirk','15980253623',NULL,'湖北','武汉',NULL,'洪山区',NULL,1),(2,14,'LinKirk','15980253623',NULL,'湖北','武汉',NULL,'洪山区',NULL,1),(3,14,'LinKirk','15980253666',NULL,'湖北','武汉',NULL,'洪山区',NULL,1);
/*!40000 ALTER TABLE `ums_member_receive_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ums_member_statistics_info`
--

DROP TABLE IF EXISTS `ums_member_statistics_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ums_member_statistics_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint DEFAULT NULL COMMENT '会员id',
  `consume_amount` decimal(18,4) DEFAULT NULL COMMENT '累计消费金额',
  `coupon_amount` decimal(18,4) DEFAULT NULL COMMENT '累计优惠金额',
  `order_count` int DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int DEFAULT NULL COMMENT '评价数',
  `return_order_count` int DEFAULT NULL COMMENT '退货数量',
  `login_count` int DEFAULT NULL COMMENT '登录次数',
  `attend_count` int DEFAULT NULL COMMENT '关注数量',
  `fans_count` int DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int DEFAULT NULL COMMENT '收藏的商品数量',
  `collect_subject_count` int DEFAULT NULL COMMENT '收藏的专题活动数量',
  `collect_comment_count` int DEFAULT NULL COMMENT '收藏的评论数量',
  `invite_friend_count` int DEFAULT NULL COMMENT '邀请的朋友数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='会员统计信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ums_member_statistics_info`
--

LOCK TABLES `ums_member_statistics_info` WRITE;
/*!40000 ALTER TABLE `ums_member_statistics_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `ums_member_statistics_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `kkmall_wms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `kkmall_wms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `kkmall_wms`;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wms_purchase`
--

DROP TABLE IF EXISTS `wms_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_purchase` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `assignee_id` bigint DEFAULT NULL,
  `assignee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `ware_id` bigint DEFAULT NULL,
  `amount` decimal(18,4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='采购信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wms_purchase`
--

LOCK TABLES `wms_purchase` WRITE;
/*!40000 ALTER TABLE `wms_purchase` DISABLE KEYS */;
INSERT INTO `wms_purchase` (`id`, `assignee_id`, `assignee_name`, `phone`, `priority`, `status`, `ware_id`, `amount`, `create_time`, `update_time`) VALUES (1,2,'fireflynay','18156475879',1,3,1,1616400.0000,'2020-06-07 00:34:32','2021-06-15 18:25:18'),(2,1,'admin','18173516309',1,3,1,177760.0000,'2020-06-07 00:55:43','2020-06-07 14:14:47'),(3,1,'admin','18173516309',1,3,1,297520.0000,'2020-06-07 13:33:08','2020-06-07 15:21:43'),(4,2,'fireflynay','18156475879',1,3,1,179640.0000,'2020-06-07 14:01:10','2020-06-07 15:18:35'),(5,1,'admin','13612345678',NULL,3,1,1616400.0000,'2021-06-15 18:15:27','2021-06-15 18:25:34');
/*!40000 ALTER TABLE `wms_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wms_purchase_detail`
--

DROP TABLE IF EXISTS `wms_purchase_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_purchase_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint DEFAULT NULL COMMENT '采购单id',
  `sku_id` bigint DEFAULT NULL COMMENT '采购商品id',
  `sku_num` int DEFAULT NULL COMMENT '采购数量',
  `sku_price` decimal(18,4) DEFAULT NULL COMMENT '采购金额',
  `ware_id` bigint DEFAULT NULL COMMENT '仓库id',
  `status` int DEFAULT NULL COMMENT '状态[0新建，1已分配，2正在采购，3已完成，4采购失败]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wms_purchase_detail`
--

LOCK TABLES `wms_purchase_detail` WRITE;
/*!40000 ALTER TABLE `wms_purchase_detail` DISABLE KEYS */;
INSERT INTO `wms_purchase_detail` (`id`, `purchase_id`, `sku_id`, `sku_num`, `sku_price`, `ware_id`, `status`) VALUES (1,1,2,10,88880.0000,1,3),(2,3,2,20,177760.0000,1,3),(3,3,3,5,29940.0000,1,3),(4,3,3,15,89820.0000,1,3),(5,4,4,30,179640.0000,1,3),(6,1,5,25,149700.0000,1,3),(9,5,9,100,418800.0000,1,3),(10,5,8,200,1197600.0000,1,3);
/*!40000 ALTER TABLE `wms_purchase_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wms_ware_info`
--

DROP TABLE IF EXISTS `wms_ware_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_ware_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库名',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '仓库地址',
  `areacode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='仓库信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wms_ware_info`
--

LOCK TABLES `wms_ware_info` WRITE;
/*!40000 ALTER TABLE `wms_ware_info` DISABLE KEYS */;
INSERT INTO `wms_ware_info` (`id`, `name`, `address`, `areacode`) VALUES (1,'1号仓库','长沙市','410000');
/*!40000 ALTER TABLE `wms_ware_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wms_ware_order_task`
--

DROP TABLE IF EXISTS `wms_ware_order_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_ware_order_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint DEFAULT NULL COMMENT 'order_id',
  `order_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'order_sn',
  `consignee` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人',
  `consignee_tel` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人电话',
  `delivery_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '配送地址',
  `order_comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单备注',
  `payment_way` tinyint(1) DEFAULT NULL COMMENT '付款方式【 1:在线付款 2:货到付款】',
  `task_status` tinyint DEFAULT NULL COMMENT '任务状态',
  `order_body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单描述',
  `tracking_no` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流单号',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `ware_id` bigint DEFAULT NULL COMMENT '仓库id',
  `task_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '工作单备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存工作单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wms_ware_order_task`
--

LOCK TABLES `wms_ware_order_task` WRITE;
/*!40000 ALTER TABLE `wms_ware_order_task` DISABLE KEYS */;
INSERT INTO `wms_ware_order_task` (`id`, `order_id`, `order_sn`, `consignee`, `consignee_tel`, `delivery_address`, `order_comment`, `payment_way`, `task_status`, `order_body`, `tracking_no`, `create_time`, `ware_id`, `task_comment`) VALUES (4,NULL,'202107131708162051414874305601388545',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,'202107141621177441415224871993171969',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,'202107141934079151415273400811823105',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,'202107150016360101415344486266118146',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,'202107161613374701415947717195235330',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,'202107181552570501416667290227900418',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,'202107181734206321416692806616023042',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `wms_ware_order_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wms_ware_order_task_detail`
--

DROP TABLE IF EXISTS `wms_ware_order_task_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_ware_order_task_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku_name',
  `sku_num` int DEFAULT NULL COMMENT '购买个数',
  `task_id` bigint DEFAULT NULL COMMENT '工作单id',
  `ware_id` bigint DEFAULT NULL COMMENT '仓库id',
  `lock_status` int DEFAULT NULL COMMENT '1-已锁定  2-已解锁  3-扣减',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='库存工作单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wms_ware_order_task_detail`
--

LOCK TABLES `wms_ware_order_task_detail` WRITE;
/*!40000 ALTER TABLE `wms_ware_order_task_detail` DISABLE KEYS */;
INSERT INTO `wms_ware_order_task_detail` (`id`, `sku_id`, `sku_name`, `sku_num`, `task_id`, `ware_id`, `lock_status`) VALUES (4,1,'',1,4,1,1),(5,1,'',1,5,1,2),(6,1,'',1,6,1,2),(7,1,'',1,7,1,2),(8,9,'',1,8,1,1),(9,1,'',1,9,1,2),(10,1,'',2,10,1,2);
/*!40000 ALTER TABLE `wms_ware_order_task_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wms_ware_sku`
--

DROP TABLE IF EXISTS `wms_ware_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wms_ware_sku` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint DEFAULT NULL COMMENT 'sku_id',
  `ware_id` bigint DEFAULT NULL COMMENT '仓库id',
  `stock` int DEFAULT NULL COMMENT '库存数',
  `sku_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku_name',
  `stock_locked` int DEFAULT '0' COMMENT '锁定库存',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sku_id` (`sku_id`) USING BTREE,
  KEY `ware_id` (`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='商品库存';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wms_ware_sku`
--

LOCK TABLES `wms_ware_sku` WRITE;
/*!40000 ALTER TABLE `wms_ware_sku` DISABLE KEYS */;
INSERT INTO `wms_ware_sku` (`id`, `sku_id`, `ware_id`, `stock`, `sku_name`, `stock_locked`) VALUES (3,1,1,50,'华为 HUAWEI P40 Pro+ 麒麟990 5G  流光幻镜 套餐三',1),(4,3,1,35,'华为 HUAWEI P40 Pro+ 麒麟990 5G  流光幻镜 套餐一',0),(5,4,1,60,'华为 HUAWEI P40 Pro+ 麒麟990 5G  霓影紫 套餐二',0),(6,5,1,125,'华为 HUAWEI P40 Pro+ 麒麟990 5G  霓影紫 套餐三',0),(7,9,1,900,'华为 HUAWEI P40 Pro+ 麒麟990 5G  钛空银 套餐一',1),(8,8,1,1400,'华为 HUAWEI P40 Pro+ 麒麟990 5G  钛空银 套餐三',0);
/*!40000 ALTER TABLE `wms_ware_sku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `nacos_config`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `nacos_config` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `nacos_config`;

--
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`) VALUES (1,'kkmall-gateway.yml','DEFAULT_GROUP','spring: \n    application:\n        name: kkmall-gateway','8a3515afc9e9a032cf075982f1545033','2021-06-08 02:49:52','2021-06-08 02:49:52',NULL,'0:0:0:0:0:0:0:1','','1491b51d-35bb-4278-8760-80cdbd28eb31',NULL,NULL,NULL,'yaml',NULL);
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`username`, `role`) VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
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

-- Dump completed on 2021-07-18 18:09:41
