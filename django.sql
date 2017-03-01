/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : django

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-09-05 21:37:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_267e8cd2_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_79b7da56_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_267e8cd2_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissio_content_type_id_9af1291_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add my user', '6', 'add_myuser');
INSERT INTO `auth_permission` VALUES ('17', 'Can change my user', '6', 'change_myuser');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete my user', '6', 'delete_myuser');
INSERT INTO `auth_permission` VALUES ('19', 'Can add job_type', '7', 'add_job_type');
INSERT INTO `auth_permission` VALUES ('20', 'Can change job_type', '7', 'change_job_type');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete job_type', '7', 'delete_job_type');
INSERT INTO `auth_permission` VALUES ('22', 'Can add farm_type', '8', 'add_farm_type');
INSERT INTO `auth_permission` VALUES ('23', 'Can change farm_type', '8', 'change_farm_type');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete farm_type', '8', 'delete_farm_type');
INSERT INTO `auth_permission` VALUES ('25', 'Can add job', '9', 'add_job');
INSERT INTO `auth_permission` VALUES ('26', 'Can change job', '9', 'change_job');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete job', '9', 'delete_job');
INSERT INTO `auth_permission` VALUES ('28', 'Can add ua v_ model', '10', 'add_uav_model');
INSERT INTO `auth_permission` VALUES ('29', 'Can change ua v_ model', '10', 'change_uav_model');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete ua v_ model', '10', 'delete_uav_model');
INSERT INTO `auth_permission` VALUES ('31', 'Can add uav', '11', 'add_uav');
INSERT INTO `auth_permission` VALUES ('32', 'Can change uav', '11', 'change_uav');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete uav', '11', 'delete_uav');
INSERT INTO `auth_permission` VALUES ('34', 'Can add ua v_ job_ detail', '12', 'add_uav_job_detail');
INSERT INTO `auth_permission` VALUES ('35', 'Can change ua v_ job_ detail', '12', 'change_uav_job_detail');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete ua v_ job_ detail', '12', 'delete_uav_job_detail');
INSERT INTO `auth_permission` VALUES ('37', 'Can add ua v_ job_ desc', '13', 'add_uav_job_desc');
INSERT INTO `auth_permission` VALUES ('38', 'Can change ua v_ job_ desc', '13', 'change_uav_job_desc');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete ua v_ job_ desc', '13', 'delete_uav_job_desc');
INSERT INTO `auth_permission` VALUES ('40', 'Can add task state', '14', 'add_taskmeta');
INSERT INTO `auth_permission` VALUES ('41', 'Can change task state', '14', 'change_taskmeta');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete task state', '14', 'delete_taskmeta');
INSERT INTO `auth_permission` VALUES ('43', 'Can add saved group result', '15', 'add_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('44', 'Can change saved group result', '15', 'change_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete saved group result', '15', 'delete_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('46', 'Can add interval', '16', 'add_intervalschedule');
INSERT INTO `auth_permission` VALUES ('47', 'Can change interval', '16', 'change_intervalschedule');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete interval', '16', 'delete_intervalschedule');
INSERT INTO `auth_permission` VALUES ('49', 'Can add crontab', '17', 'add_crontabschedule');
INSERT INTO `auth_permission` VALUES ('50', 'Can change crontab', '17', 'change_crontabschedule');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete crontab', '17', 'delete_crontabschedule');
INSERT INTO `auth_permission` VALUES ('52', 'Can add periodic tasks', '18', 'add_periodictasks');
INSERT INTO `auth_permission` VALUES ('53', 'Can change periodic tasks', '18', 'change_periodictasks');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete periodic tasks', '18', 'delete_periodictasks');
INSERT INTO `auth_permission` VALUES ('55', 'Can add periodic task', '19', 'add_periodictask');
INSERT INTO `auth_permission` VALUES ('56', 'Can change periodic task', '19', 'change_periodictask');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete periodic task', '19', 'delete_periodictask');
INSERT INTO `auth_permission` VALUES ('58', 'Can add worker', '20', 'add_workerstate');
INSERT INTO `auth_permission` VALUES ('59', 'Can change worker', '20', 'change_workerstate');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete worker', '20', 'delete_workerstate');
INSERT INTO `auth_permission` VALUES ('61', 'Can add task', '21', 'add_taskstate');
INSERT INTO `auth_permission` VALUES ('62', 'Can change task', '21', 'change_taskstate');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete task', '21', 'delete_taskstate');
INSERT INTO `auth_permission` VALUES ('64', 'Can add nation', '22', 'add_nation');
INSERT INTO `auth_permission` VALUES ('65', 'Can change nation', '22', 'change_nation');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete nation', '22', 'delete_nation');
INSERT INTO `auth_permission` VALUES ('67', 'Can add job_ border', '23', 'add_job_border');
INSERT INTO `auth_permission` VALUES ('68', 'Can change job_ border', '23', 'change_job_border');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete job_ border', '23', 'delete_job_border');
INSERT INTO `auth_permission` VALUES ('70', 'Can add ua v_ desc_ recover', '24', 'add_uav_desc_recover');
INSERT INTO `auth_permission` VALUES ('71', 'Can change ua v_ desc_ recover', '24', 'change_uav_desc_recover');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete ua v_ desc_ recover', '24', 'delete_uav_desc_recover');
INSERT INTO `auth_permission` VALUES ('85', 'Can add ua v_ job_ desc_thr', '29', 'add_uav_job_desc_thr');
INSERT INTO `auth_permission` VALUES ('86', 'Can change ua v_ job_ desc_thr', '29', 'change_uav_job_desc_thr');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete ua v_ job_ desc_thr', '29', 'delete_uav_job_desc_thr');
INSERT INTO `auth_permission` VALUES ('91', 'Can add ua v_ desc_ recover_thr', '31', 'add_uav_desc_recover_thr');
INSERT INTO `auth_permission` VALUES ('92', 'Can change ua v_ desc_ recover_thr', '31', 'change_uav_desc_recover_thr');
INSERT INTO `auth_permission` VALUES ('93', 'Can delete ua v_ desc_ recover_thr', '31', 'delete_uav_desc_recover_thr');
INSERT INTO `auth_permission` VALUES ('97', 'Can add ua v_ss', '33', 'add_uav_ss');
INSERT INTO `auth_permission` VALUES ('98', 'Can change ua v_ss', '33', 'change_uav_ss');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete ua v_ss', '33', 'delete_uav_ss');

-- ----------------------------
-- Table structure for celery_taskmeta
-- ----------------------------
DROP TABLE IF EXISTS `celery_taskmeta`;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_662f707d` (`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of celery_taskmeta
-- ----------------------------
INSERT INTO `celery_taskmeta` VALUES ('1', '404d351c-514d-44ad-a5f6-a0458ca09601', 'SUCCESS', 'gAJLBC4=', '2015-10-23 04:34:06', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('2', '5e4eb55b-3748-4982-8826-a74e1db987d3', 'SUCCESS', 'gAJLBC4=', '2015-10-23 04:40:02', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('3', '16179cae-25ab-4c7f-839b-47f860abee5f', 'SUCCESS', 'gAJLBC4=', '2015-10-23 04:40:35', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('4', '8529ddaa-083b-4ce5-bc32-1e1d8d5817e0', 'SUCCESS', 'gAJLCC4=', '2015-10-23 04:40:57', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('5', '9861cd59-5100-4134-a660-832c8b639920', 'SUCCESS', 'gAJLDC4=', '2015-10-23 04:50:09', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('6', '6758cc0a-3954-4219-bab3-887ab7e94799', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:00', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('7', '46619a5d-ebb0-4b5b-8bda-7b102aa7710d', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:10', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('8', '3d18aa78-34dc-4242-bc2c-490b09513def', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:11', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('9', 'ac187d31-fbc8-44f0-aea6-fe615c5ef14b', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:11', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('10', '7e87c7ea-3e9c-4de8-8321-bdea55e7c7ad', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:12', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('11', 'da32cc10-9a99-445f-adbc-a0a56da6ac47', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:12', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('12', '9a9fc107-d500-40e5-8604-d904628c4b15', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:12', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('13', 'b7d1b294-515b-4a3c-a163-4e3e61a0985f', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:12', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('14', '7f32c283-8a59-4823-9b12-bbedb9e659b0', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:14', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('15', 'eec8288a-6ee5-4c8b-be36-ad429c0ce710', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:16', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('16', 'dc91a2fa-5baf-4c89-9be1-899ee2e8d2a0', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:17', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('17', '1cd05967-0d8e-4d9d-81f0-dc785a0aef3f', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:18', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('18', '93dd98b5-4c77-4b4e-ae96-9230ef5a72ac', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:19', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('19', '18560813-3a5c-4ae7-815c-1005ec6ce733', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:19', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('20', '7f7029e4-2bed-4e5d-84cb-fc8b9ef18709', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:29:19', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('21', 'ee892443-e124-472d-a0a5-71d6a747dfbb', 'SUCCESS', 'gAJLDS4=', '2015-10-23 05:30:13', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');
INSERT INTO `celery_taskmeta` VALUES ('22', '0f910081-bdf5-4625-a8ad-bfe7ae148658', 'SUCCESS', 'gAJLDS4=', '2015-10-23 14:15:54', null, '0', 'eJxrYKotZIjgYGBgSM7IzEkpSs0rZIwtZCrWAwBWnQb9');

-- ----------------------------
-- Table structure for celery_tasksetmeta
-- ----------------------------
DROP TABLE IF EXISTS `celery_tasksetmeta`;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of celery_tasksetmeta
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_6977c538_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_2a48e85a_fk_model_myuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_2a48e85a_fk_model_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `model_myuser` (`id`),
  CONSTRAINT `django_admin__content_type_id_6977c538_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2015-05-14 08:14:05', '1', 'Job_type object', '1', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2015-05-14 08:15:53', '1', 'Monitoring', '2', 'Changed type.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2015-05-14 08:15:57', '2', 'Spraying', '1', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2015-05-14 08:16:25', '1', 'Farmland', '1', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2015-05-14 08:16:40', '2', 'Woodland', '1', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2015-05-14 08:17:03', '3', 'Orchard', '1', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2015-10-23 14:36:33', '1', 'every second', '1', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2015-10-23 14:38:29', '1', 'add: every second', '1', '', '19', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2015-10-23 14:38:48', '1', 'add: every second', '2', 'Changed regtask.', '19', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2016-05-26 02:06:08', '1', 'add: every second', '3', '', '19', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2016-05-26 02:08:34', '2', 'every 2 minutes', '1', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2016-05-26 02:09:43', '3', 'lat_lng_converter: every 2 minutes', '1', '', '19', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2016-05-26 02:10:15', '3', 'every 5 seconds', '1', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2016-05-26 02:10:20', '4', 'debug_task: every 5 seconds', '1', '', '19', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2016-05-26 02:11:13', '4', 'every minute', '1', '', '16', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2016-05-26 02:11:16', '5', 'uav_flying_status_detector: every minute', '1', '', '19', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2016-05-26 02:16:07', '4', 'debug_task: every 5 seconds', '3', '', '19', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2016-08-15 05:12:54', '6', 'Rtree_reBuild: every 5 seconds', '1', '', '19', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_47bff021_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('17', 'djcelery', 'crontabschedule');
INSERT INTO `django_content_type` VALUES ('16', 'djcelery', 'intervalschedule');
INSERT INTO `django_content_type` VALUES ('19', 'djcelery', 'periodictask');
INSERT INTO `django_content_type` VALUES ('18', 'djcelery', 'periodictasks');
INSERT INTO `django_content_type` VALUES ('14', 'djcelery', 'taskmeta');
INSERT INTO `django_content_type` VALUES ('15', 'djcelery', 'tasksetmeta');
INSERT INTO `django_content_type` VALUES ('21', 'djcelery', 'taskstate');
INSERT INTO `django_content_type` VALUES ('20', 'djcelery', 'workerstate');
INSERT INTO `django_content_type` VALUES ('8', 'model', 'farm_type');
INSERT INTO `django_content_type` VALUES ('9', 'model', 'job');
INSERT INTO `django_content_type` VALUES ('23', 'model', 'job_border');
INSERT INTO `django_content_type` VALUES ('7', 'model', 'job_type');
INSERT INTO `django_content_type` VALUES ('6', 'model', 'myuser');
INSERT INTO `django_content_type` VALUES ('22', 'model', 'nation');
INSERT INTO `django_content_type` VALUES ('11', 'model', 'uav');
INSERT INTO `django_content_type` VALUES ('24', 'model', 'uav_desc_recover');
INSERT INTO `django_content_type` VALUES ('31', 'model', 'uav_desc_recover_thr');
INSERT INTO `django_content_type` VALUES ('13', 'model', 'uav_job_desc');
INSERT INTO `django_content_type` VALUES ('29', 'model', 'uav_job_desc_thr');
INSERT INTO `django_content_type` VALUES ('12', 'model', 'uav_job_detail');
INSERT INTO `django_content_type` VALUES ('10', 'model', 'uav_model');
INSERT INTO `django_content_type` VALUES ('33', 'model', 'uav_ss');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2015-05-14 08:06:49');
INSERT INTO `django_migrations` VALUES ('2', 'admin', '0001_initial', '2015-05-14 08:06:50');
INSERT INTO `django_migrations` VALUES ('3', 'contenttypes', '0002_remove_content_type_name', '2015-05-14 08:06:50');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0001_initial', '2015-05-14 08:06:50');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2015-05-14 08:06:50');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2015-05-14 08:06:50');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2015-05-14 08:06:50');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2015-05-14 08:06:50');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2015-05-14 08:06:50');
INSERT INTO `django_migrations` VALUES ('10', 'sessions', '0001_initial', '2015-05-14 08:06:50');
INSERT INTO `django_migrations` VALUES ('11', 'djcelery', '0001_initial', '2015-10-23 04:22:40');
INSERT INTO `django_migrations` VALUES ('12', 'djcelery', '0002_auto_20151023_2234', '2015-10-23 14:34:06');
INSERT INTO `django_migrations` VALUES ('13', 'djcelery', '0003_auto_20151025_2057', '2015-10-25 12:57:19');
INSERT INTO `django_migrations` VALUES ('14', 'djcelery', '0004_auto_20151025_2059', '2015-10-25 12:59:57');
INSERT INTO `django_migrations` VALUES ('15', 'djcelery', '0005_auto_20151025_2101', '2015-10-25 13:01:40');
INSERT INTO `django_migrations` VALUES ('16', 'djcelery', '0002_auto_20151103_1435', '2015-11-03 06:36:10');
INSERT INTO `django_migrations` VALUES ('17', 'djcelery', '0003_auto_20151130_1505', '2015-11-30 07:05:58');
INSERT INTO `django_migrations` VALUES ('18', 'djcelery', '0006_auto_20151209_2007', '2015-12-09 12:07:56');
INSERT INTO `django_migrations` VALUES ('19', 'djcelery', '0007_auto_20151209_2153', '2015-12-09 13:53:18');
INSERT INTO `django_migrations` VALUES ('20', 'admin', '0002_logentry_remove_auto_add', '2015-12-13 10:19:42');
INSERT INTO `django_migrations` VALUES ('21', 'auth', '0007_alter_validators_add_error_messages', '2015-12-13 10:19:42');
INSERT INTO `django_migrations` VALUES ('22', 'djcelery', '0002_auto_20151213_1819', '2015-12-13 10:19:42');
INSERT INTO `django_migrations` VALUES ('23', 'djcelery', '0002_auto_20160412_1627', '2016-04-12 08:27:41');
INSERT INTO `django_migrations` VALUES ('24', 'djcelery', '0003_auto_20160412_1629', '2016-04-12 08:29:35');
INSERT INTO `django_migrations` VALUES ('25', 'djcelery', '0004_auto_20160412_1639', '2016-04-12 08:39:32');
INSERT INTO `django_migrations` VALUES ('26', 'djcelery', '0005_auto_20160412_1709', '2016-04-12 09:09:12');
INSERT INTO `django_migrations` VALUES ('27', 'djcelery', '0006_auto_20160425_1024', '2016-04-25 02:24:56');
INSERT INTO `django_migrations` VALUES ('28', 'djcelery', '0007_auto_20160425_1027', '2016-04-25 02:27:33');
INSERT INTO `django_migrations` VALUES ('29', 'djcelery', '0008_auto_20160429_1638', '2016-04-29 08:39:55');
INSERT INTO `django_migrations` VALUES ('30', 'djcelery', '0009_auto_20160429_1641', '2016-04-29 08:41:07');
INSERT INTO `django_migrations` VALUES ('31', 'djcelery', '0010_auto_20160505_1004', '2016-05-05 02:04:32');
INSERT INTO `django_migrations` VALUES ('32', 'djcelery', '0011_auto_20160505_1102', '2016-05-05 03:02:53');
INSERT INTO `django_migrations` VALUES ('33', 'djcelery', '0012_auto_20160526_0938', '2016-05-26 01:39:04');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('00mbqzxs1xw1lf4o0osddrvlhcubt86p', 'ZGYzNmMyMzM0OThiY2U2ZTFmMDM1NmJjYmU0ODNiNmNmMGMyNjk5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-03-29 06:58:15');
INSERT INTO `django_session` VALUES ('0zz8bwmc9vvxzm72583pif5pz9pl44gt', 'ZGYzNmMyMzM0OThiY2U2ZTFmMDM1NmJjYmU0ODNiNmNmMGMyNjk5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-08-28 02:18:40');
INSERT INTO `django_session` VALUES ('1ud9h4bhl30vcktmc5r23iczagpmx8y9', 'ZjFhYWY0ZGI5MTdhZmViZTI5OGRhZTA0YmQ1MzU3ZDBkNTE4NmNmMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjODZlMTU0NGQ5OTJhZTAyMjI2Y2MwZTRiNTJmZTZjMDIwMTNlMjJlIn0=', '2016-01-27 06:59:00');
INSERT INTO `django_session` VALUES ('3be73an1p814ztb1uufdrm4yypygpv4a', 'YTI2Mzk1MDdkMGEzZGFkZWYwODgxNTk5ZjY3YmQ3ZjM2NWQ2NGIzNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4NmUxNTQ0ZDk5MmFlMDIyMjZjYzBlNGI1MmZlNmMwMjAxM2UyMmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-29 08:48:10');
INSERT INTO `django_session` VALUES ('5wkuoqbnascfitiknb0padnipu3ssq6t', 'MmU1ZjU3ZTk0MGY1MjkwN2U3MGRmMDljZjI5ZDhiMTM3YTYxMmU1ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNzFmMGUxYjFmMWE1YzI5Y2EwN2Q2Mzg4M2E5MjkyYWU0OTg5OGM5In0=', '2015-08-20 02:14:18');
INSERT INTO `django_session` VALUES ('5wxmoouex5ypufinwupx71lgq75uo4zp', 'ZjFhYWY0ZGI5MTdhZmViZTI5OGRhZTA0YmQ1MzU3ZDBkNTE4NmNmMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjODZlMTU0NGQ5OTJhZTAyMjI2Y2MwZTRiNTJmZTZjMDIwMTNlMjJlIn0=', '2016-06-09 01:13:59');
INSERT INTO `django_session` VALUES ('6c5pqq5s9e7rgdnl93bwgano6ol655e6', 'ZGYzNmMyMzM0OThiY2U2ZTFmMDM1NmJjYmU0ODNiNmNmMGMyNjk5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-08-28 02:17:04');
INSERT INTO `django_session` VALUES ('6h6kh3qi6gjs34s04ueq22anilnf2jku', 'ZGYzNmMyMzM0OThiY2U2ZTFmMDM1NmJjYmU0ODNiNmNmMGMyNjk5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-03-09 06:17:40');
INSERT INTO `django_session` VALUES ('881sx3t42o39sj3ql7jw0dwuxn9m7ips', 'ZGYzNmMyMzM0OThiY2U2ZTFmMDM1NmJjYmU0ODNiNmNmMGMyNjk5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-04-13 01:48:32');
INSERT INTO `django_session` VALUES ('8s388hw7ncm1i1sqqpfo6cgikr1hhjrj', 'N2FkMDkzZjFkZDdlNzQ0ZDU5NDYyMTk2ZGQ1ZmY3YmRjZTEyNGM0MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4NmUxNTQ0ZDk5MmFlMDIyMjZjYzBlNGI1MmZlNmMwMjAxM2UyMmUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-04-27 01:51:43');
INSERT INTO `django_session` VALUES ('8sp6vnxe67olla6v1bouml8m4f738vhh', 'YzE3ZTYzMmRjYjRkNmI1NTFhYTZmNDQyN2ZjNmZlMThjOWQ5Nzg4Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3MWYwZTFiMWYxYTVjMjljYTA3ZDYzODgzYTkyOTJhZTQ5ODk4YzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-11-07 09:19:09');
INSERT INTO `django_session` VALUES ('bajdavgripb2fvcy3wzz2fsvcoy0rz7c', 'MjU0OTU4NGZiMGZlMzRlZmE4Yzg2NWZlNTc1YTYyMTEwM2FhYmNjYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-27 12:24:23');
INSERT INTO `django_session` VALUES ('cpmsm2ne7x3g8r4lvcbtdvy9y9vww244', 'NTdmMDQ2OGQ5NjdhNTAxMGNlMDAwMDA1ZmQ0N2QzOGQ5NGI4MjQ0Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIxNzFmMGUxYjFmMWE1YzI5Y2EwN2Q2Mzg4M2E5MjkyYWU0OTg5OGM5In0=', '2015-08-20 04:08:35');
INSERT INTO `django_session` VALUES ('dpo33sa2ayfronrzasinrk2cwrqfmioj', 'YTI2Mzk1MDdkMGEzZGFkZWYwODgxNTk5ZjY3YmQ3ZjM2NWQ2NGIzNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4NmUxNTQ0ZDk5MmFlMDIyMjZjYzBlNGI1MmZlNmMwMjAxM2UyMmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-20 03:16:34');
INSERT INTO `django_session` VALUES ('dsvighaqmy5cr32rxvgy90dj2tyhgcw9', 'YTdlOTU1OTg0ZDcwY2EzYjRkNDMwZTNhM2U1NDQ2NGQyODY2MjBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTcxZjBlMWIxZjFhNWMyOWNhMDdkNjM4ODNhOTI5MmFlNDk4OThjOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2015-10-18 07:01:19');
INSERT INTO `django_session` VALUES ('f9kcbp9wfdi5tsl6xqqsmtyk5j13vp69', 'ZjFhYWY0ZGI5MTdhZmViZTI5OGRhZTA0YmQ1MzU3ZDBkNTE4NmNmMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjODZlMTU0NGQ5OTJhZTAyMjI2Y2MwZTRiNTJmZTZjMDIwMTNlMjJlIn0=', '2016-01-27 07:52:57');
INSERT INTO `django_session` VALUES ('fkybqyvaj8kg6zc6cfb018io4bls6mc2', 'YTdlOTU1OTg0ZDcwY2EzYjRkNDMwZTNhM2U1NDQ2NGQyODY2MjBkZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTcxZjBlMWIxZjFhNWMyOWNhMDdkNjM4ODNhOTI5MmFlNDk4OThjOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2015-12-16 06:22:39');
INSERT INTO `django_session` VALUES ('fsmw3yvj83nb5bxog1f1qfiqmn4xzx0u', 'YTI2Mzk1MDdkMGEzZGFkZWYwODgxNTk5ZjY3YmQ3ZjM2NWQ2NGIzNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4NmUxNTQ0ZDk5MmFlMDIyMjZjYzBlNGI1MmZlNmMwMjAxM2UyMmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-12-29 08:29:15');
INSERT INTO `django_session` VALUES ('g8s9yc72hsh7fn2ci79eirwpahk8xjgf', 'NGJjM2UyM2I0MGJmYzkwM2JhZjk3NjhiMDdjNjI1NTNiMzdiOTlmZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjODZlMTU0NGQ5OTJhZTAyMjI2Y2MwZTRiNTJmZTZjMDIwMTNlMjJlIn0=', '2016-03-17 02:43:22');
INSERT INTO `django_session` VALUES ('gn26qkhfulakyqic4zwxxm4y3euawvy1', 'N2FkMDkzZjFkZDdlNzQ0ZDU5NDYyMTk2ZGQ1ZmY3YmRjZTEyNGM0MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4NmUxNTQ0ZDk5MmFlMDIyMjZjYzBlNGI1MmZlNmMwMjAxM2UyMmUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-07-12 02:24:17');
INSERT INTO `django_session` VALUES ('hvl6pfnu3z9c8znnuzb2nc53iii3izls', 'NTdmMDQ2OGQ5NjdhNTAxMGNlMDAwMDA1ZmQ0N2QzOGQ5NGI4MjQ0Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIxNzFmMGUxYjFmMWE1YzI5Y2EwN2Q2Mzg4M2E5MjkyYWU0OTg5OGM5In0=', '2015-10-31 09:04:39');
INSERT INTO `django_session` VALUES ('k0zcbktgv8t3orehfz14ql28jiunvcxy', 'YjAzZDliM2FlMTQ1MDNjOGViNTM5YzdhZTBhODk5ZDIwYjkwNzkxNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDg2NTk2N2Y2NmU3ZTA1MmU2ZDZmNmMxOTg0NDM5OTZmNmRiODdjOCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2016-09-02 06:24:36');
INSERT INTO `django_session` VALUES ('klzb520hkxtcrbmv5ntdogk5wyd8d3wo', 'NGJjM2UyM2I0MGJmYzkwM2JhZjk3NjhiMDdjNjI1NTNiMzdiOTlmZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjODZlMTU0NGQ5OTJhZTAyMjI2Y2MwZTRiNTJmZTZjMDIwMTNlMjJlIn0=', '2016-09-06 13:07:22');
INSERT INTO `django_session` VALUES ('m1tnptsoxs62ioj4txqkggyir3yzmd1n', 'ODllODg5OGE5ZmU5Y2I4NWY1ODFjYmMzMWNmYjgyM2MxMTg5Mjc5ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ODY1OTY3ZjY2ZTdlMDUyZTZkNmY2YzE5ODQ0Mzk5NmY2ZGI4N2M4In0=', '2015-12-14 09:49:32');
INSERT INTO `django_session` VALUES ('maatt9ut3uf0dgpeugi946lk09xcf2a0', 'ZTZjOTQzNTVkYTM2YmM3YjMxMzlkMzEwMjc4MGRmZWEyZTg5ODJlZjp7fQ==', '2016-06-19 11:09:12');
INSERT INTO `django_session` VALUES ('nf0z046yqayzaprw8tgcqfa50hl6i0it', 'MmU1ZjU3ZTk0MGY1MjkwN2U3MGRmMDljZjI5ZDhiMTM3YTYxMmU1ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNzFmMGUxYjFmMWE1YzI5Y2EwN2Q2Mzg4M2E5MjkyYWU0OTg5OGM5In0=', '2015-12-26 12:51:25');
INSERT INTO `django_session` VALUES ('pz4xep6y48ojdovl0ezn9fv9fok3cuqp', 'N2FkMDkzZjFkZDdlNzQ0ZDU5NDYyMTk2ZGQ1ZmY3YmRjZTEyNGM0MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4NmUxNTQ0ZDk5MmFlMDIyMjZjYzBlNGI1MmZlNmMwMjAxM2UyMmUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-01-25 06:07:46');
INSERT INTO `django_session` VALUES ('pzecka666yonjlsg9yrtccf8belfli39', 'YTI2Mzk1MDdkMGEzZGFkZWYwODgxNTk5ZjY3YmQ3ZjM2NWQ2NGIzNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4NmUxNTQ0ZDk5MmFlMDIyMjZjYzBlNGI1MmZlNmMwMjAxM2UyMmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-03 09:32:56');
INSERT INTO `django_session` VALUES ('qlk48pme76jxrvlpgm3uwb5fgz2i8cd5', 'ZGYzNmMyMzM0OThiY2U2ZTFmMDM1NmJjYmU0ODNiNmNmMGMyNjk5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-07-27 05:59:18');
INSERT INTO `django_session` VALUES ('r5w6696yz9kyg58ge73o6qcoi9zffo8v', 'MjU0OTU4NGZiMGZlMzRlZmE4Yzg2NWZlNTc1YTYyMTEwM2FhYmNjYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-01-04 05:23:23');
INSERT INTO `django_session` VALUES ('s3jqz479ufacj2tcy2sl4dh75sp4ji7g', 'MjU0OTU4NGZiMGZlMzRlZmE4Yzg2NWZlNTc1YTYyMTEwM2FhYmNjYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-26 01:13:29');
INSERT INTO `django_session` VALUES ('s62gg23ext6ouffeaag7ne6ybne215g0', 'YTI2Mzk1MDdkMGEzZGFkZWYwODgxNTk5ZjY3YmQ3ZjM2NWQ2NGIzNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4NmUxNTQ0ZDk5MmFlMDIyMjZjYzBlNGI1MmZlNmMwMjAxM2UyMmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-07-05 05:08:09');
INSERT INTO `django_session` VALUES ('t1yr62pk9sisv25z7l1atp2c9mj0ob4m', 'N2FkMDkzZjFkZDdlNzQ0ZDU5NDYyMTk2ZGQ1ZmY3YmRjZTEyNGM0MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImM4NmUxNTQ0ZDk5MmFlMDIyMjZjYzBlNGI1MmZlNmMwMjAxM2UyMmUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-05-31 01:46:44');
INSERT INTO `django_session` VALUES ('t5q1df8nwlbji510ykzv7jdt9wd8w756', 'ZGYzNmMyMzM0OThiY2U2ZTFmMDM1NmJjYmU0ODNiNmNmMGMyNjk5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2016-04-13 08:10:01');
INSERT INTO `django_session` VALUES ('t7ac2l8vemnslpmcgzy0kknua5oy20s8', 'YzE3ZTYzMmRjYjRkNmI1NTFhYTZmNDQyN2ZjNmZlMThjOWQ5Nzg4Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3MWYwZTFiMWYxYTVjMjljYTA3ZDYzODgzYTkyOTJhZTQ5ODk4YzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-11-13 01:59:19');
INSERT INTO `django_session` VALUES ('teveid1krzl5854hohkxrp1ds1f7cbe8', 'NjEyNTUzMGEzYjMxY2RlZDhjNzg2Y2UyZTBkNjI4MDg2MjhkMjYxNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3MWYwZTFiMWYxYTVjMjljYTA3ZDYzODgzYTkyOTJhZTQ5ODk4YzkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2015-09-03 04:15:40');
INSERT INTO `django_session` VALUES ('tg4oct2wti1ih4gz67eci4s7a1yum80x', 'Y2ZlZmIxYjllOTZmMTlmYzkwODE5ZjNjNTllNjg2ZjI0NDI1MzY4OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzRiZDRjZTU4NjhjYmRhZjM2OWM3NGU2Yjg4ZjczZTYyM2JhZjRhYyIsIl9hdXRoX3VzZXJfaWQiOjF9', '2015-06-01 07:13:28');
INSERT INTO `django_session` VALUES ('usk28cgya6dxv6ylkfp704vv8hohfx7j', 'NjEyNTUzMGEzYjMxY2RlZDhjNzg2Y2UyZTBkNjI4MDg2MjhkMjYxNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3MWYwZTFiMWYxYTVjMjljYTA3ZDYzODgzYTkyOTJhZTQ5ODk4YzkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2015-09-03 02:45:58');
INSERT INTO `django_session` VALUES ('xdz4em4sy55yh9athmhb0dvwvwn4ctkx', 'MjU0OTU4NGZiMGZlMzRlZmE4Yzg2NWZlNTc1YTYyMTEwM2FhYmNjYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYzg2ZTE1NDRkOTkyYWUwMjIyNmNjMGU0YjUyZmU2YzAyMDEzZTIyZSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-05-04 12:15:14');
INSERT INTO `django_session` VALUES ('yhlesfdbly59y1xmgxfh4ac8644tyoxe', 'NjEyNTUzMGEzYjMxY2RlZDhjNzg2Y2UyZTBkNjI4MDg2MjhkMjYxNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3MWYwZTFiMWYxYTVjMjljYTA3ZDYzODgzYTkyOTJhZTQ5ODk4YzkiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2015-06-24 04:17:51');
INSERT INTO `django_session` VALUES ('yyl7m4xs2qdvw9qitoi726k90yccukir', 'ZjFhYWY0ZGI5MTdhZmViZTI5OGRhZTA0YmQ1MzU3ZDBkNTE4NmNmMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJjODZlMTU0NGQ5OTJhZTAyMjI2Y2MwZTRiNTJmZTZjMDIwMTNlMjJlIn0=', '2016-05-13 02:18:41');
INSERT INTO `django_session` VALUES ('z41fiq83flg67qa5y2nd3myqiieqlnot', 'YzE3ZTYzMmRjYjRkNmI1NTFhYTZmNDQyN2ZjNmZlMThjOWQ5Nzg4Njp7Il9hdXRoX3VzZXJfaGFzaCI6IjE3MWYwZTFiMWYxYTVjMjljYTA3ZDYzODgzYTkyOTJhZTQ5ODk4YzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2015-11-01 07:09:40');

-- ----------------------------
-- Table structure for djcelery_crontabschedule
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_crontabschedule`;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_crontabschedule
-- ----------------------------
INSERT INTO `djcelery_crontabschedule` VALUES ('1', '0', '4', '*', '*', '*');

-- ----------------------------
-- Table structure for djcelery_intervalschedule
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_intervalschedule`;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_intervalschedule
-- ----------------------------
INSERT INTO `djcelery_intervalschedule` VALUES ('1', '1', 'seconds');
INSERT INTO `djcelery_intervalschedule` VALUES ('2', '2', 'minutes');
INSERT INTO `djcelery_intervalschedule` VALUES ('3', '5', 'seconds');
INSERT INTO `djcelery_intervalschedule` VALUES ('4', '1', 'minutes');

-- ----------------------------
-- Table structure for djcelery_periodictask
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictask`;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_peri_crontab_id_2d262b16_fk_djcelery_crontabschedule_id` (`crontab_id`),
  KEY `djcelery_pe_interval_id_21edfc07_fk_djcelery_intervalschedule_id` (`interval_id`),
  CONSTRAINT `djcelery_peri_crontab_id_2d262b16_fk_djcelery_crontabschedule_id` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `djcelery_pe_interval_id_21edfc07_fk_djcelery_intervalschedule_id` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_periodictask
-- ----------------------------
INSERT INTO `djcelery_periodictask` VALUES ('2', 'celery.backend_cleanup', 'celery.backend_cleanup', '[]', '{}', null, null, null, null, '1', null, '0', '2016-08-26 02:02:39', '', '1', null);
INSERT INTO `djcelery_periodictask` VALUES ('3', 'lat_lng_converter', 'common.tasks.lat_lng_converter', '[]', '{}', null, null, null, null, '1', '2016-08-23 13:22:03', '20', '2016-08-23 13:22:03', '', null, '2');
INSERT INTO `djcelery_periodictask` VALUES ('5', 'uav_flying_status_detector', 'common.tasks.uav_flying_status_detector', '[]', '{}', null, null, null, null, '1', '2016-08-26 02:02:39', '39', '2016-08-26 02:02:39', '', null, '4');
INSERT INTO `djcelery_periodictask` VALUES ('6', 'Rtree_reBuild', 'common.tasks.Job_Border_to_Rtree', '[]', '{}', null, null, null, null, '1', null, '0', '2016-08-15 05:12:54', '', null, '3');

-- ----------------------------
-- Table structure for djcelery_periodictasks
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictasks`;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_periodictasks
-- ----------------------------
INSERT INTO `djcelery_periodictasks` VALUES ('1', '2016-08-26 02:02:39');

-- ----------------------------
-- Table structure for djcelery_taskstate
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_taskstate`;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_9ed39e2e` (`state`),
  KEY `djcelery_taskstate_b068931c` (`name`),
  KEY `djcelery_taskstate_863bb2ee` (`tstamp`),
  KEY `djcelery_taskstate_662f707d` (`hidden`),
  KEY `djcelery_taskstate_ce77e6ef` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_fb589_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_taskstate
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_workerstate
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_workerstate`;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_f129901a` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_workerstate
-- ----------------------------

-- ----------------------------
-- Table structure for model_farm_type
-- ----------------------------
DROP TABLE IF EXISTS `model_farm_type`;
CREATE TABLE `model_farm_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_farm_type
-- ----------------------------
INSERT INTO `model_farm_type` VALUES ('1', '果树');
INSERT INTO `model_farm_type` VALUES ('2', '低矮作物');
INSERT INTO `model_farm_type` VALUES ('3', '高杆作物');

-- ----------------------------
-- Table structure for model_job
-- ----------------------------
DROP TABLE IF EXISTS `model_job`;
CREATE TABLE `model_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `describe` varchar(150) DEFAULT NULL,
  `shape_file_shp` varchar(100) DEFAULT NULL,
  `border_describe` varchar(150) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `person_in_charge` varchar(30) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `uav_need` int(11) DEFAULT NULL,
  `uav_selected` int(11) DEFAULT NULL,
  `each_pay` int(11) DEFAULT NULL,
  `nation` varchar(40) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `job_type_id` int(11) NOT NULL,
  `farm_type_id` int(11) NOT NULL,
  `shape_file_dbf` varchar(100) DEFAULT NULL,
  `shape_file_shx` varchar(100) DEFAULT NULL,
  `section_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `model_job_user_id_75b4ec8d_fk_model_myuser_id` (`user_id`),
  KEY `model_job_job_type_id_6af4f9d7_fk_model_job_type_id` (`job_type_id`),
  KEY `model_job_farm_type_id_3d8ac607_fk_model_farm_type_id` (`farm_type_id`),
  CONSTRAINT `model_job_farm_type_id_3d8ac607_fk_model_farm_type_id` FOREIGN KEY (`farm_type_id`) REFERENCES `model_farm_type` (`id`),
  CONSTRAINT `model_job_job_type_id_6af4f9d7_fk_model_job_type_id` FOREIGN KEY (`job_type_id`) REFERENCES `model_job_type` (`id`),
  CONSTRAINT `model_job_user_id_75b4ec8d_fk_model_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `model_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_job
-- ----------------------------
INSERT INTO `model_job` VALUES ('1', 'Deluxe20150513', '1', 'Deluxe20150513!!aaa', 'job/border/world.shp', 'Deluxe20150513', '0', 'Deluxe', '2015-05-20 00:00:00', '2015-05-20 09:00:00', '2', '2', '5000', '110101', 'wtf', '1', '3', '', '', '1');
INSERT INTO `model_job` VALUES ('14', '563215231', '1', '675675', '', '75675675', '0', '675', '2016-01-04 13:41:38', '2016-01-04 13:41:41', '5', '1', '5', '110101', '6575', '1', '3', '', '', '1');
INSERT INTO `model_job` VALUES ('20', 'Deluxe20160525', '1', 'aaaaaaaaa', 'job/border/边界.shp', null, '0', 'aaaaaaaaaaa', '2016-05-25 09:57:55', '2016-05-25 09:57:57', '2', '0', '1000', '110101', 'aaaaaaaaa', '1', '3', 'job/border/边界.dbf', '', '1');
INSERT INTO `model_job` VALUES ('21', '20160708', '1', '00', '', null, '0', '555', '2016-07-08 18:44:37', '2016-07-08 18:44:39', '1', '1', '1000', '110101', '5555', '1', '1', '', '', '1');
INSERT INTO `model_job` VALUES ('24', '201607121', '1', '2222', '', null, '0', '222', '2016-07-12 19:10:45', '2016-07-12 19:10:48', '1', '1', '1000', '110101', '22', '1', '3', '', '', '1');
INSERT INTO `model_job` VALUES ('25', '20160715', '1', '1', '', null, '0', '1', '2016-07-15 15:48:08', '2016-07-15 15:48:11', '1', '1', '1000', '110101', '1', '1', '3', '', '', '1');
INSERT INTO `model_job` VALUES ('26', '20160818', '1', '', '', null, '0', '0', '2016-08-18 17:02:26', '2016-08-18 17:02:28', '1', '0', '1000', '110108', '0', '1', '3', '', '', '1');
INSERT INTO `model_job` VALUES ('27', '20160819', '1', '', '', null, '0', '1', '2016-08-18 17:02:50', '2016-08-18 17:02:53', '1', '0', '1000', '110108', '1', '1', '3', '', '', '1');
INSERT INTO `model_job` VALUES ('28', '20160823', '1', '1', '', null, '0', '0', '2016-08-23 21:19:49', '2016-08-23 21:19:51', '1', '0', '1000', '110101', '0', '2', '1', '', '', '1');
INSERT INTO `model_job` VALUES ('29', '20160824', '1', '1', '', null, '0', '1', '2016-08-23 21:20:38', '2016-08-23 21:20:40', '1', '0', '1000', '110101', '1', '1', '3', '', '', '1');
INSERT INTO `model_job` VALUES ('33', '201608251', '1', '', '', null, '0', '1', '2016-08-25 16:54:45', '2016-08-25 16:54:46', '1', '0', '1000', '110101', '1', '1', '3', '', '', '1');
INSERT INTO `model_job` VALUES ('34', '20160826', '1', '7', '', null, '0', '0', '2016-08-25 16:57:39', '2016-08-25 16:57:40', '1', '0', '1000', '110108', '0', '1', '3', '', '', '1');
INSERT INTO `model_job` VALUES ('35', '20160827', '1', '', '', null, '0', '0', '2016-08-26 09:48:33', '2016-08-26 09:48:35', '1', '0', '1000', '110105', '0', '2', '3', '', '', '1');

-- ----------------------------
-- Table structure for model_job_border
-- ----------------------------
DROP TABLE IF EXISTS `model_job_border`;
CREATE TABLE `model_job_border` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `lng` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `model_job_border_job_id_4cc0327d_fk_model_job_id` (`job_id`),
  CONSTRAINT `model_job_border_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `model_job` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_job_border
-- ----------------------------
INSERT INTO `model_job_border` VALUES ('6', '1', '116.359336', '40.013352', '1', null, null);
INSERT INTO `model_job_border` VALUES ('7', '1', '116.359552', '40.006942', '1', null, null);
INSERT INTO `model_job_border` VALUES ('8', '1', '116.371122', '40.007522', '1', null, null);
INSERT INTO `model_job_border` VALUES ('9', '1', '116.371194', '40.007964', '1', null, null);
INSERT INTO `model_job_border` VALUES ('10', '1', '116.368643', '40.010258', '1', null, null);
INSERT INTO `model_job_border` VALUES ('11', '1', '116.365588', '40.013159', '1', null, null);
INSERT INTO `model_job_border` VALUES ('12', '1', '116.365229', '40.01385', '1', null, null);
INSERT INTO `model_job_border` VALUES ('48', '14', '122.8579724474', '39.075145140061', '1', null, null);
INSERT INTO `model_job_border` VALUES ('49', '14', '122.86091773296', '39.076545357581', '1', null, null);
INSERT INTO `model_job_border` VALUES ('50', '14', '122.8666819507', '39.072668067751', '1', null, null);
INSERT INTO `model_job_border` VALUES ('51', '14', '122.86870310849', '39.071294793696', '1', null, null);
INSERT INTO `model_job_border` VALUES ('52', '14', '122.87107637385', '39.07336427517', '1', null, null);
INSERT INTO `model_job_border` VALUES ('53', '14', '122.87257122696', '39.075428827721', '1', null, null);
INSERT INTO `model_job_border` VALUES ('54', '14', '122.87583388728', '39.077482254231', '1', null, null);
INSERT INTO `model_job_border` VALUES ('55', '14', '122.87868561069', '39.074028750289', '1', null, null);
INSERT INTO `model_job_border` VALUES ('56', '14', '122.88130930594', '39.073319420872', '1', null, null);
INSERT INTO `model_job_border` VALUES ('57', '14', '122.88539167179', '39.071676269918', '1', null, null);
INSERT INTO `model_job_border` VALUES ('58', '14', '122.88947235059', '39.070016377536', '1', null, null);
INSERT INTO `model_job_border` VALUES ('59', '14', '122.88784907714', '39.062009398344', '1', null, null);
INSERT INTO `model_job_border` VALUES ('60', '14', '122.88631661217', '39.058589190565', '1', null, null);
INSERT INTO `model_job_border` VALUES ('61', '14', '122.88245357173', '39.056108370394', '1', null, null);
INSERT INTO `model_job_border` VALUES ('62', '14', '122.87599289402', '39.055471484112', '1', null, null);
INSERT INTO `model_job_border` VALUES ('63', '14', '122.86989924884', '39.057544725318', '1', null, null);
INSERT INTO `model_job_border` VALUES ('64', '14', '122.86677257645', '39.062578709697', '1', null, null);
INSERT INTO `model_job_border` VALUES ('65', '14', '122.86333233578', '39.065088719682', '1', null, null);
INSERT INTO `model_job_border` VALUES ('66', '14', '122.86337189925', '39.067604419677', '1', null, null);
INSERT INTO `model_job_border` VALUES ('67', '14', '122.86197593977', '39.07035245192', '1', null, null);
INSERT INTO `model_job_border` VALUES ('68', '14', '122.85999988597', '39.073787496921', '1', null, null);
INSERT INTO `model_job_border` VALUES ('69', '14', '122.85797297988', '39.075152743844', '1', null, null);
INSERT INTO `model_job_border` VALUES ('70', '20', '116.5107982829', '40.375447563793', '1', null, null);
INSERT INTO `model_job_border` VALUES ('71', '20', '116.62663533005', '40.369774894451', '1', null, null);
INSERT INTO `model_job_border` VALUES ('72', '20', '116.66968975853', '40.325144267187', '1', null, null);
INSERT INTO `model_job_border` VALUES ('73', '20', '116.62659920281', '40.273553595581', '1', null, null);
INSERT INTO `model_job_border` VALUES ('74', '20', '116.50023823813', '40.284278402532', '1', null, null);
INSERT INTO `model_job_border` VALUES ('75', '21', '116.426992', '39.957022', '1', null, null);
INSERT INTO `model_job_border` VALUES ('76', '21', '116.427742', '39.957032', '1', null, null);
INSERT INTO `model_job_border` VALUES ('77', '21', '116.427738', '39.9564', '1', null, null);
INSERT INTO `model_job_border` VALUES ('78', '21', '116.427015', '39.956389', '1', null, null);
INSERT INTO `model_job_border` VALUES ('79', '21', '116.427342', '39.956676', '1', null, null);
INSERT INTO `model_job_border` VALUES ('92', '24', '116.538346', '40.079947', '1', null, null);
INSERT INTO `model_job_border` VALUES ('93', '24', '116.541149', '40.073357', '1', null, null);
INSERT INTO `model_job_border` VALUES ('94', '24', '116.535184', '40.072742', '1', null, null);
INSERT INTO `model_job_border` VALUES ('95', '24', '116.550347', '40.073404', '1', null, null);
INSERT INTO `model_job_border` VALUES ('96', '24', '116.554516', '40.082376', '1', null, null);
INSERT INTO `model_job_border` VALUES ('97', '24', '116.551318', '40.077821', '1', null, null);
INSERT INTO `model_job_border` VALUES ('98', '24', '116.545568', '40.083701', '1', null, null);
INSERT INTO `model_job_border` VALUES ('99', '24', '116.542909', '40.080664', '1', null, null);
INSERT INTO `model_job_border` VALUES ('100', '25', '116.226593', '40.011702', '1', null, null);
INSERT INTO `model_job_border` VALUES ('101', '25', '116.226126', '40.0107', '1', null, null);
INSERT INTO `model_job_border` VALUES ('102', '25', '116.228758', '40.010776', '1', null, null);
INSERT INTO `model_job_border` VALUES ('103', '25', '116.229279', '40.012075', '1', null, null);
INSERT INTO `model_job_border` VALUES ('104', '25', '116.227392', '40.011978', '1', null, null);
INSERT INTO `model_job_border` VALUES ('105', '26', '116.221506', '40.009878', '1', null, null);
INSERT INTO `model_job_border` VALUES ('106', '26', '116.22182', '40.009791', '1', null, null);
INSERT INTO `model_job_border` VALUES ('107', '26', '116.221766', '40.009422', '1', null, null);
INSERT INTO `model_job_border` VALUES ('108', '26', '116.221991', '40.00927', '1', null, null);
INSERT INTO `model_job_border` VALUES ('109', '26', '116.222359', '40.009329', '1', null, null);
INSERT INTO `model_job_border` VALUES ('110', '26', '116.222489', '40.009785', '1', null, null);
INSERT INTO `model_job_border` VALUES ('111', '26', '116.222355', '40.009795', '1', null, null);
INSERT INTO `model_job_border` VALUES ('112', '26', '116.222386', '40.010013', '1', null, null);
INSERT INTO `model_job_border` VALUES ('113', '26', '116.222373', '40.010348', '1', null, null);
INSERT INTO `model_job_border` VALUES ('114', '26', '116.221339', '40.010316', '1', null, null);
INSERT INTO `model_job_border` VALUES ('115', '26', '116.22116', '40.009729', '1', null, null);
INSERT INTO `model_job_border` VALUES ('116', '26', '116.221321', '40.009719', '1', null, null);
INSERT INTO `model_job_border` VALUES ('117', '27', '116.222964', '40.014123', '1', null, null);
INSERT INTO `model_job_border` VALUES ('118', '27', '116.223', '40.012935', '1', null, null);
INSERT INTO `model_job_border` VALUES ('119', '27', '116.225515', '40.0129', '1', null, null);
INSERT INTO `model_job_border` VALUES ('120', '27', '116.226027', '40.014019', '1', null, null);
INSERT INTO `model_job_border` VALUES ('121', '27', '116.22565', '40.014406', '1', null, null);
INSERT INTO `model_job_border` VALUES ('122', '27', '116.22353', '40.014406', '1', null, null);
INSERT INTO `model_job_border` VALUES ('123', '28', '116.461923', '39.985689', '1', null, null);
INSERT INTO `model_job_border` VALUES ('124', '28', '116.456892', '39.980603', '1', null, null);
INSERT INTO `model_job_border` VALUES ('125', '28', '116.462641', '39.976954', '1', null, null);
INSERT INTO `model_job_border` VALUES ('126', '28', '116.46681', '39.976843', '1', null, null);
INSERT INTO `model_job_border` VALUES ('127', '28', '116.467528', '39.97828', '1', null, null);
INSERT INTO `model_job_border` VALUES ('128', '28', '116.466378', '39.979718', '1', null, null);
INSERT INTO `model_job_border` VALUES ('129', '28', '116.46954', '39.981045', '1', null, null);
INSERT INTO `model_job_border` VALUES ('130', '28', '116.466522', '39.983146', '1', null, null);
INSERT INTO `model_job_border` VALUES ('131', '29', '116.438064', '39.955276', '1', null, null);
INSERT INTO `model_job_border` VALUES ('132', '29', '116.434902', '39.954281', '1', null, null);
INSERT INTO `model_job_border` VALUES ('133', '29', '116.435189', '39.951073', '1', null, null);
INSERT INTO `model_job_border` VALUES ('134', '29', '116.437201', '39.950409', '1', null, null);
INSERT INTO `model_job_border` VALUES ('135', '29', '116.43792', '39.952511', '1', null, null);
INSERT INTO `model_job_border` VALUES ('136', '29', '116.440938', '39.9524', '1', null, null);
INSERT INTO `model_job_border` VALUES ('151', '33', '116.341155', '40.022718', '1', null, null);
INSERT INTO `model_job_border` VALUES ('152', '33', '116.341406', '40.020895', '1', null, null);
INSERT INTO `model_job_border` VALUES ('153', '33', '116.343957', '40.020812', '1', null, null);
INSERT INTO `model_job_border` VALUES ('154', '33', '116.343885', '40.022553', '1', null, null);
INSERT INTO `model_job_border` VALUES ('155', '34', '116.343921', '40.028437', '1', null, null);
INSERT INTO `model_job_border` VALUES ('156', '34', '116.344245', '40.022857', '1', null, null);
INSERT INTO `model_job_border` VALUES ('157', '34', '116.345898', '40.022801', '1', null, null);
INSERT INTO `model_job_border` VALUES ('158', '34', '116.349886', '40.023989', '1', null, null);
INSERT INTO `model_job_border` VALUES ('159', '34', '116.349886', '40.024569', '1', null, null);
INSERT INTO `model_job_border` VALUES ('160', '34', '116.350389', '40.024597', '1', null, null);
INSERT INTO `model_job_border` VALUES ('161', '34', '116.350066', '40.025674', '1', null, null);
INSERT INTO `model_job_border` VALUES ('162', '34', '116.349455', '40.025868', '1', null, null);
INSERT INTO `model_job_border` VALUES ('163', '34', '116.349096', '40.02689', '1', null, null);
INSERT INTO `model_job_border` VALUES ('164', '34', '116.349383', '40.027995', '1', null, null);
INSERT INTO `model_job_border` VALUES ('165', '34', '116.353767', '40.027608', '1', null, null);
INSERT INTO `model_job_border` VALUES ('166', '34', '116.353982', '40.02852', '1', null, null);
INSERT INTO `model_job_border` VALUES ('167', '34', '116.343993', '40.028713', '1', null, null);
INSERT INTO `model_job_border` VALUES ('168', '35', '116.402994', '39.969655', '1', null, null);
INSERT INTO `model_job_border` VALUES ('169', '35', '116.407881', '39.96512', '1', null, null);
INSERT INTO `model_job_border` VALUES ('170', '35', '116.412049', '39.96512', '1', null, null);
INSERT INTO `model_job_border` VALUES ('171', '35', '116.411474', '39.968217', '1', null, null);

-- ----------------------------
-- Table structure for model_job_type
-- ----------------------------
DROP TABLE IF EXISTS `model_job_type`;
CREATE TABLE `model_job_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_job_type
-- ----------------------------
INSERT INTO `model_job_type` VALUES ('1', '液态药');
INSERT INTO `model_job_type` VALUES ('2', '粉状药');

-- ----------------------------
-- Table structure for model_myuser
-- ----------------------------
DROP TABLE IF EXISTS `model_myuser`;
CREATE TABLE `model_myuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `headshot` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `nation` varchar(40) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `describe` varchar(300) DEFAULT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_myuser
-- ----------------------------
INSERT INTO `model_myuser` VALUES ('1', 'pbkdf2_sha256$20000$EkEDgjlBVWQ6$xmN+Hy0u7vyl5HSXjNjU8iaOpdNoK4bPpmYULqSwEFU=', '2016-08-23 13:07:22', 'Deluxe', '421826500@qq.com', 'user/headshot/p1509328416.jpg', '1', '1', '110108', 'beijing', '18810517357', '管理员', '10');
INSERT INTO `model_myuser` VALUES ('2', 'pbkdf2_sha256$20000$H1b4PPplOfCL$I5wRkJSWVvBHna+BlLaXurKfD3pryg+xAhgJNGuXhNg=', '2016-08-19 07:08:52', 'skycrane', 'skycrane@163.com', 'user/headshot/1.jpg', '1', '0', '150102', '哈哈哈哈', '12345678', 'descs', '1');
INSERT INTO `model_myuser` VALUES ('3', 'pbkdf2_sha256$20000$MuosvcqpoveL$uU/qmZcmiW5I2lJ0lPhioVhSpWamRxLZTEq6Hkhz38s=', null, '123123', '421826500@qq.com', '', '1', '0', null, null, null, null, '0');

-- ----------------------------
-- Table structure for model_nation
-- ----------------------------
DROP TABLE IF EXISTS `model_nation`;
CREATE TABLE `model_nation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `district` varchar(40) DEFAULT NULL,
  `parent` varchar(40) DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `geohash` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3928 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_nation
-- ----------------------------
INSERT INTO `model_nation` VALUES ('1', '000000', '中华人民共和国', '', '', '0', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('2', '110000', '北京', '北京市', '', '2', '116.405285', '39.904989', 'wx4g0b7xrt');
INSERT INTO `model_nation` VALUES ('3', '110101', '', '', '东城区', '2', '116.418757', '39.917544', 'wx4g14v899');
INSERT INTO `model_nation` VALUES ('4', '110102', '', '', '西城区', '2', '116.366794', '39.915309', 'wx4epfrewb');
INSERT INTO `model_nation` VALUES ('5', '110105', '', '', '朝阳区', '2', '116.486409', '39.921489', 'wx4g4eqzd0');
INSERT INTO `model_nation` VALUES ('6', '110106', '', '', '丰台区', '2', '116.286968', '39.863642', 'wx4dy0vwdc');
INSERT INTO `model_nation` VALUES ('7', '110107', '', '', '石景山区', '2', '116.195445', '39.914601', 'wx4eh44zqh');
INSERT INTO `model_nation` VALUES ('8', '110108', '', '', '海淀区', '2', '116.310316', '39.956074', 'wx4eq9y94b');
INSERT INTO `model_nation` VALUES ('9', '110109', '', '', '门头沟区', '2', '116.105381', '39.937183', 'wx4e4n36gq');
INSERT INTO `model_nation` VALUES ('10', '110111', '', '', '房山区', '2', '116.139157', '39.735535', 'wx4d4c9uq8');
INSERT INTO `model_nation` VALUES ('11', '110112', '', '', '通州区', '2', '116.658603', '39.902486', 'wx4gn8h0y6');
INSERT INTO `model_nation` VALUES ('12', '110113', '', '', '顺义区', '2', '116.653525', '40.128936', 'wx4uq90xbp');
INSERT INTO `model_nation` VALUES ('13', '110114', '', '', '昌平区', '2', '116.235906', '40.218085', 'wx4sv12rkf');
INSERT INTO `model_nation` VALUES ('14', '110115', '', '', '大兴区', '2', '116.338033', '39.728908', 'wx4dp26v8t');
INSERT INTO `model_nation` VALUES ('15', '110116', '', '', '怀柔区', '2', '116.637122', '40.324272', 'wx4vqhu9cv');
INSERT INTO `model_nation` VALUES ('16', '110117', '', '', '平谷区', '2', '117.112335', '40.144783', 'wx5k2uns71');
INSERT INTO `model_nation` VALUES ('17', '110228', '', '', '密云县', '2', '116.843352', '40.377362', 'wx5jdy6xpm');
INSERT INTO `model_nation` VALUES ('18', '110229', '', '', '延庆县', '2', '115.985006', '40.465325', 'wx4qpq3xwe');
INSERT INTO `model_nation` VALUES ('19', '120000', '天津', '天津市', '', '19', '117.190182', '39.125596', 'wwgqddx715');
INSERT INTO `model_nation` VALUES ('20', '120101', '', '', '和平区', '19', '117.195907', '39.118327', 'wwgqdc72y8');
INSERT INTO `model_nation` VALUES ('21', '120102', '', '', '河东区', '19', '117.226568', '39.122125', 'wwgqe9cych');
INSERT INTO `model_nation` VALUES ('22', '120103', '', '', '河西区', '19', '117.217536', '39.101897', 'wwgq7q71n9');
INSERT INTO `model_nation` VALUES ('23', '120104', '', '', '南开区', '19', '117.164143', '39.120474', 'wwgqd1sm62');
INSERT INTO `model_nation` VALUES ('24', '120105', '', '', '河北区', '19', '117.201569', '39.156632', 'wwgqfbpxfm');
INSERT INTO `model_nation` VALUES ('25', '120106', '', '', '红桥区', '19', '117.163301', '39.175066', 'wwgqf5eeqc');
INSERT INTO `model_nation` VALUES ('26', '120110', '', '', '东丽区', '19', '117.313967', '39.087764', 'wwgqme9qtx');
INSERT INTO `model_nation` VALUES ('27', '120111', '', '', '西青区', '19', '117.012247', '39.139446', 'wwgnwtjeyc');
INSERT INTO `model_nation` VALUES ('28', '120112', '', '', '津南区', '19', '117.382549', '38.989577', 'wwgmz1g6ex');
INSERT INTO `model_nation` VALUES ('29', '120113', '', '', '北辰区', '19', '117.13482', '39.225555', 'wwgr1kycrj');
INSERT INTO `model_nation` VALUES ('30', '120114', '', '', '武清区', '19', '117.057959', '39.376925', 'wx50p8r50n');
INSERT INTO `model_nation` VALUES ('31', '120115', '', '', '宝坻区', '19', '117.308094', '39.716965', 'wx53vqm0hd');
INSERT INTO `model_nation` VALUES ('32', '120116', '', '', '滨海新区', '19', '117.654173', '39.032846', 'wwgwj39nuc');
INSERT INTO `model_nation` VALUES ('33', '120221', '', '', '宁河县', '19', '117.82828', '39.328886', 'wwgz9pxgmg');
INSERT INTO `model_nation` VALUES ('34', '120223', '', '', '静海县', '19', '116.925304', '38.935671', 'wwgjs8n2tp');
INSERT INTO `model_nation` VALUES ('35', '120225', '', '', '蓟县', '19', '117.407449', '40.045342', 'wx57zdj3pb');
INSERT INTO `model_nation` VALUES ('36', '130000', '河北省', '', '', '1', '114.502461', '38.045474', 'wwc2mtfnuw');
INSERT INTO `model_nation` VALUES ('37', '130100', '', '石家庄市', '', '36', '114.502461', '38.045474', 'wwc2mtfnuw');
INSERT INTO `model_nation` VALUES ('38', '130101', '', '', '市辖区', '37', '114.502461', '38.045474', 'wwc2mtfnuw');
INSERT INTO `model_nation` VALUES ('39', '130102', '', '', '长安区', '37', '114.548151', '38.047501', 'wwc2qw76v2');
INSERT INTO `model_nation` VALUES ('40', '130104', '', '', '桥西区', '37', '114.462931', '38.028383', 'wwc2kdv77s');
INSERT INTO `model_nation` VALUES ('41', '130105', '', '', '新华区', '37', '114.465974', '38.067142', 'wwc2s9zt4t');
INSERT INTO `model_nation` VALUES ('42', '130107', '', '', '井陉矿区', '37', '114.058178', '38.069748', 'wwc0e6qsk5');
INSERT INTO `model_nation` VALUES ('43', '130108', '', '', '裕华区', '37', '114.533257', '38.027696', 'wwc2q68x6k');
INSERT INTO `model_nation` VALUES ('44', '130109', '', '', '藁城区', '37', '114.502461', '38.045474', 'wwc2mtfnuw');
INSERT INTO `model_nation` VALUES ('45', '130110', '', '', '鹿泉区', '37', '114.502461', '38.045474', 'wwc2mtfnuw');
INSERT INTO `model_nation` VALUES ('46', '130111', '', '', '栾城区', '37', '114.502461', '38.045474', 'wwc2mtfnuw');
INSERT INTO `model_nation` VALUES ('47', '130121', '', '', '井陉县', '37', '114.144488', '38.033614', 'wwc0m7v3z7');
INSERT INTO `model_nation` VALUES ('48', '130123', '', '', '正定县', '37', '114.569887', '38.147835', 'wwc3p0e5pz');
INSERT INTO `model_nation` VALUES ('49', '130125', '', '', '行唐县', '37', '114.552734', '38.437422', 'wwc6wtqf0n');
INSERT INTO `model_nation` VALUES ('50', '130126', '', '', '灵寿县', '37', '114.37946', '38.306546', 'wwc3fv2xf9');
INSERT INTO `model_nation` VALUES ('51', '130127', '', '', '高邑县', '37', '114.610699', '37.605714', 'ww9tbjbvnv');
INSERT INTO `model_nation` VALUES ('52', '130128', '', '', '深泽县', '37', '115.200207', '38.18454', 'wwccjrq1p6');
INSERT INTO `model_nation` VALUES ('53', '130129', '', '', '赞皇县', '37', '114.387756', '37.660199', 'ww9q4zydec');
INSERT INTO `model_nation` VALUES ('54', '130130', '', '', '无极县', '37', '114.977845', '38.176376', 'wwcc0mu39b');
INSERT INTO `model_nation` VALUES ('55', '130131', '', '', '平山县', '37', '114.184144', '38.259311', 'wwc1wkfkek');
INSERT INTO `model_nation` VALUES ('56', '130132', '', '', '元氏县', '37', '114.52618', '37.762514', 'ww9qy47qt6');
INSERT INTO `model_nation` VALUES ('57', '130133', '', '', '赵县', '37', '114.775362', '37.754341', 'ww9wgbbygz');
INSERT INTO `model_nation` VALUES ('58', '130181', '', '', '辛集市', '37', '115.217451', '37.92904', 'ww9zvbfb9j');
INSERT INTO `model_nation` VALUES ('59', '130183', '', '', '晋州市', '37', '115.044886', '38.027478', 'wwcb3ftnh5');
INSERT INTO `model_nation` VALUES ('60', '130184', '', '', '新乐市', '37', '114.68578', '38.344768', 'wwcd1srwkq');
INSERT INTO `model_nation` VALUES ('61', '130200', '', '唐山市', '', '36', '118.175393', '39.635113', 'wxh13pkeq0');
INSERT INTO `model_nation` VALUES ('62', '130201', '', '', '市辖区', '61', '118.175393', '39.635113', 'wxh13pkeq0');
INSERT INTO `model_nation` VALUES ('63', '130202', '', '', '路南区', '61', '118.210821', '39.615162', 'wxh13gwrpc');
INSERT INTO `model_nation` VALUES ('64', '130203', '', '', '路北区', '61', '118.174736', '39.628538', 'wxh13nhhyy');
INSERT INTO `model_nation` VALUES ('65', '130204', '', '', '古冶区', '61', '118.45429', '39.715736', 'wxh1zqpbcj');
INSERT INTO `model_nation` VALUES ('66', '130205', '', '', '开平区', '61', '118.264425', '39.676171', 'wxh1envd2y');
INSERT INTO `model_nation` VALUES ('67', '130207', '', '', '丰南区', '61', '118.110793', '39.56303', 'wx5cpdjxkg');
INSERT INTO `model_nation` VALUES ('68', '130208', '', '', '丰润区', '61', '118.155779', '39.831363', 'wxh48en6t0');
INSERT INTO `model_nation` VALUES ('69', '130209', '', '', '曹妃甸区', '61', '118.446585', '39.278277', 'wwuprq6ht3');
INSERT INTO `model_nation` VALUES ('70', '130223', '', '', '滦县', '61', '118.699547', '39.744851', 'wxh6j566ec');
INSERT INTO `model_nation` VALUES ('71', '130224', '', '', '滦南县', '61', '118.681552', '39.506201', 'wxh2sxvk29');
INSERT INTO `model_nation` VALUES ('72', '130225', '', '', '乐亭县', '61', '118.905341', '39.42813', 'wxh83c8jx2');
INSERT INTO `model_nation` VALUES ('73', '130227', '', '', '迁西县', '61', '118.305139', '40.146238', 'wxhhkh7hv9');
INSERT INTO `model_nation` VALUES ('74', '130229', '', '', '玉田县', '61', '117.753665', '39.887323', 'wx5dzt387r');
INSERT INTO `model_nation` VALUES ('75', '130281', '', '', '遵化市', '61', '117.965875', '40.188616', 'wx5uskh5sj');
INSERT INTO `model_nation` VALUES ('76', '130283', '', '', '迁安市', '61', '118.701933', '40.012108', 'wxh7t5up7t');
INSERT INTO `model_nation` VALUES ('77', '130300', '', '秦皇岛市', '', '36', '119.586579', '39.942531', 'wxj51r2617');
INSERT INTO `model_nation` VALUES ('78', '130301', '', '', '市辖区', '77', '119.586579', '39.942531', 'wxj51r2617');
INSERT INTO `model_nation` VALUES ('79', '130302', '', '', '海港区', '77', '119.596224', '39.943458', 'wxj51rrrd0');
INSERT INTO `model_nation` VALUES ('80', '130303', '', '', '山海关区', '77', '119.753591', '39.998023', 'wxj5t13vkg');
INSERT INTO `model_nation` VALUES ('81', '130304', '', '', '北戴河区', '77', '119.486286', '39.825121', 'wxhfwczq0k');
INSERT INTO `model_nation` VALUES ('82', '130321', '', '', '青龙满族自治县', '77', '118.954555', '40.406023', 'wxhtfgsn4h');
INSERT INTO `model_nation` VALUES ('83', '130322', '', '', '昌黎县', '77', '119.164541', '39.709729', 'wxh9zsuvzn');
INSERT INTO `model_nation` VALUES ('84', '130323', '', '', '抚宁县', '77', '119.240651', '39.887053', 'wxhfcmhqut');
INSERT INTO `model_nation` VALUES ('85', '130324', '', '', '卢龙县', '77', '118.881809', '39.891639', 'wxhdcnp1du');
INSERT INTO `model_nation` VALUES ('86', '130400', '', '邯郸市', '', '36', '114.490686', '36.612273', 'ww92m319fq');
INSERT INTO `model_nation` VALUES ('87', '130401', '', '', '市辖区', '86', '114.490686', '36.612273', 'ww92m319fq');
INSERT INTO `model_nation` VALUES ('88', '130402', '', '', '邯山区', '86', '114.484989', '36.603196', 'ww92jpmmjd');
INSERT INTO `model_nation` VALUES ('89', '130403', '', '', '丛台区', '86', '114.494703', '36.611082', 'ww92m2u7pb');
INSERT INTO `model_nation` VALUES ('90', '130404', '', '', '复兴区', '86', '114.458242', '36.615484', 'ww92k99uwk');
INSERT INTO `model_nation` VALUES ('91', '130406', '', '', '峰峰矿区', '86', '114.209936', '36.420487', 'ww3pnyjhsq');
INSERT INTO `model_nation` VALUES ('92', '130421', '', '', '邯郸县', '86', '114.531083', '36.593905', 'ww92njwyzw');
INSERT INTO `model_nation` VALUES ('93', '130423', '', '', '临漳县', '86', '114.610703', '36.337604', 'ww3w8p0cyu');
INSERT INTO `model_nation` VALUES ('94', '130424', '', '', '成安县', '86', '114.680356', '36.443832', 'ww3x3d7sty');
INSERT INTO `model_nation` VALUES ('95', '130425', '', '', '大名县', '86', '115.152586', '36.283316', 'ww3ykm5t9s');
INSERT INTO `model_nation` VALUES ('96', '130426', '', '', '涉县', '86', '113.673297', '36.563143', 'ww8b48n7ez');
INSERT INTO `model_nation` VALUES ('97', '130427', '', '', '磁县', '86', '114.38208', '36.367673', 'ww3qfud3p9');
INSERT INTO `model_nation` VALUES ('98', '130428', '', '', '肥乡县', '86', '114.805154', '36.555778', 'ww3xuqy8cf');
INSERT INTO `model_nation` VALUES ('99', '130429', '', '', '永年县', '86', '114.496162', '36.776413', 'ww93jqvw1u');
INSERT INTO `model_nation` VALUES ('100', '130430', '', '', '邱县', '86', '115.168584', '36.81325', 'ww9cktxhwx');
INSERT INTO `model_nation` VALUES ('101', '130431', '', '', '鸡泽县', '86', '114.878517', '36.914908', 'ww9dn05uzm');
INSERT INTO `model_nation` VALUES ('102', '130432', '', '', '广平县', '86', '114.950859', '36.483603', 'ww3xxc8smh');
INSERT INTO `model_nation` VALUES ('103', '130433', '', '', '馆陶县', '86', '115.289057', '36.539461', 'ww3zz7ycv9');
INSERT INTO `model_nation` VALUES ('104', '130434', '', '', '魏县', '86', '114.93411', '36.354248', 'ww3wz6h6yg');
INSERT INTO `model_nation` VALUES ('105', '130435', '', '', '曲周县', '86', '114.957588', '36.773398', 'ww99pyms9f');
INSERT INTO `model_nation` VALUES ('106', '130481', '', '', '武安市', '86', '114.194581', '36.696115', 'ww90y83fqe');
INSERT INTO `model_nation` VALUES ('107', '130500', '', '邢台市', '', '36', '114.508851', '37.0682', 'ww96vsncct');
INSERT INTO `model_nation` VALUES ('108', '130501', '', '', '市辖区', '107', '114.508851', '37.0682', 'ww96vsncct');
INSERT INTO `model_nation` VALUES ('109', '130502', '', '', '桥东区', '107', '114.507131', '37.064125', 'ww96vemd1t');
INSERT INTO `model_nation` VALUES ('110', '130503', '', '', '桥西区', '107', '114.473687', '37.068009', 'ww96uuj0y1');
INSERT INTO `model_nation` VALUES ('111', '130521', '', '', '邢台县', '107', '114.561132', '37.05073', 'ww96ybuu5u');
INSERT INTO `model_nation` VALUES ('112', '130522', '', '', '临城县', '107', '114.506873', '37.444009', 'ww9mj8mr5t');
INSERT INTO `model_nation` VALUES ('113', '130523', '', '', '内丘县', '107', '114.511523', '37.287663', 'ww9kju08ru');
INSERT INTO `model_nation` VALUES ('114', '130524', '', '', '柏乡县', '107', '114.693382', '37.483596', 'ww9t1ztjv8');
INSERT INTO `model_nation` VALUES ('115', '130525', '', '', '隆尧县', '107', '114.776348', '37.350925', 'ww9s7z98fv');
INSERT INTO `model_nation` VALUES ('116', '130526', '', '', '任县', '107', '114.684469', '37.129952', 'ww9e1xq9tu');
INSERT INTO `model_nation` VALUES ('117', '130527', '', '', '南和县', '107', '114.691377', '37.003812', 'ww9d9b7dyf');
INSERT INTO `model_nation` VALUES ('118', '130528', '', '', '宁晋县', '107', '114.921027', '37.618956', 'ww9wp06fq1');
INSERT INTO `model_nation` VALUES ('119', '130529', '', '', '巨鹿县', '107', '115.038782', '37.21768', 'ww9g9z28ty');
INSERT INTO `model_nation` VALUES ('120', '130530', '', '', '新河县', '107', '115.247537', '37.526216', 'ww9vqx2wn3');
INSERT INTO `model_nation` VALUES ('121', '130531', '', '', '广宗县', '107', '115.142797', '37.075548', 'ww9fujkktx');
INSERT INTO `model_nation` VALUES ('122', '130532', '', '', '平乡县', '107', '115.029218', '37.069404', 'ww9fcs38zj');
INSERT INTO `model_nation` VALUES ('123', '130533', '', '', '威县', '107', '115.272749', '36.983272', 'ww9frhe51t');
INSERT INTO `model_nation` VALUES ('124', '130534', '', '', '清河县', '107', '115.668999', '37.059991', 'wwd6b4ed55');
INSERT INTO `model_nation` VALUES ('125', '130535', '', '', '临西县', '107', '115.498684', '36.8642', 'wwd1snztd2');
INSERT INTO `model_nation` VALUES ('126', '130581', '', '', '南宫市', '107', '115.398102', '37.359668', 'wwdh9cn7fd');
INSERT INTO `model_nation` VALUES ('127', '130582', '', '', '沙河市', '107', '114.504902', '36.861903', 'ww93twebjs');
INSERT INTO `model_nation` VALUES ('128', '130600', '', '保定市', '', '36', '115.482331', '38.867657', 'wwfj5gest2');
INSERT INTO `model_nation` VALUES ('129', '130601', '', '', '市辖区', '128', '115.482331', '38.867657', 'wwfj5gest2');
INSERT INTO `model_nation` VALUES ('130', '130602', '', '', '新市区', '128', '115.470659', '38.88662', 'wwfj5x54vr');
INSERT INTO `model_nation` VALUES ('131', '130603', '', '', '北市区', '128', '115.500934', '38.865005', 'wwfjh71jnf');
INSERT INTO `model_nation` VALUES ('132', '130604', '', '', '南市区', '128', '115.498674', '38.856702', 'wwfjh1xsdn');
INSERT INTO `model_nation` VALUES ('133', '130621', '', '', '满城县', '128', '115.32442', '38.95138', 'wwfj86bsjz');
INSERT INTO `model_nation` VALUES ('134', '130622', '', '', '清苑县', '128', '115.492221', '38.771012', 'wwfhs44ceb');
INSERT INTO `model_nation` VALUES ('135', '130623', '', '', '涞水县', '128', '115.711985', '39.393148', 'wx42156csx');
INSERT INTO `model_nation` VALUES ('136', '130624', '', '', '阜平县', '128', '114.198801', '38.847276', 'wwchyxvjbc');
INSERT INTO `model_nation` VALUES ('137', '130625', '', '', '徐水县', '128', '115.64941', '39.020395', 'wwfjzxmq68');
INSERT INTO `model_nation` VALUES ('138', '130626', '', '', '定兴县', '128', '115.796895', '39.266195', 'wwfr7h0wpj');
INSERT INTO `model_nation` VALUES ('139', '130627', '', '', '唐县', '128', '114.981241', '38.748542', 'wwcu2myy95');
INSERT INTO `model_nation` VALUES ('140', '130628', '', '', '高阳县', '128', '115.778878', '38.690092', 'wwfk4e7d57');
INSERT INTO `model_nation` VALUES ('141', '130629', '', '', '容城县', '128', '115.866247', '39.05282', 'wwfqht75pj');
INSERT INTO `model_nation` VALUES ('142', '130630', '', '', '涞源县', '128', '114.692567', '39.35755', 'wwcxcuud6e');
INSERT INTO `model_nation` VALUES ('143', '130631', '', '', '望都县', '128', '115.154009', '38.707448', 'wwcuhqkx4z');
INSERT INTO `model_nation` VALUES ('144', '130632', '', '', '安新县', '128', '115.931979', '38.929912', 'wwfmqngp4v');
INSERT INTO `model_nation` VALUES ('145', '130633', '', '', '易县', '128', '115.501146', '39.35297', 'wwfpu7crev');
INSERT INTO `model_nation` VALUES ('146', '130634', '', '', '曲阳县', '128', '114.704055', '38.619992', 'wwcednscy0');
INSERT INTO `model_nation` VALUES ('147', '130635', '', '', '蠡县', '128', '115.583631', '38.496429', 'wwf5n0j3vy');
INSERT INTO `model_nation` VALUES ('148', '130636', '', '', '顺平县', '128', '115.132749', '38.845127', 'wwcugzt172');
INSERT INTO `model_nation` VALUES ('149', '130637', '', '', '博野县', '128', '115.461798', '38.458271', 'wwf4g3hewv');
INSERT INTO `model_nation` VALUES ('150', '130638', '', '', '雄县', '128', '116.107474', '38.990819', 'wwftf44cup');
INSERT INTO `model_nation` VALUES ('151', '130681', '', '', '涿州市', '128', '115.973409', '39.485765', 'wx42xh1m22');
INSERT INTO `model_nation` VALUES ('152', '130682', '', '', '定州市', '128', '114.991389', '38.517602', 'wwcg0eyjm9');
INSERT INTO `model_nation` VALUES ('153', '130683', '', '', '安国市', '128', '115.33141', '38.421367', 'wwf486mu8t');
INSERT INTO `model_nation` VALUES ('154', '130684', '', '', '高碑店市', '128', '115.882704', '39.327689', 'wwfrszrhqs');
INSERT INTO `model_nation` VALUES ('155', '130700', '', '张家口市', '', '36', '114.884091', '40.811901', 'wx38nm8493');
INSERT INTO `model_nation` VALUES ('156', '130701', '', '', '市辖区', '155', '114.884091', '40.811901', 'wx38nm8493');
INSERT INTO `model_nation` VALUES ('157', '130702', '', '', '桥东区', '155', '114.885658', '40.813875', 'wx38nmcnjc');
INSERT INTO `model_nation` VALUES ('158', '130703', '', '', '桥西区', '155', '114.882127', '40.824385', 'wx38npye78');
INSERT INTO `model_nation` VALUES ('159', '130705', '', '', '宣化区', '155', '115.0632', '40.609368', 'wx1z42dqwy');
INSERT INTO `model_nation` VALUES ('160', '130706', '', '', '下花园区', '155', '115.281002', '40.488645', 'wx1yr69p6n');
INSERT INTO `model_nation` VALUES ('161', '130721', '', '', '宣化县', '155', '115.03308', '40.562211', 'wx1yc8hs10');
INSERT INTO `model_nation` VALUES ('162', '130722', '', '', '张北县', '155', '114.715951', '41.151713', 'wx3d47mw57');
INSERT INTO `model_nation` VALUES ('163', '130723', '', '', '康保县', '155', '114.615809', '41.850046', 'wx3w04sdjy');
INSERT INTO `model_nation` VALUES ('164', '130724', '', '', '沽源县', '155', '115.684836', '41.667419', 'wx6m03r4k1');
INSERT INTO `model_nation` VALUES ('165', '130725', '', '', '尚义县', '155', '113.977713', '41.080091', 'wx319wkhch');
INSERT INTO `model_nation` VALUES ('166', '130726', '', '', '蔚县', '155', '114.582695', '39.837181', 'wx16xkhs6k');
INSERT INTO `model_nation` VALUES ('167', '130727', '', '', '阳原县', '155', '114.167343', '40.113419', 'wx1hjyqjeg');
INSERT INTO `model_nation` VALUES ('168', '130728', '', '', '怀安县', '155', '114.422364', '40.671274', 'wx1r7ezz66');
INSERT INTO `model_nation` VALUES ('169', '130729', '', '', '万全县', '155', '114.736131', '40.765136', 'wx1xfvh61s');
INSERT INTO `model_nation` VALUES ('170', '130730', '', '', '怀来县', '155', '115.520846', '40.405405', 'wx4juexdwc');
INSERT INTO `model_nation` VALUES ('171', '130731', '', '', '涿鹿县', '155', '115.219246', '40.378701', 'wx1vtysngp');
INSERT INTO `model_nation` VALUES ('172', '130732', '', '', '赤城县', '155', '115.832708', '40.912081', 'wx62ezff1s');
INSERT INTO `model_nation` VALUES ('173', '130733', '', '', '崇礼县', '155', '115.281652', '40.971302', 'wx3cp69e1h');
INSERT INTO `model_nation` VALUES ('174', '130800', '', '承德市', '', '36', '117.939152', '40.976204', 'wx7c5g2xtq');
INSERT INTO `model_nation` VALUES ('175', '130801', '', '', '市辖区', '174', '117.939152', '40.976204', 'wx7c5g2xtq');
INSERT INTO `model_nation` VALUES ('176', '130802', '', '', '双桥区', '174', '117.939152', '40.976204', 'wx7c5g2xtq');
INSERT INTO `model_nation` VALUES ('177', '130803', '', '', '双滦区', '174', '117.797485', '40.959756', 'wx7c083xb7');
INSERT INTO `model_nation` VALUES ('178', '130804', '', '', '鹰手营子矿区', '174', '117.661154', '40.546956', 'wx5wtmq5ps');
INSERT INTO `model_nation` VALUES ('179', '130821', '', '', '承德县', '174', '118.172496', '40.768637', 'wxhpcjdwd8');
INSERT INTO `model_nation` VALUES ('180', '130822', '', '', '兴隆县', '174', '117.507098', '40.418525', 'wx5tcvyncz');
INSERT INTO `model_nation` VALUES ('181', '130823', '', '', '平泉县', '174', '118.690238', '41.00561', 'wxk3kbgdgp');
INSERT INTO `model_nation` VALUES ('182', '130824', '', '', '滦平县', '174', '117.337124', '40.936644', 'wx72yh631p');
INSERT INTO `model_nation` VALUES ('183', '130825', '', '', '隆化县', '174', '117.736343', '41.316667', 'wx7ep1kzp8');
INSERT INTO `model_nation` VALUES ('184', '130826', '', '', '丰宁满族自治县', '174', '116.65121', '41.209903', 'wx6fqqnc44');
INSERT INTO `model_nation` VALUES ('185', '130827', '', '', '宽城满族自治县', '174', '118.488642', '40.607981', 'wxhr022y9k');
INSERT INTO `model_nation` VALUES ('186', '130828', '', '', '围场满族蒙古族自治县', '174', '117.764086', '41.949404', 'wx7wxu9hyp');
INSERT INTO `model_nation` VALUES ('187', '130900', '', '沧州市', '', '36', '116.857461', '38.310582', 'wwg1gnjp24');
INSERT INTO `model_nation` VALUES ('188', '130901', '', '', '市辖区', '187', '116.857461', '38.310582', 'wwg1gnjp24');
INSERT INTO `model_nation` VALUES ('189', '130902', '', '', '新华区', '187', '116.873049', '38.308273', 'wwg1gtb3g7');
INSERT INTO `model_nation` VALUES ('190', '130903', '', '', '运河区', '187', '116.840063', '38.307405', 'wwg1fv8kfc');
INSERT INTO `model_nation` VALUES ('191', '130921', '', '', '沧县', '187', '117.007478', '38.219856', 'wwg1qtdnzc');
INSERT INTO `model_nation` VALUES ('192', '130922', '', '', '青县', '187', '116.838384', '38.569646', 'wwg56trh7x');
INSERT INTO `model_nation` VALUES ('193', '130923', '', '', '东光县', '187', '116.542062', '37.88655', 'wwdzecp34u');
INSERT INTO `model_nation` VALUES ('194', '130924', '', '', '海兴县', '187', '117.496606', '38.141582', 'wwg8cxqqv6');
INSERT INTO `model_nation` VALUES ('195', '130925', '', '', '盐山县', '187', '117.229814', '38.056141', 'wwg27xujhd');
INSERT INTO `model_nation` VALUES ('196', '130926', '', '', '肃宁县', '187', '115.835856', '38.427102', 'wwf6egmn55');
INSERT INTO `model_nation` VALUES ('197', '130927', '', '', '南皮县', '187', '116.709171', '38.042439', 'wwfbrv3j2b');
INSERT INTO `model_nation` VALUES ('198', '130928', '', '', '吴桥县', '187', '116.391512', '37.628182', 'wwdy0d18nc');
INSERT INTO `model_nation` VALUES ('199', '130929', '', '', '献县', '187', '116.123844', '38.189661', 'wwf962nycs');
INSERT INTO `model_nation` VALUES ('200', '130930', '', '', '孟村回族自治县', '187', '117.105104', '38.057953', 'wwg28b1rds');
INSERT INTO `model_nation` VALUES ('201', '130981', '', '', '泊头市', '187', '116.570163', '38.073479', 'wwfbse5f1d');
INSERT INTO `model_nation` VALUES ('202', '130982', '', '', '任丘市', '187', '116.106764', '38.706513', 'wwfs4n63g8');
INSERT INTO `model_nation` VALUES ('203', '130983', '', '', '黄骅市', '187', '117.343803', '38.369238', 'wwg6q0zjhb');
INSERT INTO `model_nation` VALUES ('204', '130984', '', '', '河间市', '187', '116.089452', '38.44149', 'wwfd9wjcbm');
INSERT INTO `model_nation` VALUES ('205', '131000', '', '廊坊市', '', '36', '116.704441', '39.523927', 'wx4bzejedd');
INSERT INTO `model_nation` VALUES ('206', '131001', '', '', '市辖区', '205', '116.704441', '39.523927', 'wx4bzejedd');
INSERT INTO `model_nation` VALUES ('207', '131002', '', '', '安次区', '205', '116.694544', '39.502569', 'wx4bxrnr5u');
INSERT INTO `model_nation` VALUES ('208', '131003', '', '', '广阳区', '205', '116.713708', '39.521931', 'wx4bzfsrft');
INSERT INTO `model_nation` VALUES ('209', '131022', '', '', '固安县', '205', '116.299894', '39.436468', 'wx48q7nypf');
INSERT INTO `model_nation` VALUES ('210', '131023', '', '', '永清县', '205', '116.498089', '39.319717', 'wwfzdvzmfn');
INSERT INTO `model_nation` VALUES ('211', '131024', '', '', '香河县', '205', '117.007161', '39.757212', 'wx54ntd483');
INSERT INTO `model_nation` VALUES ('212', '131025', '', '', '大城县', '205', '116.640735', '38.699215', 'wwfunhzpq0');
INSERT INTO `model_nation` VALUES ('213', '131026', '', '', '文安县', '205', '116.460107', '38.866801', 'wwfv457xt0');
INSERT INTO `model_nation` VALUES ('214', '131028', '', '', '大厂回族自治县', '205', '116.986501', '39.889266', 'wx54yjdgz4');
INSERT INTO `model_nation` VALUES ('215', '131081', '', '', '霸州市', '205', '116.392021', '39.117331', 'wwfy8944fx');
INSERT INTO `model_nation` VALUES ('216', '131082', '', '', '三河市', '205', '117.077018', '39.982778', 'wx572nsus4');
INSERT INTO `model_nation` VALUES ('217', '131100', '', '衡水市', '', '36', '115.665993', '37.735097', 'wwdq8j3qug');
INSERT INTO `model_nation` VALUES ('218', '131101', '', '', '市辖区', '217', '115.665993', '37.735097', 'wwdq8j3qug');
INSERT INTO `model_nation` VALUES ('219', '131102', '', '', '桃城区', '217', '115.694945', '37.732237', 'wwdq8syqpw');
INSERT INTO `model_nation` VALUES ('220', '131121', '', '', '枣强县', '217', '115.726499', '37.511512', 'wwdm3kv2qu');
INSERT INTO `model_nation` VALUES ('221', '131122', '', '', '武邑县', '217', '115.892415', '37.803774', 'wwdrj1yqby');
INSERT INTO `model_nation` VALUES ('222', '131123', '', '', '武强县', '217', '115.970236', '38.03698', 'wwf2quqvqq');
INSERT INTO `model_nation` VALUES ('223', '131124', '', '', '饶阳县', '217', '115.726577', '38.232671', 'wwf392j92w');
INSERT INTO `model_nation` VALUES ('224', '131125', '', '', '安平县', '217', '115.519627', '38.233511', 'wwf1s8ny67');
INSERT INTO `model_nation` VALUES ('225', '131126', '', '', '故城县', '217', '115.966747', '37.350981', 'wwdkqzs3jp');
INSERT INTO `model_nation` VALUES ('226', '131127', '', '', '景县', '217', '116.258446', '37.686622', 'wwdwms8u6p');
INSERT INTO `model_nation` VALUES ('227', '131128', '', '', '阜城县', '217', '116.164727', '37.869945', 'wwdx7qh86m');
INSERT INTO `model_nation` VALUES ('228', '131181', '', '', '冀州市', '217', '115.579173', '37.542788', 'wwdjw46ntf');
INSERT INTO `model_nation` VALUES ('229', '131182', '', '', '深州市', '217', '115.554596', '38.00347', 'wwf0jw2630');
INSERT INTO `model_nation` VALUES ('230', '140000', '山西省', '', '', '1', '112.549248', '37.857014', 'ww8p35ev5d');
INSERT INTO `model_nation` VALUES ('231', '140100', '', '太原市', '', '230', '112.549248', '37.857014', 'ww8p35ev5d');
INSERT INTO `model_nation` VALUES ('232', '140101', '', '', '市辖区', '231', '112.549248', '37.857014', 'ww8p35ev5d');
INSERT INTO `model_nation` VALUES ('233', '140105', '', '', '小店区', '231', '112.564273', '37.817974', 'ww8p1kwc9t');
INSERT INTO `model_nation` VALUES ('234', '140106', '', '', '迎泽区', '231', '112.558851', '37.855804', 'ww8p376y53');
INSERT INTO `model_nation` VALUES ('235', '140107', '', '', '杏花岭区', '231', '112.560743', '37.879291', 'ww8p3rsnz7');
INSERT INTO `model_nation` VALUES ('236', '140108', '', '', '尖草坪区', '231', '112.487122', '37.939893', 'wqxzzdwxgu');
INSERT INTO `model_nation` VALUES ('237', '140109', '', '', '万柏林区', '231', '112.522258', '37.862653', 'ww8p2s8jyw');
INSERT INTO `model_nation` VALUES ('238', '140110', '', '', '晋源区', '231', '112.477849', '37.715619', 'wqxyx3zv7u');
INSERT INTO `model_nation` VALUES ('239', '140121', '', '', '清徐县', '231', '112.357961', '37.60729', 'wqxvuy0w66');
INSERT INTO `model_nation` VALUES ('240', '140122', '', '', '阳曲县', '231', '112.673818', '38.058797', 'wwb0ebqsd3');
INSERT INTO `model_nation` VALUES ('241', '140123', '', '', '娄烦县', '231', '111.793798', '38.066035', 'wqz2xcty8r');
INSERT INTO `model_nation` VALUES ('242', '140181', '', '', '古交市', '231', '112.174353', '37.908534', 'wqxz8t4c5y');
INSERT INTO `model_nation` VALUES ('243', '140200', '', '大同市', '', '230', '113.295259', '40.09031', 'wx0s445nfz');
INSERT INTO `model_nation` VALUES ('244', '140201', '', '', '市辖区', '243', '113.295259', '40.09031', 'wx0s445nfz');
INSERT INTO `model_nation` VALUES ('245', '140202', '', '', '城区', '243', '113.301438', '40.090511', 'wx0s44r84u');
INSERT INTO `model_nation` VALUES ('246', '140203', '', '', '矿区', '243', '113.168656', '40.03626', 'wx07z0quhg');
INSERT INTO `model_nation` VALUES ('247', '140211', '', '', '南郊区', '243', '113.16892', '40.01802', 'wx07xjp1fg');
INSERT INTO `model_nation` VALUES ('248', '140212', '', '', '新荣区', '243', '113.141044', '40.258269', 'wx0mn8fc3m');
INSERT INTO `model_nation` VALUES ('249', '140221', '', '', '阳高县', '243', '113.749871', '40.364927', 'wx0vsknnsp');
INSERT INTO `model_nation` VALUES ('250', '140222', '', '', '天镇县', '243', '114.09112', '40.421336', 'wx1junqx7g');
INSERT INTO `model_nation` VALUES ('251', '140223', '', '', '广灵县', '243', '114.279252', '39.763051', 'wx160qxse9');
INSERT INTO `model_nation` VALUES ('252', '140224', '', '', '灵丘县', '243', '114.23576', '39.438867', 'wx10r7xun1');
INSERT INTO `model_nation` VALUES ('253', '140225', '', '', '浑源县', '243', '113.698091', '39.699099', 'wx0cg702j8');
INSERT INTO `model_nation` VALUES ('254', '140226', '', '', '左云县', '243', '112.70641', '40.012873', 'wx05ssn7cs');
INSERT INTO `model_nation` VALUES ('255', '140227', '', '', '大同县', '243', '113.611306', '40.039345', 'wx0gc2cnp6');
INSERT INTO `model_nation` VALUES ('256', '140300', '', '阳泉市', '', '230', '113.583285', '37.861188', 'ww8z2skv6k');
INSERT INTO `model_nation` VALUES ('257', '140301', '', '', '市辖区', '256', '113.583285', '37.861188', 'ww8z2skv6k');
INSERT INTO `model_nation` VALUES ('258', '140302', '', '', '城区', '256', '113.586513', '37.860938', 'ww8z2sr5vw');
INSERT INTO `model_nation` VALUES ('259', '140303', '', '', '矿区', '256', '113.559066', '37.870085', 'ww8z2n51np');
INSERT INTO `model_nation` VALUES ('260', '140311', '', '', '郊区', '256', '113.58664', '37.94096', 'ww8zbdzq0e');
INSERT INTO `model_nation` VALUES ('261', '140321', '', '', '平定县', '256', '113.631049', '37.800289', 'ww8z19rdek');
INSERT INTO `model_nation` VALUES ('262', '140322', '', '', '盂县', '256', '113.41223', '38.086131', 'wwb8sv27b3');
INSERT INTO `model_nation` VALUES ('263', '140400', '', '长治市', '', '230', '113.113556', '36.191112', 'ww2mvuqu8b');
INSERT INTO `model_nation` VALUES ('264', '140401', '', '', '市辖区', '263', '113.113556', '36.191112', 'ww2mvuqu8b');
INSERT INTO `model_nation` VALUES ('265', '140402', '', '', '城区', '263', '113.114107', '36.187896', 'ww2mvgz1v8');
INSERT INTO `model_nation` VALUES ('266', '140411', '', '', '郊区', '263', '113.101211', '36.218388', 'ww2qj9mg3h');
INSERT INTO `model_nation` VALUES ('267', '140421', '', '', '长治县', '263', '113.056679', '36.052438', 'ww2mhejket');
INSERT INTO `model_nation` VALUES ('268', '140423', '', '', '襄垣县', '263', '113.050094', '36.532854', 'ww2rud8e61');
INSERT INTO `model_nation` VALUES ('269', '140424', '', '', '屯留县', '263', '112.892741', '36.314072', 'ww2q8fvbz9');
INSERT INTO `model_nation` VALUES ('270', '140425', '', '', '平顺县', '263', '113.438791', '36.200202', 'ww2tvq597q');
INSERT INTO `model_nation` VALUES ('271', '140426', '', '', '黎城县', '263', '113.387366', '36.502971', 'ww2xsjnjjn');
INSERT INTO `model_nation` VALUES ('272', '140427', '', '', '壶关县', '263', '113.206138', '36.110938', 'ww2t2jf1qn');
INSERT INTO `model_nation` VALUES ('273', '140428', '', '', '长子县', '263', '112.884656', '36.119484', 'ww2m2z255p');
INSERT INTO `model_nation` VALUES ('274', '140429', '', '', '武乡县', '263', '112.8653', '36.834315', 'ww83836p2j');
INSERT INTO `model_nation` VALUES ('275', '140430', '', '', '沁县', '263', '112.70138', '36.757123', 'ww81he6tu2');
INSERT INTO `model_nation` VALUES ('276', '140431', '', '', '沁源县', '263', '112.340878', '36.500777', 'wqrzsku0kj');
INSERT INTO `model_nation` VALUES ('277', '140481', '', '', '潞城市', '263', '113.223245', '36.332233', 'ww2w8qndsg');
INSERT INTO `model_nation` VALUES ('278', '140500', '', '晋城市', '', '230', '112.851274', '35.497553', 'ww21zypu1r');
INSERT INTO `model_nation` VALUES ('279', '140501', '', '', '市辖区', '278', '112.851274', '35.497553', 'ww21zypu1r');
INSERT INTO `model_nation` VALUES ('280', '140502', '', '', '城区', '278', '112.853106', '35.496641', 'ww23bjcngv');
INSERT INTO `model_nation` VALUES ('281', '140521', '', '', '沁水县', '278', '112.187213', '35.689472', 'wqrg0ch4px');
INSERT INTO `model_nation` VALUES ('282', '140522', '', '', '阳城县', '278', '112.422014', '35.482177', 'wqrcy5r4wv');
INSERT INTO `model_nation` VALUES ('283', '140524', '', '', '陵川县', '278', '113.278877', '35.775614', 'ww2e98z0j1');
INSERT INTO `model_nation` VALUES ('284', '140525', '', '', '泽州县', '278', '112.899137', '35.617221', 'ww2695ftke');
INSERT INTO `model_nation` VALUES ('285', '140581', '', '', '高平市', '278', '112.930691', '35.791355', 'ww279g9egb');
INSERT INTO `model_nation` VALUES ('286', '140600', '', '朔州市', '', '230', '112.433387', '39.331261', 'wqzzy2p3py');
INSERT INTO `model_nation` VALUES ('287', '140601', '', '', '市辖区', '286', '112.433387', '39.331261', 'wqzzy2p3py');
INSERT INTO `model_nation` VALUES ('288', '140602', '', '', '朔城区', '286', '112.428676', '39.324525', 'wqzzwqu1fn');
INSERT INTO `model_nation` VALUES ('289', '140603', '', '', '平鲁区', '286', '112.295227', '39.515603', 'wrpbg3dgh6');
INSERT INTO `model_nation` VALUES ('290', '140621', '', '', '山阴县', '286', '112.816396', '39.52677', 'wx00z5wkhe');
INSERT INTO `model_nation` VALUES ('291', '140622', '', '', '应县', '286', '113.187505', '39.559187', 'wx03p9s8un');
INSERT INTO `model_nation` VALUES ('292', '140623', '', '', '右玉县', '286', '112.465588', '39.988812', 'wrpgrpwzwn');
INSERT INTO `model_nation` VALUES ('293', '140624', '', '', '怀仁县', '286', '113.100512', '39.82079', 'wx06t9jkbv');
INSERT INTO `model_nation` VALUES ('294', '140700', '', '晋中市', '', '230', '112.736465', '37.696495', 'ww8nmqkjyp');
INSERT INTO `model_nation` VALUES ('295', '140701', '', '', '市辖区', '294', '112.736465', '37.696495', 'ww8nmqkjyp');
INSERT INTO `model_nation` VALUES ('296', '140702', '', '', '榆次区', '294', '112.740056', '37.6976', 'ww8nmqwu3t');
INSERT INTO `model_nation` VALUES ('297', '140721', '', '', '榆社县', '294', '112.973521', '37.069019', 'ww86fu0y9v');
INSERT INTO `model_nation` VALUES ('298', '140722', '', '', '左权县', '294', '113.377834', '37.079672', 'ww8dgyphxp');
INSERT INTO `model_nation` VALUES ('299', '140723', '', '', '和顺县', '294', '113.572919', '37.327027', 'ww8u27jm8y');
INSERT INTO `model_nation` VALUES ('300', '140724', '', '', '昔阳县', '294', '113.706166', '37.60437', 'ww8vgmwm3d');
INSERT INTO `model_nation` VALUES ('301', '140725', '', '', '寿阳县', '294', '113.177708', '37.891136', 'ww8rx3v7ze');
INSERT INTO `model_nation` VALUES ('302', '140726', '', '', '太谷县', '294', '112.554103', '37.424595', 'ww8hchzqhd');
INSERT INTO `model_nation` VALUES ('303', '140727', '', '', '祁县', '294', '112.330532', '37.358739', 'wqxus0uw7j');
INSERT INTO `model_nation` VALUES ('304', '140728', '', '', '平遥县', '294', '112.174059', '37.195474', 'wqxg8e4xm4');
INSERT INTO `model_nation` VALUES ('305', '140729', '', '', '灵石县', '294', '111.772759', '36.847469', 'wqx3x7ykn4');
INSERT INTO `model_nation` VALUES ('306', '140781', '', '', '介休市', '294', '111.913857', '37.027616', 'wqxddstjmz');
INSERT INTO `model_nation` VALUES ('307', '140800', '', '运城市', '', '230', '111.003957', '35.022778', 'wqnzjzww7x');
INSERT INTO `model_nation` VALUES ('308', '140801', '', '', '市辖区', '307', '111.003957', '35.022778', 'wqnzjzww7x');
INSERT INTO `model_nation` VALUES ('309', '140802', '', '', '盐湖区', '307', '111.000627', '35.025643', 'wqnzmbhpnj');
INSERT INTO `model_nation` VALUES ('310', '140821', '', '', '临猗县', '307', '110.77493', '35.141883', 'wqnzbtru6c');
INSERT INTO `model_nation` VALUES ('311', '140822', '', '', '万荣县', '307', '110.843561', '35.417042', 'wqqc6r3z4p');
INSERT INTO `model_nation` VALUES ('312', '140823', '', '', '闻喜县', '307', '111.220306', '35.353839', 'wqr14guphc');
INSERT INTO `model_nation` VALUES ('313', '140824', '', '', '稷山县', '307', '110.978996', '35.600412', 'wqqft2u7qj');
INSERT INTO `model_nation` VALUES ('314', '140825', '', '', '新绛县', '307', '111.225205', '35.613697', 'wqr4dgr8z4');
INSERT INTO `model_nation` VALUES ('315', '140826', '', '', '绛县', '307', '111.576182', '35.49045', 'wqr3fuz6c7');
INSERT INTO `model_nation` VALUES ('316', '140827', '', '', '垣曲县', '307', '111.67099', '35.298293', 'wqr2v1u76w');
INSERT INTO `model_nation` VALUES ('317', '140828', '', '', '夏县', '307', '111.223174', '35.140441', 'wqppfvn5zu');
INSERT INTO `model_nation` VALUES ('318', '140829', '', '', '平陆县', '307', '111.212377', '34.837256', 'wqpn4tymsp');
INSERT INTO `model_nation` VALUES ('319', '140830', '', '', '芮城县', '307', '110.69114', '34.694769', 'wqntqgfzdt');
INSERT INTO `model_nation` VALUES ('320', '140881', '', '', '永济市', '307', '110.447984', '34.865125', 'wqnw371b0d');
INSERT INTO `model_nation` VALUES ('321', '140882', '', '', '河津市', '307', '110.710268', '35.59715', 'wqqdx22b2j');
INSERT INTO `model_nation` VALUES ('322', '140900', '', '忻州市', '', '230', '112.733538', '38.41769', 'wwb4t3dp3b');
INSERT INTO `model_nation` VALUES ('323', '140901', '', '', '市辖区', '322', '112.733538', '38.41769', 'wwb4t3dp3b');
INSERT INTO `model_nation` VALUES ('324', '140902', '', '', '忻府区', '322', '112.734112', '38.417743', 'wwb4t3drx4');
INSERT INTO `model_nation` VALUES ('325', '140921', '', '', '定襄县', '322', '112.963231', '38.484948', 'wwb6ftcr44');
INSERT INTO `model_nation` VALUES ('326', '140922', '', '', '五台县', '322', '113.259012', '38.725711', 'wwbs33b9w7');
INSERT INTO `model_nation` VALUES ('327', '140923', '', '', '代县', '322', '112.962519', '39.065138', 'wwbq4x8fcm');
INSERT INTO `model_nation` VALUES ('328', '140924', '', '', '繁峙县', '322', '113.267707', '39.188104', 'wwbwcmzp2b');
INSERT INTO `model_nation` VALUES ('329', '140925', '', '', '宁武县', '322', '112.307936', '39.001718', 'wqzvgsh1kx');
INSERT INTO `model_nation` VALUES ('330', '140926', '', '', '静乐县', '322', '111.940231', '38.355947', 'wqzd5q2rs6');
INSERT INTO `model_nation` VALUES ('331', '140927', '', '', '神池县', '322', '112.200438', '39.088467', 'wqzy35vfgd');
INSERT INTO `model_nation` VALUES ('332', '140928', '', '', '五寨县', '322', '111.841015', '38.912761', 'wqzt35b5k8');
INSERT INTO `model_nation` VALUES ('333', '140929', '', '', '岢岚县', '322', '111.56981', '38.705625', 'wqzk4y4st5');
INSERT INTO `model_nation` VALUES ('334', '140930', '', '', '河曲县', '322', '111.146609', '39.381895', 'wrp011q2pt');
INSERT INTO `model_nation` VALUES ('335', '140931', '', '', '保德县', '322', '111.085688', '39.022576', 'wqyvzzf4up');
INSERT INTO `model_nation` VALUES ('336', '140932', '', '', '偏关县', '322', '111.500477', '39.442153', 'wrp23k0pjq');
INSERT INTO `model_nation` VALUES ('337', '140981', '', '', '原平市', '322', '112.713132', '38.729186', 'wwbhkf7jy7');
INSERT INTO `model_nation` VALUES ('338', '141000', '', '临汾市', '', '230', '111.517973', '36.08415', 'wqrm38uvmj');
INSERT INTO `model_nation` VALUES ('339', '141001', '', '', '市辖区', '338', '111.517973', '36.08415', 'wqrm38uvmj');
INSERT INTO `model_nation` VALUES ('340', '141002', '', '', '尧都区', '338', '111.522945', '36.080366', 'wqrm3b0x2g');
INSERT INTO `model_nation` VALUES ('341', '141021', '', '', '曲沃县', '338', '111.475529', '35.641387', 'wqr6b8q40h');
INSERT INTO `model_nation` VALUES ('342', '141022', '', '', '翼城县', '338', '111.713508', '35.738621', 'wqr7q45293');
INSERT INTO `model_nation` VALUES ('343', '141023', '', '', '襄汾县', '338', '111.442932', '35.876139', 'wqrhpgn38t');
INSERT INTO `model_nation` VALUES ('344', '141024', '', '', '洪洞县', '338', '111.673692', '36.255742', 'wqrqm0nm18');
INSERT INTO `model_nation` VALUES ('345', '141025', '', '', '古县', '338', '111.920207', '36.26855', 'wqrw6f3z9g');
INSERT INTO `model_nation` VALUES ('346', '141026', '', '', '安泽县', '338', '112.251372', '36.146032', 'wqrvdk4vys');
INSERT INTO `model_nation` VALUES ('347', '141027', '', '', '浮山县', '338', '111.850039', '35.971359', 'wqrs9hqsqg');
INSERT INTO `model_nation` VALUES ('348', '141028', '', '', '吉县', '338', '110.682853', '36.099355', 'wqqtqesvcr');
INSERT INTO `model_nation` VALUES ('349', '141029', '', '', '乡宁县', '338', '110.857365', '35.975402', 'wqqudt5ggv');
INSERT INTO `model_nation` VALUES ('350', '141030', '', '', '大宁县', '338', '110.751283', '36.46383', 'wqqz2nn95y');
INSERT INTO `model_nation` VALUES ('351', '141031', '', '', '隰县', '338', '110.935809', '36.692675', 'wqwbsrsyrd');
INSERT INTO `model_nation` VALUES ('352', '141032', '', '', '永和县', '338', '110.631276', '36.760614', 'wqw9jkp4pe');
INSERT INTO `model_nation` VALUES ('353', '141033', '', '', '蒲县', '338', '111.09733', '36.411682', 'wqrp0hd97m');
INSERT INTO `model_nation` VALUES ('354', '141034', '', '', '汾西县', '338', '111.563021', '36.653368', 'wqx2d8t9qg');
INSERT INTO `model_nation` VALUES ('355', '141081', '', '', '侯马市', '338', '111.371272', '35.620302', 'wqr4wk6p69');
INSERT INTO `model_nation` VALUES ('356', '141082', '', '', '霍州市', '338', '111.723103', '36.57202', 'wqx2n3dr2y');
INSERT INTO `model_nation` VALUES ('357', '141100', '', '吕梁市', '', '230', '111.134335', '37.524366', 'wqxj2zje38');
INSERT INTO `model_nation` VALUES ('358', '141101', '', '', '市辖区', '357', '111.134335', '37.524366', 'wqxj2zje38');
INSERT INTO `model_nation` VALUES ('359', '141102', '', '', '离石区', '357', '111.134462', '37.524037', 'wqxj2zj9ke');
INSERT INTO `model_nation` VALUES ('360', '141121', '', '', '文水县', '357', '112.032595', '37.436314', 'wqxsvr5dkd');
INSERT INTO `model_nation` VALUES ('361', '141122', '', '', '交城县', '357', '112.159154', '37.555155', 'wqxv8hxy9s');
INSERT INTO `model_nation` VALUES ('362', '141123', '', '', '兴县', '357', '111.124816', '38.464136', 'wqz4bdntgf');
INSERT INTO `model_nation` VALUES ('363', '141124', '', '', '临县', '357', '110.995963', '37.960806', 'wqwzvy8c9r');
INSERT INTO `model_nation` VALUES ('364', '141125', '', '', '柳林县', '357', '110.89613', '37.431664', 'wqwugw0p5p');
INSERT INTO `model_nation` VALUES ('365', '141126', '', '', '石楼县', '357', '110.837119', '36.999426', 'wqwf6pt1k0');
INSERT INTO `model_nation` VALUES ('366', '141127', '', '', '岚县', '357', '111.671555', '38.278654', 'wqz3v0ktrf');
INSERT INTO `model_nation` VALUES ('367', '141128', '', '', '方山县', '357', '111.238885', '37.892632', 'wqxpe61stf');
INSERT INTO `model_nation` VALUES ('368', '141129', '', '', '中阳县', '357', '111.193319', '37.342054', 'wqxh6mbt0p');
INSERT INTO `model_nation` VALUES ('369', '141130', '', '', '交口县', '357', '111.183188', '36.983068', 'wqx46h91up');
INSERT INTO `model_nation` VALUES ('370', '141181', '', '', '孝义市', '357', '111.781568', '37.144474', 'wqx7r9uy5r');
INSERT INTO `model_nation` VALUES ('371', '141182', '', '', '汾阳市', '357', '111.785273', '37.267742', 'wqxkp8rs3d');
INSERT INTO `model_nation` VALUES ('372', '150000', '内蒙古自治区', '', '', '1', '111.670801', '40.818311', 'wrr2jnspyk');
INSERT INTO `model_nation` VALUES ('373', '150100', '', '呼和浩特市', '', '372', '111.670801', '40.818311', 'wrr2jnspyk');
INSERT INTO `model_nation` VALUES ('374', '150101', '', '', '市辖区', '373', '111.670801', '40.818311', 'wrr2jnspyk');
INSERT INTO `model_nation` VALUES ('375', '150102', '', '', '新城区', '373', '111.685964', '40.826225', 'wrr2m2pjzx');
INSERT INTO `model_nation` VALUES ('376', '150103', '', '', '回民区', '373', '111.662162', '40.815149', 'wrr2hyjvkz');
INSERT INTO `model_nation` VALUES ('377', '150104', '', '', '玉泉区', '373', '111.66543', '40.799421', 'wrr2j523c5');
INSERT INTO `model_nation` VALUES ('378', '150105', '', '', '赛罕区', '373', '111.698463', '40.807834', 'wrr2jub6fg');
INSERT INTO `model_nation` VALUES ('379', '150121', '', '', '土默特左旗', '373', '111.133615', '40.720416', 'wrpp8uvj8g');
INSERT INTO `model_nation` VALUES ('380', '150122', '', '', '托克托县', '373', '111.197317', '40.276729', 'wrpj4k5kvq');
INSERT INTO `model_nation` VALUES ('381', '150123', '', '', '和林格尔县', '373', '111.824143', '40.380288', 'wrpt8x5b5r');
INSERT INTO `model_nation` VALUES ('382', '150124', '', '', '清水河县', '373', '111.67222', '39.912479', 'wrp7j1v5p3');
INSERT INTO `model_nation` VALUES ('383', '150125', '', '', '武川县', '373', '111.456563', '41.094483', 'wrr3b300wn');
INSERT INTO `model_nation` VALUES ('384', '150200', '', '包头市', '', '372', '109.840405', '40.658168', 'wrnp73x6fz');
INSERT INTO `model_nation` VALUES ('385', '150201', '', '', '市辖区', '384', '109.840405', '40.658168', 'wrnp73x6fz');
INSERT INTO `model_nation` VALUES ('386', '150202', '', '', '东河区', '384', '110.026895', '40.587056', 'wrnnzsxhsr');
INSERT INTO `model_nation` VALUES ('387', '150203', '', '', '昆都仑区', '384', '109.822932', '40.661345', 'wrnp744teb');
INSERT INTO `model_nation` VALUES ('388', '150204', '', '', '青山区', '384', '109.880049', '40.668558', 'wrnpk7kpw8');
INSERT INTO `model_nation` VALUES ('389', '150205', '', '', '石拐区', '384', '110.272565', '40.672094', 'wrnrmk4h15');
INSERT INTO `model_nation` VALUES ('390', '150206', '', '', '白云鄂博矿区', '384', '109.97016', '41.769246', 'wrqjw7vg6r');
INSERT INTO `model_nation` VALUES ('391', '150207', '', '', '九原区', '384', '109.968122', '40.600581', 'wrnnyrh7db');
INSERT INTO `model_nation` VALUES ('392', '150221', '', '', '土默特右旗', '384', '110.526766', '40.566434', 'wrnwg0ghs7');
INSERT INTO `model_nation` VALUES ('393', '150222', '', '', '固阳县', '384', '110.063421', '41.030004', 'wrq32t39pe');
INSERT INTO `model_nation` VALUES ('394', '150223', '', '', '达尔罕茂明安联合旗', '384', '110.438452', '41.702836', 'wrqt1pfbdk');
INSERT INTO `model_nation` VALUES ('395', '150300', '', '乌海市', '', '372', '106.825563', '39.673734', 'wr5cwykh20');
INSERT INTO `model_nation` VALUES ('396', '150301', '', '', '市辖区', '395', '106.825563', '39.673734', 'wr5cwykh20');
INSERT INTO `model_nation` VALUES ('397', '150302', '', '', '海勃湾区', '395', '106.817762', '39.673527', 'wr5cwwq743');
INSERT INTO `model_nation` VALUES ('398', '150303', '', '', '海南区', '395', '106.884789', '39.44153', 'wrh02hp5s4');
INSERT INTO `model_nation` VALUES ('399', '150304', '', '', '乌达区', '395', '106.722711', '39.502288', 'wr5bsx1je2');
INSERT INTO `model_nation` VALUES ('400', '150400', '', '赤峰市', '', '372', '118.956806', '42.275317', 'wxs86zvxw6');
INSERT INTO `model_nation` VALUES ('401', '150401', '', '', '市辖区', '400', '118.956806', '42.275317', 'wxs86zvxw6');
INSERT INTO `model_nation` VALUES ('402', '150402', '', '', '红山区', '400', '118.961087', '42.269732', 'wxs87nbz41');
INSERT INTO `model_nation` VALUES ('403', '150403', '', '', '元宝山区', '400', '119.289877', '42.041168', 'wxkz4t25x9');
INSERT INTO `model_nation` VALUES ('404', '150404', '', '', '松山区', '400', '118.938958', '42.281046', 'wxs8d908yw');
INSERT INTO `model_nation` VALUES ('405', '150421', '', '', '阿鲁科尔沁旗', '400', '120.094969', '43.87877', 'wxv3sgfkre');
INSERT INTO `model_nation` VALUES ('406', '150422', '', '', '巴林左旗', '400', '119.391737', '43.980715', 'wxufhy6qjp');
INSERT INTO `model_nation` VALUES ('407', '150423', '', '', '巴林右旗', '400', '118.678347', '43.528963', 'wxsrss4ytf');
INSERT INTO `model_nation` VALUES ('408', '150424', '', '', '林西县', '400', '118.05775', '43.605326', 'wxgbn6p52v');
INSERT INTO `model_nation` VALUES ('409', '150425', '', '', '克什克腾旗', '400', '117.542465', '43.256233', 'wxew4dxccf');
INSERT INTO `model_nation` VALUES ('410', '150426', '', '', '翁牛特旗', '400', '119.022619', '42.937128', 'wxssk2mwuh');
INSERT INTO `model_nation` VALUES ('411', '150428', '', '', '喀喇沁旗', '400', '118.708572', '41.92778', 'wxkqt28zn0');
INSERT INTO `model_nation` VALUES ('412', '150429', '', '', '宁城县', '400', '119.339242', '41.598692', 'wxkuesu1vy');
INSERT INTO `model_nation` VALUES ('413', '150430', '', '', '敖汉旗', '400', '119.906486', '42.287012', 'wxt28d15xw');
INSERT INTO `model_nation` VALUES ('414', '150500', '', '通辽市', '', '372', '122.263119', '43.617429', 'wxybnhm3cn');
INSERT INTO `model_nation` VALUES ('415', '150501', '', '', '市辖区', '414', '122.263119', '43.617429', 'wxybnhm3cn');
INSERT INTO `model_nation` VALUES ('416', '150502', '', '', '科尔沁区', '414', '122.264042', '43.617422', 'wxybnhmcys');
INSERT INTO `model_nation` VALUES ('417', '150521', '', '', '科尔沁左翼中旗', '414', '123.313873', '44.127166', 'wxzen147me');
INSERT INTO `model_nation` VALUES ('418', '150522', '', '', '科尔沁左翼后旗', '414', '122.355155', '42.954564', 'wxxh278k3z');
INSERT INTO `model_nation` VALUES ('419', '150523', '', '', '开鲁县', '414', '121.308797', '43.602432', 'wxy203w6ef');
INSERT INTO `model_nation` VALUES ('420', '150524', '', '', '库伦旗', '414', '121.774886', '42.734692', 'wxwe559g8e');
INSERT INTO `model_nation` VALUES ('421', '150525', '', '', '奈曼旗', '414', '120.662543', '42.84685', 'wxtgc8pbcp');
INSERT INTO `model_nation` VALUES ('422', '150526', '', '', '扎鲁特旗', '414', '120.905275', '44.555294', 'wxvvrr093h');
INSERT INTO `model_nation` VALUES ('423', '150581', '', '', '霍林郭勒市', '414', '119.657862', '45.532361', 'y8j54bujnr');
INSERT INTO `model_nation` VALUES ('424', '150600', '', '鄂尔多斯市', '', '372', '109.99029', '39.817179', 'wrn4wbkrzs');
INSERT INTO `model_nation` VALUES ('425', '150601', '', '', '市辖区', '424', '109.99029', '39.817179', 'wrn4wbkrzs');
INSERT INTO `model_nation` VALUES ('426', '150602', '', '', '东胜区', '424', '109.98945', '39.81788', 'wrn4wbeggy');
INSERT INTO `model_nation` VALUES ('427', '150621', '', '', '达拉特旗', '424', '110.040281', '40.404076', 'wrnmb52fu3');
INSERT INTO `model_nation` VALUES ('428', '150622', '', '', '准格尔旗', '424', '111.238332', '39.865221', 'wrp4g31r9p');
INSERT INTO `model_nation` VALUES ('429', '150623', '', '', '鄂托克前旗', '424', '107.48172', '38.183257', 'wqu3jz1c9e');
INSERT INTO `model_nation` VALUES ('430', '150624', '', '', '鄂托克旗', '424', '107.982604', '39.095752', 'wquy3jnt30');
INSERT INTO `model_nation` VALUES ('431', '150625', '', '', '杭锦旗', '424', '108.736324', '39.831789', 'wrj6d75kgz');
INSERT INTO `model_nation` VALUES ('432', '150626', '', '', '乌审旗', '424', '108.842454', '38.596611', 'wqv7sf29t1');
INSERT INTO `model_nation` VALUES ('433', '150627', '', '', '伊金霍洛旗', '424', '109.787402', '39.604312', 'wrn1638xzf');
INSERT INTO `model_nation` VALUES ('434', '150700', '', '呼伦贝尔市', '', '372', '119.758168', '49.215333', 'y8tpvpmhpe');
INSERT INTO `model_nation` VALUES ('435', '150701', '', '', '市辖区', '434', '119.758168', '49.215333', 'y8tpvpmhpe');
INSERT INTO `model_nation` VALUES ('436', '150702', '', '', '海拉尔区', '434', '119.764923', '49.213889', 'y8tpvr45sv');
INSERT INTO `model_nation` VALUES ('437', '150703', '', '', '扎赉诺尔区', '434', '117.716373', '49.456567', 'y8g9qeq3qk');
INSERT INTO `model_nation` VALUES ('438', '150721', '', '', '阿荣旗', '434', '123.464615', '48.130503', 'y8xcc9bhw0');
INSERT INTO `model_nation` VALUES ('439', '150722', '', '', '莫力达瓦达斡尔族自治旗', '434', '124.507401', '48.478385', 'yb8ec1px09');
INSERT INTO `model_nation` VALUES ('440', '150723', '', '', '鄂伦春自治旗', '434', '123.725684', '50.590177', 'y8zzz3wm1k');
INSERT INTO `model_nation` VALUES ('441', '150724', '', '', '鄂温克族自治旗', '434', '119.754041', '49.143293', 'y8tpt460rm');
INSERT INTO `model_nation` VALUES ('442', '150725', '', '', '陈巴尔虎旗', '434', '119.437609', '49.328422', 'y8ubtggyfh');
INSERT INTO `model_nation` VALUES ('443', '150726', '', '', '新巴尔虎左旗', '434', '118.267454', '48.216571', 'y8s471x9zk');
INSERT INTO `model_nation` VALUES ('444', '150727', '', '', '新巴尔虎右旗', '434', '116.825991', '48.669134', 'y8ehf7yn6b');
INSERT INTO `model_nation` VALUES ('445', '150781', '', '', '满洲里市', '434', '117.455561', '49.590788', 'y8gd0g8x2b');
INSERT INTO `model_nation` VALUES ('446', '150782', '', '', '牙克石市', '434', '120.729005', '49.287024', 'y8vb7k2jtx');
INSERT INTO `model_nation` VALUES ('447', '150783', '', '', '扎兰屯市', '434', '122.744401', '48.007412', 'y8x3157xry');
INSERT INTO `model_nation` VALUES ('448', '150784', '', '', '额尔古纳市', '434', '120.178636', '50.2439', 'y8vmydx7vj');
INSERT INTO `model_nation` VALUES ('449', '150785', '', '', '根河市', '434', '121.532724', '50.780454', 'y9n2vs33td');
INSERT INTO `model_nation` VALUES ('450', '150800', '', '巴彦淖尔市', '', '372', '107.416959', '40.757402', 'wrhru7dthd');
INSERT INTO `model_nation` VALUES ('451', '150801', '', '', '市辖区', '450', '107.416959', '40.757402', 'wrhru7dthd');
INSERT INTO `model_nation` VALUES ('452', '150802', '', '', '临河区', '450', '107.417018', '40.757092', 'wrhru7demb');
INSERT INTO `model_nation` VALUES ('453', '150821', '', '', '五原县', '450', '108.270658', '41.097639', 'wrkczc8715');
INSERT INTO `model_nation` VALUES ('454', '150822', '', '', '磴口县', '450', '107.006056', '40.330479', 'wrhj6vzqjf');
INSERT INTO `model_nation` VALUES ('455', '150823', '', '', '乌拉特前旗', '450', '108.656816', '40.725209', 'wrjr8tc3x3');
INSERT INTO `model_nation` VALUES ('456', '150824', '', '', '乌拉特中旗', '450', '108.515255', '41.57254', 'wrmht243se');
INSERT INTO `model_nation` VALUES ('457', '150825', '', '', '乌拉特后旗', '450', '107.074941', '41.084307', 'wrk1sx1t6v');
INSERT INTO `model_nation` VALUES ('458', '150826', '', '', '杭锦后旗', '450', '107.147682', '40.888797', 'wrk0w5wd9b');
INSERT INTO `model_nation` VALUES ('459', '150900', '', '乌兰察布市', '', '372', '113.114543', '41.034126', 'wx23myp3pg');
INSERT INTO `model_nation` VALUES ('460', '150901', '', '', '市辖区', '459', '113.114543', '41.034126', 'wx23myp3pg');
INSERT INTO `model_nation` VALUES ('461', '150902', '', '', '集宁区', '459', '113.116453', '41.034134', 'wx23qn0chk');
INSERT INTO `model_nation` VALUES ('462', '150921', '', '', '卓资县', '459', '112.577702', '40.89576', 'wx209ube4d');
INSERT INTO `model_nation` VALUES ('463', '150922', '', '', '化德县', '459', '114.01008', '41.899335', 'wx3n67e976');
INSERT INTO `model_nation` VALUES ('464', '150923', '', '', '商都县', '459', '113.560643', '41.560163', 'wx2u2ju36z');
INSERT INTO `model_nation` VALUES ('465', '150924', '', '', '兴和县', '459', '113.834009', '40.872437', 'wx2bw2e7hw');
INSERT INTO `model_nation` VALUES ('466', '150925', '', '', '凉城县', '459', '112.500911', '40.531627', 'wx0n8489v4');
INSERT INTO `model_nation` VALUES ('467', '150926', '', '', '察哈尔右翼前旗', '459', '113.211958', '40.786859', 'wx2801n2tv');
INSERT INTO `model_nation` VALUES ('468', '150927', '', '', '察哈尔右翼中旗', '459', '112.633563', '41.274212', 'wx24g19r8n');
INSERT INTO `model_nation` VALUES ('469', '150928', '', '', '察哈尔右翼后旗', '459', '113.1906', '41.447213', 'wx27z9nzs0');
INSERT INTO `model_nation` VALUES ('470', '150929', '', '', '四子王旗', '459', '111.70123', '41.528114', 'wrrkjzfqg3');
INSERT INTO `model_nation` VALUES ('471', '150981', '', '', '丰镇市', '459', '113.163462', '40.437534', 'wx0qp17jey');
INSERT INTO `model_nation` VALUES ('472', '152200', '', '兴安盟', '', '372', '122.070317', '46.076268', 'y8ny1gbvsw');
INSERT INTO `model_nation` VALUES ('473', '152201', '', '', '乌兰浩特市', '472', '122.068975', '46.077238', 'y8ny1spgm7');
INSERT INTO `model_nation` VALUES ('474', '152202', '', '', '阿尔山市', '472', '119.943656', '47.177', 'y8mk3kk3cy');
INSERT INTO `model_nation` VALUES ('475', '152221', '', '', '科尔沁右翼前旗', '472', '121.957544', '46.076497', 'y8nwp5yz09');
INSERT INTO `model_nation` VALUES ('476', '152222', '', '', '科尔沁右翼中旗', '472', '121.472818', '45.059645', 'y8n2k4vg3y');
INSERT INTO `model_nation` VALUES ('477', '152223', '', '', '扎赉特旗', '472', '122.909332', '46.725136', 'y8r3uf5ceh');
INSERT INTO `model_nation` VALUES ('478', '152224', '', '', '突泉县', '472', '121.564856', '45.380986', 'y8n6nm2g6k');
INSERT INTO `model_nation` VALUES ('479', '152500', '', '锡林郭勒盟', '', '372', '116.090996', '43.944018', 'wxf9cxybkq');
INSERT INTO `model_nation` VALUES ('480', '152501', '', '', '二连浩特市', '479', '111.97981', '43.652895', 'wrz8k4v0w9');
INSERT INTO `model_nation` VALUES ('481', '152502', '', '', '锡林浩特市', '479', '116.091903', '43.944301', 'wxf9cxzd17');
INSERT INTO `model_nation` VALUES ('482', '152522', '', '', '阿巴嘎旗', '479', '114.970618', '44.022728', 'wxcf2np4cx');
INSERT INTO `model_nation` VALUES ('483', '152523', '', '', '苏尼特左旗', '479', '113.653412', '43.854108', 'wxbc6prusq');
INSERT INTO `model_nation` VALUES ('484', '152524', '', '', '苏尼特右旗', '479', '112.65539', '42.746662', 'wx855tc1kg');
INSERT INTO `model_nation` VALUES ('485', '152525', '', '', '东乌珠穆沁旗', '479', '116.980022', '45.510307', 'y854vuykb0');
INSERT INTO `model_nation` VALUES ('486', '152526', '', '', '西乌珠穆沁旗', '479', '117.615249', '44.586147', 'wxgtsksv1u');
INSERT INTO `model_nation` VALUES ('487', '152527', '', '', '太仆寺旗', '479', '115.28728', '41.895199', 'wx3yr6v9hr');
INSERT INTO `model_nation` VALUES ('488', '152528', '', '', '镶黄旗', '479', '113.843869', '42.239229', 'wx8bq96t66');
INSERT INTO `model_nation` VALUES ('489', '152529', '', '', '正镶白旗', '479', '115.031423', '42.286807', 'wx9b9d56d2');
INSERT INTO `model_nation` VALUES ('490', '152530', '', '', '正蓝旗', '479', '116.003311', '42.245895', 'wxd2rdxh1j');
INSERT INTO `model_nation` VALUES ('491', '152531', '', '', '多伦县', '479', '116.477288', '42.197962', 'wxdb49bhvw');
INSERT INTO `model_nation` VALUES ('492', '152900', '', '阿拉善盟', '', '372', '105.706422', '38.844814', 'wqghvrmp6n');
INSERT INTO `model_nation` VALUES ('493', '152921', '', '', '阿拉善左旗', '492', '105.70192', '38.847241', 'wqghvrcv96');
INSERT INTO `model_nation` VALUES ('494', '152922', '', '', '阿拉善右旗', '492', '101.671984', '39.21159', 'wqbr1d720f');
INSERT INTO `model_nation` VALUES ('495', '152923', '', '', '额济纳旗', '492', '101.06944', '41.958813', 'wpryeykeb9');
INSERT INTO `model_nation` VALUES ('496', '210000', '辽宁省', '', '', '1', '123.429096', '41.796767', 'wxrvb8y7f6');
INSERT INTO `model_nation` VALUES ('497', '210100', '', '沈阳市', '', '496', '123.429096', '41.796767', 'wxrvb8y7f6');
INSERT INTO `model_nation` VALUES ('498', '210101', '', '', '市辖区', '497', '123.429096', '41.796767', 'wxrvb8y7f6');
INSERT INTO `model_nation` VALUES ('499', '210102', '', '', '和平区', '497', '123.406664', '41.788074', 'wxrv8pmcpt');
INSERT INTO `model_nation` VALUES ('500', '210103', '', '', '沈河区', '497', '123.445696', '41.795591', 'wxrvc0dkvn');
INSERT INTO `model_nation` VALUES ('501', '210104', '', '', '大东区', '497', '123.469956', '41.808503', 'wxrvceh04t');
INSERT INTO `model_nation` VALUES ('502', '210105', '', '', '皇姑区', '497', '123.405677', '41.822336', 'wxrvbjt2b8');
INSERT INTO `model_nation` VALUES ('503', '210106', '', '', '铁西区', '497', '123.350664', '41.787808', 'wxrtwzjpwu');
INSERT INTO `model_nation` VALUES ('504', '210111', '', '', '苏家屯区', '497', '123.341604', '41.665904', 'wxrtn9n97x');
INSERT INTO `model_nation` VALUES ('505', '210112', '', '', '浑南区', '497', '123.458981', '41.741946', 'wxrv3quh6y');
INSERT INTO `model_nation` VALUES ('506', '210113', '', '', '沈北新区', '497', '123.521471', '42.052312', 'wxrz4z3s6z');
INSERT INTO `model_nation` VALUES ('507', '210114', '', '', '于洪区', '497', '123.310829', '41.795833', 'wxrty08nqe');
INSERT INTO `model_nation` VALUES ('508', '210122', '', '', '辽中县', '497', '122.731269', '41.512725', 'wxrk0v4jju');
INSERT INTO `model_nation` VALUES ('509', '210123', '', '', '康平县', '497', '123.352703', '42.741533', 'wxxenuyeqr');
INSERT INTO `model_nation` VALUES ('510', '210124', '', '', '法库县', '497', '123.416722', '42.507045', 'wxxcb6jm6p');
INSERT INTO `model_nation` VALUES ('511', '210181', '', '', '新民市', '497', '122.828868', '41.996508', 'wxrqgj1r2h');
INSERT INTO `model_nation` VALUES ('512', '210200', '', '大连市', '', '496', '121.618622', '38.91459', 'wwymrkpvzm');
INSERT INTO `model_nation` VALUES ('513', '210201', '', '', '市辖区', '512', '121.618622', '38.91459', 'wwymrkpvzm');
INSERT INTO `model_nation` VALUES ('514', '210202', '', '', '中山区', '512', '121.64376', '38.921553', 'wwyt2j6q3p');
INSERT INTO `model_nation` VALUES ('515', '210203', '', '', '西岗区', '512', '121.616112', '38.914266', 'wwymrknhhb');
INSERT INTO `model_nation` VALUES ('516', '210204', '', '', '沙河口区', '512', '121.593702', '38.912859', 'wwymqgvgfd');
INSERT INTO `model_nation` VALUES ('517', '210211', '', '', '甘井子区', '512', '121.582614', '38.975148', 'wwymwxjy8n');
INSERT INTO `model_nation` VALUES ('518', '210212', '', '', '旅顺口区', '512', '121.26713', '38.812043', 'wwyhz9808c');
INSERT INTO `model_nation` VALUES ('519', '210213', '', '', '金州区', '512', '121.789413', '39.052745', 'wwyw5mk6ep');
INSERT INTO `model_nation` VALUES ('520', '210224', '', '', '长海县', '512', '122.587824', '39.272399', 'wwzpmt3dr3');
INSERT INTO `model_nation` VALUES ('521', '210281', '', '', '瓦房店市', '512', '122.002656', '39.63065', 'wxnc2nx97b');
INSERT INTO `model_nation` VALUES ('522', '210282', '', '', '普兰店市', '512', '121.9705', '39.401555', 'wxn8psb4ww');
INSERT INTO `model_nation` VALUES ('523', '210283', '', '', '庄河市', '512', '122.970612', '39.69829', 'wxp3y6b7qc');
INSERT INTO `model_nation` VALUES ('524', '210300', '', '鞍山市', '', '496', '122.995632', '41.110626', 'wxr3ygfwvb');
INSERT INTO `model_nation` VALUES ('525', '210301', '', '', '市辖区', '524', '122.995632', '41.110626', 'wxr3ygfwvb');
INSERT INTO `model_nation` VALUES ('526', '210302', '', '', '铁东区', '524', '122.994475', '41.110344', 'wxr3ygcv4g');
INSERT INTO `model_nation` VALUES ('527', '210303', '', '', '铁西区', '524', '122.971834', '41.11069', 'wxr3y7cr5k');
INSERT INTO `model_nation` VALUES ('528', '210304', '', '', '立山区', '524', '123.024806', '41.150622', 'wxr6p7pztz');
INSERT INTO `model_nation` VALUES ('529', '210311', '', '', '千山区', '524', '122.949298', '41.068909', 'wxr3tu2gwr');
INSERT INTO `model_nation` VALUES ('530', '210321', '', '', '台安县', '524', '122.429736', '41.38686', 'wxr53ynxgt');
INSERT INTO `model_nation` VALUES ('531', '210323', '', '', '岫岩满族自治县', '524', '123.28833', '40.281509', 'wxptjmpbf3');
INSERT INTO `model_nation` VALUES ('532', '210381', '', '', '海城市', '524', '122.752199', '40.852533', 'wxr23kcrm8');
INSERT INTO `model_nation` VALUES ('533', '210400', '', '抚顺市', '', '496', '123.921109', '41.875956', 'wz2n5zk955');
INSERT INTO `model_nation` VALUES ('534', '210401', '', '', '市辖区', '533', '123.921109', '41.875956', 'wz2n5zk955');
INSERT INTO `model_nation` VALUES ('535', '210402', '', '', '新抚区', '533', '123.902858', '41.86082', 'wz2n5kx2cy');
INSERT INTO `model_nation` VALUES ('536', '210403', '', '', '东洲区', '533', '124.047219', '41.866829', 'wz2nnv87vw');
INSERT INTO `model_nation` VALUES ('537', '210404', '', '', '望花区', '533', '123.801509', '41.851803', 'wz2n14vs2j');
INSERT INTO `model_nation` VALUES ('538', '210411', '', '', '顺城区', '533', '123.917165', '41.881132', 'wz2n7b1xr0');
INSERT INTO `model_nation` VALUES ('539', '210421', '', '', '抚顺县', '533', '124.097979', '41.922644', 'wz2nrzv3h7');
INSERT INTO `model_nation` VALUES ('540', '210422', '', '', '新宾满族自治县', '533', '125.037547', '41.732456', 'wz2vmm1t4j');
INSERT INTO `model_nation` VALUES ('541', '210423', '', '', '清原满族自治县', '533', '124.927192', '42.10135', 'wz2zdb34ns');
INSERT INTO `model_nation` VALUES ('542', '210500', '', '本溪市', '', '496', '123.770519', '41.297909', 'wz24bqncy0');
INSERT INTO `model_nation` VALUES ('543', '210501', '', '', '市辖区', '542', '123.770519', '41.297909', 'wz24bqncy0');
INSERT INTO `model_nation` VALUES ('544', '210502', '', '', '平山区', '542', '123.761231', '41.291581', 'wz24bkbhvs');
INSERT INTO `model_nation` VALUES ('545', '210503', '', '', '溪湖区', '542', '123.765226', '41.330056', 'wz2507gj4b');
INSERT INTO `model_nation` VALUES ('546', '210504', '', '', '明山区', '542', '123.763288', '41.302429', 'wz24bqcsjd');
INSERT INTO `model_nation` VALUES ('547', '210505', '', '', '南芬区', '542', '123.748381', '41.104093', 'wxrczfybdq');
INSERT INTO `model_nation` VALUES ('548', '210521', '', '', '本溪满族自治县', '542', '124.126156', '41.300344', 'wz26bw3zvn');
INSERT INTO `model_nation` VALUES ('549', '210522', '', '', '桓仁满族自治县', '542', '125.359195', '41.268997', 'wz34u8gc2f');
INSERT INTO `model_nation` VALUES ('550', '210600', '', '丹东市', '', '496', '124.383044', '40.124296', 'wz0kq2kuyy');
INSERT INTO `model_nation` VALUES ('551', '210601', '', '', '市辖区', '550', '124.383044', '40.124296', 'wz0kq2kuyy');
INSERT INTO `model_nation` VALUES ('552', '210602', '', '', '元宝区', '550', '124.397814', '40.136483', 'wz0kqdxezn');
INSERT INTO `model_nation` VALUES ('553', '210603', '', '', '振兴区', '550', '124.361153', '40.102801', 'wz0kjump8z');
INSERT INTO `model_nation` VALUES ('554', '210604', '', '', '振安区', '550', '124.427709', '40.158557', 'wz0krqtkxc');
INSERT INTO `model_nation` VALUES ('555', '210624', '', '', '宽甸满族自治县', '550', '124.784867', '40.730412', 'wz0xxw9xf5');
INSERT INTO `model_nation` VALUES ('556', '210681', '', '', '东港市', '550', '124.149437', '39.883467', 'wz06chdf59');
INSERT INTO `model_nation` VALUES ('557', '210682', '', '', '凤城市', '550', '124.071067', '40.457567', 'wz0npm1f3m');
INSERT INTO `model_nation` VALUES ('558', '210700', '', '锦州市', '', '496', '121.135742', '41.119269', 'wxq1ut8357');
INSERT INTO `model_nation` VALUES ('559', '210701', '', '', '市辖区', '558', '121.135742', '41.119269', 'wxq1ut8357');
INSERT INTO `model_nation` VALUES ('560', '210702', '', '', '古塔区', '558', '121.130085', '41.115719', 'wxq1ukuhrt');
INSERT INTO `model_nation` VALUES ('561', '210703', '', '', '凌河区', '558', '121.151304', '41.114662', 'wxq1uuewmb');
INSERT INTO `model_nation` VALUES ('562', '210711', '', '', '太和区', '558', '121.107297', '41.105378', 'wxq1gg58ht');
INSERT INTO `model_nation` VALUES ('563', '210726', '', '', '黑山县', '558', '122.117915', '41.691804', 'wxqv4vg83e');
INSERT INTO `model_nation` VALUES ('564', '210727', '', '', '义县', '558', '121.242831', '41.537224', 'wxqhqcw7fe');
INSERT INTO `model_nation` VALUES ('565', '210781', '', '', '凌海市', '558', '121.364236', '41.171738', 'wxq61xndz8');
INSERT INTO `model_nation` VALUES ('566', '210782', '', '', '北镇市', '558', '121.795962', '41.598764', 'wxqsesc47e');
INSERT INTO `model_nation` VALUES ('567', '210800', '', '营口市', '', '496', '122.235151', '40.667432', 'wxnzme2bvq');
INSERT INTO `model_nation` VALUES ('568', '210801', '', '', '市辖区', '567', '122.235151', '40.667432', 'wxnzme2bvq');
INSERT INTO `model_nation` VALUES ('569', '210802', '', '', '站前区', '567', '122.253235', '40.669949', 'wxnzmgwpdg');
INSERT INTO `model_nation` VALUES ('570', '210803', '', '', '西市区', '567', '122.210067', '40.663086', 'wxnzkfqxsu');
INSERT INTO `model_nation` VALUES ('571', '210804', '', '', '鲅鱼圈区', '567', '122.127242', '40.263646', 'wxnv51f2dz');
INSERT INTO `model_nation` VALUES ('572', '210811', '', '', '老边区', '567', '122.382584', '40.682723', 'wxpp2yh60c');
INSERT INTO `model_nation` VALUES ('573', '210881', '', '', '盖州市', '567', '122.355534', '40.405234', 'wxpjb789d9');
INSERT INTO `model_nation` VALUES ('574', '210882', '', '', '大石桥市', '567', '122.505894', '40.633973', 'wxpp5tnn41');
INSERT INTO `model_nation` VALUES ('575', '210900', '', '阜新市', '', '496', '121.648962', '42.011796', 'wxqx00n06q');
INSERT INTO `model_nation` VALUES ('576', '210901', '', '', '市辖区', '575', '121.648962', '42.011796', 'wxqx00n06q');
INSERT INTO `model_nation` VALUES ('577', '210902', '', '', '海州区', '575', '121.657639', '42.011162', 'wxqwbruku2');
INSERT INTO `model_nation` VALUES ('578', '210903', '', '', '新邱区', '575', '121.790541', '42.086603', 'wxqx7mthjr');
INSERT INTO `model_nation` VALUES ('579', '210904', '', '', '太平区', '575', '121.677575', '42.011145', 'wxqwbzfusv');
INSERT INTO `model_nation` VALUES ('580', '210905', '', '', '清河门区', '575', '121.42018', '41.780477', 'wxqmdvzkzm');
INSERT INTO `model_nation` VALUES ('581', '210911', '', '', '细河区', '575', '121.654791', '42.019218', 'wxqx0367dj');
INSERT INTO `model_nation` VALUES ('582', '210921', '', '', '阜新蒙古族自治县', '575', '121.743125', '42.058607', 'wxqx62d9hk');
INSERT INTO `model_nation` VALUES ('583', '210922', '', '', '彰武县', '575', '122.537444', '42.384823', 'wxx1h7vj3r');
INSERT INTO `model_nation` VALUES ('584', '211000', '', '辽阳市', '', '496', '123.18152', '41.269402', 'wxrdg0f59q');
INSERT INTO `model_nation` VALUES ('585', '211001', '', '', '市辖区', '584', '123.18152', '41.269402', 'wxrdg0f59q');
INSERT INTO `model_nation` VALUES ('586', '211002', '', '', '白塔区', '584', '123.172611', '41.26745', 'wxrdfbe83f');
INSERT INTO `model_nation` VALUES ('587', '211003', '', '', '文圣区', '584', '123.188227', '41.266765', 'wxrdg0qumd');
INSERT INTO `model_nation` VALUES ('588', '211004', '', '', '宏伟区', '584', '123.200461', '41.205747', 'wxrd7mrbfg');
INSERT INTO `model_nation` VALUES ('589', '211005', '', '', '弓长岭区', '584', '123.431633', '41.157831', 'wxrf0u81tx');
INSERT INTO `model_nation` VALUES ('590', '211011', '', '', '太子河区', '584', '123.185336', '41.251682', 'wxrdejsu6q');
INSERT INTO `model_nation` VALUES ('591', '211021', '', '', '辽阳县', '584', '123.079674', '41.216479', 'wxrd2xpzkk');
INSERT INTO `model_nation` VALUES ('592', '211081', '', '', '灯塔市', '584', '123.325864', '41.427836', 'wxrewmensu');
INSERT INTO `model_nation` VALUES ('593', '211100', '', '盘锦市', '', '496', '122.06957', '41.124484', 'wxqccy2r7p');
INSERT INTO `model_nation` VALUES ('594', '211101', '', '', '市辖区', '593', '122.06957', '41.124484', 'wxqccy2r7p');
INSERT INTO `model_nation` VALUES ('595', '211102', '', '', '双台子区', '593', '122.055733', '41.190365', 'wxqf36qr28');
INSERT INTO `model_nation` VALUES ('596', '211103', '', '', '兴隆台区', '593', '122.071624', '41.122423', 'wxqccy1g7p');
INSERT INTO `model_nation` VALUES ('597', '211121', '', '', '大洼县', '593', '122.071708', '40.994428', 'wxqc1yccug');
INSERT INTO `model_nation` VALUES ('598', '211122', '', '', '盘山县', '593', '121.98528', '41.240701', 'wxqdxgdurp');
INSERT INTO `model_nation` VALUES ('599', '211200', '', '铁岭市', '', '496', '123.844279', '42.290585', 'wz80d4u8sb');
INSERT INTO `model_nation` VALUES ('600', '211201', '', '', '市辖区', '599', '123.844279', '42.290585', 'wz80d4u8sb');
INSERT INTO `model_nation` VALUES ('601', '211202', '', '', '银州区', '599', '123.844877', '42.292278', 'wz80d5j46u');
INSERT INTO `model_nation` VALUES ('602', '211204', '', '', '清河区', '599', '124.14896', '42.542978', 'wz8610dwb3');
INSERT INTO `model_nation` VALUES ('603', '211221', '', '', '铁岭县', '599', '123.725669', '42.223316', 'wxxbpqw29h');
INSERT INTO `model_nation` VALUES ('604', '211223', '', '', '西丰县', '599', '124.72332', '42.738091', 'wz8enhhxrv');
INSERT INTO `model_nation` VALUES ('605', '211224', '', '', '昌图县', '599', '124.11017', '42.784441', 'wz872hwm2t');
INSERT INTO `model_nation` VALUES ('606', '211281', '', '', '调兵山市', '599', '123.545366', '42.450734', 'wxxc7rfvrw');
INSERT INTO `model_nation` VALUES ('607', '211282', '', '', '开原市', '599', '124.045551', '42.542141', 'wz84n8x1yv');
INSERT INTO `model_nation` VALUES ('608', '211300', '', '朝阳市', '', '496', '120.451176', '41.576758', 'wxmssbvf5v');
INSERT INTO `model_nation` VALUES ('609', '211301', '', '', '市辖区', '608', '120.451176', '41.576758', 'wxmssbvf5v');
INSERT INTO `model_nation` VALUES ('610', '211302', '', '', '双塔区', '608', '120.44877', '41.579389', 'wxmssck17z');
INSERT INTO `model_nation` VALUES ('611', '211303', '', '', '龙城区', '608', '120.413376', '41.576749', 'wxmss0f655');
INSERT INTO `model_nation` VALUES ('612', '211321', '', '', '朝阳县', '608', '120.404217', '41.526342', 'wxms5zesmx');
INSERT INTO `model_nation` VALUES ('613', '211322', '', '', '建平县', '608', '119.642363', '41.402576', 'wxm5d90gmp');
INSERT INTO `model_nation` VALUES ('614', '211324', '', '', '喀喇沁左翼蒙古族自治县', '608', '119.744883', '41.125428', 'wxm1uyesfp');
INSERT INTO `model_nation` VALUES ('615', '211381', '', '', '北票市', '608', '120.766951', '41.803286', 'wxmvu45ccc');
INSERT INTO `model_nation` VALUES ('616', '211382', '', '', '凌源市', '608', '119.404789', '41.243086', 'wxkfth5fmh');
INSERT INTO `model_nation` VALUES ('617', '211400', '', '葫芦岛市', '', '496', '120.856394', '40.755572', 'wxjzy5kfqj');
INSERT INTO `model_nation` VALUES ('618', '211401', '', '', '市辖区', '617', '120.856394', '40.755572', 'wxjzy5kfqj');
INSERT INTO `model_nation` VALUES ('619', '211402', '', '', '连山区', '617', '120.85937', '40.755143', 'wxjzy5ppgm');
INSERT INTO `model_nation` VALUES ('620', '211403', '', '', '龙港区', '617', '120.838569', '40.709991', 'wxjztepbys');
INSERT INTO `model_nation` VALUES ('621', '211404', '', '', '南票区', '617', '120.752314', '41.098813', 'wxmcgcc1uy');
INSERT INTO `model_nation` VALUES ('622', '211421', '', '', '绥中县', '617', '120.342112', '40.328407', 'wxjt6mw3yr');
INSERT INTO `model_nation` VALUES ('623', '211422', '', '', '建昌县', '617', '119.807776', '40.812871', 'wxm0nmc25w');
INSERT INTO `model_nation` VALUES ('624', '211481', '', '', '兴城市', '617', '120.729365', '40.619413', 'wxjz5683np');
INSERT INTO `model_nation` VALUES ('625', '220000', '吉林省', '', '', '1', '125.3245', '43.886841', 'wzc1ev6e2s');
INSERT INTO `model_nation` VALUES ('626', '220100', '', '长春市', '', '625', '125.3245', '43.886841', 'wzc1ev6e2s');
INSERT INTO `model_nation` VALUES ('627', '220101', '', '', '市辖区', '626', '125.3245', '43.886841', 'wzc1ev6e2s');
INSERT INTO `model_nation` VALUES ('628', '220102', '', '', '南关区', '626', '125.337237', '43.890235', 'wzc1sjgz1k');
INSERT INTO `model_nation` VALUES ('629', '220103', '', '', '宽城区', '626', '125.342828', '43.903823', 'wzc1u0ry79');
INSERT INTO `model_nation` VALUES ('630', '220104', '', '', '朝阳区', '626', '125.318042', '43.86491', 'wzc1e9mgd5');
INSERT INTO `model_nation` VALUES ('631', '220105', '', '', '二道区', '626', '125.384727', '43.870824', 'wzc1t4qq5f');
INSERT INTO `model_nation` VALUES ('632', '220106', '', '', '绿园区', '626', '125.272467', '43.892177', 'wzc1dwkdkn');
INSERT INTO `model_nation` VALUES ('633', '220112', '', '', '双阳区', '626', '125.659018', '43.525168', 'wz9re7w07r');
INSERT INTO `model_nation` VALUES ('634', '220113', '', '', '九台区', '626', '125.3245', '43.886841', 'wzc1ev6e2s');
INSERT INTO `model_nation` VALUES ('635', '220122', '', '', '农安县', '626', '125.175287', '44.431258', 'wzchb2mygd');
INSERT INTO `model_nation` VALUES ('636', '220182', '', '', '榆树市', '626', '126.550107', '44.827642', 'wzczp8wgzn');
INSERT INTO `model_nation` VALUES ('637', '220183', '', '', '德惠市', '626', '125.703327', '44.533909', 'wzcmk7nkgf');
INSERT INTO `model_nation` VALUES ('638', '220200', '', '吉林市', '', '625', '126.55302', '43.843577', 'wzccrv3p75');
INSERT INTO `model_nation` VALUES ('639', '220201', '', '', '市辖区', '638', '126.55302', '43.843577', 'wzccrv3p75');
INSERT INTO `model_nation` VALUES ('640', '220202', '', '', '昌邑区', '638', '126.570766', '43.851118', 'wzf12ny528');
INSERT INTO `model_nation` VALUES ('641', '220203', '', '', '龙潭区', '638', '126.561429', '43.909755', 'wzcczcx0z5');
INSERT INTO `model_nation` VALUES ('642', '220204', '', '', '船营区', '638', '126.55239', '43.843804', 'wzccrv88sm');
INSERT INTO `model_nation` VALUES ('643', '220211', '', '', '丰满区', '638', '126.560759', '43.816594', 'wzccrbwdpm');
INSERT INTO `model_nation` VALUES ('644', '220221', '', '', '永吉县', '638', '126.501622', '43.667416', 'wzcbqt7tjk');
INSERT INTO `model_nation` VALUES ('645', '220281', '', '', '蛟河市', '638', '127.342739', '43.720579', 'wzf89z04uf');
INSERT INTO `model_nation` VALUES ('646', '220282', '', '', '桦甸市', '638', '126.745445', '42.972093', 'wzdhknv4wf');
INSERT INTO `model_nation` VALUES ('647', '220283', '', '', '舒兰市', '638', '126.947813', '44.410906', 'wzfk8ub862');
INSERT INTO `model_nation` VALUES ('648', '220284', '', '', '磐石市', '638', '126.059929', '42.942476', 'wz9sk96n11');
INSERT INTO `model_nation` VALUES ('649', '220300', '', '四平市', '', '625', '124.370785', '43.170344', 'wz8mw4uj3r');
INSERT INTO `model_nation` VALUES ('650', '220301', '', '', '市辖区', '649', '124.370785', '43.170344', 'wz8mw4uj3r');
INSERT INTO `model_nation` VALUES ('651', '220302', '', '', '铁西区', '649', '124.360894', '43.176263', 'wz8mtguzfy');
INSERT INTO `model_nation` VALUES ('652', '220303', '', '', '铁东区', '649', '124.388464', '43.16726', 'wz8mwd2gt2');
INSERT INTO `model_nation` VALUES ('653', '220322', '', '', '梨树县', '649', '124.335802', '43.30831', 'wz8qmk494n');
INSERT INTO `model_nation` VALUES ('654', '220323', '', '', '伊通满族自治县', '649', '125.303124', '43.345464', 'wz9ne6fcwk');
INSERT INTO `model_nation` VALUES ('655', '220381', '', '', '公主岭市', '649', '124.817588', '43.509474', 'wz8z829mh9');
INSERT INTO `model_nation` VALUES ('656', '220382', '', '', '双辽市', '649', '123.505283', '43.518275', 'wxxzd6mb3d');
INSERT INTO `model_nation` VALUES ('657', '220400', '', '辽源市', '', '625', '125.145349', '42.902692', 'wz8upf0n3c');
INSERT INTO `model_nation` VALUES ('658', '220401', '', '', '市辖区', '657', '125.145349', '42.902692', 'wz8upf0n3c');
INSERT INTO `model_nation` VALUES ('659', '220402', '', '', '龙山区', '657', '125.145164', '42.902702', 'wz8updpyme');
INSERT INTO `model_nation` VALUES ('660', '220403', '', '', '西安区', '657', '125.151424', '42.920415', 'wz8upvkmx9');
INSERT INTO `model_nation` VALUES ('661', '220421', '', '', '东丰县', '657', '125.529623', '42.675228', 'wz96b2zchp');
INSERT INTO `model_nation` VALUES ('662', '220422', '', '', '东辽县', '657', '124.991995', '42.927724', 'wz8uhqb2he');
INSERT INTO `model_nation` VALUES ('663', '220500', '', '通化市', '', '625', '125.936501', '41.721177', 'wz3t3g05mp');
INSERT INTO `model_nation` VALUES ('664', '220501', '', '', '市辖区', '663', '125.936501', '41.721177', 'wz3t3g05mp');
INSERT INTO `model_nation` VALUES ('665', '220502', '', '', '东昌区', '663', '125.936716', '41.721233', 'wz3t3g07f1');
INSERT INTO `model_nation` VALUES ('666', '220503', '', '', '二道江区', '663', '126.045987', '41.777564', 'wz3tsjrguq');
INSERT INTO `model_nation` VALUES ('667', '220521', '', '', '通化县', '663', '125.753121', '41.677918', 'wz3mje4xkp');
INSERT INTO `model_nation` VALUES ('668', '220523', '', '', '辉南县', '663', '126.042821', '42.683459', 'wz9du4m94t');
INSERT INTO `model_nation` VALUES ('669', '220524', '', '', '柳河县', '663', '125.740536', '42.281484', 'wz92t317qz');
INSERT INTO `model_nation` VALUES ('670', '220581', '', '', '梅河口市', '663', '125.687336', '42.530002', 'wz93un6epp');
INSERT INTO `model_nation` VALUES ('671', '220582', '', '', '集安市', '663', '126.186204', '41.126276', 'wz39zqvczt');
INSERT INTO `model_nation` VALUES ('672', '220600', '', '白山市', '', '625', '126.427839', '41.942505', 'wz3ysgmuy1');
INSERT INTO `model_nation` VALUES ('673', '220601', '', '', '市辖区', '672', '126.427839', '41.942505', 'wz3ysgmuy1');
INSERT INTO `model_nation` VALUES ('674', '220602', '', '', '浑江区', '672', '126.428035', '41.943065', 'wz3ysgw04d');
INSERT INTO `model_nation` VALUES ('675', '220605', '', '', '江源区', '672', '126.584229', '42.048109', 'wz6p0qxgfr');
INSERT INTO `model_nation` VALUES ('676', '220621', '', '', '抚松县', '672', '127.273796', '42.332643', 'wzd8b4mvw2');
INSERT INTO `model_nation` VALUES ('677', '220622', '', '', '靖宇县', '672', '126.808386', '42.389689', 'wzd1jsg1cd');
INSERT INTO `model_nation` VALUES ('678', '220623', '', '', '长白朝鲜族自治县', '672', '128.203384', '41.419361', 'wz75tk4v72');
INSERT INTO `model_nation` VALUES ('679', '220681', '', '', '临江市', '672', '126.919296', '41.810689', 'wz6mb57ucv');
INSERT INTO `model_nation` VALUES ('680', '220700', '', '松原市', '', '625', '124.823608', '45.118243', 'yb0b8mtbbf');
INSERT INTO `model_nation` VALUES ('681', '220701', '', '', '市辖区', '680', '124.823608', '45.118243', 'yb0b8mtbbf');
INSERT INTO `model_nation` VALUES ('682', '220702', '', '', '宁江区', '680', '124.827851', '45.176498', 'yb0c080u5t');
INSERT INTO `model_nation` VALUES ('683', '220721', '', '', '前郭尔罗斯蒙古族自治县', '680', '124.826808', '45.116288', 'yb0b8t0j7m');
INSERT INTO `model_nation` VALUES ('684', '220722', '', '', '长岭县', '680', '123.985184', '44.276579', 'wzb5vk73b0');
INSERT INTO `model_nation` VALUES ('685', '220723', '', '', '乾安县', '680', '124.024361', '45.006846', 'yb00n1pzch');
INSERT INTO `model_nation` VALUES ('686', '220781', '', '', '扶余市', '680', '126.042758', '44.986199', 'wzcxujmx95');
INSERT INTO `model_nation` VALUES ('687', '220800', '', '白城市', '', '625', '122.841114', '45.619026', 'y8p7e2dnj6');
INSERT INTO `model_nation` VALUES ('688', '220801', '', '', '市辖区', '687', '122.841114', '45.619026', 'y8p7e2dnj6');
INSERT INTO `model_nation` VALUES ('689', '220802', '', '', '洮北区', '687', '122.842499', '45.619253', 'y8p7e2epmt');
INSERT INTO `model_nation` VALUES ('690', '220821', '', '', '镇赉县', '687', '123.202246', '45.846089', 'y8psgd10u6');
INSERT INTO `model_nation` VALUES ('691', '220822', '', '', '通榆县', '687', '123.088543', '44.80915', 'wxzwbvq24y');
INSERT INTO `model_nation` VALUES ('692', '220881', '', '', '洮南市', '687', '122.783779', '45.339113', 'y8p3fj8rmr');
INSERT INTO `model_nation` VALUES ('693', '220882', '', '', '大安市', '687', '124.291512', '45.507648', 'yb06uk6m60');
INSERT INTO `model_nation` VALUES ('694', '222400', '', '延边朝鲜族自治州', '', '625', '129.513228', '42.904823', 'wzsh54sdsy');
INSERT INTO `model_nation` VALUES ('695', '222401', '', '', '延吉市', '694', '129.51579', '42.906964', 'wzsh54yx0t');
INSERT INTO `model_nation` VALUES ('696', '222402', '', '', '图们市', '694', '129.846701', '42.966621', 'wzsk6tz6xq');
INSERT INTO `model_nation` VALUES ('697', '222403', '', '', '敦化市', '694', '128.22986', '43.366921', 'wzentywnsk');
INSERT INTO `model_nation` VALUES ('698', '222404', '', '', '珲春市', '694', '130.365787', '42.871057', 'wzseys3qp0');
INSERT INTO `model_nation` VALUES ('699', '222405', '', '', '龙井市', '694', '129.425747', '42.771029', 'wzs534hzq3');
INSERT INTO `model_nation` VALUES ('700', '222406', '', '', '和龙市', '694', '129.008748', '42.547004', 'wzedp9mq38');
INSERT INTO `model_nation` VALUES ('701', '222424', '', '', '汪清县', '694', '129.766161', '43.315426', 'wzsq2vkfds');
INSERT INTO `model_nation` VALUES ('702', '222426', '', '', '安图县', '694', '128.901865', '43.110994', 'wzetm0p7xp');
INSERT INTO `model_nation` VALUES ('703', '230000', '黑龙江省', '', '', '1', '126.642464', '45.756967', 'yb4h3cf1xk');
INSERT INTO `model_nation` VALUES ('704', '230100', '', '哈尔滨市', '', '703', '126.642464', '45.756967', 'yb4h3cf1xk');
INSERT INTO `model_nation` VALUES ('705', '230101', '', '', '市辖区', '704', '126.642464', '45.756967', 'yb4h3cf1xk');
INSERT INTO `model_nation` VALUES ('706', '230102', '', '', '道里区', '704', '126.612532', '45.762035', 'yb4h34srjv');
INSERT INTO `model_nation` VALUES ('707', '230103', '', '', '南岗区', '704', '126.652098', '45.755971', 'yb4h6195zg');
INSERT INTO `model_nation` VALUES ('708', '230104', '', '', '道外区', '704', '126.648838', '45.78454', 'yb4h3yyf7b');
INSERT INTO `model_nation` VALUES ('709', '230108', '', '', '平房区', '704', '126.629257', '45.605567', 'yb453w0xet');
INSERT INTO `model_nation` VALUES ('710', '230109', '', '', '松北区', '704', '126.563066', '45.814656', 'yb4h8h23tn');
INSERT INTO `model_nation` VALUES ('711', '230110', '', '', '香坊区', '704', '126.667049', '45.713067', 'yb4h43u1uj');
INSERT INTO `model_nation` VALUES ('712', '230111', '', '', '呼兰区', '704', '126.603302', '45.98423', 'yb4j8gjtwc');
INSERT INTO `model_nation` VALUES ('713', '230112', '', '', '阿城区', '704', '126.972726', '45.538372', 'yb471648nz');
INSERT INTO `model_nation` VALUES ('714', '230113', '', '', '双城区', '704', '126.642464', '45.756967', 'yb4h3cf1xk');
INSERT INTO `model_nation` VALUES ('715', '230123', '', '', '依兰县', '704', '129.565594', '46.315105', 'ybhpkr6v11');
INSERT INTO `model_nation` VALUES ('716', '230124', '', '', '方正县', '704', '128.836131', '45.839536', 'yb5sg8zdek');
INSERT INTO `model_nation` VALUES ('717', '230125', '', '', '宾县', '704', '127.48594', '45.759369', 'yb4sm40rts');
INSERT INTO `model_nation` VALUES ('718', '230126', '', '', '巴彦县', '704', '127.403602', '46.081889', 'yb4w5huqrn');
INSERT INTO `model_nation` VALUES ('719', '230127', '', '', '木兰县', '704', '128.042675', '45.949826', 'yb5j3svv4s');
INSERT INTO `model_nation` VALUES ('720', '230128', '', '', '通河县', '704', '128.747786', '45.977618', 'yb5t99zr0c');
INSERT INTO `model_nation` VALUES ('721', '230129', '', '', '延寿县', '704', '128.331886', '45.455648', 'yb5686bqmd');
INSERT INTO `model_nation` VALUES ('722', '230183', '', '', '尚志市', '704', '127.968539', '45.214953', 'yb4cpzpu5n');
INSERT INTO `model_nation` VALUES ('723', '230184', '', '', '五常市', '704', '127.15759', '44.919418', 'wzfrt936dd');
INSERT INTO `model_nation` VALUES ('724', '230200', '', '齐齐哈尔市', '', '703', '123.95792', '47.342081', 'yb2jkdr7sg');
INSERT INTO `model_nation` VALUES ('725', '230201', '', '', '市辖区', '724', '123.95792', '47.342081', 'yb2jkdr7sg');
INSERT INTO `model_nation` VALUES ('726', '230202', '', '', '龙沙区', '724', '123.957338', '47.341736', 'yb2jkdqcx7');
INSERT INTO `model_nation` VALUES ('727', '230203', '', '', '建华区', '724', '123.955888', '47.354494', 'yb2jkstgvt');
INSERT INTO `model_nation` VALUES ('728', '230204', '', '', '铁锋区', '724', '123.973555', '47.339499', 'yb2jm1fu94');
INSERT INTO `model_nation` VALUES ('729', '230205', '', '', '昂昂溪区', '724', '123.813181', '47.156867', 'yb2h32wh8j');
INSERT INTO `model_nation` VALUES ('730', '230206', '', '', '富拉尔基区', '724', '123.638873', '47.20697', 'y8rut3z0d9');
INSERT INTO `model_nation` VALUES ('731', '230207', '', '', '碾子山区', '724', '122.887972', '47.51401', 'y8rqk3sm1m');
INSERT INTO `model_nation` VALUES ('732', '230208', '', '', '梅里斯达斡尔族区', '724', '123.754599', '47.311113', 'yb2j0her5n');
INSERT INTO `model_nation` VALUES ('733', '230221', '', '', '龙江县', '724', '123.187225', '47.336388', 'y8rt71q4qq');
INSERT INTO `model_nation` VALUES ('734', '230223', '', '', '依安县', '724', '125.307561', '47.890098', 'yb907qnhjc');
INSERT INTO `model_nation` VALUES ('735', '230224', '', '', '泰来县', '724', '123.41953', '46.39233', 'y8pzbmrqgm');
INSERT INTO `model_nation` VALUES ('736', '230225', '', '', '甘南县', '724', '123.506034', '47.917838', 'y8xbd7nmeh');
INSERT INTO `model_nation` VALUES ('737', '230227', '', '', '富裕县', '724', '124.469106', '47.797172', 'yb2xbm5wsq');
INSERT INTO `model_nation` VALUES ('738', '230229', '', '', '克山县', '724', '125.874355', '48.034342', 'yb99226um4');
INSERT INTO `model_nation` VALUES ('739', '230230', '', '', '克东县', '724', '126.249094', '48.03732', 'yb9c2bgv9j');
INSERT INTO `model_nation` VALUES ('740', '230231', '', '', '拜泉县', '724', '126.091911', '47.607363', 'yb3wv69kfr');
INSERT INTO `model_nation` VALUES ('741', '230281', '', '', '讷河市', '724', '124.882172', '48.481133', 'yb8gcc8rjd');
INSERT INTO `model_nation` VALUES ('742', '230300', '', '鸡西市', '', '703', '130.975966', '45.300046', 'ybj1sqtgch');
INSERT INTO `model_nation` VALUES ('743', '230301', '', '', '市辖区', '742', '130.975966', '45.300046', 'ybj1sqtgch');
INSERT INTO `model_nation` VALUES ('744', '230302', '', '', '鸡冠区', '742', '130.974374', '45.30034', 'ybj1sqsts5');
INSERT INTO `model_nation` VALUES ('745', '230303', '', '', '恒山区', '742', '130.910636', '45.213242', 'ybj14yy4nz');
INSERT INTO `model_nation` VALUES ('746', '230304', '', '', '滴道区', '742', '130.846823', '45.348812', 'ybj1crrxzz');
INSERT INTO `model_nation` VALUES ('747', '230305', '', '', '梨树区', '742', '130.697781', '45.092195', 'ybhbw0g1p4');
INSERT INTO `model_nation` VALUES ('748', '230306', '', '', '城子河区', '742', '131.010501', '45.338248', 'ybj1vjwfmv');
INSERT INTO `model_nation` VALUES ('749', '230307', '', '', '麻山区', '742', '130.481126', '45.209607', 'ybhc1njmn9');
INSERT INTO `model_nation` VALUES ('750', '230321', '', '', '鸡东县', '742', '131.148907', '45.250892', 'ybj32metx1');
INSERT INTO `model_nation` VALUES ('751', '230381', '', '', '虎林市', '742', '132.973881', '45.767985', 'ybns3gu9u4');
INSERT INTO `model_nation` VALUES ('752', '230382', '', '', '密山市', '742', '131.874137', '45.54725', 'ybjg0gegfn');
INSERT INTO `model_nation` VALUES ('753', '230400', '', '鹤岗市', '', '703', '130.277487', '47.332085', 'ybktk891mk');
INSERT INTO `model_nation` VALUES ('754', '230401', '', '', '市辖区', '753', '130.277487', '47.332085', 'ybktk891mk');
INSERT INTO `model_nation` VALUES ('755', '230402', '', '', '向阳区', '753', '130.292478', '47.345372', 'ybktkfunfc');
INSERT INTO `model_nation` VALUES ('756', '230403', '', '', '工农区', '753', '130.276652', '47.331678', 'ybktk82x40');
INSERT INTO `model_nation` VALUES ('757', '230404', '', '', '南山区', '753', '130.275533', '47.31324', 'ybkthmpexg');
INSERT INTO `model_nation` VALUES ('758', '230405', '', '', '兴安区', '753', '130.236169', '47.252911', 'ybksgd5h4t');
INSERT INTO `model_nation` VALUES ('759', '230406', '', '', '东山区', '753', '130.31714', '47.337385', 'ybktm3w032');
INSERT INTO `model_nation` VALUES ('760', '230407', '', '', '兴山区', '753', '130.30534', '47.35997', 'ybktmjt7y6');
INSERT INTO `model_nation` VALUES ('761', '230421', '', '', '萝北县', '753', '130.829087', '47.577577', 'ybmn9j4z6x');
INSERT INTO `model_nation` VALUES ('762', '230422', '', '', '绥滨县', '753', '131.860526', '47.289892', 'ybmv08cgsf');
INSERT INTO `model_nation` VALUES ('763', '230500', '', '双鸭山市', '', '703', '131.157304', '46.643442', 'ybm32e1vdx');
INSERT INTO `model_nation` VALUES ('764', '230501', '', '', '市辖区', '763', '131.157304', '46.643442', 'ybm32e1vdx');
INSERT INTO `model_nation` VALUES ('765', '230502', '', '', '尖山区', '763', '131.15896', '46.642961', 'ybm32e54cq');
INSERT INTO `model_nation` VALUES ('766', '230503', '', '', '岭东区', '763', '131.163675', '46.591076', 'ybm309wkxn');
INSERT INTO `model_nation` VALUES ('767', '230505', '', '', '四方台区', '763', '131.333181', '46.594347', 'ybm3hd1zsz');
INSERT INTO `model_nation` VALUES ('768', '230506', '', '', '宝山区', '763', '131.404294', '46.573366', 'ybm2ynmttb');
INSERT INTO `model_nation` VALUES ('769', '230521', '', '', '集贤县', '763', '131.13933', '46.72898', 'ybm3b4u8pc');
INSERT INTO `model_nation` VALUES ('770', '230522', '', '', '友谊县', '763', '131.810622', '46.775159', 'ybmdp7jt41');
INSERT INTO `model_nation` VALUES ('771', '230523', '', '', '宝清县', '763', '132.206415', '46.328781', 'ybnp83vu8y');
INSERT INTO `model_nation` VALUES ('772', '230524', '', '', '饶河县', '763', '134.021162', '46.801288', 'ybr61xzjr2');
INSERT INTO `model_nation` VALUES ('773', '230600', '', '大庆市', '', '703', '125.11272', '46.590734', 'yb2cp1869w');
INSERT INTO `model_nation` VALUES ('774', '230601', '', '', '市辖区', '773', '125.11272', '46.590734', 'yb2cp1869w');
INSERT INTO `model_nation` VALUES ('775', '230602', '', '', '萨尔图区', '773', '125.114643', '46.596356', 'yb2cp49eqq');
INSERT INTO `model_nation` VALUES ('776', '230603', '', '', '龙凤区', '773', '125.145794', '46.573948', 'yb2bzy82um');
INSERT INTO `model_nation` VALUES ('777', '230604', '', '', '让胡路区', '773', '124.868341', '46.653254', 'yb2c3kyqgh');
INSERT INTO `model_nation` VALUES ('778', '230605', '', '', '红岗区', '773', '124.889528', '46.403049', 'yb0zczmv2g');
INSERT INTO `model_nation` VALUES ('779', '230606', '', '', '大同区', '773', '124.818509', '46.034304', 'yb0vbk6160');
INSERT INTO `model_nation` VALUES ('780', '230621', '', '', '肇州县', '773', '125.273254', '45.708685', 'yb1h49j0qk');
INSERT INTO `model_nation` VALUES ('781', '230622', '', '', '肇源县', '773', '125.081974', '45.518832', 'yb0fyq3ymj');
INSERT INTO `model_nation` VALUES ('782', '230623', '', '', '林甸县', '773', '124.877742', '47.186411', 'yb2u3wj0y2');
INSERT INTO `model_nation` VALUES ('783', '230624', '', '', '杜尔伯特蒙古族自治县', '773', '124.446259', '46.865973', 'yb26xgen04');
INSERT INTO `model_nation` VALUES ('784', '230700', '', '伊春市', '', '703', '128.899396', '47.724775', 'yb7xt0j8vw');
INSERT INTO `model_nation` VALUES ('785', '230701', '', '', '市辖区', '784', '128.899396', '47.724775', 'yb7xt0j8vw');
INSERT INTO `model_nation` VALUES ('786', '230702', '', '', '伊春区', '784', '128.899284', '47.726851', 'yb7xt0mt51');
INSERT INTO `model_nation` VALUES ('787', '230703', '', '', '南岔区', '784', '129.28246', '47.137314', 'yb7ujvhdg8');
INSERT INTO `model_nation` VALUES ('788', '230704', '', '', '友好区', '784', '128.838961', '47.854303', 'ybe85z9et2');
INSERT INTO `model_nation` VALUES ('789', '230705', '', '', '西林区', '784', '129.311441', '47.479437', 'yb7yne3eyb');
INSERT INTO `model_nation` VALUES ('790', '230706', '', '', '翠峦区', '784', '128.671746', '47.726228', 'yb7rxbrckv');
INSERT INTO `model_nation` VALUES ('791', '230707', '', '', '新青区', '784', '129.52995', '48.288292', 'ybs4ew8gdw');
INSERT INTO `model_nation` VALUES ('792', '230708', '', '', '美溪区', '784', '129.133411', '47.636102', 'yb7yfxbh6t');
INSERT INTO `model_nation` VALUES ('793', '230709', '', '', '金山屯区', '784', '129.435944', '47.41295', 'ybkj9rk2kn');
INSERT INTO `model_nation` VALUES ('794', '230710', '', '', '五营区', '784', '129.245028', '48.108204', 'ybectjc6e7');
INSERT INTO `model_nation` VALUES ('795', '230711', '', '', '乌马河区', '784', '128.802941', '47.726961', 'yb7xdbrmwn');
INSERT INTO `model_nation` VALUES ('796', '230712', '', '', '汤旺河区', '784', '129.57224', '48.453651', 'ybs5skxwup');
INSERT INTO `model_nation` VALUES ('797', '230713', '', '', '带岭区', '784', '129.021151', '47.027532', 'yb7excn74x');
INSERT INTO `model_nation` VALUES ('798', '230714', '', '', '乌伊岭区', '784', '129.437847', '48.59112', 'ybsh3mtzb3');
INSERT INTO `model_nation` VALUES ('799', '230715', '', '', '红星区', '784', '129.388796', '48.238368', 'ybs42md0c7');
INSERT INTO `model_nation` VALUES ('800', '230716', '', '', '上甘岭区', '784', '129.02508', '47.974859', 'ybebbj91y3');
INSERT INTO `model_nation` VALUES ('801', '230722', '', '', '嘉荫县', '784', '130.397684', '48.891378', 'ybswpk2sym');
INSERT INTO `model_nation` VALUES ('802', '230781', '', '', '铁力市', '784', '128.030561', '46.985772', 'yb7533mpbq');
INSERT INTO `model_nation` VALUES ('803', '230800', '', '佳木斯市', '', '703', '130.361634', '46.809606', 'ybkdq3qmwp');
INSERT INTO `model_nation` VALUES ('804', '230801', '', '', '市辖区', '803', '130.361634', '46.809606', 'ybkdq3qmwp');
INSERT INTO `model_nation` VALUES ('805', '230803', '', '', '向阳区', '803', '130.361786', '46.809645', 'ybkdq3qtcy');
INSERT INTO `model_nation` VALUES ('806', '230804', '', '', '前进区', '803', '130.377684', '46.812345', 'ybkdqcfjsj');
INSERT INTO `model_nation` VALUES ('807', '230805', '', '', '东风区', '803', '130.403297', '46.822476', 'ybkdr7ub9n');
INSERT INTO `model_nation` VALUES ('808', '230811', '', '', '郊区', '803', '130.351588', '46.80712', 'ybkdq0zphp');
INSERT INTO `model_nation` VALUES ('809', '230822', '', '', '桦南县', '803', '130.570112', '46.240118', 'ybhz51y20n');
INSERT INTO `model_nation` VALUES ('810', '230826', '', '', '桦川县', '803', '130.723713', '47.023039', 'ybkgw8q153');
INSERT INTO `model_nation` VALUES ('811', '230828', '', '', '汤原县', '803', '129.904463', '46.730048', 'ybk3u4cw32');
INSERT INTO `model_nation` VALUES ('812', '230833', '', '', '抚远县', '803', '134.294501', '48.364707', 'ybx7puw2bd');
INSERT INTO `model_nation` VALUES ('813', '230881', '', '', '同江市', '803', '132.510119', '47.651131', 'ybqpp6dgvw');
INSERT INTO `model_nation` VALUES ('814', '230882', '', '', '富锦市', '803', '132.037951', '47.250747', 'ybmuu9epe3');
INSERT INTO `model_nation` VALUES ('815', '230900', '', '七台河市', '', '703', '131.015584', '45.771266', 'ybjhmk6suq');
INSERT INTO `model_nation` VALUES ('816', '230901', '', '', '市辖区', '815', '131.015584', '45.771266', 'ybjhmk6suq');
INSERT INTO `model_nation` VALUES ('817', '230902', '', '', '新兴区', '815', '130.889482', '45.794258', 'ybjhd2wfcu');
INSERT INTO `model_nation` VALUES ('818', '230903', '', '', '桃山区', '815', '131.015848', '45.771217', 'ybjhmk6udt');
INSERT INTO `model_nation` VALUES ('819', '230904', '', '', '茄子河区', '815', '131.071561', '45.776587', 'ybjhqt77uw');
INSERT INTO `model_nation` VALUES ('820', '230921', '', '', '勃利县', '815', '130.575025', '45.751573', 'ybhu72cf4x');
INSERT INTO `model_nation` VALUES ('821', '231000', '', '牡丹江市', '', '703', '129.618602', '44.582962', 'wzujts16s6');
INSERT INTO `model_nation` VALUES ('822', '231001', '', '', '市辖区', '821', '129.618602', '44.582962', 'wzujts16s6');
INSERT INTO `model_nation` VALUES ('823', '231002', '', '', '东安区', '821', '129.623292', '44.582399', 'wzujteuz39');
INSERT INTO `model_nation` VALUES ('824', '231003', '', '', '阳明区', '821', '129.634645', '44.596328', 'wzujtyt06n');
INSERT INTO `model_nation` VALUES ('825', '231004', '', '', '爱民区', '821', '129.601232', '44.595443', 'wzujtnker9');
INSERT INTO `model_nation` VALUES ('826', '231005', '', '', '西安区', '821', '129.61311', '44.581032', 'wzujt7trk6');
INSERT INTO `model_nation` VALUES ('827', '231024', '', '', '东宁县', '821', '131.125296', '44.063578', 'wzv4xvd8by');
INSERT INTO `model_nation` VALUES ('828', '231025', '', '', '林口县', '821', '130.268402', '45.286645', 'ybh9sk4tcf');
INSERT INTO `model_nation` VALUES ('829', '231081', '', '', '绥芬河市', '821', '131.164856', '44.396864', 'wzvk8dpq6x');
INSERT INTO `model_nation` VALUES ('830', '231083', '', '', '海林市', '821', '129.387902', '44.574149', 'wzuj863rhx');
INSERT INTO `model_nation` VALUES ('831', '231084', '', '', '宁安市', '821', '129.470019', '44.346836', 'wzuh61j5n1');
INSERT INTO `model_nation` VALUES ('832', '231085', '', '', '穆棱市', '821', '130.527085', '44.91967', 'wzuzd1quj9');
INSERT INTO `model_nation` VALUES ('833', '231100', '', '黑河市', '', '703', '127.499023', '50.249585', 'ybftv79vn9');
INSERT INTO `model_nation` VALUES ('834', '231101', '', '', '市辖区', '833', '127.499023', '50.249585', 'ybftv79vn9');
INSERT INTO `model_nation` VALUES ('835', '231102', '', '', '爱辉区', '833', '127.497639', '50.249027', 'ybftv78cy3');
INSERT INTO `model_nation` VALUES ('836', '231121', '', '', '嫩江县', '833', '125.229904', '49.177461', 'yb9pc8mxkr');
INSERT INTO `model_nation` VALUES ('837', '231123', '', '', '逊克县', '833', '128.476152', '49.582974', 'ybg65d33z2');
INSERT INTO `model_nation` VALUES ('838', '231124', '', '', '孙吴县', '833', '127.327315', '49.423941', 'ybf91mkgm6');
INSERT INTO `model_nation` VALUES ('839', '231181', '', '', '北安市', '833', '126.508737', '48.245437', 'yb9fqybf51');
INSERT INTO `model_nation` VALUES ('840', '231182', '', '', '五大连池市', '833', '126.197694', '48.512688', 'yb9ezxqqgk');
INSERT INTO `model_nation` VALUES ('841', '231200', '', '绥化市', '', '703', '126.99293', '46.637393', 'yb633f16t8');
INSERT INTO `model_nation` VALUES ('842', '231201', '', '', '市辖区', '841', '126.99293', '46.637393', 'yb633f16t8');
INSERT INTO `model_nation` VALUES ('843', '231202', '', '', '北林区', '841', '126.990665', '46.634912', 'yb6339xu0c');
INSERT INTO `model_nation` VALUES ('844', '231221', '', '', '望奎县', '841', '126.484191', '46.83352', 'yb3fqjycp2');
INSERT INTO `model_nation` VALUES ('845', '231222', '', '', '兰西县', '841', '126.289315', '46.259037', 'yb1z1v1n6m');
INSERT INTO `model_nation` VALUES ('846', '231223', '', '', '青冈县', '841', '126.112268', '46.686596', 'yb39tg01hu');
INSERT INTO `model_nation` VALUES ('847', '231224', '', '', '庆安县', '841', '127.510024', '46.879203', 'yb6dtw1gnu');
INSERT INTO `model_nation` VALUES ('848', '231225', '', '', '明水县', '841', '125.907544', '47.183527', 'yb3s3j7pfq');
INSERT INTO `model_nation` VALUES ('849', '231226', '', '', '绥棱县', '841', '127.111121', '47.247195', 'yb6ku3p6zg');
INSERT INTO `model_nation` VALUES ('850', '231281', '', '', '安达市', '841', '125.329926', '46.410614', 'yb305by3qv');
INSERT INTO `model_nation` VALUES ('851', '231282', '', '', '肇东市', '841', '125.991402', '46.069471', 'yb1w548nh7');
INSERT INTO `model_nation` VALUES ('852', '231283', '', '', '海伦市', '841', '126.969383', '47.460428', 'yb6mcrbm11');
INSERT INTO `model_nation` VALUES ('853', '232700', '', '大兴安岭地区', '', '703', '124.711526', '52.335262', 'yc29tzk4vp');
INSERT INTO `model_nation` VALUES ('854', '232721', '', '', '呼玛县', '853', '126.662105', '51.726998', 'yc4n628e8g');
INSERT INTO `model_nation` VALUES ('855', '232722', '', '', '塔河县', '853', '124.710516', '52.335229', 'yc29tz76v9');
INSERT INTO `model_nation` VALUES ('856', '232723', '', '', '漠河县', '853', '122.536256', '52.972074', 'y9rjk7k0tw');
INSERT INTO `model_nation` VALUES ('857', '310000', '上海', '上海市', '', '857', '121.472644', '31.231706', 'wtw3sjt9vg');
INSERT INTO `model_nation` VALUES ('858', '310101', '', '', '黄浦区', '857', '121.490317', '31.222771', 'wtw3seftcd');
INSERT INTO `model_nation` VALUES ('859', '310104', '', '', '徐汇区', '857', '121.43752', '31.179973', 'wtw37khhe2');
INSERT INTO `model_nation` VALUES ('860', '310105', '', '', '长宁区', '857', '121.4222', '31.218123', 'wtw3e50fwr');
INSERT INTO `model_nation` VALUES ('861', '310106', '', '', '静安区', '857', '121.448224', '31.229003', 'wtw3et5fhs');
INSERT INTO `model_nation` VALUES ('862', '310107', '', '', '普陀区', '857', '121.392499', '31.241701', 'wtw3dr7k45');
INSERT INTO `model_nation` VALUES ('863', '310108', '', '', '闸北区', '857', '121.465689', '31.25318', 'wtw3u12wgx');
INSERT INTO `model_nation` VALUES ('864', '310109', '', '', '虹口区', '857', '121.491832', '31.26097', 'wtw3udgskg');
INSERT INTO `model_nation` VALUES ('865', '310110', '', '', '杨浦区', '857', '121.522797', '31.270755', 'wtw3vkdjq7');
INSERT INTO `model_nation` VALUES ('866', '310112', '', '', '闵行区', '857', '121.375972', '31.111658', 'wtw2czxq91');
INSERT INTO `model_nation` VALUES ('867', '310113', '', '', '宝山区', '857', '121.489934', '31.398896', 'wtw6sefrbd');
INSERT INTO `model_nation` VALUES ('868', '310114', '', '', '嘉定区', '857', '121.250333', '31.383524', 'wtw4x15y38');
INSERT INTO `model_nation` VALUES ('869', '310115', '', '', '浦东新区', '857', '121.567706', '31.245944', 'wtw3y24uuf');
INSERT INTO `model_nation` VALUES ('870', '310116', '', '', '金山区', '857', '121.330736', '30.724697', 'wtqqbcq274');
INSERT INTO `model_nation` VALUES ('871', '310117', '', '', '松江区', '857', '121.223543', '31.03047', 'wtw0w8bm96');
INSERT INTO `model_nation` VALUES ('872', '310118', '', '', '青浦区', '857', '121.113021', '31.151209', 'wtw15yzucy');
INSERT INTO `model_nation` VALUES ('873', '310120', '', '', '奉贤区', '857', '121.458472', '30.912345', 'wtqrgg7m7w');
INSERT INTO `model_nation` VALUES ('874', '310230', '', '', '崇明县', '857', '121.397516', '31.626946', 'wtw7fmwbr4');
INSERT INTO `model_nation` VALUES ('875', '320000', '江苏省', '', '', '1', '118.767413', '32.041544', 'wtsqq8gz92');
INSERT INTO `model_nation` VALUES ('876', '320100', '', '南京市', '', '875', '118.767413', '32.041544', 'wtsqq8gz92');
INSERT INTO `model_nation` VALUES ('877', '320101', '', '', '市辖区', '876', '118.767413', '32.041544', 'wtsqq8gz92');
INSERT INTO `model_nation` VALUES ('878', '320102', '', '', '玄武区', '876', '118.792199', '32.050678', 'wtsqr4tudz');
INSERT INTO `model_nation` VALUES ('879', '320104', '', '', '秦淮区', '876', '118.786088', '32.033818', 'wtsqpp96s2');
INSERT INTO `model_nation` VALUES ('880', '320105', '', '', '建邺区', '876', '118.732688', '32.004538', 'wtsqjf4xbn');
INSERT INTO `model_nation` VALUES ('881', '320106', '', '', '鼓楼区', '876', '118.769739', '32.066966', 'wtsqqtt7xe');
INSERT INTO `model_nation` VALUES ('882', '320111', '', '', '浦口区', '876', '118.625307', '32.05839', 'wtsq7kh39v');
INSERT INTO `model_nation` VALUES ('883', '320113', '', '', '栖霞区', '876', '118.808702', '32.102147', 'wtsqxs1be3');
INSERT INTO `model_nation` VALUES ('884', '320114', '', '', '雨花台区', '876', '118.77207', '31.995946', 'wtsqn8xjvu');
INSERT INTO `model_nation` VALUES ('885', '320115', '', '', '江宁区', '876', '118.850621', '31.953418', 'wtstb8bqhh');
INSERT INTO `model_nation` VALUES ('886', '320116', '', '', '六合区', '876', '118.85065', '32.340655', 'wtsxbx2muz');
INSERT INTO `model_nation` VALUES ('887', '320117', '', '', '溧水区', '876', '119.028732', '31.653061', 'wtsshd606q');
INSERT INTO `model_nation` VALUES ('888', '320118', '', '', '高淳区', '876', '118.87589', '31.327132', 'wtsd1nfvc0');
INSERT INTO `model_nation` VALUES ('889', '320200', '', '无锡市', '', '875', '120.301663', '31.574729', 'wtte9s0bpu');
INSERT INTO `model_nation` VALUES ('890', '320201', '', '', '市辖区', '889', '120.301663', '31.574729', 'wtte9s0bpu');
INSERT INTO `model_nation` VALUES ('891', '320202', '', '', '崇安区', '889', '120.301627', '31.574705', 'wtte9ebzzp');
INSERT INTO `model_nation` VALUES ('892', '320203', '', '', '南长区', '889', '120.308448', '31.563759', 'wtte9djbnp');
INSERT INTO `model_nation` VALUES ('893', '320204', '', '', '北塘区', '889', '120.295159', '31.586575', 'wtte9qhm0k');
INSERT INTO `model_nation` VALUES ('894', '320205', '', '', '锡山区', '889', '120.357298', '31.585559', 'wttedvcx0q');
INSERT INTO `model_nation` VALUES ('895', '320206', '', '', '惠山区', '889', '120.303543', '31.681019', 'wtts1x6779');
INSERT INTO `model_nation` VALUES ('896', '320211', '', '', '滨湖区', '889', '120.266053', '31.550228', 'wtte2xx16h');
INSERT INTO `model_nation` VALUES ('897', '320281', '', '', '江阴市', '889', '120.275891', '31.910984', 'wttt8cnnzq');
INSERT INTO `model_nation` VALUES ('898', '320282', '', '', '宜兴市', '889', '119.820538', '31.364384', 'wtt4qtdwub');
INSERT INTO `model_nation` VALUES ('899', '320300', '', '徐州市', '', '875', '117.184811', '34.261792', 'ww56ft5mkh');
INSERT INTO `model_nation` VALUES ('900', '320301', '', '', '市辖区', '899', '117.184811', '34.261792', 'ww56ft5mkh');
INSERT INTO `model_nation` VALUES ('901', '320302', '', '', '鼓楼区', '899', '117.192941', '34.269397', 'ww56fy939q');
INSERT INTO `model_nation` VALUES ('902', '320303', '', '', '云龙区', '899', '117.194589', '34.254805', 'ww56fgfkxy');
INSERT INTO `model_nation` VALUES ('903', '320305', '', '', '贾汪区', '899', '117.450212', '34.441642', 'ww5ebtuth7');
INSERT INTO `model_nation` VALUES ('904', '320311', '', '', '泉山区', '899', '117.182225', '34.262249', 'ww56ft32pf');
INSERT INTO `model_nation` VALUES ('905', '320312', '', '', '铜山区', '899', '117.183894', '34.19288', 'ww56d8deyw');
INSERT INTO `model_nation` VALUES ('906', '320321', '', '', '丰县', '899', '116.592888', '34.696946', 'ww4vmhkk75');
INSERT INTO `model_nation` VALUES ('907', '320322', '', '', '沛县', '899', '116.937182', '34.729044', 'ww5jsfpp3g');
INSERT INTO `model_nation` VALUES ('908', '320324', '', '', '睢宁县', '899', '117.95066', '33.899222', 'ww5bu51j38');
INSERT INTO `model_nation` VALUES ('909', '320381', '', '', '新沂市', '899', '118.345828', '34.368779', 'wwh5t08u9s');
INSERT INTO `model_nation` VALUES ('910', '320382', '', '', '邳州市', '899', '117.963923', '34.314708', 'ww5ghqf9wt');
INSERT INTO `model_nation` VALUES ('911', '320400', '', '常州市', '', '875', '119.946973', '31.772752', 'wttkc2n9xn');
INSERT INTO `model_nation` VALUES ('912', '320401', '', '', '市辖区', '911', '119.946973', '31.772752', 'wttkc2n9xn');
INSERT INTO `model_nation` VALUES ('913', '320402', '', '', '天宁区', '911', '119.963783', '31.779632', 'wttkcc6cy8');
INSERT INTO `model_nation` VALUES ('914', '320404', '', '', '钟楼区', '911', '119.948388', '31.78096', 'wttkc3xc80');
INSERT INTO `model_nation` VALUES ('915', '320405', '', '', '戚墅堰区', '911', '120.064753', '31.721663', 'wttkknu2pd');
INSERT INTO `model_nation` VALUES ('916', '320411', '', '', '新北区', '911', '119.974654', '31.824664', 'wttm41dbh5');
INSERT INTO `model_nation` VALUES ('917', '320412', '', '', '武进区', '911', '119.958773', '31.718566', 'wttk3wpq41');
INSERT INTO `model_nation` VALUES ('918', '320481', '', '', '溧阳市', '911', '119.487816', '31.427081', 'wtsfz10k5b');
INSERT INTO `model_nation` VALUES ('919', '320482', '', '', '金坛市', '911', '119.573395', '31.744399', 'wtth8fysw0');
INSERT INTO `model_nation` VALUES ('920', '320500', '', '苏州市', '', '875', '120.619585', '31.299379', 'wttf0cbs05');
INSERT INTO `model_nation` VALUES ('921', '320501', '', '', '市辖区', '920', '120.619585', '31.299379', 'wttf0cbs05');
INSERT INTO `model_nation` VALUES ('922', '320505', '', '', '虎丘区', '920', '120.566833', '31.294845', 'wttdp941dv');
INSERT INTO `model_nation` VALUES ('923', '320506', '', '', '吴中区', '920', '120.624621', '31.270839', 'wttcbusjv6');
INSERT INTO `model_nation` VALUES ('924', '320507', '', '', '相城区', '920', '120.618956', '31.396684', 'wttf8g84cq');
INSERT INTO `model_nation` VALUES ('925', '320508', '', '', '姑苏区', '920', '120.622249', '31.311414', 'wttf0u46nn');
INSERT INTO `model_nation` VALUES ('926', '320509', '', '', '吴江区', '920', '120.641601', '31.160404', 'wttc328d90');
INSERT INTO `model_nation` VALUES ('927', '320581', '', '', '常熟市', '920', '120.74852', '31.658156', 'wttu5enqhk');
INSERT INTO `model_nation` VALUES ('928', '320582', '', '', '张家港市', '920', '120.543441', '31.865553', 'wtttr0cn3c');
INSERT INTO `model_nation` VALUES ('929', '320583', '', '', '昆山市', '920', '120.958137', '31.381925', 'wtw482zhby');
INSERT INTO `model_nation` VALUES ('930', '320585', '', '', '太仓市', '920', '121.112275', '31.452568', 'wtw4gvz22x');
INSERT INTO `model_nation` VALUES ('931', '320600', '', '南通市', '', '875', '120.864608', '32.016212', 'wttynk6gvq');
INSERT INTO `model_nation` VALUES ('932', '320601', '', '', '市辖区', '931', '120.864608', '32.016212', 'wttynk6gvq');
INSERT INTO `model_nation` VALUES ('933', '320602', '', '', '崇川区', '931', '120.86635', '32.015278', 'wttynkhnw0');
INSERT INTO `model_nation` VALUES ('934', '320611', '', '', '港闸区', '931', '120.8339', '32.040299', 'wttym8u83b');
INSERT INTO `model_nation` VALUES ('935', '320612', '', '', '通州区', '931', '121.073171', '32.084287', 'wtwne0fb92');
INSERT INTO `model_nation` VALUES ('936', '320621', '', '', '海安县', '931', '120.465995', '32.540289', 'wtv9j7b8vj');
INSERT INTO `model_nation` VALUES ('937', '320623', '', '', '如东县', '931', '121.186088', '32.311832', 'wtwpvdjn0d');
INSERT INTO `model_nation` VALUES ('938', '320681', '', '', '启东市', '931', '121.659724', '31.810158', 'wtwsbqvgt5');
INSERT INTO `model_nation` VALUES ('939', '320682', '', '', '如皋市', '931', '120.566324', '32.391591', 'wtv8r89wwy');
INSERT INTO `model_nation` VALUES ('940', '320684', '', '', '海门市', '931', '121.176609', '31.893528', 'wtwjmqn178');
INSERT INTO `model_nation` VALUES ('941', '320700', '', '连云港市', '', '875', '119.178821', '34.600018', 'wwhszfxrey');
INSERT INTO `model_nation` VALUES ('942', '320701', '', '', '市辖区', '941', '119.178821', '34.600018', 'wwhszfxrey');
INSERT INTO `model_nation` VALUES ('943', '320703', '', '', '连云区', '941', '119.366487', '34.739529', 'wwhvsk0h2t');
INSERT INTO `model_nation` VALUES ('944', '320706', '', '', '海州区', '941', '119.179793', '34.601584', 'wwhub500f6');
INSERT INTO `model_nation` VALUES ('945', '320707', '', '', '赣榆区', '941', '119.178821', '34.600018', 'wwhszfxrey');
INSERT INTO `model_nation` VALUES ('946', '320722', '', '', '东海县', '941', '118.766489', '34.522859', 'wwhkqsen5z');
INSERT INTO `model_nation` VALUES ('947', '320723', '', '', '灌云县', '941', '119.255741', '34.298436', 'wwhg1ez6u5');
INSERT INTO `model_nation` VALUES ('948', '320724', '', '', '灌南县', '941', '119.352331', '34.092553', 'wwhcgymewb');
INSERT INTO `model_nation` VALUES ('949', '320800', '', '淮安市', '', '875', '119.021265', '33.597506', 'wtuxhkhxsm');
INSERT INTO `model_nation` VALUES ('950', '320801', '', '', '市辖区', '949', '119.021265', '33.597506', 'wtuxhkhxsm');
INSERT INTO `model_nation` VALUES ('951', '320802', '', '', '清河区', '949', '119.019454', '33.603234', 'wtuxhm7342');
INSERT INTO `model_nation` VALUES ('952', '320803', '', '', '淮安区', '949', '119.14634', '33.507499', 'wtuwx5zeqf');
INSERT INTO `model_nation` VALUES ('953', '320804', '', '', '淮阴区', '949', '119.020817', '33.622452', 'wtuxk2u2fp');
INSERT INTO `model_nation` VALUES ('954', '320811', '', '', '清浦区', '949', '119.030498', '33.58074', 'wtuxh95mgx');
INSERT INTO `model_nation` VALUES ('955', '320826', '', '', '涟水县', '949', '119.266078', '33.771308', 'wwhb1gyujh');
INSERT INTO `model_nation` VALUES ('956', '320829', '', '', '洪泽县', '949', '118.867875', '33.294975', 'wtut2vhvq1');
INSERT INTO `model_nation` VALUES ('957', '320830', '', '', '盱眙县', '949', '118.493823', '33.00439', 'wtu7b2k8d0');
INSERT INTO `model_nation` VALUES ('958', '320831', '', '', '金湖县', '949', '119.016936', '33.018162', 'wtueu6c2xx');
INSERT INTO `model_nation` VALUES ('959', '320900', '', '盐城市', '', '875', '120.139998', '33.377631', 'wtvmvu5qbc');
INSERT INTO `model_nation` VALUES ('960', '320901', '', '', '市辖区', '959', '120.139998', '33.377631', 'wtvmvu5qbc');
INSERT INTO `model_nation` VALUES ('961', '320902', '', '', '亭湖区', '959', '120.136078', '33.383912', 'wtvmvv27ms');
INSERT INTO `model_nation` VALUES ('962', '320903', '', '', '盐都区', '959', '120.139753', '33.341288', 'wtvmtve554');
INSERT INTO `model_nation` VALUES ('963', '320921', '', '', '响水县', '959', '119.579573', '34.19996', 'wwj491gjnn');
INSERT INTO `model_nation` VALUES ('964', '320922', '', '', '滨海县', '959', '119.828434', '33.989888', 'wwj1qg8mky');
INSERT INTO `model_nation` VALUES ('965', '320923', '', '', '阜宁县', '959', '119.805338', '33.78573', 'wwj0nnx84s');
INSERT INTO `model_nation` VALUES ('966', '320924', '', '', '射阳县', '959', '120.257444', '33.773779', 'wwj80s2f98');
INSERT INTO `model_nation` VALUES ('967', '320925', '', '', '建湖县', '959', '119.793105', '33.472621', 'wtvnmvw8js');
INSERT INTO `model_nation` VALUES ('968', '320981', '', '', '东台市', '959', '120.314101', '32.853174', 'wtvdcudp9g');
INSERT INTO `model_nation` VALUES ('969', '320982', '', '', '大丰市', '959', '120.470324', '33.199531', 'wtvsv7gc61');
INSERT INTO `model_nation` VALUES ('970', '321000', '', '扬州市', '', '875', '119.421003', '32.393159', 'wtubm2zxz4');
INSERT INTO `model_nation` VALUES ('971', '321001', '', '', '市辖区', '970', '119.421003', '32.393159', 'wtubm2zxz4');
INSERT INTO `model_nation` VALUES ('972', '321002', '', '', '广陵区', '970', '119.442267', '32.392154', 'wtubmbz1yx');
INSERT INTO `model_nation` VALUES ('973', '321003', '', '', '邗江区', '970', '119.397777', '32.377899', 'wtubhynycv');
INSERT INTO `model_nation` VALUES ('974', '321012', '', '', '江都区', '970', '119.567481', '32.426564', 'wtv02z46kj');
INSERT INTO `model_nation` VALUES ('975', '321023', '', '', '宝应县', '970', '119.321284', '33.23694', 'wtuv54x55q');
INSERT INTO `model_nation` VALUES ('976', '321081', '', '', '仪征市', '970', '119.182443', '32.271965', 'wtsz84fjb4');
INSERT INTO `model_nation` VALUES ('977', '321084', '', '', '高邮市', '970', '119.443842', '32.785164', 'wtufw0277j');
INSERT INTO `model_nation` VALUES ('978', '321100', '', '镇江市', '', '875', '119.452753', '32.204402', 'wtsznnwu4z');
INSERT INTO `model_nation` VALUES ('979', '321101', '', '', '市辖区', '978', '119.452753', '32.204402', 'wtsznnwu4z');
INSERT INTO `model_nation` VALUES ('980', '321102', '', '', '京口区', '978', '119.454571', '32.206191', 'wtsznqbntj');
INSERT INTO `model_nation` VALUES ('981', '321111', '', '', '润州区', '978', '119.414877', '32.213501', 'wtszm2730r');
INSERT INTO `model_nation` VALUES ('982', '321112', '', '', '丹徒区', '978', '119.433883', '32.128972', 'wtsyvbchg4');
INSERT INTO `model_nation` VALUES ('983', '321181', '', '', '丹阳市', '978', '119.581911', '31.991459', 'wttjcpugu2');
INSERT INTO `model_nation` VALUES ('984', '321182', '', '', '扬中市', '978', '119.828054', '32.237266', 'wttpqu85sj');
INSERT INTO `model_nation` VALUES ('985', '321183', '', '', '句容市', '978', '119.167135', '31.947355', 'wtstxxyfgd');
INSERT INTO `model_nation` VALUES ('986', '321200', '', '泰州市', '', '875', '119.915176', '32.484882', 'wtv2b9xw4h');
INSERT INTO `model_nation` VALUES ('987', '321201', '', '', '市辖区', '986', '119.915176', '32.484882', 'wtv2b9xw4h');
INSERT INTO `model_nation` VALUES ('988', '321202', '', '', '海陵区', '986', '119.920187', '32.488406', 'wtv2bf74wv');
INSERT INTO `model_nation` VALUES ('989', '321203', '', '', '高港区', '986', '119.88166', '32.315701', 'wttpzfzht5');
INSERT INTO `model_nation` VALUES ('990', '321204', '', '', '姜堰区', '986', '120.148208', '32.508483', 'wtv2yjcr8h');
INSERT INTO `model_nation` VALUES ('991', '321281', '', '', '兴化市', '986', '119.840162', '32.938065', 'wtv5rh0ynh');
INSERT INTO `model_nation` VALUES ('992', '321282', '', '', '靖江市', '986', '120.26825', '32.018168', 'wttw0u8xm7');
INSERT INTO `model_nation` VALUES ('993', '321283', '', '', '泰兴市', '986', '120.020228', '32.168784', 'wttr50hhdp');
INSERT INTO `model_nation` VALUES ('994', '321300', '', '宿迁市', '', '875', '118.275162', '33.963008', 'wwh15qv2g5');
INSERT INTO `model_nation` VALUES ('995', '321301', '', '', '市辖区', '994', '118.275162', '33.963008', 'wwh15qv2g5');
INSERT INTO `model_nation` VALUES ('996', '321302', '', '', '宿城区', '994', '118.278984', '33.937726', 'wwh15d0js4');
INSERT INTO `model_nation` VALUES ('997', '321311', '', '', '宿豫区', '994', '118.330012', '33.941071', 'wwh1hdv314');
INSERT INTO `model_nation` VALUES ('998', '321322', '', '', '沭阳县', '994', '118.775889', '34.129097', 'wwh6nv1bqu');
INSERT INTO `model_nation` VALUES ('999', '321323', '', '', '泗阳县', '994', '118.681284', '33.711433', 'wturu8vp66');
INSERT INTO `model_nation` VALUES ('1000', '321324', '', '', '泗洪县', '994', '118.211824', '33.456538', 'wtun3fx4rn');
INSERT INTO `model_nation` VALUES ('1001', '330000', '浙江省', '', '', '1', '120.153576', '30.287459', 'wtmkq1tjjp');
INSERT INTO `model_nation` VALUES ('1002', '330100', '', '杭州市', '', '1001', '120.153576', '30.287459', 'wtmkq1tjjp');
INSERT INTO `model_nation` VALUES ('1003', '330101', '', '', '市辖区', '1002', '120.153576', '30.287459', 'wtmkq1tjjp');
INSERT INTO `model_nation` VALUES ('1004', '330102', '', '', '上城区', '1002', '120.171465', '30.250236', 'wtmkndfhqh');
INSERT INTO `model_nation` VALUES ('1005', '330103', '', '', '下城区', '1002', '120.172763', '30.276271', 'wtmknxehh3');
INSERT INTO `model_nation` VALUES ('1006', '330104', '', '', '江干区', '1002', '120.202633', '30.266603', 'wtmkpmbgsr');
INSERT INTO `model_nation` VALUES ('1007', '330105', '', '', '拱墅区', '1002', '120.150053', '30.314697', 'wtmkqndegj');
INSERT INTO `model_nation` VALUES ('1008', '330106', '', '', '西湖区', '1002', '120.147376', '30.272934', 'wtmknp08sg');
INSERT INTO `model_nation` VALUES ('1009', '330108', '', '', '滨江区', '1002', '120.21062', '30.206615', 'wtm7z6ywq3');
INSERT INTO `model_nation` VALUES ('1010', '330109', '', '', '萧山区', '1002', '120.27069', '30.162932', 'wtme8ffry4');
INSERT INTO `model_nation` VALUES ('1011', '330110', '', '', '余杭区', '1002', '120.301737', '30.421187', 'wtmt1d1038');
INSERT INTO `model_nation` VALUES ('1012', '330111', '', '', '富阳区', '1002', '120.153576', '30.287459', 'wtmkq1tjjp');
INSERT INTO `model_nation` VALUES ('1013', '330122', '', '', '桐庐县', '1002', '119.685045', '29.797437', 'wtm1e2ryxs');
INSERT INTO `model_nation` VALUES ('1014', '330127', '', '', '淳安县', '1002', '119.044276', '29.604177', 'wtk8kvm2ud');
INSERT INTO `model_nation` VALUES ('1015', '330182', '', '', '建德市', '1002', '119.279089', '29.472284', 'wthzdm22kp');
INSERT INTO `model_nation` VALUES ('1016', '330185', '', '', '临安市', '1002', '119.715101', '30.231153', 'wtm5upmvhp');
INSERT INTO `model_nation` VALUES ('1017', '330200', '', '宁波市', '', '1001', '121.549792', '29.868388', 'wtq3vvmggr');
INSERT INTO `model_nation` VALUES ('1018', '330201', '', '', '市辖区', '1017', '121.549792', '29.868388', 'wtq3vvmggr');
INSERT INTO `model_nation` VALUES ('1019', '330203', '', '', '海曙区', '1017', '121.539698', '29.874452', 'wtq3vwqx21');
INSERT INTO `model_nation` VALUES ('1020', '330204', '', '', '江东区', '1017', '121.572991', '29.866542', 'wtq3ymnc0n');
INSERT INTO `model_nation` VALUES ('1021', '330205', '', '', '江北区', '1017', '121.559282', '29.888361', 'wtq6n1hb2d');
INSERT INTO `model_nation` VALUES ('1022', '330206', '', '', '北仑区', '1017', '121.831303', '29.90944', 'wtqdhkfg55');
INSERT INTO `model_nation` VALUES ('1023', '330211', '', '', '镇海区', '1017', '121.713162', '29.952107', 'wtqd3ssgdj');
INSERT INTO `model_nation` VALUES ('1024', '330212', '', '', '鄞州区', '1017', '121.558436', '29.831662', 'wtq3wnsnhb');
INSERT INTO `model_nation` VALUES ('1025', '330225', '', '', '象山县', '1017', '121.877091', '29.470206', 'wtnxtkuhqh');
INSERT INTO `model_nation` VALUES ('1026', '330226', '', '', '宁海县', '1017', '121.432606', '29.299836', 'wtnqembebv');
INSERT INTO `model_nation` VALUES ('1027', '330281', '', '', '余姚市', '1017', '121.156294', '30.045404', 'wtq4uvx74m');
INSERT INTO `model_nation` VALUES ('1028', '330282', '', '', '慈溪市', '1017', '121.248052', '30.177142', 'wtq5xjd4s6');
INSERT INTO `model_nation` VALUES ('1029', '330283', '', '', '奉化市', '1017', '121.41089', '29.662348', 'wtq2dzbewy');
INSERT INTO `model_nation` VALUES ('1030', '330300', '', '温州市', '', '1001', '120.672111', '28.000575', 'wsvz3cqepv');
INSERT INTO `model_nation` VALUES ('1031', '330301', '', '', '市辖区', '1030', '120.672111', '28.000575', 'wsvz3cqepv');
INSERT INTO `model_nation` VALUES ('1032', '330302', '', '', '鹿城区', '1030', '120.674231', '28.003352', 'wsvz61b737');
INSERT INTO `model_nation` VALUES ('1033', '330303', '', '', '龙湾区', '1030', '120.763469', '27.970254', 'wsvzh5c68c');
INSERT INTO `model_nation` VALUES ('1034', '330304', '', '', '瓯海区', '1030', '120.637145', '28.006444', 'wsvz34mm35');
INSERT INTO `model_nation` VALUES ('1035', '330322', '', '', '洞头县', '1030', '121.156181', '27.836057', 'wsynkgrhz9');
INSERT INTO `model_nation` VALUES ('1036', '330324', '', '', '永嘉县', '1030', '120.690968', '28.153886', 'wtjb4mk2r2');
INSERT INTO `model_nation` VALUES ('1037', '330326', '', '', '平阳县', '1030', '120.564387', '27.6693', 'wsvtrt033g');
INSERT INTO `model_nation` VALUES ('1038', '330327', '', '', '苍南县', '1030', '120.406256', '27.507743', 'wsvs7zthjn');
INSERT INTO `model_nation` VALUES ('1039', '330328', '', '', '文成县', '1030', '120.09245', '27.789133', 'wsvqhfbekv');
INSERT INTO `model_nation` VALUES ('1040', '330329', '', '', '泰顺县', '1030', '119.71624', '27.557309', 'wsvhu0wsyw');
INSERT INTO `model_nation` VALUES ('1041', '330381', '', '', '瑞安市', '1030', '120.646171', '27.779321', 'wsvy135f78');
INSERT INTO `model_nation` VALUES ('1042', '330382', '', '', '乐清市', '1030', '120.967147', '28.116083', 'wsypbwms4c');
INSERT INTO `model_nation` VALUES ('1043', '330400', '', '嘉兴市', '', '1001', '120.750865', '30.762653', 'wtmz5b0j7n');
INSERT INTO `model_nation` VALUES ('1044', '330401', '', '', '市辖区', '1043', '120.750865', '30.762653', 'wtmz5b0j7n');
INSERT INTO `model_nation` VALUES ('1045', '330402', '', '', '南湖区', '1043', '120.749953', '30.764652', 'wtmz58x3jf');
INSERT INTO `model_nation` VALUES ('1046', '330411', '', '', '秀洲区', '1043', '120.720431', '30.763323', 'wtmz503cmg');
INSERT INTO `model_nation` VALUES ('1047', '330421', '', '', '嘉善县', '1043', '120.921871', '30.841352', 'wtmzrwkxgu');
INSERT INTO `model_nation` VALUES ('1048', '330424', '', '', '海盐县', '1043', '120.942017', '30.522223', 'wtqj8h7kc6');
INSERT INTO `model_nation` VALUES ('1049', '330481', '', '', '海宁市', '1043', '120.688821', '30.525544', 'wtmvdm4bjm');
INSERT INTO `model_nation` VALUES ('1050', '330482', '', '', '平湖市', '1043', '121.014666', '30.698921', 'wtqn9u84nj');
INSERT INTO `model_nation` VALUES ('1051', '330483', '', '', '桐乡市', '1043', '120.551085', '30.629065', 'wtmwppye5z');
INSERT INTO `model_nation` VALUES ('1052', '330500', '', '湖州市', '', '1001', '120.102398', '30.867198', 'wtmrsgpykw');
INSERT INTO `model_nation` VALUES ('1053', '330501', '', '', '市辖区', '1052', '120.102398', '30.867198', 'wtmrsgpykw');
INSERT INTO `model_nation` VALUES ('1054', '330502', '', '', '吴兴区', '1052', '120.101416', '30.867252', 'wtmrsgpnvb');
INSERT INTO `model_nation` VALUES ('1055', '330503', '', '', '南浔区', '1052', '120.417195', '30.872742', 'wtmxshjnu0');
INSERT INTO `model_nation` VALUES ('1056', '330521', '', '', '德清县', '1052', '119.967662', '30.534927', 'wtmm9ytyc4');
INSERT INTO `model_nation` VALUES ('1057', '330522', '', '', '长兴县', '1052', '119.910122', '31.00475', 'wtt22s5zu2');
INSERT INTO `model_nation` VALUES ('1058', '330523', '', '', '安吉县', '1052', '119.687891', '30.631974', 'wtmn786h1v');
INSERT INTO `model_nation` VALUES ('1059', '330600', '', '绍兴市', '', '1001', '120.582112', '29.997117', 'wtmdxuv1yg');
INSERT INTO `model_nation` VALUES ('1060', '330601', '', '', '市辖区', '1059', '120.582112', '29.997117', 'wtmdxuv1yg');
INSERT INTO `model_nation` VALUES ('1061', '330602', '', '', '越城区', '1059', '120.585315', '29.996993', 'wtmdxuz91k');
INSERT INTO `model_nation` VALUES ('1062', '330603', '', '', '柯桥区', '1059', '120.582112', '29.997117', 'wtmdxuv1yg');
INSERT INTO `model_nation` VALUES ('1063', '330604', '', '', '上虞区', '1059', '120.582112', '29.997117', 'wtmdxuv1yg');
INSERT INTO `model_nation` VALUES ('1064', '330624', '', '', '新昌县', '1059', '120.905665', '29.501205', 'wtjzz68bfp');
INSERT INTO `model_nation` VALUES ('1065', '330681', '', '', '诸暨市', '1059', '120.244326', '29.713662', 'wtm901pnxu');
INSERT INTO `model_nation` VALUES ('1066', '330683', '', '', '嵊州市', '1059', '120.82888', '29.586606', 'wtmbmd0fkz');
INSERT INTO `model_nation` VALUES ('1067', '330700', '', '金华市', '', '1001', '119.649506', '29.089524', 'wtjj6xw4g8');
INSERT INTO `model_nation` VALUES ('1068', '330701', '', '', '市辖区', '1067', '119.649506', '29.089524', 'wtjj6xw4g8');
INSERT INTO `model_nation` VALUES ('1069', '330702', '', '', '婺城区', '1067', '119.652579', '29.082607', 'wtjj6y267n');
INSERT INTO `model_nation` VALUES ('1070', '330703', '', '', '金东区', '1067', '119.681264', '29.095835', 'wtjje2tpx8');
INSERT INTO `model_nation` VALUES ('1071', '330723', '', '', '武义县', '1067', '119.819159', '28.896563', 'wtjhqs3wsv');
INSERT INTO `model_nation` VALUES ('1072', '330726', '', '', '浦江县', '1067', '119.893363', '29.451254', 'wtjr81rtvz');
INSERT INTO `model_nation` VALUES ('1073', '330727', '', '', '磐安县', '1067', '120.44513', '29.052627', 'wtjtkbc7yf');
INSERT INTO `model_nation` VALUES ('1074', '330781', '', '', '兰溪市', '1067', '119.460521', '29.210065', 'wthynms2zy');
INSERT INTO `model_nation` VALUES ('1075', '330782', '', '', '义乌市', '1067', '120.074911', '29.306863', 'wtjqsr5uu5');
INSERT INTO `model_nation` VALUES ('1076', '330783', '', '', '东阳市', '1067', '120.23334', '29.262546', 'wtjqrzp4xv');
INSERT INTO `model_nation` VALUES ('1077', '330784', '', '', '永康市', '1067', '120.036328', '28.895293', 'wtjk7kpz31');
INSERT INTO `model_nation` VALUES ('1078', '330800', '', '衢州市', '', '1001', '118.87263', '28.941708', 'wths9h8mtj');
INSERT INTO `model_nation` VALUES ('1079', '330801', '', '', '市辖区', '1078', '118.87263', '28.941708', 'wths9h8mtj');
INSERT INTO `model_nation` VALUES ('1080', '330802', '', '', '柯城区', '1078', '118.873041', '28.944539', 'wths9j0wnt');
INSERT INTO `model_nation` VALUES ('1081', '330803', '', '', '衢江区', '1078', '118.957683', '28.973195', 'wthsffqm4g');
INSERT INTO `model_nation` VALUES ('1082', '330822', '', '', '常山县', '1078', '118.521654', '28.900039', 'wthk3j0fft');
INSERT INTO `model_nation` VALUES ('1083', '330824', '', '', '开化县', '1078', '118.414435', '29.136503', 'wthjy84u2m');
INSERT INTO `model_nation` VALUES ('1084', '330825', '', '', '龙游县', '1078', '119.172525', '29.031364', 'wthtpufzcn');
INSERT INTO `model_nation` VALUES ('1085', '330881', '', '', '江山市', '1078', '118.627879', '28.734674', 'wth77qyptg');
INSERT INTO `model_nation` VALUES ('1086', '330900', '', '舟山市', '', '1001', '122.106863', '30.016028', 'wtqff87801');
INSERT INTO `model_nation` VALUES ('1087', '330901', '', '', '市辖区', '1086', '122.106863', '30.016028', 'wtqff87801');
INSERT INTO `model_nation` VALUES ('1088', '330902', '', '', '定海区', '1086', '122.108496', '30.016423', 'wtqff8kdq4');
INSERT INTO `model_nation` VALUES ('1089', '330903', '', '', '普陀区', '1086', '122.301953', '29.945614', 'wtqfr53tf5');
INSERT INTO `model_nation` VALUES ('1090', '330921', '', '', '岱山县', '1086', '122.201132', '30.242865', 'wtquhc81ky');
INSERT INTO `model_nation` VALUES ('1091', '330922', '', '', '嵊泗县', '1086', '122.457809', '30.727166', 'wtrnf9en9y');
INSERT INTO `model_nation` VALUES ('1092', '331000', '', '台州市', '', '1001', '121.428599', '28.661378', 'wtn751tsek');
INSERT INTO `model_nation` VALUES ('1093', '331001', '', '', '市辖区', '1092', '121.428599', '28.661378', 'wtn751tsek');
INSERT INTO `model_nation` VALUES ('1094', '331002', '', '', '椒江区', '1092', '121.431049', '28.67615', 'wtn75hr6st');
INSERT INTO `model_nation` VALUES ('1095', '331003', '', '', '黄岩区', '1092', '121.262138', '28.64488', 'wtn4zqsks8');
INSERT INTO `model_nation` VALUES ('1096', '331004', '', '', '路桥区', '1092', '121.37292', '28.581799', 'wtn69gjj41');
INSERT INTO `model_nation` VALUES ('1097', '331021', '', '', '玉环县', '1092', '121.232337', '28.12842', 'wtn0n8weyj');
INSERT INTO `model_nation` VALUES ('1098', '331022', '', '', '三门县', '1092', '121.376429', '29.118955', 'wtnm9uzw5y');
INSERT INTO `model_nation` VALUES ('1099', '331023', '', '', '天台县', '1092', '121.031227', '29.141126', 'wtnjf0uprg');
INSERT INTO `model_nation` VALUES ('1100', '331024', '', '', '仙居县', '1092', '120.735074', '28.849213', 'wtju57udg5');
INSERT INTO `model_nation` VALUES ('1101', '331081', '', '', '温岭市', '1092', '121.373611', '28.368781', 'wtn33ums4h');
INSERT INTO `model_nation` VALUES ('1102', '331082', '', '', '临海市', '1092', '121.131229', '28.845441', 'wtnhh7jhf5');
INSERT INTO `model_nation` VALUES ('1103', '331100', '', '丽水市', '', '1001', '119.921786', '28.451993', 'wtj3bgs2u5');
INSERT INTO `model_nation` VALUES ('1104', '331101', '', '', '市辖区', '1103', '119.921786', '28.451993', 'wtj3bgs2u5');
INSERT INTO `model_nation` VALUES ('1105', '331102', '', '', '莲都区', '1103', '119.922293', '28.451103', 'wtj3bgkexy');
INSERT INTO `model_nation` VALUES ('1106', '331121', '', '', '青田县', '1103', '120.291939', '28.135247', 'wtj813cgtq');
INSERT INTO `model_nation` VALUES ('1107', '331122', '', '', '缙云县', '1103', '120.078965', '28.654208', 'wtj7h2qffe');
INSERT INTO `model_nation` VALUES ('1108', '331123', '', '', '遂昌县', '1103', '119.27589', '28.5924', 'wthfdjn4c9');
INSERT INTO `model_nation` VALUES ('1109', '331124', '', '', '松阳县', '1103', '119.485292', '28.449937', 'wthcygnsch');
INSERT INTO `model_nation` VALUES ('1110', '331125', '', '', '云和县', '1103', '119.569458', '28.111077', 'wsvpbv7yfk');
INSERT INTO `model_nation` VALUES ('1111', '331126', '', '', '庆元县', '1103', '119.067233', '27.618231', 'wsutj7wpge');
INSERT INTO `model_nation` VALUES ('1112', '331127', '', '', '景宁畲族自治县', '1103', '119.634669', '27.977247', 'wsvp4m573b');
INSERT INTO `model_nation` VALUES ('1113', '331181', '', '', '龙泉市', '1103', '119.132319', '28.069177', 'wsuxwvvdb1');
INSERT INTO `model_nation` VALUES ('1114', '340000', '安徽省', '', '', '1', '117.283042', '31.86119', 'wtemkb4uuu');
INSERT INTO `model_nation` VALUES ('1115', '340100', '', '合肥市', '', '1114', '117.283042', '31.86119', 'wtemkb4uuu');
INSERT INTO `model_nation` VALUES ('1116', '340101', '', '', '市辖区', '1115', '117.283042', '31.86119', 'wtemkb4uuu');
INSERT INTO `model_nation` VALUES ('1117', '340102', '', '', '瑶海区', '1115', '117.315358', '31.86961', 'wtemm9dmvv');
INSERT INTO `model_nation` VALUES ('1118', '340103', '', '', '庐阳区', '1115', '117.283776', '31.869011', 'wtemkce6qn');
INSERT INTO `model_nation` VALUES ('1119', '340104', '', '', '蜀山区', '1115', '117.262072', '31.855868', 'wtemhr5tuk');
INSERT INTO `model_nation` VALUES ('1120', '340111', '', '', '包河区', '1115', '117.285751', '31.82956', 'wtemhfkush');
INSERT INTO `model_nation` VALUES ('1121', '340121', '', '', '长丰县', '1115', '117.164699', '32.478548', 'wtg2f0s9r2');
INSERT INTO `model_nation` VALUES ('1122', '340122', '', '', '肥东县', '1115', '117.463222', '31.883992', 'wtet2uq1eq');
INSERT INTO `model_nation` VALUES ('1123', '340123', '', '', '肥西县', '1115', '117.166118', '31.719646', 'wtek6nmu26');
INSERT INTO `model_nation` VALUES ('1124', '340124', '', '', '庐江县', '1115', '117.289844', '31.251488', 'wte3ucpv57');
INSERT INTO `model_nation` VALUES ('1125', '340181', '', '', '巢湖市', '1115', '117.874155', '31.600518', 'wtegf29q6g');
INSERT INTO `model_nation` VALUES ('1126', '340200', '', '芜湖市', '', '1114', '118.376451', '31.326319', 'wts4jwz151');
INSERT INTO `model_nation` VALUES ('1127', '340201', '', '', '市辖区', '1126', '118.376451', '31.326319', 'wts4jwz151');
INSERT INTO `model_nation` VALUES ('1128', '340202', '', '', '镜湖区', '1126', '118.376343', '31.32559', 'wts4jwxhb9');
INSERT INTO `model_nation` VALUES ('1129', '340203', '', '', '弋江区', '1126', '118.377476', '31.313394', 'wts4jsrvep');
INSERT INTO `model_nation` VALUES ('1130', '340207', '', '', '鸠江区', '1126', '118.400174', '31.362716', 'wts4qm2mh4');
INSERT INTO `model_nation` VALUES ('1131', '340208', '', '', '三山区', '1126', '118.233987', '31.225423', 'wts1dkrm78');
INSERT INTO `model_nation` VALUES ('1132', '340221', '', '', '芜湖县', '1126', '118.572301', '31.145262', 'wts34jvdqc');
INSERT INTO `model_nation` VALUES ('1133', '340222', '', '', '繁昌县', '1126', '118.201349', '31.080896', 'wts0cdpe74');
INSERT INTO `model_nation` VALUES ('1134', '340223', '', '', '南陵县', '1126', '118.337104', '30.919638', 'wtkpuudryq');
INSERT INTO `model_nation` VALUES ('1135', '340225', '', '', '无为县', '1126', '117.911432', '31.303075', 'wtef54s3xs');
INSERT INTO `model_nation` VALUES ('1136', '340300', '', '蚌埠市', '', '1114', '117.363228', '32.939667', 'wtg7qsmr3q');
INSERT INTO `model_nation` VALUES ('1137', '340301', '', '', '市辖区', '1136', '117.363228', '32.939667', 'wtg7qsmr3q');
INSERT INTO `model_nation` VALUES ('1138', '340302', '', '', '龙子湖区', '1136', '117.382312', '32.950452', 'wtg7rn7nq1');
INSERT INTO `model_nation` VALUES ('1139', '340303', '', '', '蚌山区', '1136', '117.355789', '32.938066', 'wtg7qkpyhh');
INSERT INTO `model_nation` VALUES ('1140', '340304', '', '', '禹会区', '1136', '117.35259', '32.931933', 'wtg7q7jd3t');
INSERT INTO `model_nation` VALUES ('1141', '340311', '', '', '淮上区', '1136', '117.34709', '32.963147', 'wtg7w2c81r');
INSERT INTO `model_nation` VALUES ('1142', '340321', '', '', '怀远县', '1136', '117.200171', '32.956934', 'wtg76zws1c');
INSERT INTO `model_nation` VALUES ('1143', '340322', '', '', '五河县', '1136', '117.888809', '33.146202', 'wtguddh487');
INSERT INTO `model_nation` VALUES ('1144', '340323', '', '', '固镇县', '1136', '117.315962', '33.318679', 'wtgmt96zk5');
INSERT INTO `model_nation` VALUES ('1145', '340400', '', '淮南市', '', '1114', '117.018329', '32.647574', 'wtg1wz61us');
INSERT INTO `model_nation` VALUES ('1146', '340401', '', '', '市辖区', '1145', '117.018329', '32.647574', 'wtg1wz61us');
INSERT INTO `model_nation` VALUES ('1147', '340402', '', '', '大通区', '1145', '117.052927', '32.632066', 'wtg1xs7rdc');
INSERT INTO `model_nation` VALUES ('1148', '340403', '', '', '田家庵区', '1145', '117.018318', '32.644342', 'wtg1wydph6');
INSERT INTO `model_nation` VALUES ('1149', '340404', '', '', '谢家集区', '1145', '116.865354', '32.598289', 'wtg17q6fb1');
INSERT INTO `model_nation` VALUES ('1150', '340405', '', '', '八公山区', '1145', '116.841111', '32.628229', 'wtg1dgc15n');
INSERT INTO `model_nation` VALUES ('1151', '340406', '', '', '潘集区', '1145', '116.816879', '32.782117', 'wtg46pz3wt');
INSERT INTO `model_nation` VALUES ('1152', '340421', '', '', '凤台县', '1145', '116.722769', '32.705382', 'wtg401fftt');
INSERT INTO `model_nation` VALUES ('1153', '340500', '', '马鞍山市', '', '1114', '118.507906', '31.689362', 'wtsk28ygfm');
INSERT INTO `model_nation` VALUES ('1154', '340501', '', '', '市辖区', '1153', '118.507906', '31.689362', 'wtsk28ygfm');
INSERT INTO `model_nation` VALUES ('1155', '340503', '', '', '花山区', '1153', '118.511308', '31.69902', 'wtsk2f9k1t');
INSERT INTO `model_nation` VALUES ('1156', '340504', '', '', '雨山区', '1153', '118.493104', '31.685912', 'wtsk22hpc6');
INSERT INTO `model_nation` VALUES ('1157', '340506', '', '', '博望区', '1153', '118.843742', '31.562321', 'wtse83ergg');
INSERT INTO `model_nation` VALUES ('1158', '340521', '', '', '当涂县', '1153', '118.489873', '31.556167', 'wts7829eyp');
INSERT INTO `model_nation` VALUES ('1159', '340522', '', '', '含山县', '1153', '118.105545', '31.727758', 'wteurxcgdd');
INSERT INTO `model_nation` VALUES ('1160', '340523', '', '', '和县', '1153', '118.362998', '31.716634', 'wtshmmv6cc');
INSERT INTO `model_nation` VALUES ('1161', '340600', '', '淮北市', '', '1114', '116.794664', '33.971707', 'ww5138r78c');
INSERT INTO `model_nation` VALUES ('1162', '340601', '', '', '市辖区', '1161', '116.794664', '33.971707', 'ww5138r78c');
INSERT INTO `model_nation` VALUES ('1163', '340602', '', '', '杜集区', '1161', '116.833925', '33.991218', 'ww516egv5y');
INSERT INTO `model_nation` VALUES ('1164', '340603', '', '', '相山区', '1161', '116.790775', '33.970916', 'ww5138hqym');
INSERT INTO `model_nation` VALUES ('1165', '340604', '', '', '烈山区', '1161', '116.809465', '33.889529', 'ww50f16hcf');
INSERT INTO `model_nation` VALUES ('1166', '340621', '', '', '濉溪县', '1161', '116.767435', '33.916407', 'ww50cn73qk');
INSERT INTO `model_nation` VALUES ('1167', '340700', '', '铜陵市', '', '1114', '117.816576', '30.929935', 'wt7zbyx7vj');
INSERT INTO `model_nation` VALUES ('1168', '340701', '', '', '市辖区', '1167', '117.816576', '30.929935', 'wt7zbyx7vj');
INSERT INTO `model_nation` VALUES ('1169', '340702', '', '', '铜官山区', '1167', '117.818427', '30.93182', 'wt7zcnbybm');
INSERT INTO `model_nation` VALUES ('1170', '340703', '', '', '狮子山区', '1167', '117.864094', '30.946249', 'wteb41d4bq');
INSERT INTO `model_nation` VALUES ('1171', '340711', '', '', '郊区', '1167', '117.80707', '30.908927', 'wt7zbfb3x9');
INSERT INTO `model_nation` VALUES ('1172', '340721', '', '', '铜陵县', '1167', '117.792288', '30.952338', 'wteb06twrn');
INSERT INTO `model_nation` VALUES ('1173', '340800', '', '安庆市', '', '1114', '117.043551', '30.50883', 'wt7jx3uwb6');
INSERT INTO `model_nation` VALUES ('1174', '340801', '', '', '市辖区', '1173', '117.043551', '30.50883', 'wt7jx3uwb6');
INSERT INTO `model_nation` VALUES ('1175', '340802', '', '', '迎江区', '1173', '117.044965', '30.506375', 'wt7jx3t892');
INSERT INTO `model_nation` VALUES ('1176', '340803', '', '', '大观区', '1173', '117.034512', '30.505632', 'wt7jx1mujv');
INSERT INTO `model_nation` VALUES ('1177', '340811', '', '', '宜秀区', '1173', '117.070003', '30.541323', 'wt7jxzzu0g');
INSERT INTO `model_nation` VALUES ('1178', '340822', '', '', '怀宁县', '1173', '116.828664', '30.734994', 'wt7nfe0h34');
INSERT INTO `model_nation` VALUES ('1179', '340823', '', '', '枞阳县', '1173', '117.222027', '30.700615', 'wt7qekykp1');
INSERT INTO `model_nation` VALUES ('1180', '340824', '', '', '潜山县', '1173', '116.573666', '30.638222', 'wt6yk9w2e6');
INSERT INTO `model_nation` VALUES ('1181', '340825', '', '', '太湖县', '1173', '116.305225', '30.451869', 'wt6tnxdfup');
INSERT INTO `model_nation` VALUES ('1182', '340826', '', '', '宿松县', '1173', '116.120204', '30.158327', 'wt6ed6hhuz');
INSERT INTO `model_nation` VALUES ('1183', '340827', '', '', '望江县', '1173', '116.690927', '30.12491', 'wt6grk5drd');
INSERT INTO `model_nation` VALUES ('1184', '340828', '', '', '岳西县', '1173', '116.360482', '30.848502', 'wt6xrzg1ec');
INSERT INTO `model_nation` VALUES ('1185', '340881', '', '', '桐城市', '1173', '116.959656', '31.050576', 'wte0tkx6tw');
INSERT INTO `model_nation` VALUES ('1186', '341000', '', '黄山市', '', '1114', '118.317325', '29.709239', 'wtk1h2khc7');
INSERT INTO `model_nation` VALUES ('1187', '341001', '', '', '市辖区', '1186', '118.317325', '29.709239', 'wtk1h2khc7');
INSERT INTO `model_nation` VALUES ('1188', '341002', '', '', '屯溪区', '1186', '118.317354', '29.709186', 'wtk1h2khd1');
INSERT INTO `model_nation` VALUES ('1189', '341003', '', '', '黄山区', '1186', '118.136639', '30.294517', 'wtkh26bqr5');
INSERT INTO `model_nation` VALUES ('1190', '341004', '', '', '徽州区', '1186', '118.339743', '29.825201', 'wtk1svs27u');
INSERT INTO `model_nation` VALUES ('1191', '341021', '', '', '歙县', '1186', '118.428025', '29.867748', 'wtk1yvk8hz');
INSERT INTO `model_nation` VALUES ('1192', '341022', '', '', '休宁县', '1186', '118.188531', '29.788878', 'wtk13qykb3');
INSERT INTO `model_nation` VALUES ('1193', '341023', '', '', '黟县', '1186', '117.942911', '29.923812', 'wt7f5z7qv4');
INSERT INTO `model_nation` VALUES ('1194', '341024', '', '', '祁门县', '1186', '117.717237', '29.853472', 'wt79ydxj46');
INSERT INTO `model_nation` VALUES ('1195', '341100', '', '滁州市', '', '1114', '118.316264', '32.303627', 'wtspu2eq2b');
INSERT INTO `model_nation` VALUES ('1196', '341101', '', '', '市辖区', '1195', '118.316264', '32.303627', 'wtspu2eq2b');
INSERT INTO `model_nation` VALUES ('1197', '341102', '', '', '琅琊区', '1195', '118.316475', '32.303797', 'wtspu2erm8');
INSERT INTO `model_nation` VALUES ('1198', '341103', '', '', '南谯区', '1195', '118.296955', '32.329841', 'wtspgvmnyz');
INSERT INTO `model_nation` VALUES ('1199', '341122', '', '', '来安县', '1195', '118.433293', '32.450231', 'wtu0x52kr9');
INSERT INTO `model_nation` VALUES ('1200', '341124', '', '', '全椒县', '1195', '118.268576', '32.09385', 'wtsne6881x');
INSERT INTO `model_nation` VALUES ('1201', '341125', '', '', '定远县', '1195', '117.683713', '32.527105', 'wtg9jcqsj7');
INSERT INTO `model_nation` VALUES ('1202', '341126', '', '', '凤阳县', '1195', '117.562461', '32.867146', 'wtgdgpq35b');
INSERT INTO `model_nation` VALUES ('1203', '341181', '', '', '天长市', '1195', '119.011212', '32.6815', 'wtu9ujmrd1');
INSERT INTO `model_nation` VALUES ('1204', '341182', '', '', '明光市', '1195', '117.998048', '32.781206', 'wtgfmpes3g');
INSERT INTO `model_nation` VALUES ('1205', '341200', '', '阜阳市', '', '1114', '115.819729', '32.896969', 'wtf75s9qer');
INSERT INTO `model_nation` VALUES ('1206', '341201', '', '', '市辖区', '1205', '115.819729', '32.896969', 'wtf75s9qer');
INSERT INTO `model_nation` VALUES ('1207', '341202', '', '', '颍州区', '1205', '115.813914', '32.891238', 'wtf757tj7g');
INSERT INTO `model_nation` VALUES ('1208', '341203', '', '', '颍东区', '1205', '115.858747', '32.908861', 'wtf7hqvu02');
INSERT INTO `model_nation` VALUES ('1209', '341204', '', '', '颍泉区', '1205', '115.804525', '32.924797', 'wtf771y2c5');
INSERT INTO `model_nation` VALUES ('1210', '341221', '', '', '临泉县', '1205', '115.261688', '33.062698', 'wtcunffupv');
INSERT INTO `model_nation` VALUES ('1211', '341222', '', '', '太和县', '1205', '115.627243', '33.16229', 'wtfhxjj0q4');
INSERT INTO `model_nation` VALUES ('1212', '341225', '', '', '阜南县', '1205', '115.590534', '32.638102', 'wtf1wmd6wx');
INSERT INTO `model_nation` VALUES ('1213', '341226', '', '', '颍上县', '1205', '116.259122', '32.637065', 'wtf9tt3k9v');
INSERT INTO `model_nation` VALUES ('1214', '341282', '', '', '界首市', '1205', '115.362117', '33.26153', 'wtfj1ph4kn');
INSERT INTO `model_nation` VALUES ('1215', '341300', '', '宿州市', '', '1114', '116.984084', '33.633891', 'wtgpq4c5we');
INSERT INTO `model_nation` VALUES ('1216', '341301', '', '', '市辖区', '1215', '116.984084', '33.633891', 'wtgpq4c5we');
INSERT INTO `model_nation` VALUES ('1217', '341302', '', '', '埇桥区', '1215', '116.983309', '33.633853', 'wtgpq4beks');
INSERT INTO `model_nation` VALUES ('1218', '341321', '', '', '砀山县', '1215', '116.351113', '34.426247', 'ww4ezeh73m');
INSERT INTO `model_nation` VALUES ('1219', '341322', '', '', '萧县', '1215', '116.945399', '34.183266', 'ww54mnv5cq');
INSERT INTO `model_nation` VALUES ('1220', '341323', '', '', '灵璧县', '1215', '117.551493', '33.540629', 'wtgwfcykk6');
INSERT INTO `model_nation` VALUES ('1221', '341324', '', '', '泗县', '1215', '117.885443', '33.47758', 'wtgy6w3t1c');
INSERT INTO `model_nation` VALUES ('1222', '341500', '', '六安市', '', '1114', '116.507676', '31.752889', 'wtduehqmcx');
INSERT INTO `model_nation` VALUES ('1223', '341501', '', '', '市辖区', '1222', '116.507676', '31.752889', 'wtduehqmcx');
INSERT INTO `model_nation` VALUES ('1224', '341502', '', '', '金安区', '1222', '116.503288', '31.754491', 'wtduehep76');
INSERT INTO `model_nation` VALUES ('1225', '341503', '', '', '裕安区', '1222', '116.494543', '31.750692', 'wtduduh9pt');
INSERT INTO `model_nation` VALUES ('1226', '341521', '', '', '寿县', '1222', '116.785349', '32.577304', 'wtg13d82xc');
INSERT INTO `model_nation` VALUES ('1227', '341522', '', '', '霍邱县', '1222', '116.278875', '32.341305', 'wtdxvzx9y0');
INSERT INTO `model_nation` VALUES ('1228', '341523', '', '', '舒城县', '1222', '116.944088', '31.462848', 'wte4vpsh6g');
INSERT INTO `model_nation` VALUES ('1229', '341524', '', '', '金寨县', '1222', '115.878514', '31.681624', 'wtdkhzknv4');
INSERT INTO `model_nation` VALUES ('1230', '341525', '', '', '霍山县', '1222', '116.333078', '31.402456', 'wtddxhxht4');
INSERT INTO `model_nation` VALUES ('1231', '341600', '', '亳州市', '', '1114', '115.782939', '33.869338', 'ww42dtwx4n');
INSERT INTO `model_nation` VALUES ('1232', '341601', '', '', '市辖区', '1231', '115.782939', '33.869338', 'ww42dtwx4n');
INSERT INTO `model_nation` VALUES ('1233', '341602', '', '', '谯城区', '1231', '115.781214', '33.869284', 'ww42dttqcu');
INSERT INTO `model_nation` VALUES ('1234', '341621', '', '', '涡阳县', '1231', '116.211551', '33.502831', 'wtfws7n8jk');
INSERT INTO `model_nation` VALUES ('1235', '341622', '', '', '蒙城县', '1231', '116.560337', '33.260814', 'wtfvhquwk9');
INSERT INTO `model_nation` VALUES ('1236', '341623', '', '', '利辛县', '1231', '116.207782', '33.143503', 'wtfss3efvs');
INSERT INTO `model_nation` VALUES ('1237', '341700', '', '池州市', '', '1114', '117.489157', '30.656037', 'wt7w3sbbrg');
INSERT INTO `model_nation` VALUES ('1238', '341701', '', '', '市辖区', '1237', '117.489157', '30.656037', 'wt7w3sbbrg');
INSERT INTO `model_nation` VALUES ('1239', '341702', '', '', '贵池区', '1237', '117.488342', '30.657378', 'wt7w3t02hv');
INSERT INTO `model_nation` VALUES ('1240', '341721', '', '', '东至县', '1237', '117.021476', '30.096568', 'wt75nyumnn');
INSERT INTO `model_nation` VALUES ('1241', '341722', '', '', '石台县', '1237', '117.482907', '30.210324', 'wt7ec7s7yh');
INSERT INTO `model_nation` VALUES ('1242', '341723', '', '', '青阳县', '1237', '117.857395', '30.63818', 'wt7y3ct0k6');
INSERT INTO `model_nation` VALUES ('1243', '341800', '', '宣城市', '', '1114', '118.757995', '30.945667', 'wts2n3kztf');
INSERT INTO `model_nation` VALUES ('1244', '341801', '', '', '市辖区', '1243', '118.757995', '30.945667', 'wts2n3kztf');
INSERT INTO `model_nation` VALUES ('1245', '341802', '', '', '宣州区', '1243', '118.758412', '30.946003', 'wts2n3t1x9');
INSERT INTO `model_nation` VALUES ('1246', '341821', '', '', '郎溪县', '1243', '119.185024', '31.127834', 'wtsc04euu2');
INSERT INTO `model_nation` VALUES ('1247', '341822', '', '', '广德县', '1243', '119.417521', '30.893116', 'wtkztrvjmy');
INSERT INTO `model_nation` VALUES ('1248', '341823', '', '', '泾县', '1243', '118.412397', '30.685975', 'wtknwd1qbb');
INSERT INTO `model_nation` VALUES ('1249', '341824', '', '', '绩溪县', '1243', '118.594705', '30.065267', 'wtk749nnbg');
INSERT INTO `model_nation` VALUES ('1250', '341825', '', '', '旌德县', '1243', '118.543081', '30.288057', 'wtkk39b2tz');
INSERT INTO `model_nation` VALUES ('1251', '341881', '', '', '宁国市', '1243', '118.983407', '30.626529', 'wtkw5x3h6q');
INSERT INTO `model_nation` VALUES ('1252', '350000', '福建省', '', '', '1', '119.306239', '26.075302', 'wssu6fu5su');
INSERT INTO `model_nation` VALUES ('1253', '350100', '', '福州市', '', '1252', '119.306239', '26.075302', 'wssu6fu5su');
INSERT INTO `model_nation` VALUES ('1254', '350101', '', '', '市辖区', '1253', '119.306239', '26.075302', 'wssu6fu5su');
INSERT INTO `model_nation` VALUES ('1255', '350102', '', '', '鼓楼区', '1253', '119.29929', '26.082284', 'wssu6sph6f');
INSERT INTO `model_nation` VALUES ('1256', '350103', '', '', '台江区', '1253', '119.310156', '26.058616', 'wssu4zz42n');
INSERT INTO `model_nation` VALUES ('1257', '350104', '', '', '仓山区', '1253', '119.320988', '26.038912', 'wssu5hnzst');
INSERT INTO `model_nation` VALUES ('1258', '350105', '', '', '马尾区', '1253', '119.458725', '25.991975', 'wssgy7ennp');
INSERT INTO `model_nation` VALUES ('1259', '350111', '', '', '晋安区', '1253', '119.328597', '26.078837', 'wssu77s2jz');
INSERT INTO `model_nation` VALUES ('1260', '350121', '', '', '闽侯县', '1253', '119.145117', '26.148567', 'wsssz0ny6q');
INSERT INTO `model_nation` VALUES ('1261', '350122', '', '', '连江县', '1253', '119.538365', '26.202109', 'wstj01vnmg');
INSERT INTO `model_nation` VALUES ('1262', '350123', '', '', '罗源县', '1253', '119.552645', '26.487234', 'wstn8mze6d');
INSERT INTO `model_nation` VALUES ('1263', '350124', '', '', '闽清县', '1253', '118.868416', '26.223793', 'wsst0vvkdv');
INSERT INTO `model_nation` VALUES ('1264', '350125', '', '', '永泰县', '1253', '118.939089', '25.864825', 'wsse4s8c98');
INSERT INTO `model_nation` VALUES ('1265', '350128', '', '', '平潭县', '1253', '119.791197', '25.503672', 'wst1jfv39j');
INSERT INTO `model_nation` VALUES ('1266', '350181', '', '', '福清市', '1253', '119.376992', '25.720402', 'wssfk6r8jw');
INSERT INTO `model_nation` VALUES ('1267', '350182', '', '', '长乐市', '1253', '119.510849', '25.960583', 'wssgxtcpke');
INSERT INTO `model_nation` VALUES ('1268', '350200', '', '厦门市', '', '1252', '118.11022', '24.490474', 'ws7grdm5re');
INSERT INTO `model_nation` VALUES ('1269', '350201', '', '', '市辖区', '1268', '118.11022', '24.490474', 'ws7grdm5re');
INSERT INTO `model_nation` VALUES ('1270', '350203', '', '', '思明区', '1268', '118.087828', '24.462059', 'ws7gpjhvvf');
INSERT INTO `model_nation` VALUES ('1271', '350205', '', '', '海沧区', '1268', '118.036364', '24.492512', 'ws7gmfxrnx');
INSERT INTO `model_nation` VALUES ('1272', '350206', '', '', '湖里区', '1268', '118.10943', '24.512764', 'ws7grwktjn');
INSERT INTO `model_nation` VALUES ('1273', '350211', '', '', '集美区', '1268', '118.100869', '24.572874', 'ws7gz3q7me');
INSERT INTO `model_nation` VALUES ('1274', '350212', '', '', '同安区', '1268', '118.150455', '24.729333', 'wskh8tfdc1');
INSERT INTO `model_nation` VALUES ('1275', '350213', '', '', '翔安区', '1268', '118.242811', '24.637479', 'wskh4tjg9n');
INSERT INTO `model_nation` VALUES ('1276', '350300', '', '莆田市', '', '1252', '119.007558', '25.431011', 'wss8sjddmh');
INSERT INTO `model_nation` VALUES ('1277', '350301', '', '', '市辖区', '1276', '119.007558', '25.431011', 'wss8sjddmh');
INSERT INTO `model_nation` VALUES ('1278', '350302', '', '', '城厢区', '1276', '119.001028', '25.433737', 'wss8eyjfkb');
INSERT INTO `model_nation` VALUES ('1279', '350303', '', '', '涵江区', '1276', '119.119102', '25.459273', 'wss8ydezh2');
INSERT INTO `model_nation` VALUES ('1280', '350304', '', '', '荔城区', '1276', '119.020047', '25.430047', 'wss8sm7ub0');
INSERT INTO `model_nation` VALUES ('1281', '350305', '', '', '秀屿区', '1276', '119.092607', '25.316141', 'wss8n08t4y');
INSERT INTO `model_nation` VALUES ('1282', '350322', '', '', '仙游县', '1276', '118.694331', '25.356529', 'wss2kbn86r');
INSERT INTO `model_nation` VALUES ('1283', '350400', '', '三明市', '', '1252', '117.635001', '26.265444', 'wsetkv7pq1');
INSERT INTO `model_nation` VALUES ('1284', '350401', '', '', '市辖区', '1283', '117.635001', '26.265444', 'wsetkv7pq1');
INSERT INTO `model_nation` VALUES ('1285', '350402', '', '', '梅列区', '1283', '117.63687', '26.269208', 'wsetkyht1x');
INSERT INTO `model_nation` VALUES ('1286', '350403', '', '', '三元区', '1283', '117.607418', '26.234191', 'wsethpz15r');
INSERT INTO `model_nation` VALUES ('1287', '350421', '', '', '明溪县', '1283', '117.201845', '26.357375', 'wsemfypybf');
INSERT INTO `model_nation` VALUES ('1288', '350423', '', '', '清流县', '1283', '116.815821', '26.17761', 'wsehfjqxtu');
INSERT INTO `model_nation` VALUES ('1289', '350424', '', '', '宁化县', '1283', '116.659725', '26.259932', 'wsdvqsmp0w');
INSERT INTO `model_nation` VALUES ('1290', '350425', '', '', '大田县', '1283', '117.849355', '25.690803', 'wsef1sz7c0');
INSERT INTO `model_nation` VALUES ('1291', '350426', '', '', '尤溪县', '1283', '118.188577', '26.169261', 'wsshc7yqcr');
INSERT INTO `model_nation` VALUES ('1292', '350427', '', '', '沙县', '1283', '117.789095', '26.397361', 'wsey0m7rub');
INSERT INTO `model_nation` VALUES ('1293', '350428', '', '', '将乐县', '1283', '117.473558', '26.728667', 'wsg811v9u2');
INSERT INTO `model_nation` VALUES ('1294', '350429', '', '', '泰宁县', '1283', '117.177522', '26.897995', 'wsg342wh4j');
INSERT INTO `model_nation` VALUES ('1295', '350430', '', '', '建宁县', '1283', '116.845832', '26.831398', 'wsg0dus81p');
INSERT INTO `model_nation` VALUES ('1296', '350481', '', '', '永安市', '1283', '117.364447', '25.974075', 'wse7y8qjvy');
INSERT INTO `model_nation` VALUES ('1297', '350500', '', '泉州市', '', '1252', '118.589421', '24.908853', 'wskmdwd0tf');
INSERT INTO `model_nation` VALUES ('1298', '350501', '', '', '市辖区', '1297', '118.589421', '24.908853', 'wskmdwd0tf');
INSERT INTO `model_nation` VALUES ('1299', '350502', '', '', '鲤城区', '1297', '118.588929', '24.907645', 'wskmdw3cd3');
INSERT INTO `model_nation` VALUES ('1300', '350503', '', '', '丰泽区', '1297', '118.605147', '24.896041', 'wskmdujtun');
INSERT INTO `model_nation` VALUES ('1301', '350504', '', '', '洛江区', '1297', '118.670312', '24.941153', 'wskmukmhdx');
INSERT INTO `model_nation` VALUES ('1302', '350505', '', '', '泉港区', '1297', '118.912285', '25.126859', 'wskwcyjq94');
INSERT INTO `model_nation` VALUES ('1303', '350521', '', '', '惠安县', '1297', '118.798954', '25.028718', 'wskqrk6fb7');
INSERT INTO `model_nation` VALUES ('1304', '350524', '', '', '安溪县', '1297', '118.186014', '25.056824', 'wskn93kqtd');
INSERT INTO `model_nation` VALUES ('1305', '350525', '', '', '永春县', '1297', '118.29503', '25.320721', 'wss05c7zcu');
INSERT INTO `model_nation` VALUES ('1306', '350526', '', '', '德化县', '1297', '118.242986', '25.489004', 'wss148jujq');
INSERT INTO `model_nation` VALUES ('1307', '350527', '', '', '金门县', '1297', '118.323221', '24.436417', 'wsk5h8826y');
INSERT INTO `model_nation` VALUES ('1308', '350581', '', '', '石狮市', '1297', '118.628402', '24.731978', 'wskkeqqd4n');
INSERT INTO `model_nation` VALUES ('1309', '350582', '', '', '晋江市', '1297', '118.577338', '24.807322', 'wskm4k13h5');
INSERT INTO `model_nation` VALUES ('1310', '350583', '', '', '南安市', '1297', '118.387031', '24.959494', 'wskjvzwz9f');
INSERT INTO `model_nation` VALUES ('1311', '350600', '', '漳州市', '', '1252', '117.661801', '24.510897', 'ws7emqndqd');
INSERT INTO `model_nation` VALUES ('1312', '350601', '', '', '市辖区', '1311', '117.661801', '24.510897', 'ws7emqndqd');
INSERT INTO `model_nation` VALUES ('1313', '350602', '', '', '芗城区', '1311', '117.656461', '24.509955', 'ws7emmfuf4');
INSERT INTO `model_nation` VALUES ('1314', '350603', '', '', '龙文区', '1311', '117.671387', '24.515656', 'ws7emwvwn1');
INSERT INTO `model_nation` VALUES ('1315', '350622', '', '', '云霄县', '1311', '117.340946', '23.950486', 'ws72q0j1dn');
INSERT INTO `model_nation` VALUES ('1316', '350623', '', '', '漳浦县', '1311', '117.614023', '24.117907', 'ws79hqebvr');
INSERT INTO `model_nation` VALUES ('1317', '350624', '', '', '诏安县', '1311', '117.176083', '23.710834', 'ws5qfkmj8e');
INSERT INTO `model_nation` VALUES ('1318', '350625', '', '', '长泰县', '1311', '117.755913', '24.621475', 'ws7spd5nrx');
INSERT INTO `model_nation` VALUES ('1319', '350626', '', '', '东山县', '1311', '117.427679', '23.702845', 'ws5wb4upp4');
INSERT INTO `model_nation` VALUES ('1320', '350627', '', '', '南靖县', '1311', '117.365462', '24.516425', 'ws77qxnft2');
INSERT INTO `model_nation` VALUES ('1321', '350628', '', '', '平和县', '1311', '117.313549', '24.366158', 'ws76te9p5v');
INSERT INTO `model_nation` VALUES ('1322', '350629', '', '', '华安县', '1311', '117.53631', '25.001416', 'ws7w4x77f9');
INSERT INTO `model_nation` VALUES ('1323', '350681', '', '', '龙海市', '1311', '117.817292', '24.445341', 'ws7g0fpumv');
INSERT INTO `model_nation` VALUES ('1324', '350700', '', '南平市', '', '1252', '118.178459', '26.635627', 'wssp90ygv8');
INSERT INTO `model_nation` VALUES ('1325', '350701', '', '', '市辖区', '1324', '118.178459', '26.635627', 'wssp90ygv8');
INSERT INTO `model_nation` VALUES ('1326', '350702', '', '', '延平区', '1324', '118.178918', '26.636079', 'wssp90zq2m');
INSERT INTO `model_nation` VALUES ('1327', '350703', '', '', '建阳区', '1324', '118.178459', '26.635627', 'wssp90ygv8');
INSERT INTO `model_nation` VALUES ('1328', '350721', '', '', '顺昌县', '1324', '117.80771', '26.792851', 'wsgb2v2zwt');
INSERT INTO `model_nation` VALUES ('1329', '350722', '', '', '浦城县', '1324', '118.536822', '27.920412', 'wsuqc6gbhn');
INSERT INTO `model_nation` VALUES ('1330', '350723', '', '', '光泽县', '1324', '117.337897', '27.542803', 'wsgkwn4b7n');
INSERT INTO `model_nation` VALUES ('1331', '350724', '', '', '松溪县', '1324', '118.783491', '27.525785', 'wsukwfzmrf');
INSERT INTO `model_nation` VALUES ('1332', '350725', '', '', '政和县', '1324', '118.858661', '27.365398', 'wsue8twnzx');
INSERT INTO `model_nation` VALUES ('1333', '350781', '', '', '邵武市', '1324', '117.491544', '27.337952', 'wsge98dxp7');
INSERT INTO `model_nation` VALUES ('1334', '350782', '', '', '武夷山市', '1324', '118.032796', '27.751733', 'wsgvvuhce3');
INSERT INTO `model_nation` VALUES ('1335', '350783', '', '', '建瓯市', '1324', '118.321765', '27.03502', 'wsu1u3x62v');
INSERT INTO `model_nation` VALUES ('1336', '350800', '', '龙岩市', '', '1252', '117.02978', '25.091603', 'ws7nxpf3pt');
INSERT INTO `model_nation` VALUES ('1337', '350801', '', '', '市辖区', '1336', '117.02978', '25.091603', 'ws7nxpf3pt');
INSERT INTO `model_nation` VALUES ('1338', '350802', '', '', '新罗区', '1336', '117.030721', '25.0918', 'ws7nxpg4m6');
INSERT INTO `model_nation` VALUES ('1339', '350803', '', '', '永定区', '1336', '117.02978', '25.091603', 'ws7nxpf3pt');
INSERT INTO `model_nation` VALUES ('1340', '350821', '', '', '长汀县', '1336', '116.361007', '25.842278', 'wsdepb7qpv');
INSERT INTO `model_nation` VALUES ('1341', '350823', '', '', '上杭县', '1336', '116.424774', '25.050019', 'ws6y921yvv');
INSERT INTO `model_nation` VALUES ('1342', '350824', '', '', '武平县', '1336', '116.100928', '25.08865', 'ws6w9znpgx');
INSERT INTO `model_nation` VALUES ('1343', '350825', '', '', '连城县', '1336', '116.756687', '25.708506', 'wse42b5dgu');
INSERT INTO `model_nation` VALUES ('1344', '350881', '', '', '漳平市', '1336', '117.42073', '25.291597', 'ws7rzupnjr');
INSERT INTO `model_nation` VALUES ('1345', '350900', '', '宁德市', '', '1252', '119.527082', '26.65924', 'wsszxvhvqf');
INSERT INTO `model_nation` VALUES ('1346', '350901', '', '', '市辖区', '1345', '119.527082', '26.65924', 'wsszxvhvqf');
INSERT INTO `model_nation` VALUES ('1347', '350902', '', '', '蕉城区', '1345', '119.527225', '26.659253', 'wsszxvjj6h');
INSERT INTO `model_nation` VALUES ('1348', '350921', '', '', '霞浦县', '1345', '120.005214', '26.882068', 'wsv2fv9pkh');
INSERT INTO `model_nation` VALUES ('1349', '350922', '', '', '古田县', '1345', '118.743156', '26.577491', 'wssrnn61h5');
INSERT INTO `model_nation` VALUES ('1350', '350923', '', '', '屏南县', '1345', '118.987544', '26.910826', 'wsu95dunft');
INSERT INTO `model_nation` VALUES ('1351', '350924', '', '', '寿宁县', '1345', '119.506733', '27.457798', 'wsuupqw1k8');
INSERT INTO `model_nation` VALUES ('1352', '350925', '', '', '周宁县', '1345', '119.338239', '27.103106', 'wsuf5tgrn9');
INSERT INTO `model_nation` VALUES ('1353', '350926', '', '', '柘荣县', '1345', '119.898226', '27.236163', 'wsv6bq5nph');
INSERT INTO `model_nation` VALUES ('1354', '350981', '', '', '福安市', '1345', '119.650798', '27.084246', 'wsv44dx11t');
INSERT INTO `model_nation` VALUES ('1355', '350982', '', '', '福鼎市', '1345', '120.219761', '27.318884', 'wsv7rtm253');
INSERT INTO `model_nation` VALUES ('1356', '360000', '江西省', '', '', '1', '115.892151', '28.676493', 'wt47jhqhdv');
INSERT INTO `model_nation` VALUES ('1357', '360100', '', '南昌市', '', '1356', '115.892151', '28.676493', 'wt47jhqhdv');
INSERT INTO `model_nation` VALUES ('1358', '360101', '', '', '市辖区', '1357', '115.892151', '28.676493', 'wt47jhqhdv');
INSERT INTO `model_nation` VALUES ('1359', '360102', '', '', '东湖区', '1357', '115.889675', '28.682988', 'wt47jjs690');
INSERT INTO `model_nation` VALUES ('1360', '360103', '', '', '西湖区', '1357', '115.91065', '28.662901', 'wt47j9gt9b');
INSERT INTO `model_nation` VALUES ('1361', '360104', '', '', '青云谱区', '1357', '115.907292', '28.635724', 'wt46vscp5t');
INSERT INTO `model_nation` VALUES ('1362', '360105', '', '', '湾里区', '1357', '115.731324', '28.714803', 'wt473e2gz7');
INSERT INTO `model_nation` VALUES ('1363', '360111', '', '', '青山湖区', '1357', '115.949044', '28.689292', 'wt47nqxx0x');
INSERT INTO `model_nation` VALUES ('1364', '360121', '', '', '南昌县', '1357', '115.942465', '28.543781', 'wt46qk4xx4');
INSERT INTO `model_nation` VALUES ('1365', '360122', '', '', '新建县', '1357', '115.820806', '28.690788', 'wt475wfpuq');
INSERT INTO `model_nation` VALUES ('1366', '360123', '', '', '安义县', '1357', '115.553109', '28.841334', 'wt4hj6rhyw');
INSERT INTO `model_nation` VALUES ('1367', '360124', '', '', '进贤县', '1357', '116.267671', '28.365681', 'wt49mezd14');
INSERT INTO `model_nation` VALUES ('1368', '360200', '', '景德镇市', '', '1356', '117.214664', '29.29256', 'wt5qek91e8');
INSERT INTO `model_nation` VALUES ('1369', '360201', '', '', '市辖区', '1368', '117.214664', '29.29256', 'wt5qek91e8');
INSERT INTO `model_nation` VALUES ('1370', '360202', '', '', '昌江区', '1368', '117.195023', '29.288465', 'wt5qdgfc9v');
INSERT INTO `model_nation` VALUES ('1371', '360203', '', '', '珠山区', '1368', '117.214814', '29.292812', 'wt5qek94zp');
INSERT INTO `model_nation` VALUES ('1372', '360222', '', '', '浮梁县', '1368', '117.217611', '29.352251', 'wt5qgr7m22');
INSERT INTO `model_nation` VALUES ('1373', '360281', '', '', '乐平市', '1368', '117.129376', '28.967361', 'wt5kc37507');
INSERT INTO `model_nation` VALUES ('1374', '360300', '', '萍乡市', '', '1356', '113.852186', '27.622946', 'wsbvnu8ek4');
INSERT INTO `model_nation` VALUES ('1375', '360301', '', '', '市辖区', '1374', '113.852186', '27.622946', 'wsbvnu8ek4');
INSERT INTO `model_nation` VALUES ('1376', '360302', '', '', '安源区', '1374', '113.855044', '27.625826', 'wsbvnv4sng');
INSERT INTO `model_nation` VALUES ('1377', '360313', '', '', '湘东区', '1374', '113.7456', '27.639319', 'wsbvhre48w');
INSERT INTO `model_nation` VALUES ('1378', '360321', '', '', '莲花县', '1374', '113.955582', '27.127807', 'wsc4347yvt');
INSERT INTO `model_nation` VALUES ('1379', '360322', '', '', '上栗县', '1374', '113.800525', '27.877041', 'wsbytdg583');
INSERT INTO `model_nation` VALUES ('1380', '360323', '', '', '芦溪县', '1374', '114.041206', '27.633633', 'wscj5nd38d');
INSERT INTO `model_nation` VALUES ('1381', '360400', '', '九江市', '', '1356', '115.992811', '29.712034', 'wt63p2zmhk');
INSERT INTO `model_nation` VALUES ('1382', '360401', '', '', '市辖区', '1381', '115.992811', '29.712034', 'wt63p2zmhk');
INSERT INTO `model_nation` VALUES ('1383', '360402', '', '', '庐山区', '1381', '115.99012', '29.676175', 'wt62z6mkjx');
INSERT INTO `model_nation` VALUES ('1384', '360403', '', '', '浔阳区', '1381', '115.995947', '29.72465', 'wt63pe1wtk');
INSERT INTO `model_nation` VALUES ('1385', '360421', '', '', '九江县', '1381', '115.892977', '29.610264', 'wt62mnqsq1');
INSERT INTO `model_nation` VALUES ('1386', '360423', '', '', '武宁县', '1381', '115.105646', '29.260182', 'wt1y7q9kgv');
INSERT INTO `model_nation` VALUES ('1387', '360424', '', '', '修水县', '1381', '114.573428', '29.032729', 'wt1mpjjzfk');
INSERT INTO `model_nation` VALUES ('1388', '360425', '', '', '永修县', '1381', '115.809055', '29.018212', 'wt4m569e6d');
INSERT INTO `model_nation` VALUES ('1389', '360426', '', '', '德安县', '1381', '115.762611', '29.327474', 'wt4qf4zubm');
INSERT INTO `model_nation` VALUES ('1390', '360427', '', '', '星子县', '1381', '116.043743', '29.456169', 'wt4x8dk6x5');
INSERT INTO `model_nation` VALUES ('1391', '360428', '', '', '都昌县', '1381', '116.205114', '29.275105', 'wt4ws33gz7');
INSERT INTO `model_nation` VALUES ('1392', '360429', '', '', '湖口县', '1381', '116.244313', '29.7263', 'wt69j5w80z');
INSERT INTO `model_nation` VALUES ('1393', '360430', '', '', '彭泽县', '1381', '116.55584', '29.898865', 'wt6fh6cmeb');
INSERT INTO `model_nation` VALUES ('1394', '360481', '', '', '瑞昌市', '1381', '115.669081', '29.676599', 'wt62b47wsz');
INSERT INTO `model_nation` VALUES ('1395', '360482', '', '', '共青城市', '1381', '115.805712', '29.247884', 'wt4q7hrjk8');
INSERT INTO `model_nation` VALUES ('1396', '360500', '', '新余市', '', '1356', '114.930835', '27.810834', 'wscwpqf1fe');
INSERT INTO `model_nation` VALUES ('1397', '360501', '', '', '市辖区', '1396', '114.930835', '27.810834', 'wscwpqf1fe');
INSERT INTO `model_nation` VALUES ('1398', '360502', '', '', '渝水区', '1396', '114.923923', '27.819171', 'wscwr0m43m');
INSERT INTO `model_nation` VALUES ('1399', '360521', '', '', '分宜县', '1396', '114.675262', '27.811301', 'wscw1qzux6');
INSERT INTO `model_nation` VALUES ('1400', '360600', '', '鹰潭市', '', '1356', '117.033838', '28.238638', 'wt50xhtmyp');
INSERT INTO `model_nation` VALUES ('1401', '360601', '', '', '市辖区', '1400', '117.033838', '28.238638', 'wt50xhtmyp');
INSERT INTO `model_nation` VALUES ('1402', '360602', '', '', '月湖区', '1400', '117.034112', '28.239076', 'wt50xhv8s3');
INSERT INTO `model_nation` VALUES ('1403', '360622', '', '', '余江县', '1400', '116.822763', '28.206177', 'wt506qg8zs');
INSERT INTO `model_nation` VALUES ('1404', '360681', '', '', '贵溪市', '1400', '117.212103', '28.283693', 'wt52ghzhry');
INSERT INTO `model_nation` VALUES ('1405', '360700', '', '赣州市', '', '1356', '114.940278', '25.85097', 'ws9epd0byd');
INSERT INTO `model_nation` VALUES ('1406', '360701', '', '', '市辖区', '1405', '114.940278', '25.85097', 'ws9epd0byd');
INSERT INTO `model_nation` VALUES ('1407', '360702', '', '', '章贡区', '1405', '114.93872', '25.851367', 'ws9ep6pg4k');
INSERT INTO `model_nation` VALUES ('1408', '360703', '', '', '南康区', '1405', '114.940278', '25.85097', 'ws9epd0byd');
INSERT INTO `model_nation` VALUES ('1409', '360721', '', '', '赣县', '1405', '115.018461', '25.865432', 'ws9g1k9vh3');
INSERT INTO `model_nation` VALUES ('1410', '360722', '', '', '信丰县', '1405', '114.930893', '25.38023', 'ws98rk64ec');
INSERT INTO `model_nation` VALUES ('1411', '360723', '', '', '大余县', '1405', '114.362243', '25.395937', 'ws926rhn13');
INSERT INTO `model_nation` VALUES ('1412', '360724', '', '', '上犹县', '1405', '114.540537', '25.794284', 'ws96wrtyeg');
INSERT INTO `model_nation` VALUES ('1413', '360725', '', '', '崇义县', '1405', '114.307348', '25.687911', 'ws961hk4fm');
INSERT INTO `model_nation` VALUES ('1414', '360726', '', '', '安远县', '1405', '115.392328', '25.134591', 'ws6nczd5s5');
INSERT INTO `model_nation` VALUES ('1415', '360727', '', '', '龙南县', '1405', '114.792657', '24.90476', 'ws3tsjv2wz');
INSERT INTO `model_nation` VALUES ('1416', '360728', '', '', '定南县', '1405', '115.03267', '24.774277', 'ws3ucwh0x7');
INSERT INTO `model_nation` VALUES ('1417', '360729', '', '', '全南县', '1405', '114.531589', '24.742651', 'ws3ky0r27k');
INSERT INTO `model_nation` VALUES ('1418', '360730', '', '', '宁都县', '1405', '116.018782', '26.472054', 'wsdw8546cs');
INSERT INTO `model_nation` VALUES ('1419', '360731', '', '', '于都县', '1405', '115.411198', '25.955033', 'wsd5dhzz5b');
INSERT INTO `model_nation` VALUES ('1420', '360732', '', '', '兴国县', '1405', '115.351896', '26.330489', 'wsdjbckdjy');
INSERT INTO `model_nation` VALUES ('1421', '360733', '', '', '会昌县', '1405', '115.791158', '25.599125', 'wsd3duht9w');
INSERT INTO `model_nation` VALUES ('1422', '360734', '', '', '寻乌县', '1405', '115.651399', '24.954136', 'ws6jzwyb2u');
INSERT INTO `model_nation` VALUES ('1423', '360735', '', '', '石城县', '1405', '116.342249', '26.326582', 'wsdtz2tg6y');
INSERT INTO `model_nation` VALUES ('1424', '360781', '', '', '瑞金市', '1405', '116.034854', '25.875278', 'wsde0qqn2j');
INSERT INTO `model_nation` VALUES ('1425', '360800', '', '吉安市', '', '1356', '114.986373', '27.111699', 'wscf0xd90e');
INSERT INTO `model_nation` VALUES ('1426', '360801', '', '', '市辖区', '1425', '114.986373', '27.111699', 'wscf0xd90e');
INSERT INTO `model_nation` VALUES ('1427', '360802', '', '', '吉州区', '1425', '114.987331', '27.112367', 'wscf0xehzp');
INSERT INTO `model_nation` VALUES ('1428', '360803', '', '', '青原区', '1425', '115.016306', '27.105879', 'wscf1q2r4n');
INSERT INTO `model_nation` VALUES ('1429', '360821', '', '', '吉安县', '1425', '114.905117', '27.040042', 'wsc9ydrrem');
INSERT INTO `model_nation` VALUES ('1430', '360822', '', '', '吉水县', '1425', '115.134569', '27.213445', 'wscfgfn3vc');
INSERT INTO `model_nation` VALUES ('1431', '360823', '', '', '峡江县', '1425', '115.319331', '27.580862', 'wsfhbhuypj');
INSERT INTO `model_nation` VALUES ('1432', '360824', '', '', '新干县', '1425', '115.399294', '27.755758', 'wsfjcuz1n2');
INSERT INTO `model_nation` VALUES ('1433', '360825', '', '', '永丰县', '1425', '115.435559', '27.321087', 'wsf56v9sg7');
INSERT INTO `model_nation` VALUES ('1434', '360826', '', '', '泰和县', '1425', '114.901393', '26.790164', 'wsc8qth8h8');
INSERT INTO `model_nation` VALUES ('1435', '360827', '', '', '遂川县', '1425', '114.51689', '26.323705', 'ws9mvbhdsy');
INSERT INTO `model_nation` VALUES ('1436', '360828', '', '', '万安县', '1425', '114.784694', '26.462085', 'ws9wecr8v4');
INSERT INTO `model_nation` VALUES ('1437', '360829', '', '', '安福县', '1425', '114.61384', '27.382746', 'wsceb0gk01');
INSERT INTO `model_nation` VALUES ('1438', '360830', '', '', '永新县', '1425', '114.242534', '26.944721', 'wsc1r9hu7u');
INSERT INTO `model_nation` VALUES ('1439', '360881', '', '', '井冈山市', '1425', '114.284421', '26.745919', 'wsc20sgqk0');
INSERT INTO `model_nation` VALUES ('1440', '360900', '', '宜春市', '', '1356', '114.391136', '27.8043', 'wscq5j95f9');
INSERT INTO `model_nation` VALUES ('1441', '360901', '', '', '市辖区', '1440', '114.391136', '27.8043', 'wscq5j95f9');
INSERT INTO `model_nation` VALUES ('1442', '360902', '', '', '袁州区', '1440', '114.387379', '27.800117', 'wscq4uy77j');
INSERT INTO `model_nation` VALUES ('1443', '360921', '', '', '奉新县', '1440', '115.389899', '28.700672', 'wt453bb3e9');
INSERT INTO `model_nation` VALUES ('1444', '360922', '', '', '万载县', '1440', '114.449012', '28.104528', 'wscruk70xr');
INSERT INTO `model_nation` VALUES ('1445', '360923', '', '', '上高县', '1440', '114.932653', '28.234789', 'wt18x7grsf');
INSERT INTO `model_nation` VALUES ('1446', '360924', '', '', '宜丰县', '1440', '114.787381', '28.388289', 'wt19kpctgb');
INSERT INTO `model_nation` VALUES ('1447', '360925', '', '', '靖安县', '1440', '115.361744', '28.86054', 'wt4h1jgug6');
INSERT INTO `model_nation` VALUES ('1448', '360926', '', '', '铜鼓县', '1440', '114.37014', '28.520956', 'wt16681f97');
INSERT INTO `model_nation` VALUES ('1449', '360981', '', '', '丰城市', '1440', '115.786005', '28.191584', 'wt426u0gck');
INSERT INTO `model_nation` VALUES ('1450', '360982', '', '', '樟树市', '1440', '115.543388', '28.055898', 'wsfpt72jkn');
INSERT INTO `model_nation` VALUES ('1451', '360983', '', '', '高安市', '1440', '115.381527', '28.420951', 'wt419tfk03');
INSERT INTO `model_nation` VALUES ('1452', '361000', '', '抚州市', '', '1356', '116.358351', '27.98385', 'wsfxpy39dp');
INSERT INTO `model_nation` VALUES ('1453', '361001', '', '', '市辖区', '1452', '116.358351', '27.98385', 'wsfxpy39dp');
INSERT INTO `model_nation` VALUES ('1454', '361002', '', '', '临川区', '1452', '116.361404', '27.981919', 'wsfxpvgy3p');
INSERT INTO `model_nation` VALUES ('1455', '361021', '', '', '南城县', '1452', '116.63945', '27.55531', 'wsfuy0q324');
INSERT INTO `model_nation` VALUES ('1456', '361022', '', '', '黎川县', '1452', '116.91457', '27.292561', 'wsg5k2qwdy');
INSERT INTO `model_nation` VALUES ('1457', '361023', '', '', '南丰县', '1452', '116.532994', '27.210132', 'wsffgc2wx8');
INSERT INTO `model_nation` VALUES ('1458', '361024', '', '', '崇仁县', '1452', '116.059109', '27.760907', 'wsftbvxxj2');
INSERT INTO `model_nation` VALUES ('1459', '361025', '', '', '乐安县', '1452', '115.838432', '27.420101', 'wsf7gzwvxj');
INSERT INTO `model_nation` VALUES ('1460', '361026', '', '', '宜黄县', '1452', '116.223023', '27.546512', 'wsfsswxn0d');
INSERT INTO `model_nation` VALUES ('1461', '361027', '', '', '金溪县', '1452', '116.778751', '27.907387', 'wsgnc27sq1');
INSERT INTO `model_nation` VALUES ('1462', '361028', '', '', '资溪县', '1452', '117.066095', '27.70653', 'wsgjxgufjx');
INSERT INTO `model_nation` VALUES ('1463', '361029', '', '', '东乡县', '1452', '116.605341', '28.2325', 'wt4bt7t6jr');
INSERT INTO `model_nation` VALUES ('1464', '361030', '', '', '广昌县', '1452', '116.327291', '26.838426', 'wsf8xjfcnm');
INSERT INTO `model_nation` VALUES ('1465', '361100', '', '上饶市', '', '1356', '117.971185', '28.44442', 'wt5cu6puzb');
INSERT INTO `model_nation` VALUES ('1466', '361101', '', '', '市辖区', '1465', '117.971185', '28.44442', 'wt5cu6puzb');
INSERT INTO `model_nation` VALUES ('1467', '361102', '', '', '信州区', '1465', '117.970522', '28.445378', 'wt5cu6rd26');
INSERT INTO `model_nation` VALUES ('1468', '361121', '', '', '上饶县', '1465', '117.90612', '28.453897', 'wt5cg5begw');
INSERT INTO `model_nation` VALUES ('1469', '361122', '', '', '广丰县', '1465', '118.189852', '28.440285', 'wth1c3rhxj');
INSERT INTO `model_nation` VALUES ('1470', '361123', '', '', '玉山县', '1465', '118.244408', '28.673479', 'wth54eygn7');
INSERT INTO `model_nation` VALUES ('1471', '361124', '', '', '铅山县', '1465', '117.711906', '28.310892', 'wt59n9g4yh');
INSERT INTO `model_nation` VALUES ('1472', '361125', '', '', '横峰县', '1465', '117.608247', '28.415103', 'wt59shz9yz');
INSERT INTO `model_nation` VALUES ('1473', '361126', '', '', '弋阳县', '1465', '117.435002', '28.402391', 'wt59863xcv');
INSERT INTO `model_nation` VALUES ('1474', '361127', '', '', '余干县', '1465', '116.691072', '28.69173', 'wt4gpr5v7n');
INSERT INTO `model_nation` VALUES ('1475', '361128', '', '', '鄱阳县', '1465', '116.673748', '28.993374', 'wt4uyyp4xk');
INSERT INTO `model_nation` VALUES ('1476', '361129', '', '', '万年县', '1465', '117.07015', '28.692589', 'wt55pzrfkn');
INSERT INTO `model_nation` VALUES ('1477', '361130', '', '', '婺源县', '1465', '117.86219', '29.254015', 'wt5y6j88up');
INSERT INTO `model_nation` VALUES ('1478', '361181', '', '', '德兴市', '1465', '117.578732', '28.945034', 'wt5set61p1');
INSERT INTO `model_nation` VALUES ('1479', '370000', '山东省', '', '', '1', '117.000923', '36.675807', 'wwe0wktkp1');
INSERT INTO `model_nation` VALUES ('1480', '370100', '', '济南市', '', '1479', '117.000923', '36.675807', 'wwe0wktkp1');
INSERT INTO `model_nation` VALUES ('1481', '370101', '', '', '市辖区', '1480', '117.000923', '36.675807', 'wwe0wktkp1');
INSERT INTO `model_nation` VALUES ('1482', '370102', '', '', '历下区', '1480', '117.03862', '36.664169', 'wwe0x68bm8');
INSERT INTO `model_nation` VALUES ('1483', '370103', '', '', '市中区', '1480', '116.99898', '36.657354', 'wwe0w3k09f');
INSERT INTO `model_nation` VALUES ('1484', '370104', '', '', '槐荫区', '1480', '116.947921', '36.668205', 'wwe0t5nzu0');
INSERT INTO `model_nation` VALUES ('1485', '370105', '', '', '天桥区', '1480', '116.996086', '36.693374', 'wwe0wrcfqk');
INSERT INTO `model_nation` VALUES ('1486', '370112', '', '', '历城区', '1480', '117.063744', '36.681744', 'wwe0xvenwu');
INSERT INTO `model_nation` VALUES ('1487', '370113', '', '', '长清区', '1480', '116.74588', '36.561049', 'ww7pbxez81');
INSERT INTO `model_nation` VALUES ('1488', '370124', '', '', '平阴县', '1480', '116.455054', '36.286923', 'ww6y3vzfxk');
INSERT INTO `model_nation` VALUES ('1489', '370125', '', '', '济阳县', '1480', '117.176035', '36.976772', 'wwe667kvr9');
INSERT INTO `model_nation` VALUES ('1490', '370126', '', '', '商河县', '1480', '117.156369', '37.310544', 'wwek3bnttm');
INSERT INTO `model_nation` VALUES ('1491', '370181', '', '', '章丘市', '1480', '117.54069', '36.71209', 'wwe8fenx2t');
INSERT INTO `model_nation` VALUES ('1492', '370200', '', '青岛市', '', '1479', '120.355173', '36.082982', 'wwmt68xywg');
INSERT INTO `model_nation` VALUES ('1493', '370201', '', '', '市辖区', '1492', '120.355173', '36.082982', 'wwmt68xywg');
INSERT INTO `model_nation` VALUES ('1494', '370202', '', '', '市南区', '1492', '120.395966', '36.070892', 'wwmt5wt8jm');
INSERT INTO `model_nation` VALUES ('1495', '370203', '', '', '市北区', '1492', '120.355026', '36.083819', 'wwmt68zg7r');
INSERT INTO `model_nation` VALUES ('1496', '370211', '', '', '黄岛区', '1492', '119.995518', '35.875138', 'wwmk4df5f4');
INSERT INTO `model_nation` VALUES ('1497', '370212', '', '', '崂山区', '1492', '120.467393', '36.102569', 'wwmtmk38tw');
INSERT INTO `model_nation` VALUES ('1498', '370213', '', '', '李沧区', '1492', '120.421236', '36.160023', 'wwmtsq8p6h');
INSERT INTO `model_nation` VALUES ('1499', '370214', '', '', '城阳区', '1492', '120.389135', '36.306833', 'wwmwe92wwh');
INSERT INTO `model_nation` VALUES ('1500', '370281', '', '', '胶州市', '1492', '120.006202', '36.285878', 'wwmq6v9ue1');
INSERT INTO `model_nation` VALUES ('1501', '370282', '', '', '即墨市', '1492', '120.447352', '36.390847', 'wwmxhbg049');
INSERT INTO `model_nation` VALUES ('1502', '370283', '', '', '平度市', '1492', '119.959012', '36.788828', 'wwt339pqrw');
INSERT INTO `model_nation` VALUES ('1503', '370285', '', '', '莱西市', '1492', '120.526226', '36.86509', 'wwt9wxhd8w');
INSERT INTO `model_nation` VALUES ('1504', '370300', '', '淄博市', '', '1479', '118.047648', '36.814939', 'wwecqjzwtd');
INSERT INTO `model_nation` VALUES ('1505', '370301', '', '', '市辖区', '1504', '118.047648', '36.814939', 'wwecqjzwtd');
INSERT INTO `model_nation` VALUES ('1506', '370302', '', '', '淄川区', '1504', '117.967696', '36.647272', 'wwebkrmmyd');
INSERT INTO `model_nation` VALUES ('1507', '370303', '', '', '张店区', '1504', '118.053521', '36.807049', 'wwecqkebw7');
INSERT INTO `model_nation` VALUES ('1508', '370304', '', '', '博山区', '1504', '117.85823', '36.497567', 'ww7z9ujtxz');
INSERT INTO `model_nation` VALUES ('1509', '370305', '', '', '临淄区', '1504', '118.306018', '36.816657', 'wws1kn7bd4');
INSERT INTO `model_nation` VALUES ('1510', '370306', '', '', '周村区', '1504', '117.851036', '36.803699', 'wwec3gbt04');
INSERT INTO `model_nation` VALUES ('1511', '370321', '', '', '桓台县', '1504', '118.101556', '36.959773', 'wwefr2qfm9');
INSERT INTO `model_nation` VALUES ('1512', '370322', '', '', '高青县', '1504', '117.829839', '37.169581', 'wweg3q90d2');
INSERT INTO `model_nation` VALUES ('1513', '370323', '', '', '沂源县', '1504', '118.166161', '36.186282', 'wwkjbgtbr5');
INSERT INTO `model_nation` VALUES ('1514', '370400', '', '枣庄市', '', '1479', '117.557964', '34.856424', 'ww5w717j7h');
INSERT INTO `model_nation` VALUES ('1515', '370401', '', '', '市辖区', '1514', '117.557964', '34.856424', 'ww5w717j7h');
INSERT INTO `model_nation` VALUES ('1516', '370402', '', '', '市中区', '1514', '117.557281', '34.856651', 'ww5w716wen');
INSERT INTO `model_nation` VALUES ('1517', '370403', '', '', '薛城区', '1514', '117.265293', '34.79789', 'ww5muqvbrk');
INSERT INTO `model_nation` VALUES ('1518', '370404', '', '', '峄城区', '1514', '117.586316', '34.767713', 'ww5tg9r8xg');
INSERT INTO `model_nation` VALUES ('1519', '370405', '', '', '台儿庄区', '1514', '117.734747', '34.564815', 'ww5sxh7fdk');
INSERT INTO `model_nation` VALUES ('1520', '370406', '', '', '山亭区', '1514', '117.458968', '35.096077', 'ww5x8v512q');
INSERT INTO `model_nation` VALUES ('1521', '370481', '', '', '滕州市', '1514', '117.162098', '35.088498', 'ww5rd5dv6f');
INSERT INTO `model_nation` VALUES ('1522', '370500', '', '东营市', '', '1479', '118.66471', '37.434564', 'wwskuqc00h');
INSERT INTO `model_nation` VALUES ('1523', '370501', '', '', '市辖区', '1522', '118.66471', '37.434564', 'wwskuqc00h');
INSERT INTO `model_nation` VALUES ('1524', '370502', '', '', '东营区', '1522', '118.507543', '37.461567', 'wwsm0ewt3y');
INSERT INTO `model_nation` VALUES ('1525', '370503', '', '', '河口区', '1522', '118.529613', '37.886015', 'wwsr90ywh1');
INSERT INTO `model_nation` VALUES ('1526', '370521', '', '', '垦利县', '1522', '118.551314', '37.588679', 'wwsmcdy3vv');
INSERT INTO `model_nation` VALUES ('1527', '370522', '', '', '利津县', '1522', '118.248854', '37.493365', 'wwsj6c6nwj');
INSERT INTO `model_nation` VALUES ('1528', '370523', '', '', '广饶县', '1522', '118.407522', '37.05161', 'wws4y3j9r0');
INSERT INTO `model_nation` VALUES ('1529', '370600', '', '烟台市', '', '1479', '121.391382', '37.539297', 'wwwmd3fd20');
INSERT INTO `model_nation` VALUES ('1530', '370601', '', '', '市辖区', '1529', '121.391382', '37.539297', 'wwwmd3fd20');
INSERT INTO `model_nation` VALUES ('1531', '370602', '', '', '芝罘区', '1529', '121.385877', '37.540925', 'wwwmd4n7xz');
INSERT INTO `model_nation` VALUES ('1532', '370611', '', '', '福山区', '1529', '121.264741', '37.496875', 'wwwjr6n71k');
INSERT INTO `model_nation` VALUES ('1533', '370612', '', '', '牟平区', '1529', '121.60151', '37.388356', 'wwwkxn7dbw');
INSERT INTO `model_nation` VALUES ('1534', '370613', '', '', '莱山区', '1529', '121.448866', '37.473549', 'wwwm5tu75x');
INSERT INTO `model_nation` VALUES ('1535', '370634', '', '', '长岛县', '1529', '120.738345', '37.916194', 'wwtzeqqvz6');
INSERT INTO `model_nation` VALUES ('1536', '370681', '', '', '龙口市', '1529', '120.528328', '37.648446', 'wwtwntwn1e');
INSERT INTO `model_nation` VALUES ('1537', '370682', '', '', '莱阳市', '1529', '120.711151', '36.977037', 'wwtf6g7nve');
INSERT INTO `model_nation` VALUES ('1538', '370683', '', '', '莱州市', '1529', '119.942135', '37.182725', 'wwt792gjn6');
INSERT INTO `model_nation` VALUES ('1539', '370684', '', '', '蓬莱市', '1529', '120.762689', '37.811168', 'wwtzh52dn8');
INSERT INTO `model_nation` VALUES ('1540', '370685', '', '', '招远市', '1529', '120.403142', '37.364919', 'wwtsef4fkt');
INSERT INTO `model_nation` VALUES ('1541', '370686', '', '', '栖霞市', '1529', '120.834097', '37.305854', 'wwtujxkdqe');
INSERT INTO `model_nation` VALUES ('1542', '370687', '', '', '海阳市', '1529', '121.168392', '36.780657', 'www1jr8nu5');
INSERT INTO `model_nation` VALUES ('1543', '370700', '', '潍坊市', '', '1479', '119.107078', '36.70925', 'wws8y6enuh');
INSERT INTO `model_nation` VALUES ('1544', '370701', '', '', '市辖区', '1543', '119.107078', '36.70925', 'wws8y6enuh');
INSERT INTO `model_nation` VALUES ('1545', '370702', '', '', '潍城区', '1543', '119.103784', '36.710062', 'wws8y6bex7');
INSERT INTO `model_nation` VALUES ('1546', '370703', '', '', '寒亭区', '1543', '119.207866', '36.772103', 'wwsc0wht08');
INSERT INTO `model_nation` VALUES ('1547', '370704', '', '', '坊子区', '1543', '119.166326', '36.654616', 'wws8x8y28e');
INSERT INTO `model_nation` VALUES ('1548', '370705', '', '', '奎文区', '1543', '119.137357', '36.709494', 'wws8z4c0m9');
INSERT INTO `model_nation` VALUES ('1549', '370724', '', '', '临朐县', '1543', '118.539876', '36.516371', 'wwkr9rw572');
INSERT INTO `model_nation` VALUES ('1550', '370725', '', '', '昌乐县', '1543', '118.839995', '36.703253', 'wws8b38euw');
INSERT INTO `model_nation` VALUES ('1551', '370781', '', '', '青州市', '1543', '118.484693', '36.697855', 'wws2b0tut2');
INSERT INTO `model_nation` VALUES ('1552', '370782', '', '', '诸城市', '1543', '119.403182', '35.997093', 'wwkuv14drb');
INSERT INTO `model_nation` VALUES ('1553', '370783', '', '', '寿光市', '1543', '118.736451', '36.874411', 'wws3vbv1pb');
INSERT INTO `model_nation` VALUES ('1554', '370784', '', '', '安丘市', '1543', '119.206886', '36.427417', 'wwkz0x7v1f');
INSERT INTO `model_nation` VALUES ('1555', '370785', '', '', '高密市', '1543', '119.757033', '36.37754', 'wwmnvnk6t0');
INSERT INTO `model_nation` VALUES ('1556', '370786', '', '', '昌邑市', '1543', '119.394502', '36.854937', 'wwscsvhrtd');
INSERT INTO `model_nation` VALUES ('1557', '370800', '', '济宁市', '', '1479', '116.587245', '35.415393', 'ww6cmp0jxe');
INSERT INTO `model_nation` VALUES ('1558', '370801', '', '', '市辖区', '1557', '116.587245', '35.415393', 'ww6cmp0jxe');
INSERT INTO `model_nation` VALUES ('1559', '370811', '', '', '任城区', '1557', '116.595261', '35.414828', 'ww6cmpn466');
INSERT INTO `model_nation` VALUES ('1560', '370812', '', '', '兖州区', '1557', '116.587245', '35.415393', 'ww6cmp0jxe');
INSERT INTO `model_nation` VALUES ('1561', '370826', '', '', '微山县', '1557', '117.12861', '34.809525', 'ww5q12fknm');
INSERT INTO `model_nation` VALUES ('1562', '370827', '', '', '鱼台县', '1557', '116.650023', '34.997706', 'ww4zn7juqt');
INSERT INTO `model_nation` VALUES ('1563', '370828', '', '', '金乡县', '1557', '116.310364', '35.06977', 'ww4xw8q85y');
INSERT INTO `model_nation` VALUES ('1564', '370829', '', '', '嘉祥县', '1557', '116.342885', '35.398098', 'ww69rkn2ce');
INSERT INTO `model_nation` VALUES ('1565', '370830', '', '', '汶上县', '1557', '116.487146', '35.721746', 'ww6g4wzq70');
INSERT INTO `model_nation` VALUES ('1566', '370831', '', '', '泗水县', '1557', '117.273605', '35.653216', 'ww76udkp11');
INSERT INTO `model_nation` VALUES ('1567', '370832', '', '', '梁山县', '1557', '116.08963', '35.801843', 'ww6e9ttbu7');
INSERT INTO `model_nation` VALUES ('1568', '370881', '', '', '曲阜市', '1557', '116.991885', '35.592788', 'ww74qpqzh8');
INSERT INTO `model_nation` VALUES ('1569', '370883', '', '', '邹城市', '1557', '116.96673', '35.405259', 'ww71mtkdd6');
INSERT INTO `model_nation` VALUES ('1570', '370900', '', '泰安市', '', '1479', '117.129063', '36.194968', 'ww7mcm4fbz');
INSERT INTO `model_nation` VALUES ('1571', '370901', '', '', '市辖区', '1570', '117.129063', '36.194968', 'ww7mcm4fbz');
INSERT INTO `model_nation` VALUES ('1572', '370902', '', '', '泰山区', '1570', '117.129984', '36.189313', 'ww7mck56n2');
INSERT INTO `model_nation` VALUES ('1573', '370911', '', '', '岱岳区', '1570', '117.04353', '36.1841', 'ww7jz7h7xv');
INSERT INTO `model_nation` VALUES ('1574', '370921', '', '', '宁阳县', '1570', '116.799297', '35.76754', 'ww753z69hb');
INSERT INTO `model_nation` VALUES ('1575', '370923', '', '', '东平县', '1570', '116.461052', '35.930467', 'ww6u6huq5h');
INSERT INTO `model_nation` VALUES ('1576', '370982', '', '', '新泰市', '1570', '117.766092', '35.910387', 'ww7src69hv');
INSERT INTO `model_nation` VALUES ('1577', '370983', '', '', '肥城市', '1570', '116.763703', '36.1856', 'ww7jc52srk');
INSERT INTO `model_nation` VALUES ('1578', '371000', '', '威海市', '', '1479', '122.116394', '37.509691', 'wwwv6u6my1');
INSERT INTO `model_nation` VALUES ('1579', '371001', '', '', '市辖区', '1578', '122.116394', '37.509691', 'wwwv6u6my1');
INSERT INTO `model_nation` VALUES ('1580', '371002', '', '', '环翠区', '1578', '122.116189', '37.510754', 'wwwv6ud7cr');
INSERT INTO `model_nation` VALUES ('1581', '371081', '', '', '文登市', '1578', '122.057139', '37.196211', 'wwwg97r79k');
INSERT INTO `model_nation` VALUES ('1582', '371082', '', '', '荣成市', '1578', '122.422896', '37.160134', 'wwx53uc9kp');
INSERT INTO `model_nation` VALUES ('1583', '371083', '', '', '乳山市', '1578', '121.536346', '36.919622', 'www6j9h06h');
INSERT INTO `model_nation` VALUES ('1584', '371100', '', '日照市', '', '1479', '119.461208', '35.428588', 'wwkcw3sfrz');
INSERT INTO `model_nation` VALUES ('1585', '371101', '', '', '市辖区', '1584', '119.461208', '35.428588', 'wwkcw3sfrz');
INSERT INTO `model_nation` VALUES ('1586', '371102', '', '', '东港区', '1584', '119.457703', '35.426152', 'wwkcw34kq1');
INSERT INTO `model_nation` VALUES ('1587', '371103', '', '', '岚山区', '1584', '119.315844', '35.119794', 'wwhzg175ss');
INSERT INTO `model_nation` VALUES ('1588', '371121', '', '', '五莲县', '1584', '119.206745', '35.751936', 'wwkg2s7wn7');
INSERT INTO `model_nation` VALUES ('1589', '371122', '', '', '莒县', '1584', '118.832859', '35.588115', 'wwkd2ne7y3');
INSERT INTO `model_nation` VALUES ('1590', '371200', '', '莱芜市', '', '1479', '117.677736', '36.214397', 'ww7wjbdk1u');
INSERT INTO `model_nation` VALUES ('1591', '371201', '', '', '市辖区', '1590', '117.677736', '36.214397', 'ww7wjbdk1u');
INSERT INTO `model_nation` VALUES ('1592', '371202', '', '', '莱城区', '1590', '117.678351', '36.213662', 'ww7wjb6zb7');
INSERT INTO `model_nation` VALUES ('1593', '371203', '', '', '钢城区', '1590', '117.82033', '36.058038', 'ww7v1h4jk9');
INSERT INTO `model_nation` VALUES ('1594', '371300', '', '临沂市', '', '1479', '118.326443', '35.065282', 'wwhpkx6wjf');
INSERT INTO `model_nation` VALUES ('1595', '371301', '', '', '市辖区', '1594', '118.326443', '35.065282', 'wwhpkx6wjf');
INSERT INTO `model_nation` VALUES ('1596', '371302', '', '', '兰山区', '1594', '118.327667', '35.061631', 'wwhpkwg8f3');
INSERT INTO `model_nation` VALUES ('1597', '371311', '', '', '罗庄区', '1594', '118.284795', '34.997204', 'wwhp5eh37r');
INSERT INTO `model_nation` VALUES ('1598', '371312', '', '', '河东区', '1594', '118.398296', '35.085004', 'wwhpw5p0bq');
INSERT INTO `model_nation` VALUES ('1599', '371321', '', '', '沂南县', '1594', '118.455395', '35.547002', 'wwk4px0s6c');
INSERT INTO `model_nation` VALUES ('1600', '371322', '', '', '郯城县', '1594', '118.342963', '34.614741', 'wwhhuvqtqz');
INSERT INTO `model_nation` VALUES ('1601', '371323', '', '', '沂水县', '1594', '118.634543', '35.787029', 'wwk7edg491');
INSERT INTO `model_nation` VALUES ('1602', '371324', '', '', '兰陵县', '1594', '118.049968', '34.855573', 'ww5yq3327t');
INSERT INTO `model_nation` VALUES ('1603', '371325', '', '', '费县', '1594', '117.968869', '35.269174', 'ww7bskw3cf');
INSERT INTO `model_nation` VALUES ('1604', '371326', '', '', '平邑县', '1594', '117.631884', '35.511519', 'ww7dhb8vtd');
INSERT INTO `model_nation` VALUES ('1605', '371327', '', '', '莒南县', '1594', '118.838322', '35.175911', 'wwk805x6t9');
INSERT INTO `model_nation` VALUES ('1606', '371328', '', '', '蒙阴县', '1594', '117.943271', '35.712435', 'ww7g5v78j2');
INSERT INTO `model_nation` VALUES ('1607', '371329', '', '', '临沭县', '1594', '118.648379', '34.917062', 'wwhqeumnes');
INSERT INTO `model_nation` VALUES ('1608', '371400', '', '德州市', '', '1479', '116.307428', '37.453968', 'wwdtndk3pt');
INSERT INTO `model_nation` VALUES ('1609', '371401', '', '', '市辖区', '1608', '116.307428', '37.453968', 'wwdtndk3pt');
INSERT INTO `model_nation` VALUES ('1610', '371402', '', '', '德城区', '1608', '116.307076', '37.453923', 'wwdtndk0zm');
INSERT INTO `model_nation` VALUES ('1611', '371403', '', '', '陵城区', '1608', '116.307428', '37.453968', 'wwdtndk3pt');
INSERT INTO `model_nation` VALUES ('1612', '371422', '', '', '宁津县', '1608', '116.79372', '37.649619', 'wwen1tysfv');
INSERT INTO `model_nation` VALUES ('1613', '371423', '', '', '庆云县', '1608', '117.390507', '37.777724', 'wweqzm1pjn');
INSERT INTO `model_nation` VALUES ('1614', '371424', '', '', '临邑县', '1608', '116.867028', '37.192044', 'wwe5e6egr5');
INSERT INTO `model_nation` VALUES ('1615', '371425', '', '', '齐河县', '1608', '116.758394', '36.795497', 'wwe12fkv7c');
INSERT INTO `model_nation` VALUES ('1616', '371426', '', '', '平原县', '1608', '116.433904', '37.164465', 'wwdg3t8ddw');
INSERT INTO `model_nation` VALUES ('1617', '371427', '', '', '夏津县', '1608', '116.003816', '36.950501', 'wwd6pwxkkb');
INSERT INTO `model_nation` VALUES ('1618', '371428', '', '', '武城县', '1608', '116.078627', '37.209527', 'wwde9mvchn');
INSERT INTO `model_nation` VALUES ('1619', '371481', '', '', '乐陵市', '1608', '117.216657', '37.729115', 'wweqek6s40');
INSERT INTO `model_nation` VALUES ('1620', '371482', '', '', '禹城市', '1608', '116.642554', '36.934485', 'wwdfn78wbx');
INSERT INTO `model_nation` VALUES ('1621', '371500', '', '聊城市', '', '1479', '115.980367', '36.456013', 'ww6rrhw7dm');
INSERT INTO `model_nation` VALUES ('1622', '371501', '', '', '市辖区', '1621', '115.980367', '36.456013', 'ww6rrhw7dm');
INSERT INTO `model_nation` VALUES ('1623', '371502', '', '', '东昌府区', '1621', '115.980023', '36.45606', 'ww6rrhw5fq');
INSERT INTO `model_nation` VALUES ('1624', '371521', '', '', '阳谷县', '1621', '115.784287', '36.113708', 'ww6m6wr997');
INSERT INTO `model_nation` VALUES ('1625', '371522', '', '', '莘县', '1621', '115.667291', '36.237597', 'ww6q0hf771');
INSERT INTO `model_nation` VALUES ('1626', '371523', '', '', '茌平县', '1621', '116.25335', '36.591934', 'wwd8jmm57q');
INSERT INTO `model_nation` VALUES ('1627', '371524', '', '', '东阿县', '1621', '116.248855', '36.336004', 'ww6wtqcbdd');
INSERT INTO `model_nation` VALUES ('1628', '371525', '', '', '冠县', '1621', '115.444808', '36.483753', 'ww6pe18m6b');
INSERT INTO `model_nation` VALUES ('1629', '371526', '', '', '高唐县', '1621', '116.229662', '36.859755', 'wwd9sy5gek');
INSERT INTO `model_nation` VALUES ('1630', '371581', '', '', '临清市', '1621', '115.713462', '36.842598', 'wwd394gzxn');
INSERT INTO `model_nation` VALUES ('1631', '371600', '', '滨州市', '', '1479', '118.016974', '37.383542', 'wweutt3qfv');
INSERT INTO `model_nation` VALUES ('1632', '371601', '', '', '市辖区', '1631', '118.016974', '37.383542', 'wweutt3qfv');
INSERT INTO `model_nation` VALUES ('1633', '371602', '', '', '滨城区', '1631', '118.020149', '37.384842', 'wweuttewkz');
INSERT INTO `model_nation` VALUES ('1634', '371603', '', '', '沾化区', '1631', '118.016974', '37.383542', 'wweutt3qfv');
INSERT INTO `model_nation` VALUES ('1635', '371621', '', '', '惠民县', '1631', '117.508941', '37.483876', 'wwet1zxrku');
INSERT INTO `model_nation` VALUES ('1636', '371622', '', '', '阳信县', '1631', '117.581326', '37.640492', 'wwew5shpg2');
INSERT INTO `model_nation` VALUES ('1637', '371623', '', '', '无棣县', '1631', '117.616325', '37.740848', 'wwewsqt875');
INSERT INTO `model_nation` VALUES ('1638', '371625', '', '', '博兴县', '1631', '118.123096', '37.147002', 'wwegrfqsgx');
INSERT INTO `model_nation` VALUES ('1639', '371626', '', '', '邹平县', '1631', '117.736807', '36.87803', 'wwe9z1mq47');
INSERT INTO `model_nation` VALUES ('1640', '371700', '', '菏泽市', '', '1479', '115.469381', '35.246531', 'ww60e86jzt');
INSERT INTO `model_nation` VALUES ('1641', '371701', '', '', '市辖区', '1640', '115.469381', '35.246531', 'ww60e86jzt');
INSERT INTO `model_nation` VALUES ('1642', '371702', '', '', '牡丹区', '1640', '115.470946', '35.24311', 'ww607xg3up');
INSERT INTO `model_nation` VALUES ('1643', '371721', '', '', '曹县', '1640', '115.549482', '34.823253', 'ww4nj7ks4h');
INSERT INTO `model_nation` VALUES ('1644', '371722', '', '', '单县', '1640', '116.08262', '34.790851', 'ww4tct2z3h');
INSERT INTO `model_nation` VALUES ('1645', '371723', '', '', '成武县', '1640', '115.897349', '34.947366', 'ww4qv3cz5v');
INSERT INTO `model_nation` VALUES ('1646', '371724', '', '', '巨野县', '1640', '116.089341', '35.390999', 'ww693dtxt8');
INSERT INTO `model_nation` VALUES ('1647', '371725', '', '', '郓城县', '1640', '115.93885', '35.594773', 'ww66qrb4e4');
INSERT INTO `model_nation` VALUES ('1648', '371726', '', '', '鄄城县', '1640', '115.51434', '35.560257', 'ww64k9dcx0');
INSERT INTO `model_nation` VALUES ('1649', '371727', '', '', '定陶县', '1640', '115.569601', '35.072701', 'ww4ptbg1qc');
INSERT INTO `model_nation` VALUES ('1650', '371728', '', '', '东明县', '1640', '115.098412', '35.289637', 'ww3bg0k153');
INSERT INTO `model_nation` VALUES ('1651', '410000', '河南省', '', '', '1', '113.665412', '34.757975', 'ww0vdx2xuh');
INSERT INTO `model_nation` VALUES ('1652', '410100', '', '郑州市', '', '1651', '113.665412', '34.757975', 'ww0vdx2xuh');
INSERT INTO `model_nation` VALUES ('1653', '410101', '', '', '市辖区', '1652', '113.665412', '34.757975', 'ww0vdx2xuh');
INSERT INTO `model_nation` VALUES ('1654', '410102', '', '', '中原区', '1652', '113.611576', '34.748286', 'ww0v9m9rmt');
INSERT INTO `model_nation` VALUES ('1655', '410103', '', '', '二七区', '1652', '113.645422', '34.730936', 'ww0vd4d467');
INSERT INTO `model_nation` VALUES ('1656', '410104', '', '', '管城回族区', '1652', '113.685313', '34.746453', 'ww0vdvrhgb');
INSERT INTO `model_nation` VALUES ('1657', '410105', '', '', '金水区', '1652', '113.686037', '34.775838', 'ww0vffxxuw');
INSERT INTO `model_nation` VALUES ('1658', '410106', '', '', '上街区', '1652', '113.298282', '34.808689', 'ww0w40tr33');
INSERT INTO `model_nation` VALUES ('1659', '410108', '', '', '惠济区', '1652', '113.61836', '34.828591', 'ww0y1kq75x');
INSERT INTO `model_nation` VALUES ('1660', '410122', '', '', '中牟县', '1652', '114.022521', '34.721976', 'ww1jd8uwjm');
INSERT INTO `model_nation` VALUES ('1661', '410181', '', '', '巩义市', '1652', '112.98283', '34.75218', 'ww0mdyrw4g');
INSERT INTO `model_nation` VALUES ('1662', '410182', '', '', '荥阳市', '1652', '113.391523', '34.789077', 'ww0tum1jjc');
INSERT INTO `model_nation` VALUES ('1663', '410183', '', '', '新密市', '1652', '113.380616', '34.537846', 'ww0skp3jxc');
INSERT INTO `model_nation` VALUES ('1664', '410184', '', '', '新郑市', '1652', '113.73967', '34.394219', 'ww0gsjq8y7');
INSERT INTO `model_nation` VALUES ('1665', '410185', '', '', '登封市', '1652', '113.037768', '34.459939', 'ww0kh1pxdy');
INSERT INTO `model_nation` VALUES ('1666', '410200', '', '开封市', '', '1651', '114.341447', '34.797049', 'ww1mcysgsb');
INSERT INTO `model_nation` VALUES ('1667', '410201', '', '', '市辖区', '1666', '114.341447', '34.797049', 'ww1mcysgsb');
INSERT INTO `model_nation` VALUES ('1668', '410202', '', '', '龙亭区', '1666', '114.353348', '34.799833', 'ww1mfpjedp');
INSERT INTO `model_nation` VALUES ('1669', '410203', '', '', '顺河回族区', '1666', '114.364875', '34.800459', 'ww1mfrjzqe');
INSERT INTO `model_nation` VALUES ('1670', '410204', '', '', '鼓楼区', '1666', '114.3485', '34.792383', 'ww1mfjf034');
INSERT INTO `model_nation` VALUES ('1671', '410205', '', '', '禹王台区', '1666', '114.350246', '34.779727', 'ww1mf57q9g');
INSERT INTO `model_nation` VALUES ('1672', '410212', '', '', '祥符区', '1666', '114.341447', '34.797049', 'ww1mcysgsb');
INSERT INTO `model_nation` VALUES ('1673', '410221', '', '', '杞县', '1666', '114.770472', '34.554585', 'ww1sedmr1c');
INSERT INTO `model_nation` VALUES ('1674', '410222', '', '', '通许县', '1666', '114.467734', '34.477302', 'ww1khu2ugd');
INSERT INTO `model_nation` VALUES ('1675', '410223', '', '', '尉氏县', '1666', '114.193927', '34.412256', 'ww15y893zm');
INSERT INTO `model_nation` VALUES ('1676', '410225', '', '', '兰考县', '1666', '114.820572', '34.829899', 'ww1whu9fc5');
INSERT INTO `model_nation` VALUES ('1677', '410300', '', '洛阳市', '', '1651', '112.434468', '34.663041', 'wqpvnw0qbg');
INSERT INTO `model_nation` VALUES ('1678', '410301', '', '', '市辖区', '1677', '112.434468', '34.663041', 'wqpvnw0qbg');
INSERT INTO `model_nation` VALUES ('1679', '410302', '', '', '老城区', '1677', '112.477298', '34.682945', 'wqpvr3z6z1');
INSERT INTO `model_nation` VALUES ('1680', '410303', '', '', '西工区', '1677', '112.443232', '34.667847', 'wqpvnxndv5');
INSERT INTO `model_nation` VALUES ('1681', '410304', '', '', '瀍河回族区', '1677', '112.491625', '34.684738', 'wqpvrf1vhz');
INSERT INTO `model_nation` VALUES ('1682', '410305', '', '', '涧西区', '1677', '112.399243', '34.654251', 'wqpvjswesh');
INSERT INTO `model_nation` VALUES ('1683', '410306', '', '', '吉利区', '1677', '112.584796', '34.899093', 'ww0n9cjtzy');
INSERT INTO `model_nation` VALUES ('1684', '410311', '', '', '洛龙区', '1677', '112.456634', '34.618557', 'wqpuzn07tq');
INSERT INTO `model_nation` VALUES ('1685', '410322', '', '', '孟津县', '1677', '112.443892', '34.826485', 'wqpyneznux');
INSERT INTO `model_nation` VALUES ('1686', '410323', '', '', '新安县', '1677', '112.141403', '34.728679', 'wqptxf4vhn');
INSERT INTO `model_nation` VALUES ('1687', '410324', '', '', '栾川县', '1677', '111.618386', '33.783195', 'wqp25yn12g');
INSERT INTO `model_nation` VALUES ('1688', '410325', '', '', '嵩县', '1677', '112.087765', '34.131563', 'wqpdnt7yf0');
INSERT INTO `model_nation` VALUES ('1689', '410326', '', '', '汝阳县', '1677', '112.473789', '34.15323', 'wqpfr3kuvp');
INSERT INTO `model_nation` VALUES ('1690', '410327', '', '', '宜阳县', '1677', '112.179989', '34.516478', 'wqpu2ewcp1');
INSERT INTO `model_nation` VALUES ('1691', '410328', '', '', '洛宁县', '1677', '111.655399', '34.387179', 'wqp7sgbzz6');
INSERT INTO `model_nation` VALUES ('1692', '410329', '', '', '伊川县', '1677', '112.429384', '34.423416', 'wqpgy6sdft');
INSERT INTO `model_nation` VALUES ('1693', '410381', '', '', '偃师市', '1677', '112.787739', '34.723042', 'ww0jw91s2u');
INSERT INTO `model_nation` VALUES ('1694', '410400', '', '平顶山市', '', '1651', '113.307718', '33.735241', 'wtbxfmk4j0');
INSERT INTO `model_nation` VALUES ('1695', '410401', '', '', '市辖区', '1694', '113.307718', '33.735241', 'wtbxfmk4j0');
INSERT INTO `model_nation` VALUES ('1696', '410402', '', '', '新华区', '1694', '113.299061', '33.737579', 'wtbxfjtzek');
INSERT INTO `model_nation` VALUES ('1697', '410403', '', '', '卫东区', '1694', '113.310327', '33.739285', 'wtbxfqn19f');
INSERT INTO `model_nation` VALUES ('1698', '410404', '', '', '石龙区', '1694', '112.889885', '33.901538', 'ww02bgefub');
INSERT INTO `model_nation` VALUES ('1699', '410411', '', '', '湛河区', '1694', '113.320873', '33.725681', 'wtbxfetdrd');
INSERT INTO `model_nation` VALUES ('1700', '410421', '', '', '宝丰县', '1694', '113.066812', '33.866359', 'ww02svhtzd');
INSERT INTO `model_nation` VALUES ('1701', '410422', '', '', '叶县', '1694', '113.358298', '33.621252', 'wtbx788czz');
INSERT INTO `model_nation` VALUES ('1702', '410423', '', '', '鲁山县', '1694', '112.906703', '33.740325', 'wtbrcq0psu');
INSERT INTO `model_nation` VALUES ('1703', '410425', '', '', '郏县', '1694', '113.220451', '33.971993', 'ww0922kt5w');
INSERT INTO `model_nation` VALUES ('1704', '410481', '', '', '舞钢市', '1694', '113.52625', '33.302082', 'wtbtrq7q9q');
INSERT INTO `model_nation` VALUES ('1705', '410482', '', '', '汝州市', '1694', '112.845336', '34.167408', 'ww04rggrwf');
INSERT INTO `model_nation` VALUES ('1706', '410500', '', '安阳市', '', '1651', '114.352482', '36.103442', 'ww3m6hkvvc');
INSERT INTO `model_nation` VALUES ('1707', '410501', '', '', '市辖区', '1706', '114.352482', '36.103442', 'ww3m6hkvvc');
INSERT INTO `model_nation` VALUES ('1708', '410502', '', '', '文峰区', '1706', '114.352562', '36.098101', 'ww3m65kyxv');
INSERT INTO `model_nation` VALUES ('1709', '410503', '', '', '北关区', '1706', '114.352646', '36.10978', 'ww3m6jt49y');
INSERT INTO `model_nation` VALUES ('1710', '410505', '', '', '殷都区', '1706', '114.300098', '36.108974', 'ww3m2vqy12');
INSERT INTO `model_nation` VALUES ('1711', '410506', '', '', '龙安区', '1706', '114.323522', '36.095568', 'ww3m36zzgj');
INSERT INTO `model_nation` VALUES ('1712', '410522', '', '', '安阳县', '1706', '114.130207', '36.130585', 'ww3jt175ft');
INSERT INTO `model_nation` VALUES ('1713', '410523', '', '', '汤阴县', '1706', '114.362357', '35.922349', 'ww3k67knu5');
INSERT INTO `model_nation` VALUES ('1714', '410526', '', '', '滑县', '1706', '114.524', '35.574628', 'ww36qh1v4x');
INSERT INTO `model_nation` VALUES ('1715', '410527', '', '', '内黄县', '1706', '114.904582', '35.953702', 'ww3sw9nvqz');
INSERT INTO `model_nation` VALUES ('1716', '410581', '', '', '林州市', '1706', '113.823767', '36.063403', 'ww2vnj5uw1');
INSERT INTO `model_nation` VALUES ('1717', '410600', '', '鹤壁市', '', '1651', '114.295444', '35.748236', 'ww372gg2sf');
INSERT INTO `model_nation` VALUES ('1718', '410601', '', '', '市辖区', '1717', '114.295444', '35.748236', 'ww372gg2sf');
INSERT INTO `model_nation` VALUES ('1719', '410602', '', '', '鹤山区', '1717', '114.166551', '35.936128', 'ww3hmvvx17');
INSERT INTO `model_nation` VALUES ('1720', '410603', '', '', '山城区', '1717', '114.184202', '35.896058', 'ww3hnqdmsy');
INSERT INTO `model_nation` VALUES ('1721', '410611', '', '', '淇滨区', '1717', '114.293917', '35.748382', 'ww372gf33m');
INSERT INTO `model_nation` VALUES ('1722', '410621', '', '', '浚县', '1717', '114.550162', '35.671282', 'ww36ytubk0');
INSERT INTO `model_nation` VALUES ('1723', '410622', '', '', '淇县', '1717', '114.200379', '35.609478', 'ww34wdw0jx');
INSERT INTO `model_nation` VALUES ('1724', '410700', '', '新乡市', '', '1651', '113.883991', '35.302616', 'ww2bz6xu9k');
INSERT INTO `model_nation` VALUES ('1725', '410701', '', '', '市辖区', '1724', '113.883991', '35.302616', 'ww2bz6xu9k');
INSERT INTO `model_nation` VALUES ('1726', '410702', '', '', '红旗区', '1724', '113.878158', '35.302684', 'ww2bz6et13');
INSERT INTO `model_nation` VALUES ('1727', '410703', '', '', '卫滨区', '1724', '113.866065', '35.304905', 'ww2bz549zx');
INSERT INTO `model_nation` VALUES ('1728', '410704', '', '', '凤泉区', '1724', '113.906712', '35.379855', 'ww31208qdf');
INSERT INTO `model_nation` VALUES ('1729', '410711', '', '', '牧野区', '1724', '113.89716', '35.312974', 'ww2bzu92up');
INSERT INTO `model_nation` VALUES ('1730', '410721', '', '', '新乡县', '1724', '113.806186', '35.190021', 'ww2bjwphsr');
INSERT INTO `model_nation` VALUES ('1731', '410724', '', '', '获嘉县', '1724', '113.657249', '35.261685', 'ww2bd74wjy');
INSERT INTO `model_nation` VALUES ('1732', '410725', '', '', '原阳县', '1724', '113.965966', '35.054001', 'ww1p3m7kr7');
INSERT INTO `model_nation` VALUES ('1733', '410726', '', '', '延津县', '1724', '114.200982', '35.149515', 'ww1pywy8gb');
INSERT INTO `model_nation` VALUES ('1734', '410727', '', '', '封丘县', '1724', '114.423405', '35.04057', 'ww1r7fbw4e');
INSERT INTO `model_nation` VALUES ('1735', '410728', '', '', '长垣县', '1724', '114.673807', '35.19615', 'ww381rqbmm');
INSERT INTO `model_nation` VALUES ('1736', '410781', '', '', '卫辉市', '1724', '114.065855', '35.404295', 'ww317thhzn');
INSERT INTO `model_nation` VALUES ('1737', '410782', '', '', '辉县市', '1724', '113.802518', '35.461318', 'ww2ctxs3nu');
INSERT INTO `model_nation` VALUES ('1738', '410800', '', '焦作市', '', '1651', '113.238266', '35.23904', 'ww282z1d6c');
INSERT INTO `model_nation` VALUES ('1739', '410801', '', '', '市辖区', '1738', '113.238266', '35.23904', 'ww282z1d6c');
INSERT INTO `model_nation` VALUES ('1740', '410802', '', '', '解放区', '1738', '113.226126', '35.241353', 'ww282x2xzb');
INSERT INTO `model_nation` VALUES ('1741', '410803', '', '', '中站区', '1738', '113.175485', '35.236145', 'ww22rqec7v');
INSERT INTO `model_nation` VALUES ('1742', '410804', '', '', '马村区', '1738', '113.321703', '35.265453', 'ww28deyk5h');
INSERT INTO `model_nation` VALUES ('1743', '410811', '', '', '山阳区', '1738', '113.26766', '35.21476', 'ww2836wuzg');
INSERT INTO `model_nation` VALUES ('1744', '410821', '', '', '修武县', '1738', '113.447465', '35.229923', 'ww28mt3vjt');
INSERT INTO `model_nation` VALUES ('1745', '410822', '', '', '博爱县', '1738', '113.069313', '35.170351', 'ww22hfwd1u');
INSERT INTO `model_nation` VALUES ('1746', '410823', '', '', '武陟县', '1738', '113.408334', '35.09885', 'ww0xstt3te');
INSERT INTO `model_nation` VALUES ('1747', '410825', '', '', '温县', '1738', '113.079118', '34.941233', 'ww0qv0veqm');
INSERT INTO `model_nation` VALUES ('1748', '410882', '', '', '沁阳市', '1738', '112.934538', '35.08901', 'ww0r9gu2m3');
INSERT INTO `model_nation` VALUES ('1749', '410883', '', '', '孟州市', '1738', '112.78708', '34.90963', 'ww0nwe1536');
INSERT INTO `model_nation` VALUES ('1750', '410900', '', '濮阳市', '', '1651', '115.041299', '35.768234', 'ww3g3z6t0d');
INSERT INTO `model_nation` VALUES ('1751', '410901', '', '', '市辖区', '1750', '115.041299', '35.768234', 'ww3g3z6t0d');
INSERT INTO `model_nation` VALUES ('1752', '410902', '', '', '华龙区', '1750', '115.03184', '35.760473', 'ww3g3tgxu5');
INSERT INTO `model_nation` VALUES ('1753', '410922', '', '', '清丰县', '1750', '115.107287', '35.902413', 'ww3u5rfddn');
INSERT INTO `model_nation` VALUES ('1754', '410923', '', '', '南乐县', '1750', '115.204336', '36.075204', 'ww3vjx31r9');
INSERT INTO `model_nation` VALUES ('1755', '410926', '', '', '范县', '1750', '115.504212', '35.851977', 'ww65uqesgh');
INSERT INTO `model_nation` VALUES ('1756', '410927', '', '', '台前县', '1750', '115.855681', '35.996474', 'ww6ku2gw9j');
INSERT INTO `model_nation` VALUES ('1757', '410928', '', '', '濮阳县', '1750', '115.023844', '35.710349', 'ww3g1kvgcg');
INSERT INTO `model_nation` VALUES ('1758', '411000', '', '许昌市', '', '1651', '113.826063', '34.022956', 'ww0cw1tw5d');
INSERT INTO `model_nation` VALUES ('1759', '411001', '', '', '市辖区', '1758', '113.826063', '34.022956', 'ww0cw1tw5d');
INSERT INTO `model_nation` VALUES ('1760', '411002', '', '', '魏都区', '1758', '113.828307', '34.02711', 'ww0cw4rnrc');
INSERT INTO `model_nation` VALUES ('1761', '411023', '', '', '许昌县', '1758', '113.842898', '34.005018', 'ww0cqw3vef');
INSERT INTO `model_nation` VALUES ('1762', '411024', '', '', '鄢陵县', '1758', '114.188507', '34.100502', 'ww11yrv9c4');
INSERT INTO `model_nation` VALUES ('1763', '411025', '', '', '襄城县', '1758', '113.493166', '33.855943', 'ww08we71nm');
INSERT INTO `model_nation` VALUES ('1764', '411081', '', '', '禹州市', '1758', '113.471316', '34.154403', 'ww0dq1e7c6');
INSERT INTO `model_nation` VALUES ('1765', '411082', '', '', '长葛市', '1758', '113.768912', '34.219257', 'ww0fsv7vxg');
INSERT INTO `model_nation` VALUES ('1766', '411100', '', '漯河市', '', '1651', '114.026405', '33.575855', 'wtcp48r3xc');
INSERT INTO `model_nation` VALUES ('1767', '411101', '', '', '市辖区', '1766', '114.026405', '33.575855', 'wtcp48r3xc');
INSERT INTO `model_nation` VALUES ('1768', '411102', '', '', '源汇区', '1766', '114.017948', '33.565441', 'wtcnfw3kfg');
INSERT INTO `model_nation` VALUES ('1769', '411103', '', '', '郾城区', '1766', '114.016813', '33.588897', 'wtcp4d8t82');
INSERT INTO `model_nation` VALUES ('1770', '411104', '', '', '召陵区', '1766', '114.051686', '33.567555', 'wtcngqcchv');
INSERT INTO `model_nation` VALUES ('1771', '411121', '', '', '舞阳县', '1766', '113.610565', '33.436278', 'wtby1qbsqj');
INSERT INTO `model_nation` VALUES ('1772', '411122', '', '', '临颍县', '1766', '113.938891', '33.80609', 'ww102dpy8x');
INSERT INTO `model_nation` VALUES ('1773', '411200', '', '三门峡市', '', '1651', '111.194099', '34.777338', 'wqpjf710dm');
INSERT INTO `model_nation` VALUES ('1774', '411201', '', '', '市辖区', '1773', '111.194099', '34.777338', 'wqpjf710dm');
INSERT INTO `model_nation` VALUES ('1775', '411202', '', '', '湖滨区', '1773', '111.19487', '34.77812', 'wqpjf71thr');
INSERT INTO `model_nation` VALUES ('1776', '411221', '', '', '渑池县', '1773', '111.762992', '34.763487', 'wqpmz0rrfr');
INSERT INTO `model_nation` VALUES ('1777', '411222', '', '', '陕县', '1773', '111.103851', '34.720244', 'wqpj80xk56');
INSERT INTO `model_nation` VALUES ('1778', '411224', '', '', '卢氏县', '1773', '111.052649', '34.053995', 'wqncxp64fk');
INSERT INTO `model_nation` VALUES ('1779', '411281', '', '', '义马市', '1773', '111.869417', '34.746868', 'wqpt9tkz4m');
INSERT INTO `model_nation` VALUES ('1780', '411282', '', '', '灵宝市', '1773', '110.88577', '34.521264', 'wqnu7k2scw');
INSERT INTO `model_nation` VALUES ('1781', '411300', '', '南阳市', '', '1651', '112.540918', '32.999082', 'wtb58zmc96');
INSERT INTO `model_nation` VALUES ('1782', '411301', '', '', '市辖区', '1781', '112.540918', '32.999082', 'wtb58zmc96');
INSERT INTO `model_nation` VALUES ('1783', '411302', '', '', '宛城区', '1781', '112.544591', '32.994857', 'wtb59n82zp');
INSERT INTO `model_nation` VALUES ('1784', '411303', '', '', '卧龙区', '1781', '112.528789', '32.989877', 'wtb58tsgyy');
INSERT INTO `model_nation` VALUES ('1785', '411321', '', '', '南召县', '1781', '112.435583', '33.488617', 'wmzyw83j6f');
INSERT INTO `model_nation` VALUES ('1786', '411322', '', '', '方城县', '1781', '113.010933', '33.255138', 'wtbm5tuj1x');
INSERT INTO `model_nation` VALUES ('1787', '411323', '', '', '西峡县', '1781', '111.485772', '33.302981', 'wmzm2yt7yv');
INSERT INTO `model_nation` VALUES ('1788', '411324', '', '', '镇平县', '1781', '112.232722', '33.036651', 'wmzgcyjk7y');
INSERT INTO `model_nation` VALUES ('1789', '411325', '', '', '内乡县', '1781', '111.843801', '33.046358', 'wmzecpfhvr');
INSERT INTO `model_nation` VALUES ('1790', '411326', '', '', '淅川县', '1781', '111.489026', '33.136106', 'wmzk8bpzf9');
INSERT INTO `model_nation` VALUES ('1791', '411327', '', '', '社旗县', '1781', '112.938279', '33.056126', 'wtbk1cxjus');
INSERT INTO `model_nation` VALUES ('1792', '411328', '', '', '唐河县', '1781', '112.838492', '32.687892', 'wtb1zwwkz2');
INSERT INTO `model_nation` VALUES ('1793', '411329', '', '', '新野县', '1781', '112.365624', '32.524006', 'wmzchby4hf');
INSERT INTO `model_nation` VALUES ('1794', '411330', '', '', '桐柏县', '1781', '113.406059', '32.367153', 'wtb8hs7b2d');
INSERT INTO `model_nation` VALUES ('1795', '411381', '', '', '邓州市', '1781', '112.092716', '32.681642', 'wmz9ytx2me');
INSERT INTO `model_nation` VALUES ('1796', '411400', '', '商丘市', '', '1651', '115.650497', '34.437054', 'ww45ztn47u');
INSERT INTO `model_nation` VALUES ('1797', '411401', '', '', '市辖区', '1796', '115.650497', '34.437054', 'ww45ztn47u');
INSERT INTO `model_nation` VALUES ('1798', '411402', '', '', '梁园区', '1796', '115.65459', '34.436553', 'ww45zucp7q');
INSERT INTO `model_nation` VALUES ('1799', '411403', '', '', '睢阳区', '1796', '115.653813', '34.390536', 'ww45xu8e3h');
INSERT INTO `model_nation` VALUES ('1800', '411421', '', '', '民权县', '1796', '115.148146', '34.648455', 'ww1vh783fk');
INSERT INTO `model_nation` VALUES ('1801', '411422', '', '', '睢县', '1796', '115.070109', '34.428433', 'ww1gf7x2pv');
INSERT INTO `model_nation` VALUES ('1802', '411423', '', '', '宁陵县', '1796', '115.320055', '34.449299', 'ww45bpm98n');
INSERT INTO `model_nation` VALUES ('1803', '411424', '', '', '柘城县', '1796', '115.307433', '34.075277', 'ww1czghqcu');
INSERT INTO `model_nation` VALUES ('1804', '411425', '', '', '虞城县', '1796', '115.863811', '34.399634', 'ww47sw32qk');
INSERT INTO `model_nation` VALUES ('1805', '411426', '', '', '夏邑县', '1796', '116.13989', '34.240894', 'ww4dfc67xt');
INSERT INTO `model_nation` VALUES ('1806', '411481', '', '', '永城市', '1796', '116.449672', '33.931318', 'ww4c1ch060');
INSERT INTO `model_nation` VALUES ('1807', '411500', '', '信阳市', '', '1651', '114.075031', '32.123274', 'wt9nezfgsu');
INSERT INTO `model_nation` VALUES ('1808', '411501', '', '', '市辖区', '1807', '114.075031', '32.123274', 'wt9nezfgsu');
INSERT INTO `model_nation` VALUES ('1809', '411502', '', '', '浉河区', '1807', '114.075031', '32.123274', 'wt9nezfgsu');
INSERT INTO `model_nation` VALUES ('1810', '411503', '', '', '平桥区', '1807', '114.126027', '32.098395', 'wt9nt5249n');
INSERT INTO `model_nation` VALUES ('1811', '411521', '', '', '罗山县', '1807', '114.533414', '32.203206', 'wt9rnq2tmb');
INSERT INTO `model_nation` VALUES ('1812', '411522', '', '', '光山县', '1807', '114.903577', '32.010398', 'wt9wneq4p6');
INSERT INTO `model_nation` VALUES ('1813', '411523', '', '', '新县', '1807', '114.87705', '31.63515', 'wt9eyp4bj7');
INSERT INTO `model_nation` VALUES ('1814', '411524', '', '', '商城县', '1807', '115.406297', '31.799982', 'wtdhfjh23d');
INSERT INTO `model_nation` VALUES ('1815', '411525', '', '', '固始县', '1807', '115.667328', '32.183074', 'wtdr04drup');
INSERT INTO `model_nation` VALUES ('1816', '411526', '', '', '潢川县', '1807', '115.050123', '32.134024', 'wt9yf1bfq0');
INSERT INTO `model_nation` VALUES ('1817', '411527', '', '', '淮滨县', '1807', '115.415451', '32.452639', 'wtf0d7ffqf');
INSERT INTO `model_nation` VALUES ('1818', '411528', '', '', '息县', '1807', '114.740713', '32.344744', 'wtc84bptu3');
INSERT INTO `model_nation` VALUES ('1819', '411600', '', '周口市', '', '1651', '114.649653', '33.620357', 'wtcx2bmkf8');
INSERT INTO `model_nation` VALUES ('1820', '411601', '', '', '市辖区', '1819', '114.649653', '33.620357', 'wtcx2bmkf8');
INSERT INTO `model_nation` VALUES ('1821', '411602', '', '', '川汇区', '1819', '114.652136', '33.614836', 'wtcx0zrhs7');
INSERT INTO `model_nation` VALUES ('1822', '411621', '', '', '扶沟县', '1819', '114.392008', '34.054061', 'ww13ep3eqc');
INSERT INTO `model_nation` VALUES ('1823', '411622', '', '', '西华县', '1819', '114.530067', '33.784378', 'ww12nnq0rb');
INSERT INTO `model_nation` VALUES ('1824', '411623', '', '', '商水县', '1819', '114.60927', '33.543845', 'wtcqzfrzj9');
INSERT INTO `model_nation` VALUES ('1825', '411624', '', '', '沈丘县', '1819', '115.078375', '33.395514', 'wtcvfxmwbr');
INSERT INTO `model_nation` VALUES ('1826', '411625', '', '', '郸城县', '1819', '115.189', '33.643852', 'wtczmhwjdh');
INSERT INTO `model_nation` VALUES ('1827', '411626', '', '', '淮阳县', '1819', '114.870166', '33.732547', 'wtcxvuvfkf');
INSERT INTO `model_nation` VALUES ('1828', '411627', '', '', '太康县', '1819', '114.853834', '34.065312', 'ww19v96hb6');
INSERT INTO `model_nation` VALUES ('1829', '411628', '', '', '鹿邑县', '1819', '115.486386', '33.861067', 'ww40eunx5b');
INSERT INTO `model_nation` VALUES ('1830', '411681', '', '', '项城市', '1819', '114.899521', '33.443085', 'wtcwq85k0f');
INSERT INTO `model_nation` VALUES ('1831', '411700', '', '驻马店市', '', '1651', '114.024736', '32.980169', 'wtc5dey72v');
INSERT INTO `model_nation` VALUES ('1832', '411701', '', '', '市辖区', '1831', '114.024736', '32.980169', 'wtc5dey72v');
INSERT INTO `model_nation` VALUES ('1833', '411702', '', '', '驿城区', '1831', '114.029149', '32.977559', 'wtc5dg3kpy');
INSERT INTO `model_nation` VALUES ('1834', '411721', '', '', '西平县', '1831', '114.026864', '33.382315', 'wtcjftpf4d');
INSERT INTO `model_nation` VALUES ('1835', '411722', '', '', '上蔡县', '1831', '114.266892', '33.264719', 'wtcm0pwt59');
INSERT INTO `model_nation` VALUES ('1836', '411723', '', '', '平舆县', '1831', '114.637105', '32.955626', 'wtce2xkhqj');
INSERT INTO `model_nation` VALUES ('1837', '411724', '', '', '正阳县', '1831', '114.38948', '32.601826', 'wtc36yzzkh');
INSERT INTO `model_nation` VALUES ('1838', '411725', '', '', '确山县', '1831', '114.026679', '32.801538', 'wtc4derdy1');
INSERT INTO `model_nation` VALUES ('1839', '411726', '', '', '泌阳县', '1831', '113.32605', '32.725129', 'wtbd4v3t8q');
INSERT INTO `model_nation` VALUES ('1840', '411727', '', '', '汝南县', '1831', '114.359495', '33.004535', 'wtc7f26137');
INSERT INTO `model_nation` VALUES ('1841', '411728', '', '', '遂平县', '1831', '114.00371', '33.14698', 'wtchd4nznu');
INSERT INTO `model_nation` VALUES ('1842', '411729', '', '', '新蔡县', '1831', '114.975246', '32.749948', 'wtcf23fqm2');
INSERT INTO `model_nation` VALUES ('1843', '419000', '', '省直辖县级行政区划', '', '1651', '113.665412', '34.757975', 'ww0vdx2xuh');
INSERT INTO `model_nation` VALUES ('1844', '419001', '', '', '济源市', '1843', '112.590047', '35.090378', 'ww0pdh1860');
INSERT INTO `model_nation` VALUES ('1845', '420000', '湖北省', '', '', '1', '114.298572', '30.584355', 'wt3mbztwvc');
INSERT INTO `model_nation` VALUES ('1846', '420100', '', '武汉市', '', '1845', '114.298572', '30.584355', 'wt3mbztwvc');
INSERT INTO `model_nation` VALUES ('1847', '420101', '', '', '市辖区', '1846', '114.298572', '30.584355', 'wt3mbztwvc');
INSERT INTO `model_nation` VALUES ('1848', '420102', '', '', '江岸区', '1846', '114.30304', '30.594911', 'wt3q118umb');
INSERT INTO `model_nation` VALUES ('1849', '420103', '', '', '江汉区', '1846', '114.283109', '30.578771', 'wt3mbwdqm2');
INSERT INTO `model_nation` VALUES ('1850', '420104', '', '', '硚口区', '1846', '114.264568', '30.57061', 'wt3mbjhytq');
INSERT INTO `model_nation` VALUES ('1851', '420105', '', '', '汉阳区', '1846', '114.265807', '30.549326', 'wt3mb1mfdr');
INSERT INTO `model_nation` VALUES ('1852', '420106', '', '', '武昌区', '1846', '114.307344', '30.546536', 'wt3mc0u46p');
INSERT INTO `model_nation` VALUES ('1853', '420107', '', '', '青山区', '1846', '114.39707', '30.634215', 'wt3q70v3hz');
INSERT INTO `model_nation` VALUES ('1854', '420111', '', '', '洪山区', '1846', '114.400718', '30.504259', 'wt3me30h1y');
INSERT INTO `model_nation` VALUES ('1855', '420112', '', '', '东西湖区', '1846', '114.142483', '30.622467', 'wt3njqshb9');
INSERT INTO `model_nation` VALUES ('1856', '420113', '', '', '汉南区', '1846', '114.08124', '30.309637', 'wt3h7vxqmt');
INSERT INTO `model_nation` VALUES ('1857', '420114', '', '', '蔡甸区', '1846', '114.029341', '30.582186', 'wt3jfz3dhh');
INSERT INTO `model_nation` VALUES ('1858', '420115', '', '', '江夏区', '1846', '114.313961', '30.349045', 'wt3k9kbuh2');
INSERT INTO `model_nation` VALUES ('1859', '420116', '', '', '黄陂区', '1846', '114.374025', '30.874155', 'wt3rdskwgz');
INSERT INTO `model_nation` VALUES ('1860', '420117', '', '', '新洲区', '1846', '114.802108', '30.842149', 'wt3xkqske1');
INSERT INTO `model_nation` VALUES ('1861', '420200', '', '黄石市', '', '1845', '115.077048', '30.220074', 'wt3gftks9w');
INSERT INTO `model_nation` VALUES ('1862', '420201', '', '', '市辖区', '1861', '115.077048', '30.220074', 'wt3gftks9w');
INSERT INTO `model_nation` VALUES ('1863', '420202', '', '', '黄石港区', '1861', '115.090164', '30.212086', 'wt3gfgyn5j');
INSERT INTO `model_nation` VALUES ('1864', '420203', '', '', '西塞山区', '1861', '115.093354', '30.205365', 'wt3gg48rj8');
INSERT INTO `model_nation` VALUES ('1865', '420204', '', '', '下陆区', '1861', '114.975755', '30.177845', 'wt3g8mdy9q');
INSERT INTO `model_nation` VALUES ('1866', '420205', '', '', '铁山区', '1861', '114.901366', '30.20601', 'wt3eydudgb');
INSERT INTO `model_nation` VALUES ('1867', '420222', '', '', '阳新县', '1861', '115.212883', '29.841572', 'wt3cv8rryb');
INSERT INTO `model_nation` VALUES ('1868', '420281', '', '', '大冶市', '1861', '114.974842', '30.098804', 'wt3g0r645z');
INSERT INTO `model_nation` VALUES ('1869', '420300', '', '十堰市', '', '1845', '110.787916', '32.646907', 'wmyc9p1q18');
INSERT INTO `model_nation` VALUES ('1870', '420301', '', '', '市辖区', '1869', '110.787916', '32.646907', 'wmyc9p1q18');
INSERT INTO `model_nation` VALUES ('1871', '420302', '', '', '茅箭区', '1869', '110.78621', '32.644463', 'wmyc9n8pcb');
INSERT INTO `model_nation` VALUES ('1872', '420303', '', '', '张湾区', '1869', '110.772365', '32.652516', 'wmycb8jyxn');
INSERT INTO `model_nation` VALUES ('1873', '420304', '', '', '郧阳区', '1869', '110.787916', '32.646907', 'wmyc9p1q18');
INSERT INTO `model_nation` VALUES ('1874', '420322', '', '', '郧西县', '1869', '110.426472', '32.991457', 'wmye8vfj5m');
INSERT INTO `model_nation` VALUES ('1875', '420323', '', '', '竹山县', '1869', '110.2296', '32.22586', 'wmwrk6d9pz');
INSERT INTO `model_nation` VALUES ('1876', '420324', '', '', '竹溪县', '1869', '109.717196', '32.315342', 'wmwpbdvdeb');
INSERT INTO `model_nation` VALUES ('1877', '420325', '', '', '房县', '1869', '110.741966', '32.055002', 'wmwwrgrvfv');
INSERT INTO `model_nation` VALUES ('1878', '420381', '', '', '丹江口市', '1869', '111.513793', '32.538839', 'wmz31e9b7x');
INSERT INTO `model_nation` VALUES ('1879', '420500', '', '宜昌市', '', '1845', '111.290843', '30.702636', 'wmrnsmpxbd');
INSERT INTO `model_nation` VALUES ('1880', '420501', '', '', '市辖区', '1879', '111.290843', '30.702636', 'wmrnsmpxbd');
INSERT INTO `model_nation` VALUES ('1881', '420502', '', '', '西陵区', '1879', '111.295468', '30.702476', 'wmrnst4yuk');
INSERT INTO `model_nation` VALUES ('1882', '420503', '', '', '伍家岗区', '1879', '111.307215', '30.679053', 'wmrnsbgqqj');
INSERT INTO `model_nation` VALUES ('1883', '420504', '', '', '点军区', '1879', '111.268163', '30.692322', 'wmrnegr58p');
INSERT INTO `model_nation` VALUES ('1884', '420505', '', '', '猇亭区', '1879', '111.427642', '30.530744', 'wmrjxtgnkp');
INSERT INTO `model_nation` VALUES ('1885', '420506', '', '', '夷陵区', '1879', '111.326747', '30.770199', 'wmrpj399mh');
INSERT INTO `model_nation` VALUES ('1886', '420525', '', '', '远安县', '1879', '111.64331', '31.059626', 'wmx2sw0pmt');
INSERT INTO `model_nation` VALUES ('1887', '420526', '', '', '兴山县', '1879', '110.754499', '31.34795', 'wmwf268znc');
INSERT INTO `model_nation` VALUES ('1888', '420527', '', '', '秭归县', '1879', '110.976785', '30.823908', 'wmqzm76f68');
INSERT INTO `model_nation` VALUES ('1889', '420528', '', '', '长阳土家族自治县', '1879', '111.198475', '30.466534', 'wmrj66k22m');
INSERT INTO `model_nation` VALUES ('1890', '420529', '', '', '五峰土家族自治县', '1879', '110.674938', '30.199252', 'wmqey3x52u');
INSERT INTO `model_nation` VALUES ('1891', '420581', '', '', '宜都市', '1879', '111.454367', '30.387234', 'wmrkb5yd6y');
INSERT INTO `model_nation` VALUES ('1892', '420582', '', '', '当阳市', '1879', '111.793419', '30.824492', 'wmrrrgmmxm');
INSERT INTO `model_nation` VALUES ('1893', '420583', '', '', '枝江市', '1879', '111.751799', '30.425364', 'wmrmnfz0td');
INSERT INTO `model_nation` VALUES ('1894', '420600', '', '襄阳市', '', '1845', '112.144146', '32.042426', 'wmxwrchusj');
INSERT INTO `model_nation` VALUES ('1895', '420601', '', '', '市辖区', '1894', '112.144146', '32.042426', 'wmxwrchusj');
INSERT INTO `model_nation` VALUES ('1896', '420602', '', '', '襄城区', '1894', '112.150327', '32.015088', 'wmxy0h1mkh');
INSERT INTO `model_nation` VALUES ('1897', '420606', '', '', '樊城区', '1894', '112.13957', '32.058589', 'wmxwru1dc6');
INSERT INTO `model_nation` VALUES ('1898', '420607', '', '', '襄州区', '1894', '112.197378', '32.085517', 'wmxy90gxsm');
INSERT INTO `model_nation` VALUES ('1899', '420624', '', '', '南漳县', '1894', '111.844424', '31.77692', 'wmxsc0f9gz');
INSERT INTO `model_nation` VALUES ('1900', '420625', '', '', '谷城县', '1894', '111.640147', '32.262676', 'wmxrs3jzey');
INSERT INTO `model_nation` VALUES ('1901', '420626', '', '', '保康县', '1894', '111.262235', '31.873507', 'wmxj7f6stu');
INSERT INTO `model_nation` VALUES ('1902', '420682', '', '', '老河口市', '1894', '111.675732', '32.385438', 'wmz2jpxfc5');
INSERT INTO `model_nation` VALUES ('1903', '420683', '', '', '枣阳市', '1894', '112.765268', '32.123083', 'wt8nwpc4t0');
INSERT INTO `model_nation` VALUES ('1904', '420684', '', '', '宜城市', '1894', '112.261441', '31.709203', 'wmxu6s6r3p');
INSERT INTO `model_nation` VALUES ('1905', '420700', '', '鄂州市', '', '1845', '114.890593', '30.396536', 'wt3symsb8v');
INSERT INTO `model_nation` VALUES ('1906', '420701', '', '', '市辖区', '1905', '114.890593', '30.396536', 'wt3symsb8v');
INSERT INTO `model_nation` VALUES ('1907', '420702', '', '', '梁子湖区', '1905', '114.681967', '30.098191', 'wt3e1xhyet');
INSERT INTO `model_nation` VALUES ('1908', '420703', '', '', '华容区', '1905', '114.74148', '30.534468', 'wt3ten8hnm');
INSERT INTO `model_nation` VALUES ('1909', '420704', '', '', '鄂城区', '1905', '114.890012', '30.39669', 'wt3syms3e3');
INSERT INTO `model_nation` VALUES ('1910', '420800', '', '荆门市', '', '1845', '112.204251', '31.03542', 'wmxb93bdkt');
INSERT INTO `model_nation` VALUES ('1911', '420801', '', '', '市辖区', '1910', '112.204251', '31.03542', 'wmxb93bdkt');
INSERT INTO `model_nation` VALUES ('1912', '420802', '', '', '东宝区', '1910', '112.204804', '31.033461', 'wmxb933p12');
INSERT INTO `model_nation` VALUES ('1913', '420804', '', '', '掇刀区', '1910', '112.198413', '30.980798', 'wmxb1pukhx');
INSERT INTO `model_nation` VALUES ('1914', '420821', '', '', '京山县', '1910', '113.114595', '31.022458', 'wt82mzrwcj');
INSERT INTO `model_nation` VALUES ('1915', '420822', '', '', '沙洋县', '1910', '112.595218', '30.70359', 'wt2ndjmm6s');
INSERT INTO `model_nation` VALUES ('1916', '420881', '', '', '钟祥市', '1910', '112.587267', '31.165573', 'wt813cx897');
INSERT INTO `model_nation` VALUES ('1917', '420900', '', '孝感市', '', '1845', '113.926655', '30.926423', 'wt3pbmyz7r');
INSERT INTO `model_nation` VALUES ('1918', '420901', '', '', '市辖区', '1917', '113.926655', '30.926423', 'wt3pbmyz7r');
INSERT INTO `model_nation` VALUES ('1919', '420902', '', '', '孝南区', '1917', '113.925849', '30.925966', 'wt3pbmykb9');
INSERT INTO `model_nation` VALUES ('1920', '420921', '', '', '孝昌县', '1917', '113.988964', '31.251618', 'wt91cchjz7');
INSERT INTO `model_nation` VALUES ('1921', '420922', '', '', '大悟县', '1917', '114.126249', '31.565483', 'wt95t424q2');
INSERT INTO `model_nation` VALUES ('1922', '420923', '', '', '云梦县', '1917', '113.750616', '31.021691', 'wt8bkrqdmq');
INSERT INTO `model_nation` VALUES ('1923', '420981', '', '', '应城市', '1917', '113.573842', '30.939038', 'wt8b02mbyq');
INSERT INTO `model_nation` VALUES ('1924', '420982', '', '', '安陆市', '1917', '113.690401', '31.26174', 'wt8cg54bf6');
INSERT INTO `model_nation` VALUES ('1925', '420984', '', '', '汉川市', '1917', '113.835301', '30.652165', 'wt2yqkh3fc');
INSERT INTO `model_nation` VALUES ('1926', '421000', '', '荆州市', '', '1845', '112.23813', '30.326857', 'wmrud0c69z');
INSERT INTO `model_nation` VALUES ('1927', '421001', '', '', '市辖区', '1926', '112.23813', '30.326857', 'wmrud0c69z');
INSERT INTO `model_nation` VALUES ('1928', '421002', '', '', '沙市区', '1926', '112.257433', '30.315895', 'wmru6qz6gu');
INSERT INTO `model_nation` VALUES ('1929', '421003', '', '', '荆州区', '1926', '112.195354', '30.350674', 'wmru9j4jmp');
INSERT INTO `model_nation` VALUES ('1930', '421022', '', '', '公安县', '1926', '112.230179', '30.059065', 'wmrg1b5d8x');
INSERT INTO `model_nation` VALUES ('1931', '421023', '', '', '监利县', '1926', '112.904344', '29.820079', 'wt239hw6tc');
INSERT INTO `model_nation` VALUES ('1932', '421024', '', '', '江陵县', '1926', '112.41735', '30.033919', 'wmrfy5eb60');
INSERT INTO `model_nation` VALUES ('1933', '421081', '', '', '石首市', '1926', '112.40887', '29.716437', 'wmrcjctwu9');
INSERT INTO `model_nation` VALUES ('1934', '421083', '', '', '洪湖市', '1926', '113.470304', '29.81297', 'wt29w5691s');
INSERT INTO `model_nation` VALUES ('1935', '421087', '', '', '松滋市', '1926', '111.77818', '30.176037', 'wmr7xt6khm');
INSERT INTO `model_nation` VALUES ('1936', '421100', '', '黄冈市', '', '1845', '114.879365', '30.447711', 'wt3tnnudg0');
INSERT INTO `model_nation` VALUES ('1937', '421101', '', '', '市辖区', '1936', '114.879365', '30.447711', 'wt3tnnudg0');
INSERT INTO `model_nation` VALUES ('1938', '421102', '', '', '黄州区', '1936', '114.878934', '30.447435', 'wt3tnnu31j');
INSERT INTO `model_nation` VALUES ('1939', '421121', '', '', '团风县', '1936', '114.872029', '30.63569', 'wt3wmcp3b6');
INSERT INTO `model_nation` VALUES ('1940', '421122', '', '', '红安县', '1936', '114.615095', '31.284777', 'wt99bphpj3');
INSERT INTO `model_nation` VALUES ('1941', '421123', '', '', '罗田县', '1936', '115.398984', '30.781679', 'wt6p1gwur0');
INSERT INTO `model_nation` VALUES ('1942', '421124', '', '', '英山县', '1936', '115.67753', '30.735794', 'wt6qb73bcz');
INSERT INTO `model_nation` VALUES ('1943', '421125', '', '', '浠水县', '1936', '115.26344', '30.454837', 'wt3vqbhk2c');
INSERT INTO `model_nation` VALUES ('1944', '421126', '', '', '蕲春县', '1936', '115.433964', '30.234927', 'wt6h4b07nq');
INSERT INTO `model_nation` VALUES ('1945', '421127', '', '', '黄梅县', '1936', '115.942548', '30.075113', 'wt67n74b1p');
INSERT INTO `model_nation` VALUES ('1946', '421181', '', '', '麻城市', '1936', '115.02541', '31.177906', 'wt9c37ybqq');
INSERT INTO `model_nation` VALUES ('1947', '421182', '', '', '武穴市', '1936', '115.56242', '29.849342', 'wt61v9vvp8');
INSERT INTO `model_nation` VALUES ('1948', '421200', '', '咸宁市', '', '1845', '114.328963', '29.832798', 'wt339wgu9u');
INSERT INTO `model_nation` VALUES ('1949', '421201', '', '', '市辖区', '1948', '114.328963', '29.832798', 'wt339wgu9u');
INSERT INTO `model_nation` VALUES ('1950', '421202', '', '', '咸安区', '1948', '114.333894', '29.824716', 'wt339trmsf');
INSERT INTO `model_nation` VALUES ('1951', '421221', '', '', '嘉鱼县', '1948', '113.921547', '29.973363', 'wt34827pkr');
INSERT INTO `model_nation` VALUES ('1952', '421222', '', '', '通城县', '1948', '113.814131', '29.246076', 'wt0ymuhftr');
INSERT INTO `model_nation` VALUES ('1953', '421223', '', '', '崇阳县', '1948', '114.049958', '29.54101', 'wt3053b8ue');
INSERT INTO `model_nation` VALUES ('1954', '421224', '', '', '通山县', '1948', '114.493163', '29.604455', 'wt32mm76kn');
INSERT INTO `model_nation` VALUES ('1955', '421281', '', '', '赤壁市', '1948', '113.88366', '29.716879', 'wt2cp3z93e');
INSERT INTO `model_nation` VALUES ('1956', '421300', '', '随州市', '', '1845', '113.37377', '31.717497', 'wt8s7vurb3');
INSERT INTO `model_nation` VALUES ('1957', '421301', '', '', '市辖区', '1956', '113.37377', '31.717497', 'wt8s7vurb3');
INSERT INTO `model_nation` VALUES ('1958', '421303', '', '', '曾都区', '1956', '113.374519', '31.717521', 'wt8s7vuzcy');
INSERT INTO `model_nation` VALUES ('1959', '421321', '', '', '随县', '1956', '113.301384', '31.854246', 'wt8t4nzs3t');
INSERT INTO `model_nation` VALUES ('1960', '421381', '', '', '广水市', '1956', '113.826601', '31.617731', 'wt8gy5y48h');
INSERT INTO `model_nation` VALUES ('1961', '422800', '', '恩施土家族苗族自治州', '', '1845', '109.48699', '30.283114', 'wmmu72vgzv');
INSERT INTO `model_nation` VALUES ('1962', '422801', '', '', '恩施市', '1961', '109.486761', '30.282406', 'wmmu72tzf3');
INSERT INTO `model_nation` VALUES ('1963', '422802', '', '', '利川市', '1961', '108.943491', '30.294247', 'wmmkr4fhz2');
INSERT INTO `model_nation` VALUES ('1964', '422822', '', '', '建始县', '1961', '109.723822', '30.601632', 'wmqn0ff7qm');
INSERT INTO `model_nation` VALUES ('1965', '422823', '', '', '巴东县', '1961', '110.336665', '31.041403', 'wmw2wfbtq8');
INSERT INTO `model_nation` VALUES ('1966', '422825', '', '', '宣恩县', '1961', '109.482819', '29.98867', 'wmmfe76bwt');
INSERT INTO `model_nation` VALUES ('1967', '422826', '', '', '咸丰县', '1961', '109.15041', '29.678967', 'wmm8gfbusb');
INSERT INTO `model_nation` VALUES ('1968', '422827', '', '', '来凤县', '1961', '109.408328', '29.506945', 'wmjzcesdqv');
INSERT INTO `model_nation` VALUES ('1969', '422828', '', '', '鹤峰县', '1961', '110.033699', '29.887298', 'wmq4pbu45h');
INSERT INTO `model_nation` VALUES ('1970', '429000', '', '省直辖县级行政区划', '', '1845', '114.298572', '30.584355', 'wt3mbztwvc');
INSERT INTO `model_nation` VALUES ('1971', '429004', '', '', '仙桃市', '1970', '113.453974', '30.364953', 'wt2stxy8tj');
INSERT INTO `model_nation` VALUES ('1972', '429005', '', '', '潜江市', '1970', '112.896866', '30.421215', 'wt2m140brt');
INSERT INTO `model_nation` VALUES ('1973', '429006', '', '', '天门市', '1970', '113.165862', '30.653061', 'wt2qrhhz58');
INSERT INTO `model_nation` VALUES ('1974', '429021', '', '', '神农架林区', '1970', '110.671525', '31.744449', 'wmwsw6usc6');
INSERT INTO `model_nation` VALUES ('1975', '430000', '湖南省', '', '', '1', '112.982279', '28.19409', 'wt026ux4mz');
INSERT INTO `model_nation` VALUES ('1976', '430100', '', '长沙市', '', '1975', '112.982279', '28.19409', 'wt026ux4mz');
INSERT INTO `model_nation` VALUES ('1977', '430101', '', '', '市辖区', '1976', '112.982279', '28.19409', 'wt026ux4mz');
INSERT INTO `model_nation` VALUES ('1978', '430102', '', '', '芙蓉区', '1976', '112.988094', '28.193106', 'wt027h7ktr');
INSERT INTO `model_nation` VALUES ('1979', '430103', '', '', '天心区', '1976', '112.97307', '28.192375', 'wt026u22rr');
INSERT INTO `model_nation` VALUES ('1980', '430104', '', '', '岳麓区', '1976', '112.911591', '28.213044', 'wt029258yu');
INSERT INTO `model_nation` VALUES ('1981', '430105', '', '', '开福区', '1976', '112.985525', '28.201336', 'wt027jcs9w');
INSERT INTO `model_nation` VALUES ('1982', '430111', '', '', '雨花区', '1976', '113.016337', '28.109937', 'wsbrgtrbr8');
INSERT INTO `model_nation` VALUES ('1983', '430112', '', '', '望城区', '1976', '112.819549', '28.347458', 'wt01r22xyj');
INSERT INTO `model_nation` VALUES ('1984', '430121', '', '', '长沙县', '1976', '113.080098', '28.237888', 'wt02thw3t7');
INSERT INTO `model_nation` VALUES ('1985', '430124', '', '', '宁乡县', '1976', '112.553182', '28.253928', 'wt009pqxp1');
INSERT INTO `model_nation` VALUES ('1986', '430181', '', '', '浏阳市', '1976', '113.633301', '28.141112', 'wt0b1fcjzg');
INSERT INTO `model_nation` VALUES ('1987', '430200', '', '株洲市', '', '1975', '113.151737', '27.835806', 'wsbqqg6e6d');
INSERT INTO `model_nation` VALUES ('1988', '430201', '', '', '市辖区', '1987', '113.151737', '27.835806', 'wsbqqg6e6d');
INSERT INTO `model_nation` VALUES ('1989', '430202', '', '', '荷塘区', '1987', '113.162548', '27.833036', 'wsbqr4f7nm');
INSERT INTO `model_nation` VALUES ('1990', '430203', '', '', '芦淞区', '1987', '113.155169', '27.827246', 'wsbqqcv16w');
INSERT INTO `model_nation` VALUES ('1991', '430204', '', '', '石峰区', '1987', '113.11295', '27.871945', 'wsbqtcymfg');
INSERT INTO `model_nation` VALUES ('1992', '430211', '', '', '天元区', '1987', '113.136252', '27.826909', 'wsbqq3xr3x');
INSERT INTO `model_nation` VALUES ('1993', '430221', '', '', '株洲县', '1987', '113.146176', '27.705844', 'wsbmweww0z');
INSERT INTO `model_nation` VALUES ('1994', '430223', '', '', '攸县', '1987', '113.345774', '27.000071', 'wsb9e5pygf');
INSERT INTO `model_nation` VALUES ('1995', '430224', '', '', '茶陵县', '1987', '113.546509', '26.789534', 'wsb8rufh37');
INSERT INTO `model_nation` VALUES ('1996', '430225', '', '', '炎陵县', '1987', '113.776884', '26.489459', 'ws8ytn3b39');
INSERT INTO `model_nation` VALUES ('1997', '430281', '', '', '醴陵市', '1987', '113.507157', '27.657873', 'wsbtqfvqu3');
INSERT INTO `model_nation` VALUES ('1998', '430300', '', '湘潭市', '', '1975', '112.944052', '27.82973', 'wsbq645rgj');
INSERT INTO `model_nation` VALUES ('1999', '430301', '', '', '市辖区', '1998', '112.944052', '27.82973', 'wsbq645rgj');
INSERT INTO `model_nation` VALUES ('2000', '430302', '', '', '雨湖区', '1998', '112.907427', '27.86077', 'wsbq3rbstx');
INSERT INTO `model_nation` VALUES ('2001', '430304', '', '', '岳塘区', '1998', '112.927707', '27.828854', 'wsbq3dp6y6');
INSERT INTO `model_nation` VALUES ('2002', '430321', '', '', '湘潭县', '1998', '112.952829', '27.778601', 'wsbq42cwpd');
INSERT INTO `model_nation` VALUES ('2003', '430381', '', '', '湘乡市', '1998', '112.525217', '27.734918', 'wsbjb8free');
INSERT INTO `model_nation` VALUES ('2004', '430382', '', '', '韶山市', '1998', '112.52848', '27.922682', 'wsbnbehtrt');
INSERT INTO `model_nation` VALUES ('2005', '430400', '', '衡阳市', '', '1975', '112.607693', '26.900358', 'wsb143n3vq');
INSERT INTO `model_nation` VALUES ('2006', '430401', '', '', '市辖区', '2005', '112.607693', '26.900358', 'wsb143n3vq');
INSERT INTO `model_nation` VALUES ('2007', '430405', '', '', '珠晖区', '2005', '112.626324', '26.891063', 'wsb0fz7gz9');
INSERT INTO `model_nation` VALUES ('2008', '430406', '', '', '雁峰区', '2005', '112.612241', '26.893694', 'wsb0fxcep7');
INSERT INTO `model_nation` VALUES ('2009', '430407', '', '', '石鼓区', '2005', '112.607635', '26.903908', 'wsb143wqs5');
INSERT INTO `model_nation` VALUES ('2010', '430408', '', '', '蒸湘区', '2005', '112.570608', '26.89087', 'wsb0cx76tm');
INSERT INTO `model_nation` VALUES ('2011', '430412', '', '', '南岳区', '2005', '112.734147', '27.240536', 'wsb4vqfx85');
INSERT INTO `model_nation` VALUES ('2012', '430421', '', '', '衡阳县', '2005', '112.379643', '26.962388', 'wkzcmk2773');
INSERT INTO `model_nation` VALUES ('2013', '430422', '', '', '衡南县', '2005', '112.677459', '26.739973', 'wsb0h5c5xh');
INSERT INTO `model_nation` VALUES ('2014', '430423', '', '', '衡山县', '2005', '112.86971', '27.234808', 'wsb6bmvnqb');
INSERT INTO `model_nation` VALUES ('2015', '430424', '', '', '衡东县', '2005', '112.950412', '27.083531', 'wsb644rvp2');
INSERT INTO `model_nation` VALUES ('2016', '430426', '', '', '祁东县', '2005', '112.111192', '26.787109', 'wkz8rhkyhp');
INSERT INTO `model_nation` VALUES ('2017', '430481', '', '', '耒阳市', '2005', '112.847215', '26.414162', 'ws8nrbscds');
INSERT INTO `model_nation` VALUES ('2018', '430482', '', '', '常宁市', '2005', '112.396821', '26.406773', 'wkxyjxhyeg');
INSERT INTO `model_nation` VALUES ('2019', '430500', '', '邵阳市', '', '1975', '111.46923', '27.237842', 'wkz6bw3rvm');
INSERT INTO `model_nation` VALUES ('2020', '430501', '', '', '市辖区', '2019', '111.46923', '27.237842', 'wkz6bw3rvm');
INSERT INTO `model_nation` VALUES ('2021', '430502', '', '', '双清区', '2019', '111.479756', '27.240001', 'wkz6bychd8');
INSERT INTO `model_nation` VALUES ('2022', '430503', '', '', '大祥区', '2019', '111.462968', '27.233593', 'wkz6bmsz5m');
INSERT INTO `model_nation` VALUES ('2023', '430511', '', '', '北塔区', '2019', '111.452315', '27.245688', 'wkz6bpvjeh');
INSERT INTO `model_nation` VALUES ('2024', '430521', '', '', '邵东县', '2019', '111.743168', '27.257273', 'wkz7nf0che');
INSERT INTO `model_nation` VALUES ('2025', '430522', '', '', '新邵县', '2019', '111.459762', '27.311429', 'wkz727fs8e');
INSERT INTO `model_nation` VALUES ('2026', '430523', '', '', '邵阳县', '2019', '111.2757', '26.989713', 'wkz1s1k6rx');
INSERT INTO `model_nation` VALUES ('2027', '430524', '', '', '隆回县', '2019', '111.038785', '27.116002', 'wkyfq8rfpj');
INSERT INTO `model_nation` VALUES ('2028', '430525', '', '', '洞口县', '2019', '110.579212', '27.062286', 'wky9uq934r');
INSERT INTO `model_nation` VALUES ('2029', '430527', '', '', '绥宁县', '2019', '110.155075', '26.580622', 'wkwr4wu7r7');
INSERT INTO `model_nation` VALUES ('2030', '430528', '', '', '新宁县', '2019', '110.859115', '26.438912', 'wkwy6tj1ud');
INSERT INTO `model_nation` VALUES ('2031', '430529', '', '', '城步苗族自治县', '2019', '110.313226', '26.363575', 'wkwmyprduq');
INSERT INTO `model_nation` VALUES ('2032', '430581', '', '', '武冈市', '2019', '110.636804', '26.732086', 'wky8jd7m8q');
INSERT INTO `model_nation` VALUES ('2033', '430600', '', '岳阳市', '', '1975', '113.132855', '29.37029', 'wt0rn6sy6d');
INSERT INTO `model_nation` VALUES ('2034', '430601', '', '', '市辖区', '2033', '113.132855', '29.37029', 'wt0rn6sy6d');
INSERT INTO `model_nation` VALUES ('2035', '430602', '', '', '岳阳楼区', '2033', '113.120751', '29.366784', 'wt0rn4h1bt');
INSERT INTO `model_nation` VALUES ('2036', '430603', '', '', '云溪区', '2033', '113.27387', '29.473395', 'wt0x9t7wbr');
INSERT INTO `model_nation` VALUES ('2037', '430611', '', '', '君山区', '2033', '113.004082', '29.438062', 'wt0r7rp11u');
INSERT INTO `model_nation` VALUES ('2038', '430621', '', '', '岳阳县', '2033', '113.116073', '29.144843', 'wt0my18t58');
INSERT INTO `model_nation` VALUES ('2039', '430623', '', '', '华容县', '2033', '112.559369', '29.524107', 'wt0pcqenrk');
INSERT INTO `model_nation` VALUES ('2040', '430624', '', '', '湘阴县', '2033', '112.889748', '28.677498', 'wt070uef9c');
INSERT INTO `model_nation` VALUES ('2041', '430626', '', '', '平江县', '2033', '113.593751', '28.701523', 'wt0g2buqqp');
INSERT INTO `model_nation` VALUES ('2042', '430681', '', '', '汨罗市', '2033', '113.079419', '28.803149', 'wt07v5myt2');
INSERT INTO `model_nation` VALUES ('2043', '430682', '', '', '临湘市', '2033', '113.450809', '29.471594', 'wt0xtthk7r');
INSERT INTO `model_nation` VALUES ('2044', '430700', '', '常德市', '', '1975', '111.691347', '29.040225', 'wmpmjwe5t4');
INSERT INTO `model_nation` VALUES ('2045', '430701', '', '', '市辖区', '2044', '111.691347', '29.040225', 'wmpmjwe5t4');
INSERT INTO `model_nation` VALUES ('2046', '430702', '', '', '武陵区', '2044', '111.690718', '29.040477', 'wmpmjwdtn3');
INSERT INTO `model_nation` VALUES ('2047', '430703', '', '', '鼎城区', '2044', '111.685327', '29.014426', 'wmpmj3yv29');
INSERT INTO `model_nation` VALUES ('2048', '430721', '', '', '安乡县', '2044', '112.172289', '29.414483', 'wmpz2d9rgc');
INSERT INTO `model_nation` VALUES ('2049', '430722', '', '', '汉寿县', '2044', '111.968506', '28.907319', 'wmps7ykvr6');
INSERT INTO `model_nation` VALUES ('2050', '430723', '', '', '澧县', '2044', '111.761682', '29.64264', 'wmr2xhq2gu');
INSERT INTO `model_nation` VALUES ('2051', '430724', '', '', '临澧县', '2044', '111.645602', '29.443217', 'wmprkxcz5j');
INSERT INTO `model_nation` VALUES ('2052', '430725', '', '', '桃源县', '2044', '111.484503', '28.902734', 'wmpk2vsd9h');
INSERT INTO `model_nation` VALUES ('2053', '430726', '', '', '石门县', '2044', '111.379087', '29.584703', 'wmr0q3xz2u');
INSERT INTO `model_nation` VALUES ('2054', '430781', '', '', '津市市', '2044', '111.879609', '29.630867', 'wmr89fhhrc');
INSERT INTO `model_nation` VALUES ('2055', '430800', '', '张家界市', '', '1975', '110.479921', '29.127401', 'wmntdn3p2t');
INSERT INTO `model_nation` VALUES ('2056', '430801', '', '', '市辖区', '2055', '110.479921', '29.127401', 'wmntdn3p2t');
INSERT INTO `model_nation` VALUES ('2057', '430802', '', '', '永定区', '2055', '110.484559', '29.125961', 'wmntdnhrhb');
INSERT INTO `model_nation` VALUES ('2058', '430811', '', '', '武陵源区', '2055', '110.54758', '29.347827', 'wmnwgwd73r');
INSERT INTO `model_nation` VALUES ('2059', '430821', '', '', '慈利县', '2055', '111.132702', '29.423876', 'wmpp2ukqe8');
INSERT INTO `model_nation` VALUES ('2060', '430822', '', '', '桑植县', '2055', '110.164039', '29.399939', 'wmnr6b5501');
INSERT INTO `model_nation` VALUES ('2061', '430900', '', '益阳市', '', '1975', '112.355042', '28.570066', 'wmpfs9n2wn');
INSERT INTO `model_nation` VALUES ('2062', '430901', '', '', '市辖区', '2061', '112.355042', '28.570066', 'wmpfs9n2wn');
INSERT INTO `model_nation` VALUES ('2063', '430902', '', '', '资阳区', '2061', '112.33084', '28.592771', 'wmpfsjhufq');
INSERT INTO `model_nation` VALUES ('2064', '430903', '', '', '赫山区', '2061', '112.360946', '28.568327', 'wmpfsbdwxf');
INSERT INTO `model_nation` VALUES ('2065', '430921', '', '', '南县', '2061', '112.410399', '29.372181', 'wmpzjgnc25');
INSERT INTO `model_nation` VALUES ('2066', '430922', '', '', '桃江县', '2061', '112.139732', '28.520993', 'wmpdrb1dv4');
INSERT INTO `model_nation` VALUES ('2067', '430923', '', '', '安化县', '2061', '111.221824', '28.377421', 'wmp16vvq2q');
INSERT INTO `model_nation` VALUES ('2068', '430981', '', '', '沅江市', '2061', '112.361088', '28.839713', 'wmpuhf4ge0');
INSERT INTO `model_nation` VALUES ('2069', '431000', '', '郴州市', '', '1975', '113.032067', '25.793589', 'ws86spe6w1');
INSERT INTO `model_nation` VALUES ('2070', '431001', '', '', '市辖区', '2069', '113.032067', '25.793589', 'ws86spe6w1');
INSERT INTO `model_nation` VALUES ('2071', '431002', '', '', '北湖区', '2069', '113.032208', '25.792628', 'ws86sp7scq');
INSERT INTO `model_nation` VALUES ('2072', '431003', '', '', '苏仙区', '2069', '113.038698', '25.793157', 'ws86sr8208');
INSERT INTO `model_nation` VALUES ('2073', '431021', '', '', '桂阳县', '2069', '112.734466', '25.737447', 'ws84mm6err');
INSERT INTO `model_nation` VALUES ('2074', '431022', '', '', '宜章县', '2069', '112.947884', '25.394345', 'ws826nyhu3');
INSERT INTO `model_nation` VALUES ('2075', '431023', '', '', '永兴县', '2069', '113.114819', '26.129392', 'ws8ktuxwwr');
INSERT INTO `model_nation` VALUES ('2076', '431024', '', '', '嘉禾县', '2069', '112.370618', '25.587309', 'wkxct41bch');
INSERT INTO `model_nation` VALUES ('2077', '431025', '', '', '临武县', '2069', '112.564589', '25.279119', 'ws2pc3zj91');
INSERT INTO `model_nation` VALUES ('2078', '431026', '', '', '汝城县', '2069', '113.685686', '25.553759', 'ws8c6gzmkm');
INSERT INTO `model_nation` VALUES ('2079', '431027', '', '', '桂东县', '2069', '113.945879', '26.073917', 'ws9h2fsge6');
INSERT INTO `model_nation` VALUES ('2080', '431028', '', '', '安仁县', '2069', '113.27217', '26.708625', 'ws8xcw4m0b');
INSERT INTO `model_nation` VALUES ('2081', '431081', '', '', '资兴市', '2069', '113.23682', '25.974152', 'ws8ebb2w3h');
INSERT INTO `model_nation` VALUES ('2082', '431100', '', '永州市', '', '1975', '111.608019', '26.434516', 'wkxq7sq2pq');
INSERT INTO `model_nation` VALUES ('2083', '431101', '', '', '市辖区', '2082', '111.608019', '26.434516', 'wkxq7sq2pq');
INSERT INTO `model_nation` VALUES ('2084', '431102', '', '', '零陵区', '2082', '111.626348', '26.223347', 'wkxmhjgf46');
INSERT INTO `model_nation` VALUES ('2085', '431103', '', '', '冷水滩区', '2082', '111.607156', '26.434364', 'wkxq7sjz74');
INSERT INTO `model_nation` VALUES ('2086', '431121', '', '', '祁阳县', '2082', '111.85734', '26.585929', 'wkxx1ru42b');
INSERT INTO `model_nation` VALUES ('2087', '431122', '', '', '东安县', '2082', '111.313035', '26.397278', 'wkxnhvrxm9');
INSERT INTO `model_nation` VALUES ('2088', '431123', '', '', '双牌县', '2082', '111.662146', '25.959397', 'wkx7svvbkw');
INSERT INTO `model_nation` VALUES ('2089', '431124', '', '', '道县', '2082', '111.591614', '25.518444', 'wkx35m6x9n');
INSERT INTO `model_nation` VALUES ('2090', '431125', '', '', '江永县', '2082', '111.346803', '25.268154', 'wkrptzbm8t');
INSERT INTO `model_nation` VALUES ('2091', '431126', '', '', '宁远县', '2082', '111.944529', '25.584112', 'wkx9e37w28');
INSERT INTO `model_nation` VALUES ('2092', '431127', '', '', '蓝山县', '2082', '112.194195', '25.375255', 'wkxb353md4');
INSERT INTO `model_nation` VALUES ('2093', '431128', '', '', '新田县', '2082', '112.220341', '25.906927', 'wkxg3shqg3');
INSERT INTO `model_nation` VALUES ('2094', '431129', '', '', '江华瑶族自治县', '2082', '111.577276', '25.182596', 'wkrr70256b');
INSERT INTO `model_nation` VALUES ('2095', '431200', '', '怀化市', '', '1975', '109.97824', '27.550082', 'wkyhwx7dye');
INSERT INTO `model_nation` VALUES ('2096', '431201', '', '', '市辖区', '2095', '109.97824', '27.550082', 'wkyhwx7dye');
INSERT INTO `model_nation` VALUES ('2097', '431202', '', '', '鹤城区', '2095', '109.982242', '27.548474', 'wkyhwxn97z');
INSERT INTO `model_nation` VALUES ('2098', '431221', '', '', '中方县', '2095', '109.948061', '27.43736', 'wkyhjfvdpw');
INSERT INTO `model_nation` VALUES ('2099', '431222', '', '', '沅陵县', '2095', '110.399161', '28.455554', 'wmn9bhnjwg');
INSERT INTO `model_nation` VALUES ('2100', '431223', '', '', '辰溪县', '2095', '110.196953', '28.005474', 'wkyr7d4zxn');
INSERT INTO `model_nation` VALUES ('2101', '431224', '', '', '溆浦县', '2095', '110.593373', '27.903802', 'wkywsxexkm');
INSERT INTO `model_nation` VALUES ('2102', '431225', '', '', '会同县', '2095', '109.720785', '26.870789', 'wky0bg8jxw');
INSERT INTO `model_nation` VALUES ('2103', '431226', '', '', '麻阳苗族自治县', '2095', '109.802807', '27.865991', 'wkynd8ggnv');
INSERT INTO `model_nation` VALUES ('2104', '431227', '', '', '新晃侗族自治县', '2095', '109.174443', '27.359897', 'wkveskdquy');
INSERT INTO `model_nation` VALUES ('2105', '431228', '', '', '芷江侗族自治县', '2095', '109.687777', '27.437996', 'wkyh04bjym');
INSERT INTO `model_nation` VALUES ('2106', '431229', '', '', '靖州苗族侗族自治县', '2095', '109.691159', '26.573511', 'wkwp0jd9vm');
INSERT INTO `model_nation` VALUES ('2107', '431230', '', '', '通道侗族自治县', '2095', '109.783359', '26.158349', 'wkwhf1vz3t');
INSERT INTO `model_nation` VALUES ('2108', '431281', '', '', '洪江市', '2095', '109.831765', '27.201876', 'wky4ercn3t');
INSERT INTO `model_nation` VALUES ('2109', '431300', '', '娄底市', '', '1975', '112.008497', '27.728136', 'wkztszf055');
INSERT INTO `model_nation` VALUES ('2110', '431301', '', '', '市辖区', '2109', '112.008497', '27.728136', 'wkztszf055');
INSERT INTO `model_nation` VALUES ('2111', '431302', '', '', '娄星区', '2109', '112.008486', '27.726643', 'wkztsz6p6u');
INSERT INTO `model_nation` VALUES ('2112', '431321', '', '', '双峰县', '2109', '112.198245', '27.459126', 'wkzu1nu308');
INSERT INTO `model_nation` VALUES ('2113', '431322', '', '', '新化县', '2109', '111.306747', '27.737456', 'wkzjuc7n7h');
INSERT INTO `model_nation` VALUES ('2114', '431381', '', '', '冷水江市', '2109', '111.434674', '27.685759', 'wkzjxb030p');
INSERT INTO `model_nation` VALUES ('2115', '431382', '', '', '涟源市', '2109', '111.670847', '27.692301', 'wkzmt1hpr7');
INSERT INTO `model_nation` VALUES ('2116', '433100', '', '湘西土家族苗族自治州', '', '1975', '109.739735', '28.314296', 'wmn114qn9p');
INSERT INTO `model_nation` VALUES ('2117', '433101', '', '', '吉首市', '2116', '109.738273', '28.314827', 'wmn114scz4');
INSERT INTO `model_nation` VALUES ('2118', '433122', '', '', '泸溪县', '2116', '110.214428', '28.214516', 'wmn2ebr9qq');
INSERT INTO `model_nation` VALUES ('2119', '433123', '', '', '凤凰县', '2116', '109.599191', '27.948308', 'wkvyvzzdwq');
INSERT INTO `model_nation` VALUES ('2120', '433124', '', '', '花垣县', '2116', '109.479063', '28.581352', 'wmjfe704rn');
INSERT INTO `model_nation` VALUES ('2121', '433125', '', '', '保靖县', '2116', '109.651445', '28.709605', 'wmjgr4mtxf');
INSERT INTO `model_nation` VALUES ('2122', '433126', '', '', '古丈县', '2116', '109.949592', '28.616973', 'wmn4vcwcgn');
INSERT INTO `model_nation` VALUES ('2123', '433127', '', '', '永顺县', '2116', '109.853292', '28.998068', 'wmnhgybtzp');
INSERT INTO `model_nation` VALUES ('2124', '433130', '', '', '龙山县', '2116', '109.441189', '29.453438', 'wmjzd3udsw');
INSERT INTO `model_nation` VALUES ('2125', '440000', '广东省', '', '', '1', '113.280637', '23.125178', 'ws0e9cb3yj');
INSERT INTO `model_nation` VALUES ('2126', '440100', '', '广州市', '', '2125', '113.280637', '23.125178', 'ws0e9cb3yj');
INSERT INTO `model_nation` VALUES ('2127', '440101', '', '', '市辖区', '2126', '113.280637', '23.125178', 'ws0e9cb3yj');
INSERT INTO `model_nation` VALUES ('2128', '440103', '', '', '荔湾区', '2126', '113.243038', '23.124943', 'ws0e8cv0d1');
INSERT INTO `model_nation` VALUES ('2129', '440104', '', '', '越秀区', '2126', '113.280714', '23.125624', 'ws0e9cbkxb');
INSERT INTO `model_nation` VALUES ('2130', '440105', '', '', '海珠区', '2126', '113.262008', '23.103131', 'ws0e3mfckp');
INSERT INTO `model_nation` VALUES ('2131', '440106', '', '', '天河区', '2126', '113.335367', '23.13559', 'ws0ee58q96');
INSERT INTO `model_nation` VALUES ('2132', '440111', '', '', '白云区', '2126', '113.262831', '23.162281', 'ws0ec2e6p6');
INSERT INTO `model_nation` VALUES ('2133', '440112', '', '', '黄埔区', '2126', '113.450761', '23.103239', 'ws0emtu647');
INSERT INTO `model_nation` VALUES ('2134', '440113', '', '', '番禺区', '2126', '113.364619', '22.938582', 'ws0d7xvdgj');
INSERT INTO `model_nation` VALUES ('2135', '440114', '', '', '花都区', '2126', '113.211184', '23.39205', 'ws0t04muef');
INSERT INTO `model_nation` VALUES ('2136', '440115', '', '', '南沙区', '2126', '113.53738', '22.794531', 'ws09xte7u8');
INSERT INTO `model_nation` VALUES ('2137', '440117', '', '', '从化区', '2126', '113.280637', '23.125178', 'ws0e9cb3yj');
INSERT INTO `model_nation` VALUES ('2138', '440118', '', '', '增城区', '2126', '113.280637', '23.125178', 'ws0e9cb3yj');
INSERT INTO `model_nation` VALUES ('2139', '440200', '', '韶关市', '', '2125', '113.591544', '24.801322', 'ws2v0ffy4v');
INSERT INTO `model_nation` VALUES ('2140', '440201', '', '', '市辖区', '2139', '113.591544', '24.801322', 'ws2v0ffy4v');
INSERT INTO `model_nation` VALUES ('2141', '440203', '', '', '武江区', '2139', '113.588289', '24.80016', 'ws2v0f8rqu');
INSERT INTO `model_nation` VALUES ('2142', '440204', '', '', '浈江区', '2139', '113.599224', '24.803977', 'ws2v152mtu');
INSERT INTO `model_nation` VALUES ('2143', '440205', '', '', '曲江区', '2139', '113.605582', '24.680195', 'ws2u3hvh9c');
INSERT INTO `model_nation` VALUES ('2144', '440222', '', '', '始兴县', '2139', '114.067205', '24.948364', 'ws3jgttny8');
INSERT INTO `model_nation` VALUES ('2145', '440224', '', '', '仁化县', '2139', '113.748627', '25.088226', 'ws2ysrjjx0');
INSERT INTO `model_nation` VALUES ('2146', '440229', '', '', '翁源县', '2139', '114.131289', '24.353887', 'ws34t17zev');
INSERT INTO `model_nation` VALUES ('2147', '440232', '', '', '乳源瑶族自治县', '2139', '113.278417', '24.776109', 'ws2scwqg63');
INSERT INTO `model_nation` VALUES ('2148', '440233', '', '', '新丰县', '2139', '114.207034', '24.055412', 'ws30yg5hbv');
INSERT INTO `model_nation` VALUES ('2149', '440281', '', '', '乐昌市', '2139', '113.352413', '25.128445', 'ws2wgqkxy9');
INSERT INTO `model_nation` VALUES ('2150', '440282', '', '', '南雄市', '2139', '114.311231', '25.115328', 'ws3qchngks');
INSERT INTO `model_nation` VALUES ('2151', '440300', '', '深圳市', '', '2125', '114.085947', '22.547', 'ws10k0dcg1');
INSERT INTO `model_nation` VALUES ('2152', '440301', '', '', '市辖区', '2151', '114.085947', '22.547', 'ws10k0dcg1');
INSERT INTO `model_nation` VALUES ('2153', '440303', '', '', '罗湖区', '2151', '114.123885', '22.555341', 'ws10kfn6rk');
INSERT INTO `model_nation` VALUES ('2154', '440304', '', '', '福田区', '2151', '114.05096', '22.541009', 'ws105r3qgu');
INSERT INTO `model_nation` VALUES ('2155', '440305', '', '', '南山区', '2151', '113.92943', '22.531221', 'ws100t8vuh');
INSERT INTO `model_nation` VALUES ('2156', '440306', '', '', '宝安区', '2151', '113.828671', '22.754741', 'ws0cqnrebr');
INSERT INTO `model_nation` VALUES ('2157', '440307', '', '', '龙岗区', '2151', '114.251372', '22.721511', 'ws11rb763u');
INSERT INTO `model_nation` VALUES ('2158', '440308', '', '', '盐田区', '2151', '114.235366', '22.555069', 'ws10r6p8uc');
INSERT INTO `model_nation` VALUES ('2159', '440400', '', '珠海市', '', '2125', '113.553986', '22.224979', 'webwrvzmzs');
INSERT INTO `model_nation` VALUES ('2160', '440401', '', '', '市辖区', '2159', '113.553986', '22.224979', 'webwrvzmzs');
INSERT INTO `model_nation` VALUES ('2161', '440402', '', '', '香洲区', '2159', '113.55027', '22.271249', 'webwxykg3j');
INSERT INTO `model_nation` VALUES ('2162', '440403', '', '', '斗门区', '2159', '113.297739', '22.209117', 'webw65hckx');
INSERT INTO `model_nation` VALUES ('2163', '440404', '', '', '金湾区', '2159', '113.345071', '22.139122', 'webtgnr3ex');
INSERT INTO `model_nation` VALUES ('2164', '440500', '', '汕头市', '', '2125', '116.708463', '23.37102', 'ws4uzy8d03');
INSERT INTO `model_nation` VALUES ('2165', '440501', '', '', '市辖区', '2164', '116.708463', '23.37102', 'ws4uzy8d03');
INSERT INTO `model_nation` VALUES ('2166', '440507', '', '', '龙湖区', '2164', '116.732015', '23.373754', 'ws5hbr19vp');
INSERT INTO `model_nation` VALUES ('2167', '440511', '', '', '金平区', '2164', '116.703583', '23.367071', 'ws4uztugn9');
INSERT INTO `model_nation` VALUES ('2168', '440512', '', '', '濠江区', '2164', '116.729528', '23.279345', 'ws5h2jzu50');
INSERT INTO `model_nation` VALUES ('2169', '440513', '', '', '潮阳区', '2164', '116.602602', '23.262336', 'ws4um6g2vt');
INSERT INTO `model_nation` VALUES ('2170', '440514', '', '', '潮南区', '2164', '116.423607', '23.249798', 'ws4u323pfs');
INSERT INTO `model_nation` VALUES ('2171', '440515', '', '', '澄海区', '2164', '116.76336', '23.46844', 'ws5j9023x6');
INSERT INTO `model_nation` VALUES ('2172', '440523', '', '', '南澳县', '2164', '117.027105', '23.419562', 'ws5jpp2sc4');
INSERT INTO `model_nation` VALUES ('2173', '440600', '', '佛山市', '', '2125', '113.122717', '23.028762', 'ws07n0m2q2');
INSERT INTO `model_nation` VALUES ('2174', '440601', '', '', '市辖区', '2173', '113.122717', '23.028762', 'ws07n0m2q2');
INSERT INTO `model_nation` VALUES ('2175', '440604', '', '', '禅城区', '2173', '113.112414', '23.019643', 'ws06vytgnk');
INSERT INTO `model_nation` VALUES ('2176', '440605', '', '', '南海区', '2173', '113.145577', '23.031562', 'ws07n8y0e4');
INSERT INTO `model_nation` VALUES ('2177', '440606', '', '', '顺德区', '2173', '113.281826', '22.75851', 'ws093z13cv');
INSERT INTO `model_nation` VALUES ('2178', '440607', '', '', '三水区', '2173', '112.899414', '23.16504', 'ws07c14f5h');
INSERT INTO `model_nation` VALUES ('2179', '440608', '', '', '高明区', '2173', '112.882123', '22.893855', 'ws060xwq25');
INSERT INTO `model_nation` VALUES ('2180', '440700', '', '江门市', '', '2125', '113.094942', '22.590431', 'ws02t83nz1');
INSERT INTO `model_nation` VALUES ('2181', '440701', '', '', '市辖区', '2180', '113.094942', '22.590431', 'ws02t83nz1');
INSERT INTO `model_nation` VALUES ('2182', '440703', '', '', '蓬江区', '2180', '113.07859', '22.59677', 'ws02t1t7dp');
INSERT INTO `model_nation` VALUES ('2183', '440704', '', '', '江海区', '2180', '113.120601', '22.572211', 'ws02qj5utj');
INSERT INTO `model_nation` VALUES ('2184', '440705', '', '', '新会区', '2180', '113.038584', '22.520247', 'ws02h78jvy');
INSERT INTO `model_nation` VALUES ('2185', '440781', '', '', '台山市', '2180', '112.793414', '22.250713', 'webnwdtev1');
INSERT INTO `model_nation` VALUES ('2186', '440783', '', '', '开平市', '2180', '112.692262', '22.366286', 'webphrsj01');
INSERT INTO `model_nation` VALUES ('2187', '440784', '', '', '鹤山市', '2180', '112.961795', '22.768104', 'ws03d8b3bd');
INSERT INTO `model_nation` VALUES ('2188', '440785', '', '', '恩平市', '2180', '112.314051', '22.182956', 'w7zy5y2954');
INSERT INTO `model_nation` VALUES ('2189', '440800', '', '湛江市', '', '2125', '110.364977', '21.274898', 'w7y3p2vr62');
INSERT INTO `model_nation` VALUES ('2190', '440801', '', '', '市辖区', '2189', '110.364977', '21.274898', 'w7y3p2vr62');
INSERT INTO `model_nation` VALUES ('2191', '440802', '', '', '赤坎区', '2189', '110.361634', '21.273365', 'w7y3p2dyk6');
INSERT INTO `model_nation` VALUES ('2192', '440803', '', '', '霞山区', '2189', '110.406382', '21.194229', 'w7y88673r4');
INSERT INTO `model_nation` VALUES ('2193', '440804', '', '', '坡头区', '2189', '110.455632', '21.24441', 'w7y8c7rmdv');
INSERT INTO `model_nation` VALUES ('2194', '440811', '', '', '麻章区', '2189', '110.329167', '21.265997', 'w7y2yx75rv');
INSERT INTO `model_nation` VALUES ('2195', '440823', '', '', '遂溪县', '2189', '110.255321', '21.376915', 'w7y3sgt3x1');
INSERT INTO `model_nation` VALUES ('2196', '440825', '', '', '徐闻县', '2189', '110.175718', '20.326083', 'w7w7eh7802');
INSERT INTO `model_nation` VALUES ('2197', '440881', '', '', '廉江市', '2189', '110.284961', '21.611281', 'w7y6vw5ncf');
INSERT INTO `model_nation` VALUES ('2198', '440882', '', '', '雷州市', '2189', '110.088275', '20.908523', 'w7wqcn7bfx');
INSERT INTO `model_nation` VALUES ('2199', '440883', '', '', '吴川市', '2189', '110.780508', '21.428453', 'w7ycbugvuc');
INSERT INTO `model_nation` VALUES ('2200', '440900', '', '茂名市', '', '2125', '110.919229', '21.659751', 'w7yghp0cjq');
INSERT INTO `model_nation` VALUES ('2201', '440901', '', '', '市辖区', '2200', '110.919229', '21.659751', 'w7yghp0cjq');
INSERT INTO `model_nation` VALUES ('2202', '440902', '', '', '茂南区', '2200', '110.920542', '21.660425', 'w7yghp1v5g');
INSERT INTO `model_nation` VALUES ('2203', '440904', '', '', '电白区', '2200', '110.919229', '21.659751', 'w7yghp0cjq');
INSERT INTO `model_nation` VALUES ('2204', '440981', '', '', '高州市', '2200', '110.853251', '21.915153', 'w7yudt8c5b');
INSERT INTO `model_nation` VALUES ('2205', '440982', '', '', '化州市', '2200', '110.63839', '21.654953', 'w7yejwhmjr');
INSERT INTO `model_nation` VALUES ('2206', '440983', '', '', '信宜市', '2200', '110.941656', '22.352681', 'w7yzht1jzc');
INSERT INTO `model_nation` VALUES ('2207', '441200', '', '肇庆市', '', '2125', '112.472529', '23.051546', 'wkpgpk7uzz');
INSERT INTO `model_nation` VALUES ('2208', '441201', '', '', '市辖区', '2207', '112.472529', '23.051546', 'wkpgpk7uzz');
INSERT INTO `model_nation` VALUES ('2209', '441202', '', '', '端州区', '2207', '112.472329', '23.052662', 'wkpgpkeg7p');
INSERT INTO `model_nation` VALUES ('2210', '441203', '', '', '鼎湖区', '2207', '112.565249', '23.155822', 'ws059rrs2q');
INSERT INTO `model_nation` VALUES ('2211', '441223', '', '', '广宁县', '2207', '112.440419', '23.631486', 'wkpyqtux7s');
INSERT INTO `model_nation` VALUES ('2212', '441224', '', '', '怀集县', '2207', '112.182466', '23.913072', 'wkrb0c0z8z');
INSERT INTO `model_nation` VALUES ('2213', '441225', '', '', '封开县', '2207', '111.502973', '23.434731', 'wkpm361vpw');
INSERT INTO `model_nation` VALUES ('2214', '441226', '', '', '德庆县', '2207', '111.78156', '23.141711', 'wkp7xsuf5p');
INSERT INTO `model_nation` VALUES ('2215', '441283', '', '', '高要市', '2207', '112.460846', '23.027694', 'wkpgp056p9');
INSERT INTO `model_nation` VALUES ('2216', '441284', '', '', '四会市', '2207', '112.695028', '23.340324', 'ws0hu2yp0r');
INSERT INTO `model_nation` VALUES ('2217', '441300', '', '惠州市', '', '2125', '114.412599', '23.079404', 'ws17792xqb');
INSERT INTO `model_nation` VALUES ('2218', '441301', '', '', '市辖区', '2217', '114.412599', '23.079404', 'ws17792xqb');
INSERT INTO `model_nation` VALUES ('2219', '441302', '', '', '惠城区', '2217', '114.413978', '23.079883', 'ws17799dnf');
INSERT INTO `model_nation` VALUES ('2220', '441303', '', '', '惠阳区', '2217', '114.469444', '22.78851', 'ws13sud0eq');
INSERT INTO `model_nation` VALUES ('2221', '441322', '', '', '博罗县', '2217', '114.284254', '23.167575', 'ws17b9e2bh');
INSERT INTO `model_nation` VALUES ('2222', '441323', '', '', '惠东县', '2217', '114.723092', '22.983036', 'ws1ddxfvcu');
INSERT INTO `model_nation` VALUES ('2223', '441324', '', '', '龙门县', '2217', '114.259986', '23.723894', 'ws1qbnc9dw');
INSERT INTO `model_nation` VALUES ('2224', '441400', '', '梅州市', '', '2125', '116.117582', '24.299112', 'ws6d4rd0xf');
INSERT INTO `model_nation` VALUES ('2225', '441401', '', '', '市辖区', '2224', '116.117582', '24.299112', 'ws6d4rd0xf');
INSERT INTO `model_nation` VALUES ('2226', '441402', '', '', '梅江区', '2224', '116.12116', '24.302593', 'ws6d62hug5');
INSERT INTO `model_nation` VALUES ('2227', '441403', '', '', '梅县区', '2224', '116.117582', '24.299112', 'ws6d4rd0xf');
INSERT INTO `model_nation` VALUES ('2228', '441422', '', '', '大埔县', '2224', '116.69552', '24.351587', 'ws6fx3p468');
INSERT INTO `model_nation` VALUES ('2229', '441423', '', '', '丰顺县', '2224', '116.184419', '23.752771', 'ws4x5u4cvj');
INSERT INTO `model_nation` VALUES ('2230', '441424', '', '', '五华县', '2224', '115.775004', '23.925424', 'ws624e2z9n');
INSERT INTO `model_nation` VALUES ('2231', '441426', '', '', '平远县', '2224', '115.891729', '24.569651', 'ws67v0vb94');
INSERT INTO `model_nation` VALUES ('2232', '441427', '', '', '蕉岭县', '2224', '116.170531', '24.653313', 'ws6s5xbzcw');
INSERT INTO `model_nation` VALUES ('2233', '441481', '', '', '兴宁市', '2224', '115.731648', '24.138077', 'ws633d1nqz');
INSERT INTO `model_nation` VALUES ('2234', '441500', '', '汕尾市', '', '2125', '115.364238', '22.774485', 'ws4191vwvx');
INSERT INTO `model_nation` VALUES ('2235', '441501', '', '', '市辖区', '2234', '115.364238', '22.774485', 'ws4191vwvx');
INSERT INTO `model_nation` VALUES ('2236', '441502', '', '', '城区', '2234', '115.363667', '22.776227', 'ws4194m30k');
INSERT INTO `model_nation` VALUES ('2237', '441521', '', '', '海丰县', '2234', '115.337324', '22.971042', 'ws448tf042');
INSERT INTO `model_nation` VALUES ('2238', '441523', '', '', '陆河县', '2234', '115.657565', '23.302682', 'ws4hxf57bw');
INSERT INTO `model_nation` VALUES ('2239', '441581', '', '', '陆丰市', '2234', '115.644203', '22.946104', 'ws44x91w9p');
INSERT INTO `model_nation` VALUES ('2240', '441600', '', '河源市', '', '2125', '114.697802', '23.746266', 'ws1x44bkh2');
INSERT INTO `model_nation` VALUES ('2241', '441601', '', '', '市辖区', '2240', '114.697802', '23.746266', 'ws1x44bkh2');
INSERT INTO `model_nation` VALUES ('2242', '441602', '', '', '源城区', '2240', '114.696828', '23.746255', 'ws1x1fzevy');
INSERT INTO `model_nation` VALUES ('2243', '441621', '', '', '紫金县', '2240', '115.184383', '23.633744', 'ws1ymn6sw9');
INSERT INTO `model_nation` VALUES ('2244', '441622', '', '', '龙川县', '2240', '115.256415', '24.101174', 'ws3cnerpt0');
INSERT INTO `model_nation` VALUES ('2245', '441623', '', '', '连平县', '2240', '114.495952', '24.364227', 'ws36t7m7vj');
INSERT INTO `model_nation` VALUES ('2246', '441624', '', '', '和平县', '2240', '114.941473', '24.44318', 'ws3ep99zf7');
INSERT INTO `model_nation` VALUES ('2247', '441625', '', '', '东源县', '2240', '114.742711', '23.789093', 'ws1x749jdb');
INSERT INTO `model_nation` VALUES ('2248', '441700', '', '阳江市', '', '2125', '111.975107', '21.859222', 'w7zsk53g1n');
INSERT INTO `model_nation` VALUES ('2249', '441701', '', '', '市辖区', '2248', '111.975107', '21.859222', 'w7zsk53g1n');
INSERT INTO `model_nation` VALUES ('2250', '441702', '', '', '江城区', '2248', '111.968909', '21.859182', 'w7zs7gm6bw');
INSERT INTO `model_nation` VALUES ('2251', '441704', '', '', '阳东区', '2248', '111.975107', '21.859222', 'w7zsk53g1n');
INSERT INTO `model_nation` VALUES ('2252', '441721', '', '', '阳西县', '2248', '111.617556', '21.75367', 'w7z7gbjkmd');
INSERT INTO `model_nation` VALUES ('2253', '441781', '', '', '阳春市', '2248', '111.7905', '22.169598', 'w7zqpgg772');
INSERT INTO `model_nation` VALUES ('2254', '441800', '', '清远市', '', '2125', '113.051227', '23.685022', 'ws0qsx9rk8');
INSERT INTO `model_nation` VALUES ('2255', '441801', '', '', '市辖区', '2254', '113.051227', '23.685022', 'ws0qsx9rk8');
INSERT INTO `model_nation` VALUES ('2256', '441802', '', '', '清城区', '2254', '113.048698', '23.688976', 'ws0qu2rw39');
INSERT INTO `model_nation` VALUES ('2257', '441803', '', '', '清新区', '2254', '113.015203', '23.736949', 'ws0r59pjv0');
INSERT INTO `model_nation` VALUES ('2258', '441821', '', '', '佛冈县', '2254', '113.534094', '23.866739', 'ws0xz8c1b4');
INSERT INTO `model_nation` VALUES ('2259', '441823', '', '', '阳山县', '2254', '112.634019', '24.470286', 'ws255n9tdz');
INSERT INTO `model_nation` VALUES ('2260', '441825', '', '', '连山壮族瑶族自治县', '2254', '112.086555', '24.567271', 'wkrey86fwp');
INSERT INTO `model_nation` VALUES ('2261', '441826', '', '', '连南瑶族自治县', '2254', '112.290808', '24.719097', 'wkrue5zxjm');
INSERT INTO `model_nation` VALUES ('2262', '441881', '', '', '英德市', '2254', '113.405404', '24.18612', 'ws29sdgq37');
INSERT INTO `model_nation` VALUES ('2263', '441882', '', '', '连州市', '2254', '112.379271', '24.783966', 'wkruvrb14f');
INSERT INTO `model_nation` VALUES ('2264', '441900', '', '东莞市', '', '2125', '113.746262', '23.046237', 'ws0gh77w01');
INSERT INTO `model_nation` VALUES ('2265', '442000', '', '中山市', '', '2125', '113.382391', '22.521113', 'ws08h5fdcp');
INSERT INTO `model_nation` VALUES ('2266', '445100', '', '潮州市', '', '2125', '116.632301', '23.661701', 'ws4yw53p3s');
INSERT INTO `model_nation` VALUES ('2267', '445101', '', '', '市辖区', '2266', '116.632301', '23.661701', 'ws4yw53p3s');
INSERT INTO `model_nation` VALUES ('2268', '445102', '', '', '湘桥区', '2266', '116.63365', '23.664675', 'ws4ywh409p');
INSERT INTO `model_nation` VALUES ('2269', '445103', '', '', '潮安区', '2266', '116.67931', '23.461012', 'ws4vrngq2c');
INSERT INTO `model_nation` VALUES ('2270', '445122', '', '', '饶平县', '2266', '117.00205', '23.668171', 'ws5nwkwm16');
INSERT INTO `model_nation` VALUES ('2271', '445200', '', '揭阳市', '', '2125', '116.355733', '23.543778', 'ws4tzwp8mn');
INSERT INTO `model_nation` VALUES ('2272', '445201', '', '', '市辖区', '2271', '116.355733', '23.543778', 'ws4tzwp8mn');
INSERT INTO `model_nation` VALUES ('2273', '445202', '', '', '榕城区', '2271', '116.357045', '23.535524', 'ws4tzu887e');
INSERT INTO `model_nation` VALUES ('2274', '445203', '', '', '揭东区', '2271', '116.412947', '23.569887', 'ws4y14c2d3');
INSERT INTO `model_nation` VALUES ('2275', '445222', '', '', '揭西县', '2271', '115.838708', '23.4273', 'ws4m7bz1vt');
INSERT INTO `model_nation` VALUES ('2276', '445224', '', '', '惠来县', '2271', '116.295832', '23.029834', 'ws4en2kn92');
INSERT INTO `model_nation` VALUES ('2277', '445281', '', '', '普宁市', '2271', '116.165082', '23.29788', 'ws4se3hzfx');
INSERT INTO `model_nation` VALUES ('2278', '445300', '', '云浮市', '', '2125', '112.044439', '22.929801', 'wkpdmwhrb8');
INSERT INTO `model_nation` VALUES ('2279', '445301', '', '', '市辖区', '2278', '112.044439', '22.929801', 'wkpdmwhrb8');
INSERT INTO `model_nation` VALUES ('2280', '445302', '', '', '云城区', '2278', '112.04471', '22.930827', 'wkpdmwkmwz');
INSERT INTO `model_nation` VALUES ('2281', '445303', '', '', '云安区', '2278', '112.044439', '22.929801', 'wkpdmwhrb8');
INSERT INTO `model_nation` VALUES ('2282', '445321', '', '', '新兴县', '2278', '112.23083', '22.703204', 'wkpc1ugzxz');
INSERT INTO `model_nation` VALUES ('2283', '445322', '', '', '郁南县', '2278', '111.535921', '23.237709', 'wkpk4n3crq');
INSERT INTO `model_nation` VALUES ('2284', '445381', '', '', '罗定市', '2278', '111.578201', '22.765415', 'wkp3e02f0s');
INSERT INTO `model_nation` VALUES ('2285', '450000', '广西壮族自治区', '', '', '1', '108.320004', '22.82402', 'wkj1bfupx1');
INSERT INTO `model_nation` VALUES ('2286', '450100', '', '南宁市', '', '2285', '108.320004', '22.82402', 'wkj1bfupx1');
INSERT INTO `model_nation` VALUES ('2287', '450101', '', '', '市辖区', '2286', '108.320004', '22.82402', 'wkj1bfupx1');
INSERT INTO `model_nation` VALUES ('2288', '450102', '', '', '兴宁区', '2286', '108.320189', '22.819511', 'wkj1bfhm73');
INSERT INTO `model_nation` VALUES ('2289', '450103', '', '', '青秀区', '2286', '108.346113', '22.816614', 'wkj1c3xhrm');
INSERT INTO `model_nation` VALUES ('2290', '450105', '', '', '江南区', '2286', '108.310478', '22.799593', 'wkj18wt330');
INSERT INTO `model_nation` VALUES ('2291', '450107', '', '', '西乡塘区', '2286', '108.306903', '22.832779', 'wkj1bsddtf');
INSERT INTO `model_nation` VALUES ('2292', '450108', '', '', '良庆区', '2286', '108.322102', '22.75909', 'wkj12zjtrc');
INSERT INTO `model_nation` VALUES ('2293', '450109', '', '', '邕宁区', '2286', '108.484251', '22.756598', 'wkj1kweyf3');
INSERT INTO `model_nation` VALUES ('2294', '450122', '', '', '武鸣县', '2286', '108.280717', '23.157163', 'wkhgxzxs78');
INSERT INTO `model_nation` VALUES ('2295', '450123', '', '', '隆安县', '2286', '107.688661', '23.174763', 'wkhefdb6z8');
INSERT INTO `model_nation` VALUES ('2296', '450124', '', '', '马山县', '2286', '108.172903', '23.711758', 'wkhyvs9552');
INSERT INTO `model_nation` VALUES ('2297', '450125', '', '', '上林县', '2286', '108.603937', '23.431769', 'wkjjr3dgzn');
INSERT INTO `model_nation` VALUES ('2298', '450126', '', '', '宾阳县', '2286', '108.816735', '23.216884', 'wkjkh4tbjs');
INSERT INTO `model_nation` VALUES ('2299', '450127', '', '', '横县', '2286', '109.270987', '22.68743', 'wkj9nd0eye');
INSERT INTO `model_nation` VALUES ('2300', '450200', '', '柳州市', '', '2285', '109.411703', '24.314617', 'wkmf3dr4vm');
INSERT INTO `model_nation` VALUES ('2301', '450201', '', '', '市辖区', '2300', '109.411703', '24.314617', 'wkmf3dr4vm');
INSERT INTO `model_nation` VALUES ('2302', '450202', '', '', '城中区', '2300', '109.411749', '24.312324', 'wkmf39zjw9');
INSERT INTO `model_nation` VALUES ('2303', '450203', '', '', '鱼峰区', '2300', '109.415364', '24.303848', 'wkmf3b3u4v');
INSERT INTO `model_nation` VALUES ('2304', '450204', '', '', '柳南区', '2300', '109.395936', '24.287013', 'wkmf1m7dn5');
INSERT INTO `model_nation` VALUES ('2305', '450205', '', '', '柳北区', '2300', '109.406577', '24.359145', 'wkmf9d7qq1');
INSERT INTO `model_nation` VALUES ('2306', '450221', '', '', '柳江县', '2300', '109.334503', '24.257512', 'wkm9zzyynx');
INSERT INTO `model_nation` VALUES ('2307', '450222', '', '', '柳城县', '2300', '109.245812', '24.655121', 'wkmsmbq67z');
INSERT INTO `model_nation` VALUES ('2308', '450223', '', '', '鹿寨县', '2300', '109.740805', '24.483405', 'wkq531nf4j');
INSERT INTO `model_nation` VALUES ('2309', '450224', '', '', '融安县', '2300', '109.403621', '25.214703', 'wkmz3w1q31');
INSERT INTO `model_nation` VALUES ('2310', '450225', '', '', '融水苗族自治县', '2300', '109.252744', '25.068812', 'wkmww5ekmm');
INSERT INTO `model_nation` VALUES ('2311', '450226', '', '', '三江侗族自治县', '2300', '109.614846', '25.78553', 'wktfwq55e5');
INSERT INTO `model_nation` VALUES ('2312', '450300', '', '桂林市', '', '2285', '110.299121', '25.274215', 'wkqrvcj2gz');
INSERT INTO `model_nation` VALUES ('2313', '450301', '', '', '市辖区', '2312', '110.299121', '25.274215', 'wkqrvcj2gz');
INSERT INTO `model_nation` VALUES ('2314', '450302', '', '', '秀峰区', '2312', '110.292445', '25.278544', 'wkqrvcbd0n');
INSERT INTO `model_nation` VALUES ('2315', '450303', '', '', '叠彩区', '2312', '110.300783', '25.301334', 'wkqrvvywfw');
INSERT INTO `model_nation` VALUES ('2316', '450304', '', '', '象山区', '2312', '110.284882', '25.261986', 'wkqrtwg18p');
INSERT INTO `model_nation` VALUES ('2317', '450305', '', '', '七星区', '2312', '110.317577', '25.254339', 'wkqrwm6v1y');
INSERT INTO `model_nation` VALUES ('2318', '450311', '', '', '雁山区', '2312', '110.305667', '25.077646', 'wkqqwj4puk');
INSERT INTO `model_nation` VALUES ('2319', '450312', '', '', '临桂区', '2312', '110.205487', '25.246257', 'wkqregcnjg');
INSERT INTO `model_nation` VALUES ('2320', '450321', '', '', '阳朔县', '2312', '110.494699', '24.77534', 'wkqsfq5yc4');
INSERT INTO `model_nation` VALUES ('2321', '450323', '', '', '灵川县', '2312', '110.325712', '25.408541', 'wkw2w92xrr');
INSERT INTO `model_nation` VALUES ('2322', '450324', '', '', '全州县', '2312', '111.072989', '25.929897', 'wkwgx82us5');
INSERT INTO `model_nation` VALUES ('2323', '450325', '', '', '兴安县', '2312', '110.670783', '25.609554', 'wkw9wqh42n');
INSERT INTO `model_nation` VALUES ('2324', '450326', '', '', '永福县', '2312', '109.989208', '24.986692', 'wkqnnuewn2');
INSERT INTO `model_nation` VALUES ('2325', '450327', '', '', '灌阳县', '2312', '111.160248', '25.489098', 'wkx1180kv8');
INSERT INTO `model_nation` VALUES ('2326', '450328', '', '', '龙胜各族自治县', '2312', '110.009423', '25.796428', 'wkw4z247j6');
INSERT INTO `model_nation` VALUES ('2327', '450329', '', '', '资源县', '2312', '110.642587', '26.0342', 'wkwsjerkpn');
INSERT INTO `model_nation` VALUES ('2328', '450330', '', '', '平乐县', '2312', '110.642821', '24.632216', 'wkqsjspth9');
INSERT INTO `model_nation` VALUES ('2329', '450331', '', '', '荔浦县', '2312', '110.400149', '24.497786', 'wkqe25wvvy');
INSERT INTO `model_nation` VALUES ('2330', '450332', '', '', '恭城瑶族自治县', '2312', '110.82952', '24.833612', 'wkqv3bzd6b');
INSERT INTO `model_nation` VALUES ('2331', '450400', '', '梧州市', '', '2285', '111.297604', '23.474803', 'wkpjs9kqwh');
INSERT INTO `model_nation` VALUES ('2332', '450401', '', '', '市辖区', '2331', '111.297604', '23.474803', 'wkpjs9kqwh');
INSERT INTO `model_nation` VALUES ('2333', '450403', '', '', '万秀区', '2331', '111.315817', '23.471318', 'wkpjt0cdqd');
INSERT INTO `model_nation` VALUES ('2334', '450405', '', '', '长洲区', '2331', '111.275678', '23.4777', 'wkpjs1urx0');
INSERT INTO `model_nation` VALUES ('2335', '450406', '', '', '龙圩区', '2331', '111.246035', '23.40996', 'wkpj5mwuuk');
INSERT INTO `model_nation` VALUES ('2336', '450421', '', '', '苍梧县', '2331', '111.544008', '23.845097', 'wkprdhzggb');
INSERT INTO `model_nation` VALUES ('2337', '450422', '', '', '藤县', '2331', '110.931826', '23.373963', 'wknuur454y');
INSERT INTO `model_nation` VALUES ('2338', '450423', '', '', '蒙山县', '2331', '110.5226', '24.199829', 'wkq9ej2n5p');
INSERT INTO `model_nation` VALUES ('2339', '450481', '', '', '岑溪市', '2331', '110.998114', '22.918406', 'wknfmu4m7s');
INSERT INTO `model_nation` VALUES ('2340', '450500', '', '北海市', '', '2285', '109.119254', '21.473343', 'w7vd5j45qc');
INSERT INTO `model_nation` VALUES ('2341', '450501', '', '', '市辖区', '2340', '109.119254', '21.473343', 'w7vd5j45qc');
INSERT INTO `model_nation` VALUES ('2342', '450502', '', '', '海城区', '2340', '109.107529', '21.468443', 'w7vd4u1wtx');
INSERT INTO `model_nation` VALUES ('2343', '450503', '', '', '银海区', '2340', '109.118707', '21.444909', 'w7v9gpcvdh');
INSERT INTO `model_nation` VALUES ('2344', '450512', '', '', '铁山港区', '2340', '109.450573', '21.5928', 'w7vffdg7pj');
INSERT INTO `model_nation` VALUES ('2345', '450521', '', '', '合浦县', '2340', '109.200695', '21.663554', 'w7vehztx2e');
INSERT INTO `model_nation` VALUES ('2346', '450600', '', '防城港市', '', '2285', '108.345478', '21.614631', 'w7v4cqyf2e');
INSERT INTO `model_nation` VALUES ('2347', '450601', '', '', '市辖区', '2346', '108.345478', '21.614631', 'w7v4cqyf2e');
INSERT INTO `model_nation` VALUES ('2348', '450602', '', '', '港口区', '2346', '108.346281', '21.614406', 'w7v4cqz353');
INSERT INTO `model_nation` VALUES ('2349', '450603', '', '', '防城区', '2346', '108.358426', '21.764758', 'w7v5cf0hyk');
INSERT INTO `model_nation` VALUES ('2350', '450621', '', '', '上思县', '2346', '107.982139', '22.151423', 'w7uy10w1qh');
INSERT INTO `model_nation` VALUES ('2351', '450681', '', '', '东兴市', '2346', '107.97017', '21.541172', 'w7uf8cmqrm');
INSERT INTO `model_nation` VALUES ('2352', '450700', '', '钦州市', '', '2285', '108.624175', '21.967127', 'w7vhzycxy9');
INSERT INTO `model_nation` VALUES ('2353', '450701', '', '', '市辖区', '2352', '108.624175', '21.967127', 'w7vhzycxy9');
INSERT INTO `model_nation` VALUES ('2354', '450702', '', '', '钦南区', '2352', '108.626629', '21.966808', 'w7vhzygmzv');
INSERT INTO `model_nation` VALUES ('2355', '450703', '', '', '钦北区', '2352', '108.44911', '22.132761', 'w7vjgv4hxm');
INSERT INTO `model_nation` VALUES ('2356', '450721', '', '', '灵山县', '2352', '109.293468', '22.418041', 'w7vxx114d3');
INSERT INTO `model_nation` VALUES ('2357', '450722', '', '', '浦北县', '2352', '109.556341', '22.268335', 'w7vytjb6ry');
INSERT INTO `model_nation` VALUES ('2358', '450800', '', '贵港市', '', '2285', '109.602146', '23.0936', 'wkjgqh1cgp');
INSERT INTO `model_nation` VALUES ('2359', '450801', '', '', '市辖区', '2358', '109.602146', '23.0936', 'wkjgqh1cgp');
INSERT INTO `model_nation` VALUES ('2360', '450802', '', '', '港北区', '2358', '109.59481', '23.107677', 'wkjgmysebp');
INSERT INTO `model_nation` VALUES ('2361', '450803', '', '', '港南区', '2358', '109.604665', '23.067516', 'wkjgnp7djb');
INSERT INTO `model_nation` VALUES ('2362', '450804', '', '', '覃塘区', '2358', '109.415697', '23.132815', 'wkjg9g4n6t');
INSERT INTO `model_nation` VALUES ('2363', '450821', '', '', '平南县', '2358', '110.397485', '23.544546', 'wkntbnhuzv');
INSERT INTO `model_nation` VALUES ('2364', '450881', '', '', '桂平市', '2358', '110.074668', '23.382473', 'wknm0b9uv8');
INSERT INTO `model_nation` VALUES ('2365', '450900', '', '玉林市', '', '2285', '110.154393', '22.63136', 'wkn2dxgvpr');
INSERT INTO `model_nation` VALUES ('2366', '450901', '', '', '市辖区', '2365', '110.154393', '22.63136', 'wkn2dxgvpr');
INSERT INTO `model_nation` VALUES ('2367', '450902', '', '', '玉州区', '2365', '110.154912', '22.632132', 'wkn2f8h3er');
INSERT INTO `model_nation` VALUES ('2368', '450903', '', '', '福绵区', '2365', '110.054155', '22.58163', 'wkn22qfgx8');
INSERT INTO `model_nation` VALUES ('2369', '450921', '', '', '容县', '2365', '110.552467', '22.856435', 'wknd58vu7h');
INSERT INTO `model_nation` VALUES ('2370', '450922', '', '', '陆川县', '2365', '110.264842', '22.321054', 'w7yqvpkmt4');
INSERT INTO `model_nation` VALUES ('2371', '450923', '', '', '博白县', '2365', '109.980004', '22.271285', 'w7ynwwkgxu');
INSERT INTO `model_nation` VALUES ('2372', '450924', '', '', '兴业县', '2365', '109.877768', '22.74187', 'wkn1kk48cx');
INSERT INTO `model_nation` VALUES ('2373', '450981', '', '', '北流市', '2365', '110.348052', '22.701648', 'wkn3ph8yxv');
INSERT INTO `model_nation` VALUES ('2374', '451000', '', '百色市', '', '2285', '106.616285', '23.897742', 'wk5zfn7w7t');
INSERT INTO `model_nation` VALUES ('2375', '451001', '', '', '市辖区', '2374', '106.616285', '23.897742', 'wk5zfn7w7t');
INSERT INTO `model_nation` VALUES ('2376', '451002', '', '', '右江区', '2374', '106.615727', '23.897675', 'wk5zfn7nn9');
INSERT INTO `model_nation` VALUES ('2377', '451021', '', '', '田阳县', '2374', '106.904315', '23.736079', 'wkhp09j2ej');
INSERT INTO `model_nation` VALUES ('2378', '451022', '', '', '田东县', '2374', '107.12426', '23.600444', 'wkhnm8md81');
INSERT INTO `model_nation` VALUES ('2379', '451023', '', '', '平果县', '2374', '107.580403', '23.320479', 'wkhs8j3eth');
INSERT INTO `model_nation` VALUES ('2380', '451024', '', '', '德保县', '2374', '106.618164', '23.321464', 'wk5udjscr7');
INSERT INTO `model_nation` VALUES ('2381', '451025', '', '', '靖西县', '2374', '106.417549', '23.134766', 'wk5etedcu8');
INSERT INTO `model_nation` VALUES ('2382', '451026', '', '', '那坡县', '2374', '105.833553', '23.400785', 'wk5m07cxkw');
INSERT INTO `model_nation` VALUES ('2383', '451027', '', '', '凌云县', '2374', '106.56487', '24.345643', 'wk7f2zyptk');
INSERT INTO `model_nation` VALUES ('2384', '451028', '', '', '乐业县', '2374', '106.559638', '24.782204', 'wk7ubz6qg9');
INSERT INTO `model_nation` VALUES ('2385', '451029', '', '', '田林县', '2374', '106.235047', '24.290262', 'wk7d1myj01');
INSERT INTO `model_nation` VALUES ('2386', '451030', '', '', '西林县', '2374', '105.095025', '24.492041', 'wk6er6xu7x');
INSERT INTO `model_nation` VALUES ('2387', '451031', '', '', '隆林各族自治县', '2374', '105.342363', '24.774318', 'wk6uvn5byg');
INSERT INTO `model_nation` VALUES ('2388', '451100', '', '贺州市', '', '2285', '111.552056', '24.414141', 'wkr6fkmwxm');
INSERT INTO `model_nation` VALUES ('2389', '451101', '', '', '市辖区', '2388', '111.552056', '24.414141', 'wkr6fkmwxm');
INSERT INTO `model_nation` VALUES ('2390', '451102', '', '', '八步区', '2388', '111.551991', '24.412446', 'wkr6fkjsvc');
INSERT INTO `model_nation` VALUES ('2391', '451119', '', '', '平桂管理区', '2388', '111.552056', '24.414141', 'wkr6fkmwxm');
INSERT INTO `model_nation` VALUES ('2392', '451121', '', '', '昭平县', '2388', '110.810865', '24.172958', 'wkqc98d18m');
INSERT INTO `model_nation` VALUES ('2393', '451122', '', '', '钟山县', '2388', '111.303629', '24.528566', 'wkr5sc2c68');
INSERT INTO `model_nation` VALUES ('2394', '451123', '', '', '富川瑶族自治县', '2388', '111.277228', '24.81896', 'wkrjhnjsgm');
INSERT INTO `model_nation` VALUES ('2395', '451200', '', '河池市', '', '2285', '108.062105', '24.695899', 'wkku7pb2j9');
INSERT INTO `model_nation` VALUES ('2396', '451201', '', '', '市辖区', '2395', '108.062105', '24.695899', 'wkku7pb2j9');
INSERT INTO `model_nation` VALUES ('2397', '451202', '', '', '金城江区', '2395', '108.062131', '24.695625', 'wkku7p8qqn');
INSERT INTO `model_nation` VALUES ('2398', '451221', '', '', '南丹县', '2395', '107.546605', '24.983192', 'wkkqpk119s');
INSERT INTO `model_nation` VALUES ('2399', '451222', '', '', '天峨县', '2395', '107.174939', '24.985964', 'wkknnud3v1');
INSERT INTO `model_nation` VALUES ('2400', '451223', '', '', '凤山县', '2395', '107.044592', '24.544561', 'wkk5eu5qrv');
INSERT INTO `model_nation` VALUES ('2401', '451224', '', '', '东兰县', '2395', '107.373696', '24.509367', 'wkk77mg1km');
INSERT INTO `model_nation` VALUES ('2402', '451225', '', '', '罗城仫佬族自治县', '2395', '108.902453', '24.779327', 'wkmkynuq51');
INSERT INTO `model_nation` VALUES ('2403', '451226', '', '', '环江毛南族自治县', '2395', '108.258669', '24.827628', 'wkkvprxx3v');
INSERT INTO `model_nation` VALUES ('2404', '451227', '', '', '巴马瑶族自治县', '2395', '107.253126', '24.139538', 'wkk32d7r4b');
INSERT INTO `model_nation` VALUES ('2405', '451228', '', '', '都安瑶族自治县', '2395', '108.102761', '23.934964', 'wkkb5vnp2b');
INSERT INTO `model_nation` VALUES ('2406', '451229', '', '', '大化瑶族自治县', '2395', '107.9945', '23.739596', 'wkhz13xjnj');
INSERT INTO `model_nation` VALUES ('2407', '451281', '', '', '宜州市', '2395', '108.653965', '24.492193', 'wkm726xmkg');
INSERT INTO `model_nation` VALUES ('2408', '451300', '', '来宾市', '', '2285', '109.229772', '23.733766', 'wkjxj8denn');
INSERT INTO `model_nation` VALUES ('2409', '451301', '', '', '市辖区', '2408', '109.229772', '23.733766', 'wkjxj8denn');
INSERT INTO `model_nation` VALUES ('2410', '451302', '', '', '兴宾区', '2408', '109.230541', '23.732926', 'wkjxj87q24');
INSERT INTO `model_nation` VALUES ('2411', '451321', '', '', '忻城县', '2408', '108.667361', '24.064779', 'wkm2buc5mp');
INSERT INTO `model_nation` VALUES ('2412', '451322', '', '', '象州县', '2408', '109.684555', '23.959824', 'wkmbrcvb56');
INSERT INTO `model_nation` VALUES ('2413', '451323', '', '', '武宣县', '2408', '109.66287', '23.604162', 'wkjyr3n04n');
INSERT INTO `model_nation` VALUES ('2414', '451324', '', '', '金秀瑶族自治县', '2408', '110.188556', '24.134941', 'wkq373su5r');
INSERT INTO `model_nation` VALUES ('2415', '451381', '', '', '合山市', '2408', '108.88858', '23.81311', 'wkjrmz41rv');
INSERT INTO `model_nation` VALUES ('2416', '451400', '', '崇左市', '', '2285', '107.353926', '22.404108', 'w7ur6ys9ru');
INSERT INTO `model_nation` VALUES ('2417', '451401', '', '', '市辖区', '2416', '107.353926', '22.404108', 'w7ur6ys9ru');
INSERT INTO `model_nation` VALUES ('2418', '451402', '', '', '江州区', '2416', '107.354443', '22.40469', 'w7ur6ythgb');
INSERT INTO `model_nation` VALUES ('2419', '451421', '', '', '扶绥县', '2416', '107.911533', '22.635821', 'wkh8z8dz0y');
INSERT INTO `model_nation` VALUES ('2420', '451422', '', '', '宁明县', '2416', '107.067616', '22.131353', 'w7ujukuk2r');
INSERT INTO `model_nation` VALUES ('2421', '451423', '', '', '龙州县', '2416', '106.857502', '22.343716', 'w7gzpee386');
INSERT INTO `model_nation` VALUES ('2422', '451424', '', '', '大新县', '2416', '107.200803', '22.833369', 'wkh1zktnpb');
INSERT INTO `model_nation` VALUES ('2423', '451425', '', '', '天等县', '2416', '107.142441', '23.082484', 'wkh5q449py');
INSERT INTO `model_nation` VALUES ('2424', '451481', '', '', '凭祥市', '2416', '106.759038', '22.108882', 'w7gvv2g99f');
INSERT INTO `model_nation` VALUES ('2425', '460000', '海南省', '', '', '1', '110.33119', '20.031971', 'w7w3ywswxn');
INSERT INTO `model_nation` VALUES ('2426', '460100', '', '海口市', '', '2425', '110.33119', '20.031971', 'w7w3ywswxn');
INSERT INTO `model_nation` VALUES ('2427', '460101', '', '', '市辖区', '2426', '110.33119', '20.031971', 'w7w3ywswxn');
INSERT INTO `model_nation` VALUES ('2428', '460105', '', '', '秀英区', '2426', '110.282393', '20.008145', 'w7w3vd35yh');
INSERT INTO `model_nation` VALUES ('2429', '460106', '', '', '龙华区', '2426', '110.330373', '20.031026', 'w7w3yws1hj');
INSERT INTO `model_nation` VALUES ('2430', '460107', '', '', '琼山区', '2426', '110.354722', '20.001051', 'w7w3z1jfe6');
INSERT INTO `model_nation` VALUES ('2431', '460108', '', '', '美兰区', '2426', '110.356566', '20.03074', 'w7w3znrpw2');
INSERT INTO `model_nation` VALUES ('2432', '460200', '', '三亚市', '', '2425', '109.508268', '18.247872', 'w7jzgcvmx9');
INSERT INTO `model_nation` VALUES ('2433', '460201', '', '', '市辖区', '2432', '109.508268', '18.247872', 'w7jzgcvmx9');
INSERT INTO `model_nation` VALUES ('2434', '460202', '', '', '海棠区', '2432', '109.760778', '18.407516', 'w7q09wvre9');
INSERT INTO `model_nation` VALUES ('2435', '460203', '', '', '吉阳区', '2432', '109.512081', '18.247436', 'w7jzu1b702');
INSERT INTO `model_nation` VALUES ('2436', '460204', '', '', '天涯区', '2432', '109.506357', '18.24734', 'w7jzgcu47n');
INSERT INTO `model_nation` VALUES ('2437', '460205', '', '', '崖州区', '2432', '109.174306', '18.352192', 'w7m8kkfm38');
INSERT INTO `model_nation` VALUES ('2438', '460300', '', '三沙市', '', '2425', '112.34882', '16.831039', 'w6zzsxczvm');
INSERT INTO `model_nation` VALUES ('2439', '460321', '', '', '西沙群岛', '2438', '111.792944', '16.204546', 'w6zkpvvnk6');
INSERT INTO `model_nation` VALUES ('2440', '460322', '', '', '南沙群岛', '2438', '116.749998', '11.471888', 'wd5128qu84');
INSERT INTO `model_nation` VALUES ('2441', '460323', '', '', '中沙群岛的岛礁及其海域', '2438', '117.740071', '15.112856', 'wdetzppwy8');
INSERT INTO `model_nation` VALUES ('2442', '469000', '', '省直辖县级行政区划', '', '2425', '110.33119', '20.031971', 'w7w3ywswxn');
INSERT INTO `model_nation` VALUES ('2443', '469001', '', '', '五指山市', '2442', '109.516662', '18.776921', 'w7mfu45x7p');
INSERT INTO `model_nation` VALUES ('2444', '469002', '', '', '琼海市', '2442', '110.466785', '19.246011', 'w7qt3xxkns');
INSERT INTO `model_nation` VALUES ('2445', '469003', '', '', '儋州市', '2442', '109.576782', '19.517486', 'w7mzj3p3s5');
INSERT INTO `model_nation` VALUES ('2446', '469005', '', '', '文昌市', '2442', '110.753975', '19.612986', 'w7qz862tft');
INSERT INTO `model_nation` VALUES ('2447', '469006', '', '', '万宁市', '2442', '110.388793', '18.796216', 'w7q6zvwxvk');
INSERT INTO `model_nation` VALUES ('2448', '469007', '', '', '东方市', '2442', '108.653789', '19.10198', 'w7mk8mrm0g');
INSERT INTO `model_nation` VALUES ('2449', '469021', '', '', '定安县', '2442', '110.349235', '19.684966', 'w7qrzp9c5x');
INSERT INTO `model_nation` VALUES ('2450', '469022', '', '', '屯昌县', '2442', '110.102773', '19.362916', 'w7qq1kymht');
INSERT INTO `model_nation` VALUES ('2451', '469023', '', '', '澄迈县', '2442', '110.007147', '19.737095', 'w7w0r30bbm');
INSERT INTO `model_nation` VALUES ('2452', '469024', '', '', '临高县', '2442', '109.687697', '19.908293', 'w7w1200nhw');
INSERT INTO `model_nation` VALUES ('2453', '469025', '', '', '白沙黎族自治县', '2442', '109.452606', '19.224584', 'w7mv6eszqd');
INSERT INTO `model_nation` VALUES ('2454', '469026', '', '', '昌江黎族自治县', '2442', '109.053351', '19.260968', 'w7mt9d65r2');
INSERT INTO `model_nation` VALUES ('2455', '469027', '', '', '乐东黎族自治县', '2442', '109.175444', '18.74758', 'w7mdskghs4');
INSERT INTO `model_nation` VALUES ('2456', '469028', '', '', '陵水黎族自治县', '2442', '110.037218', '18.505006', 'w7q1rbwxmp');
INSERT INTO `model_nation` VALUES ('2457', '469029', '', '', '保亭黎族苗族自治县', '2442', '109.70245', '18.636371', 'w7q402dusr');
INSERT INTO `model_nation` VALUES ('2458', '469030', '', '', '琼中黎族苗族自治县', '2442', '109.839996', '19.03557', 'w7qh73r41r');
INSERT INTO `model_nation` VALUES ('2459', '500000', '重庆', '重庆市', '', '2459', '106.504962', '29.533155', 'wm78p86e17');
INSERT INTO `model_nation` VALUES ('2460', '500101', '', '', '万州区', '2459', '108.380246', '30.807807', 'wmmp622h6z');
INSERT INTO `model_nation` VALUES ('2461', '500102', '', '', '涪陵区', '2459', '107.394905', '29.703652', 'wmk2gz6s6d');
INSERT INTO `model_nation` VALUES ('2462', '500103', '', '', '渝中区', '2459', '106.56288', '29.556742', 'wm7b0ussx0');
INSERT INTO `model_nation` VALUES ('2463', '500104', '', '', '大渡口区', '2459', '106.48613', '29.481002', 'wm5xxnug69');
INSERT INTO `model_nation` VALUES ('2464', '500105', '', '', '江北区', '2459', '106.532844', '29.575352', 'wm7b20nbgj');
INSERT INTO `model_nation` VALUES ('2465', '500106', '', '', '沙坪坝区', '2459', '106.4542', '29.541224', 'wm78n3vd4e');
INSERT INTO `model_nation` VALUES ('2466', '500107', '', '', '九龙坡区', '2459', '106.480989', '29.523492', 'wm5xzn94fc');
INSERT INTO `model_nation` VALUES ('2467', '500108', '', '', '南岸区', '2459', '106.560813', '29.523992', 'wm5zbyejwz');
INSERT INTO `model_nation` VALUES ('2468', '500109', '', '', '北碚区', '2459', '106.437868', '29.82543', 'wm79wj99wp');
INSERT INTO `model_nation` VALUES ('2469', '500110', '', '', '綦江区', '2459', '106.651417', '29.028091', 'wm5v4umhyh');
INSERT INTO `model_nation` VALUES ('2470', '500111', '', '', '大足区', '2459', '105.715319', '29.700498', 'wm70vwg9cq');
INSERT INTO `model_nation` VALUES ('2471', '500112', '', '', '渝北区', '2459', '106.512851', '29.601451', 'wm78rub2cq');
INSERT INTO `model_nation` VALUES ('2472', '500113', '', '', '巴南区', '2459', '106.519423', '29.381919', 'wm5xpuv446');
INSERT INTO `model_nation` VALUES ('2473', '500114', '', '', '黔江区', '2459', '108.782577', '29.527548', 'wmjrgrm43v');
INSERT INTO `model_nation` VALUES ('2474', '500115', '', '', '长寿区', '2459', '107.074854', '29.833671', 'wmk1sx198z');
INSERT INTO `model_nation` VALUES ('2475', '500116', '', '', '江津区', '2459', '106.253156', '29.283387', 'wm5w9fghjf');
INSERT INTO `model_nation` VALUES ('2476', '500117', '', '', '合川区', '2459', '106.265554', '29.990993', 'wm7dd5snny');
INSERT INTO `model_nation` VALUES ('2477', '500118', '', '', '永川区', '2459', '105.894714', '29.348748', 'wm5qcwy0ve');
INSERT INTO `model_nation` VALUES ('2478', '500119', '', '', '南川区', '2459', '107.098153', '29.156646', 'wmhjv5f3zb');
INSERT INTO `model_nation` VALUES ('2479', '500120', '', '', '璧山区', '2459', '106.504962', '29.533155', 'wm78p86e17');
INSERT INTO `model_nation` VALUES ('2480', '500151', '', '', '铜梁区', '2459', '106.504962', '29.533155', 'wm78p86e17');
INSERT INTO `model_nation` VALUES ('2481', '500223', '', '', '潼南县', '2459', '105.841818', '30.189554', 'wm778rzdvh');
INSERT INTO `model_nation` VALUES ('2482', '500226', '', '', '荣昌县', '2459', '105.594061', '29.403627', 'wm5p6bg0xc');
INSERT INTO `model_nation` VALUES ('2483', '500228', '', '', '梁平县', '2459', '107.800034', '30.672168', 'wmkwmp9w6f');
INSERT INTO `model_nation` VALUES ('2484', '500229', '', '', '城口县', '2459', '108.6649', '31.946293', 'wmtm8xxkes');
INSERT INTO `model_nation` VALUES ('2485', '500230', '', '', '丰都县', '2459', '107.73248', '29.866424', 'wmk9gt02s8');
INSERT INTO `model_nation` VALUES ('2486', '500231', '', '', '垫江县', '2459', '107.348692', '30.330012', 'wmkkdc2vju');
INSERT INTO `model_nation` VALUES ('2487', '500232', '', '', '武隆县', '2459', '107.75655', '29.32376', 'wmhwu41zm9');
INSERT INTO `model_nation` VALUES ('2488', '500233', '', '', '忠县', '2459', '108.037518', '30.291537', 'wmku66qsbx');
INSERT INTO `model_nation` VALUES ('2489', '500234', '', '', '开县', '2459', '108.413317', '31.167735', 'wmt171bjjq');
INSERT INTO `model_nation` VALUES ('2490', '500235', '', '', '云阳县', '2459', '108.697698', '30.930529', 'wmmrcqxpru');
INSERT INTO `model_nation` VALUES ('2491', '500236', '', '', '奉节县', '2459', '109.465774', '31.019967', 'wmtb6zn83k');
INSERT INTO `model_nation` VALUES ('2492', '500237', '', '', '巫山县', '2459', '109.878928', '31.074843', 'wmw0u352hd');
INSERT INTO `model_nation` VALUES ('2493', '500238', '', '', '巫溪县', '2459', '109.628912', '31.3966', 'wmtfwet66y');
INSERT INTO `model_nation` VALUES ('2494', '500240', '', '', '石柱土家族自治县', '2459', '108.112448', '29.99853', 'wmkfsjj44e');
INSERT INTO `model_nation` VALUES ('2495', '500241', '', '', '秀山土家族苗族自治县', '2459', '108.996043', '28.444772', 'wmj9b60qzc');
INSERT INTO `model_nation` VALUES ('2496', '500242', '', '', '酉阳土家族苗族自治县', '2459', '108.767201', '28.839828', 'wmjk541u5m');
INSERT INTO `model_nation` VALUES ('2497', '500243', '', '', '彭水苗族土家族自治县', '2459', '108.166551', '29.293856', 'wmhytku3p6');
INSERT INTO `model_nation` VALUES ('2498', '510000', '四川省', '', '', '1', '104.065735', '30.659462', 'wm6n2j6k73');
INSERT INTO `model_nation` VALUES ('2499', '510100', '', '成都市', '', '2498', '104.065735', '30.659462', 'wm6n2j6k73');
INSERT INTO `model_nation` VALUES ('2500', '510101', '', '', '市辖区', '2499', '104.065735', '30.659462', 'wm6n2j6k73');
INSERT INTO `model_nation` VALUES ('2501', '510104', '', '', '锦江区', '2499', '104.080989', '30.657689', 'wm6n2mj3yz');
INSERT INTO `model_nation` VALUES ('2502', '510105', '', '', '青羊区', '2499', '104.055731', '30.667648', 'wm3yryg5fr');
INSERT INTO `model_nation` VALUES ('2503', '510106', '', '', '金牛区', '2499', '104.043487', '30.692058', 'wm3yxe64hy');
INSERT INTO `model_nation` VALUES ('2504', '510107', '', '', '武侯区', '2499', '104.05167', '30.630862', 'wm3yrb0jew');
INSERT INTO `model_nation` VALUES ('2505', '510108', '', '', '成华区', '2499', '104.103077', '30.660275', 'wm6n2vt919');
INSERT INTO `model_nation` VALUES ('2506', '510112', '', '', '龙泉驿区', '2499', '104.269181', '30.56065', 'wm6jueqs8n');
INSERT INTO `model_nation` VALUES ('2507', '510113', '', '', '青白江区', '2499', '104.25494', '30.883438', 'wm6psqhjh4');
INSERT INTO `model_nation` VALUES ('2508', '510114', '', '', '新都区', '2499', '104.16022', '30.824223', 'wm6p65rhj5');
INSERT INTO `model_nation` VALUES ('2509', '510115', '', '', '温江区', '2499', '103.836776', '30.697996', 'wm3ydu7su1');
INSERT INTO `model_nation` VALUES ('2510', '510121', '', '', '金堂县', '2499', '104.415604', '30.858417', 'wm6r81957c');
INSERT INTO `model_nation` VALUES ('2511', '510122', '', '', '双流县', '2499', '103.922706', '30.573243', 'wm3vuvdnn9');
INSERT INTO `model_nation` VALUES ('2512', '510124', '', '', '郫县', '2499', '103.887842', '30.808752', 'wm3zk08cfp');
INSERT INTO `model_nation` VALUES ('2513', '510129', '', '', '大邑县', '2499', '103.522397', '30.586602', 'wm3w58neye');
INSERT INTO `model_nation` VALUES ('2514', '510131', '', '', '蒲江县', '2499', '103.511541', '30.194359', 'wm3eg2wycs');
INSERT INTO `model_nation` VALUES ('2515', '510132', '', '', '新津县', '2499', '103.812449', '30.414284', 'wm3v42cbj3');
INSERT INTO `model_nation` VALUES ('2516', '510181', '', '', '都江堰市', '2499', '103.627898', '30.99114', 'wm98q1g83p');
INSERT INTO `model_nation` VALUES ('2517', '510182', '', '', '彭州市', '2499', '103.941173', '30.985161', 'wm9bm0xtsu');
INSERT INTO `model_nation` VALUES ('2518', '510183', '', '', '邛崃市', '2499', '103.46143', '30.413271', 'wm3t42d64h');
INSERT INTO `model_nation` VALUES ('2519', '510184', '', '', '崇州市', '2499', '103.671049', '30.631478', 'wm3wr06cq9');
INSERT INTO `model_nation` VALUES ('2520', '510300', '', '自贡市', '', '2498', '104.773447', '29.352765', 'wm4wbpt8nr');
INSERT INTO `model_nation` VALUES ('2521', '510301', '', '', '市辖区', '2520', '104.773447', '29.352765', 'wm4wbpt8nr');
INSERT INTO `model_nation` VALUES ('2522', '510302', '', '', '自流井区', '2520', '104.778188', '29.343231', 'wm4wbmc0sw');
INSERT INTO `model_nation` VALUES ('2523', '510303', '', '', '贡井区', '2520', '104.714372', '29.345675', 'wm4qyy4wvw');
INSERT INTO `model_nation` VALUES ('2524', '510304', '', '', '大安区', '2520', '104.783229', '29.367136', 'wm4x06hgfn');
INSERT INTO `model_nation` VALUES ('2525', '510311', '', '', '沿滩区', '2520', '104.876417', '29.272521', 'wm4wd8bsv9');
INSERT INTO `model_nation` VALUES ('2526', '510321', '', '', '荣县', '2520', '104.423932', '29.454851', 'wm4r84p4vy');
INSERT INTO `model_nation` VALUES ('2527', '510322', '', '', '富顺县', '2520', '104.984256', '29.181282', 'wm4whbr1q3');
INSERT INTO `model_nation` VALUES ('2528', '510400', '', '攀枝花市', '', '2498', '101.716007', '26.580446', 'wk8r4wg66f');
INSERT INTO `model_nation` VALUES ('2529', '510401', '', '', '市辖区', '2528', '101.716007', '26.580446', 'wk8r4wg66f');
INSERT INTO `model_nation` VALUES ('2530', '510402', '', '', '东区', '2528', '101.715134', '26.580887', 'wk8r4wfsyk');
INSERT INTO `model_nation` VALUES ('2531', '510403', '', '', '西区', '2528', '101.637969', '26.596776', 'wk8r2cf92q');
INSERT INTO `model_nation` VALUES ('2532', '510411', '', '', '仁和区', '2528', '101.737916', '26.497185', 'wk8qepem33');
INSERT INTO `model_nation` VALUES ('2533', '510421', '', '', '米易县', '2528', '102.109877', '26.887474', 'wkb8gwdnus');
INSERT INTO `model_nation` VALUES ('2534', '510422', '', '', '盐边县', '2528', '101.851848', '26.677619', 'wk8rv8w22h');
INSERT INTO `model_nation` VALUES ('2535', '510500', '', '泸州市', '', '2498', '105.443348', '28.889138', 'wm4ur7je2j');
INSERT INTO `model_nation` VALUES ('2536', '510501', '', '', '市辖区', '2535', '105.443348', '28.889138', 'wm4ur7je2j');
INSERT INTO `model_nation` VALUES ('2537', '510502', '', '', '江阳区', '2535', '105.445131', '28.882889', 'wm4ur3yz18');
INSERT INTO `model_nation` VALUES ('2538', '510503', '', '', '纳溪区', '2535', '105.37721', '28.77631', 'wm4gtyt64u');
INSERT INTO `model_nation` VALUES ('2539', '510504', '', '', '龙马潭区', '2535', '105.435228', '28.897572', 'wm4urhxsdc');
INSERT INTO `model_nation` VALUES ('2540', '510521', '', '', '泸县', '2535', '105.376335', '29.151288', 'wm4vvfudw9');
INSERT INTO `model_nation` VALUES ('2541', '510522', '', '', '合江县', '2535', '105.834098', '28.810325', 'wm57bkf031');
INSERT INTO `model_nation` VALUES ('2542', '510524', '', '', '叙永县', '2535', '105.437775', '28.167919', 'wm4bprc6n0');
INSERT INTO `model_nation` VALUES ('2543', '510525', '', '', '古蔺县', '2535', '105.813359', '28.03948', 'wkgpxb6vvc');
INSERT INTO `model_nation` VALUES ('2544', '510600', '', '德阳市', '', '2498', '104.398651', '31.127991', 'wmd1pdsv8y');
INSERT INTO `model_nation` VALUES ('2545', '510601', '', '', '市辖区', '2544', '104.398651', '31.127991', 'wmd1pdsv8y');
INSERT INTO `model_nation` VALUES ('2546', '510603', '', '', '旌阳区', '2544', '104.389648', '31.130428', 'wmd1p7n5zh');
INSERT INTO `model_nation` VALUES ('2547', '510623', '', '', '中江县', '2544', '104.677831', '31.03681', 'wmd2w404d2');
INSERT INTO `model_nation` VALUES ('2548', '510626', '', '', '罗江县', '2544', '104.507126', '31.303281', 'wmd644efbd');
INSERT INTO `model_nation` VALUES ('2549', '510681', '', '', '广汉市', '2544', '104.281903', '30.97715', 'wmd0hzpybr');
INSERT INTO `model_nation` VALUES ('2550', '510682', '', '', '什邡市', '2544', '104.173653', '31.126881', 'wmd14d2znp');
INSERT INTO `model_nation` VALUES ('2551', '510683', '', '', '绵竹市', '2544', '104.200162', '31.343084', 'wmd471u4xy');
INSERT INTO `model_nation` VALUES ('2552', '510700', '', '绵阳市', '', '2498', '104.741722', '31.46402', 'wmd6zrye5n');
INSERT INTO `model_nation` VALUES ('2553', '510701', '', '', '市辖区', '2552', '104.741722', '31.46402', 'wmd6zrye5n');
INSERT INTO `model_nation` VALUES ('2554', '510703', '', '', '涪城区', '2552', '104.740971', '31.463557', 'wmd6zry098');
INSERT INTO `model_nation` VALUES ('2555', '510704', '', '', '游仙区', '2552', '104.770006', '31.484772', 'wmde05ehn4');
INSERT INTO `model_nation` VALUES ('2556', '510722', '', '', '三台县', '2552', '105.090316', '31.090909', 'wmd8z7umtv');
INSERT INTO `model_nation` VALUES ('2557', '510723', '', '', '盐亭县', '2552', '105.391991', '31.22318', 'wmdcwk005q');
INSERT INTO `model_nation` VALUES ('2558', '510724', '', '', '安县', '2552', '104.560341', '31.53894', 'wmd77m6x8s');
INSERT INTO `model_nation` VALUES ('2559', '510725', '', '', '梓潼县', '2552', '105.16353', '31.635225', 'wmdgcp18xc');
INSERT INTO `model_nation` VALUES ('2560', '510726', '', '', '北川羌族自治县', '2552', '104.468069', '31.615863', 'wmd7c5rrf2');
INSERT INTO `model_nation` VALUES ('2561', '510727', '', '', '平武县', '2552', '104.530555', '32.407588', 'wmf26esgfk');
INSERT INTO `model_nation` VALUES ('2562', '510781', '', '', '江油市', '2552', '104.744431', '31.776386', 'wmdkz88wf5');
INSERT INTO `model_nation` VALUES ('2563', '510800', '', '广元市', '', '2498', '105.829757', '32.433668', 'wmg280qgu1');
INSERT INTO `model_nation` VALUES ('2564', '510801', '', '', '市辖区', '2563', '105.829757', '32.433668', 'wmg280qgu1');
INSERT INTO `model_nation` VALUES ('2565', '510802', '', '', '利州区', '2563', '105.826194', '32.432276', 'wmg280h79n');
INSERT INTO `model_nation` VALUES ('2566', '510811', '', '', '昭化区', '2563', '105.964121', '32.322788', 'wmergk0tyu');
INSERT INTO `model_nation` VALUES ('2567', '510812', '', '', '朝天区', '2563', '105.88917', '32.642632', 'wmg39w6jh7');
INSERT INTO `model_nation` VALUES ('2568', '510821', '', '', '旺苍县', '2563', '106.290426', '32.22833', 'wmex6dyrdk');
INSERT INTO `model_nation` VALUES ('2569', '510822', '', '', '青川县', '2563', '105.238847', '32.585655', 'wmfc6u094y');
INSERT INTO `model_nation` VALUES ('2570', '510823', '', '', '剑阁县', '2563', '105.527035', '32.286517', 'wmep9md6w4');
INSERT INTO `model_nation` VALUES ('2571', '510824', '', '', '苍溪县', '2563', '105.939706', '31.732251', 'wmekd8wvy0');
INSERT INTO `model_nation` VALUES ('2572', '510900', '', '遂宁市', '', '2498', '105.571331', '30.513311', 'wm7jd6f8ym');
INSERT INTO `model_nation` VALUES ('2573', '510901', '', '', '市辖区', '2572', '105.571331', '30.513311', 'wm7jd6f8ym');
INSERT INTO `model_nation` VALUES ('2574', '510903', '', '', '船山区', '2572', '105.582215', '30.502647', 'wm7jd8fdgc');
INSERT INTO `model_nation` VALUES ('2575', '510904', '', '', '安居区', '2572', '105.459383', '30.346121', 'wm6uxu34vw');
INSERT INTO `model_nation` VALUES ('2576', '510921', '', '', '蓬溪县', '2572', '105.713699', '30.774883', 'wm7pjd6ket');
INSERT INTO `model_nation` VALUES ('2577', '510922', '', '', '射洪县', '2572', '105.381849', '30.868752', 'wm6zw52xx0');
INSERT INTO `model_nation` VALUES ('2578', '510923', '', '', '大英县', '2572', '105.252187', '30.581571', 'wm6vgp4q9d');
INSERT INTO `model_nation` VALUES ('2579', '511000', '', '内江市', '', '2498', '105.066138', '29.58708', 'wm68qf4v4r');
INSERT INTO `model_nation` VALUES ('2580', '511001', '', '', '市辖区', '2579', '105.066138', '29.58708', 'wm68qf4v4r');
INSERT INTO `model_nation` VALUES ('2581', '511002', '', '', '市中区', '2579', '105.065467', '29.585265', 'wm68qcf6dv');
INSERT INTO `model_nation` VALUES ('2582', '511011', '', '', '东兴区', '2579', '105.067203', '29.600107', 'wm68que957');
INSERT INTO `model_nation` VALUES ('2583', '511024', '', '', '威远县', '2579', '104.668327', '29.52686', 'wm4rvz1nkv');
INSERT INTO `model_nation` VALUES ('2584', '511025', '', '', '资中县', '2579', '104.852463', '29.775295', 'wm693urjxm');
INSERT INTO `model_nation` VALUES ('2585', '511028', '', '', '隆昌县', '2579', '105.288074', '29.338162', 'wm4yguu7jv');
INSERT INTO `model_nation` VALUES ('2586', '511100', '', '乐山市', '', '2498', '103.761263', '29.582024', 'wm3b31hxu8');
INSERT INTO `model_nation` VALUES ('2587', '511101', '', '', '市辖区', '2586', '103.761263', '29.582024', 'wm3b31hxu8');
INSERT INTO `model_nation` VALUES ('2588', '511102', '', '', '市中区', '2586', '103.75539', '29.588327', 'wm3b342k7z');
INSERT INTO `model_nation` VALUES ('2589', '511111', '', '', '沙湾区', '2586', '103.549961', '29.416536', 'wm1xk74g8z');
INSERT INTO `model_nation` VALUES ('2590', '511112', '', '', '五通桥区', '2586', '103.816837', '29.406186', 'wm1z63jp7w');
INSERT INTO `model_nation` VALUES ('2591', '511113', '', '', '金口河区', '2586', '103.077831', '29.24602', 'wm1q3s4frt');
INSERT INTO `model_nation` VALUES ('2592', '511123', '', '', '犍为县', '2586', '103.944266', '29.209782', 'wm1yjm3zkf');
INSERT INTO `model_nation` VALUES ('2593', '511124', '', '', '井研县', '2586', '104.06885', '29.651645', 'wm608jut7g');
INSERT INTO `model_nation` VALUES ('2594', '511126', '', '', '夹江县', '2586', '103.578862', '29.741019', 'wm39hypvfr');
INSERT INTO `model_nation` VALUES ('2595', '511129', '', '', '沐川县', '2586', '103.90211', '28.956338', 'wm1usr74ys');
INSERT INTO `model_nation` VALUES ('2596', '511132', '', '', '峨边彝族自治县', '2586', '103.262148', '29.230271', 'wm1qmc1nwm');
INSERT INTO `model_nation` VALUES ('2597', '511133', '', '', '马边彝族自治县', '2586', '103.546851', '28.838933', 'wm1sh3bwbw');
INSERT INTO `model_nation` VALUES ('2598', '511181', '', '', '峨眉山市', '2586', '103.492488', '29.597478', 'wm387h0cvc');
INSERT INTO `model_nation` VALUES ('2599', '511300', '', '南充市', '', '2498', '106.082974', '30.795281', 'wm7rjyp782');
INSERT INTO `model_nation` VALUES ('2600', '511301', '', '', '市辖区', '2599', '106.082974', '30.795281', 'wm7rjyp782');
INSERT INTO `model_nation` VALUES ('2601', '511302', '', '', '顺庆区', '2599', '106.084091', '30.795572', 'wm7rnn0j4q');
INSERT INTO `model_nation` VALUES ('2602', '511303', '', '', '高坪区', '2599', '106.108996', '30.781809', 'wm7rnedjnc');
INSERT INTO `model_nation` VALUES ('2603', '511304', '', '', '嘉陵区', '2599', '106.067027', '30.762976', 'wm7rj85xkf');
INSERT INTO `model_nation` VALUES ('2604', '511321', '', '', '南部县', '2599', '106.061138', '31.349407', 'wme6m6zre9');
INSERT INTO `model_nation` VALUES ('2605', '511322', '', '', '营山县', '2599', '106.564893', '31.075907', 'wmebbcnnmb');
INSERT INTO `model_nation` VALUES ('2606', '511323', '', '', '蓬安县', '2599', '106.413488', '31.027978', 'wme8t2rzjf');
INSERT INTO `model_nation` VALUES ('2607', '511324', '', '', '仪陇县', '2599', '106.297083', '31.271261', 'wme9fug0m9');
INSERT INTO `model_nation` VALUES ('2608', '511325', '', '', '西充县', '2599', '105.893021', '30.994616', 'wme23dkuwp');
INSERT INTO `model_nation` VALUES ('2609', '511381', '', '', '阆中市', '2599', '105.975266', '31.580466', 'wme7et0cd9');
INSERT INTO `model_nation` VALUES ('2610', '511400', '', '眉山市', '', '2498', '103.831788', '30.048318', 'wm3ffy0h0h');
INSERT INTO `model_nation` VALUES ('2611', '511401', '', '', '市辖区', '2610', '103.831788', '30.048318', 'wm3ffy0h0h');
INSERT INTO `model_nation` VALUES ('2612', '511402', '', '', '东坡区', '2610', '103.831553', '30.048128', 'wm3ffwpg49');
INSERT INTO `model_nation` VALUES ('2613', '511403', '', '', '彭山区', '2610', '103.831788', '30.048318', 'wm3ffy0h0h');
INSERT INTO `model_nation` VALUES ('2614', '511421', '', '', '仁寿县', '2610', '104.147646', '29.996721', 'wm649uwp84');
INSERT INTO `model_nation` VALUES ('2615', '511423', '', '', '洪雅县', '2610', '103.375006', '29.904867', 'wm3d0k52kp');
INSERT INTO `model_nation` VALUES ('2616', '511424', '', '', '丹棱县', '2610', '103.518333', '30.012751', 'wm3dexeszy');
INSERT INTO `model_nation` VALUES ('2617', '511425', '', '', '青神县', '2610', '103.846131', '29.831469', 'wm3cendkyh');
INSERT INTO `model_nation` VALUES ('2618', '511500', '', '宜宾市', '', '2498', '104.630825', '28.760189', 'wm47sgtu4z');
INSERT INTO `model_nation` VALUES ('2619', '511501', '', '', '市辖区', '2618', '104.630825', '28.760189', 'wm47sgtu4z');
INSERT INTO `model_nation` VALUES ('2620', '511502', '', '', '翠屏区', '2618', '104.630231', '28.760179', 'wm47sgtkjj');
INSERT INTO `model_nation` VALUES ('2621', '511503', '', '', '南溪区', '2618', '104.981133', '28.839806', 'wm4shfhuj9');
INSERT INTO `model_nation` VALUES ('2622', '511521', '', '', '宜宾县', '2618', '104.541489', '28.695678', 'wm474zuu3q');
INSERT INTO `model_nation` VALUES ('2623', '511523', '', '', '江安县', '2618', '105.068697', '28.728102', 'wm4eqvu9q4');
INSERT INTO `model_nation` VALUES ('2624', '511524', '', '', '长宁县', '2618', '104.921116', '28.577271', 'wm4ded34xj');
INSERT INTO `model_nation` VALUES ('2625', '511525', '', '', '高县', '2618', '104.519187', '28.435676', 'wm43f2s9cd');
INSERT INTO `model_nation` VALUES ('2626', '511526', '', '', '珙县', '2618', '104.712268', '28.449041', 'wm43yfcpst');
INSERT INTO `model_nation` VALUES ('2627', '511527', '', '', '筠连县', '2618', '104.507848', '28.162017', 'wm424nsr9k');
INSERT INTO `model_nation` VALUES ('2628', '511528', '', '', '兴文县', '2618', '105.236549', '28.302988', 'wm4c48quv7');
INSERT INTO `model_nation` VALUES ('2629', '511529', '', '', '屏山县', '2618', '104.162617', '28.64237', 'wm44fq0vuu');
INSERT INTO `model_nation` VALUES ('2630', '511600', '', '广安市', '', '2498', '106.633369', '30.456398', 'wm7v682j3s');
INSERT INTO `model_nation` VALUES ('2631', '511601', '', '', '市辖区', '2630', '106.633369', '30.456398', 'wm7v682j3s');
INSERT INTO `model_nation` VALUES ('2632', '511602', '', '', '广安区', '2630', '106.632907', '30.456462', 'wm7v62rtyb');
INSERT INTO `model_nation` VALUES ('2633', '511603', '', '', '前锋区', '2630', '106.893277', '30.4963', 'wmkj2rtmcf');
INSERT INTO `model_nation` VALUES ('2634', '511621', '', '', '岳池县', '2630', '106.444451', '30.533538', 'wm7twnqqz2');
INSERT INTO `model_nation` VALUES ('2635', '511622', '', '', '武胜县', '2630', '106.292473', '30.344291', 'wm7sdspb61');
INSERT INTO `model_nation` VALUES ('2636', '511623', '', '', '邻水县', '2630', '106.934968', '30.334323', 'wmkh965wjr');
INSERT INTO `model_nation` VALUES ('2637', '511681', '', '', '华蓥市', '2630', '106.777882', '30.380574', 'wm7uvf978v');
INSERT INTO `model_nation` VALUES ('2638', '511700', '', '达州市', '', '2498', '107.502262', '31.209484', 'wms3w38b2m');
INSERT INTO `model_nation` VALUES ('2639', '511701', '', '', '市辖区', '2638', '107.502262', '31.209484', 'wms3w38b2m');
INSERT INTO `model_nation` VALUES ('2640', '511702', '', '', '通川区', '2638', '107.501062', '31.213522', 'wms3w4pzuq');
INSERT INTO `model_nation` VALUES ('2641', '511703', '', '', '达川区', '2638', '107.507926', '31.199062', 'wms3qrsgsn');
INSERT INTO `model_nation` VALUES ('2642', '511722', '', '', '宣汉县', '2638', '107.722254', '31.355025', 'wmsd7k0bq2');
INSERT INTO `model_nation` VALUES ('2643', '511723', '', '', '开江县', '2638', '107.864135', '31.085537', 'wms8ydbq2s');
INSERT INTO `model_nation` VALUES ('2644', '511724', '', '', '大竹县', '2638', '107.20742', '30.736289', 'wmknze65cg');
INSERT INTO `model_nation` VALUES ('2645', '511725', '', '', '渠县', '2638', '106.970746', '30.836348', 'wmkp6jtdxp');
INSERT INTO `model_nation` VALUES ('2646', '511781', '', '', '万源市', '2638', '108.037548', '32.06777', 'wmsy6my833');
INSERT INTO `model_nation` VALUES ('2647', '511800', '', '雅安市', '', '2498', '103.001033', '29.987722', 'wm34xg554h');
INSERT INTO `model_nation` VALUES ('2648', '511801', '', '', '市辖区', '2647', '103.001033', '29.987722', 'wm34xg554h');
INSERT INTO `model_nation` VALUES ('2649', '511802', '', '', '雨城区', '2647', '103.003398', '29.981831', 'wm34xfhbc4');
INSERT INTO `model_nation` VALUES ('2650', '511803', '', '', '名山区', '2647', '103.112214', '30.084718', 'wm374ku00t');
INSERT INTO `model_nation` VALUES ('2651', '511822', '', '', '荥经县', '2647', '102.844674', '29.795529', 'wm31s215w9');
INSERT INTO `model_nation` VALUES ('2652', '511823', '', '', '汉源县', '2647', '102.677145', '29.349915', 'wm1nbqzpwu');
INSERT INTO `model_nation` VALUES ('2653', '511824', '', '', '石棉县', '2647', '102.35962', '29.234063', 'wm0y33bhb0');
INSERT INTO `model_nation` VALUES ('2654', '511825', '', '', '天全县', '2647', '102.763462', '30.059955', 'wm3542npfj');
INSERT INTO `model_nation` VALUES ('2655', '511826', '', '', '芦山县', '2647', '102.924016', '30.152907', 'wm35w14vrm');
INSERT INTO `model_nation` VALUES ('2656', '511827', '', '', '宝兴县', '2647', '102.813377', '30.369026', 'wm3hg8d2mk');
INSERT INTO `model_nation` VALUES ('2657', '511900', '', '巴中市', '', '2498', '106.753669', '31.858809', 'wmevjpxxhb');
INSERT INTO `model_nation` VALUES ('2658', '511901', '', '', '市辖区', '2657', '106.753669', '31.858809', 'wmevjpxxhb');
INSERT INTO `model_nation` VALUES ('2659', '511902', '', '', '巴州区', '2657', '106.753671', '31.858366', 'wmevjpxskv');
INSERT INTO `model_nation` VALUES ('2660', '511903', '', '', '恩阳区', '2657', '106.486515', '31.816336', 'wmeszpvped');
INSERT INTO `model_nation` VALUES ('2661', '511921', '', '', '通江县', '2657', '107.247621', '31.91212', 'wmsm83rmdd');
INSERT INTO `model_nation` VALUES ('2662', '511922', '', '', '南江县', '2657', '106.843418', '32.353164', 'wmgbp39nb4');
INSERT INTO `model_nation` VALUES ('2663', '511923', '', '', '平昌县', '2657', '107.101937', '31.562814', 'wms5t1v68n');
INSERT INTO `model_nation` VALUES ('2664', '512000', '', '资阳市', '', '2498', '104.641917', '30.122211', 'wm67m5tft7');
INSERT INTO `model_nation` VALUES ('2665', '512001', '', '', '市辖区', '2664', '104.641917', '30.122211', 'wm67m5tft7');
INSERT INTO `model_nation` VALUES ('2666', '512002', '', '', '雁江区', '2664', '104.642338', '30.121686', 'wm67m5qpx1');
INSERT INTO `model_nation` VALUES ('2667', '512021', '', '', '安岳县', '2664', '105.336764', '30.099206', 'wm6ghzrusd');
INSERT INTO `model_nation` VALUES ('2668', '512022', '', '', '乐至县', '2664', '105.031142', '30.275619', 'wm6snp926b');
INSERT INTO `model_nation` VALUES ('2669', '512081', '', '', '简阳市', '2664', '104.550339', '30.390666', 'wm6kgh7nrq');
INSERT INTO `model_nation` VALUES ('2670', '513200', '', '阿坝藏族羌族自治州', '', '2498', '102.221374', '31.899792', 'wm8tqp5mf8');
INSERT INTO `model_nation` VALUES ('2671', '513221', '', '', '汶川县', '2670', '103.580675', '31.47463', 'wm9ej1c1h8');
INSERT INTO `model_nation` VALUES ('2672', '513222', '', '', '理县', '2670', '103.165486', '31.436764', 'wm96gdfu6j');
INSERT INTO `model_nation` VALUES ('2673', '513223', '', '', '茂县', '2670', '103.850684', '31.680407', 'wm9u5pjz8r');
INSERT INTO `model_nation` VALUES ('2674', '513224', '', '', '松潘县', '2670', '103.599177', '32.63838', 'wmc9tmws7g');
INSERT INTO `model_nation` VALUES ('2675', '513225', '', '', '九寨沟县', '2670', '104.236344', '33.262097', 'wmfj5zntfb');
INSERT INTO `model_nation` VALUES ('2676', '513226', '', '', '金川县', '2670', '102.064647', '31.476356', 'wm8e4d15nd');
INSERT INTO `model_nation` VALUES ('2677', '513227', '', '', '小金县', '2670', '102.363193', '30.999016', 'wm8b374w77');
INSERT INTO `model_nation` VALUES ('2678', '513228', '', '', '黑水县', '2670', '102.990805', '32.061721', 'wm9nrset59');
INSERT INTO `model_nation` VALUES ('2679', '513229', '', '', '马尔康县', '2670', '102.221187', '31.899761', 'wm8tqp5jw6');
INSERT INTO `model_nation` VALUES ('2680', '513230', '', '', '壤塘县', '2670', '100.979136', '32.264887', 'wjxz9cdu86');
INSERT INTO `model_nation` VALUES ('2681', '513231', '', '', '阿坝县', '2670', '101.700985', '32.904223', 'wmb74q02ux');
INSERT INTO `model_nation` VALUES ('2682', '513232', '', '', '若尔盖县', '2670', '102.963726', '33.575934', 'wmcpnbrcux');
INSERT INTO `model_nation` VALUES ('2683', '513233', '', '', '红原县', '2670', '102.544906', '32.793902', 'wmbft3yym6');
INSERT INTO `model_nation` VALUES ('2684', '513300', '', '甘孜藏族自治州', '', '2498', '101.963815', '30.050663', 'wm2dbnxcc1');
INSERT INTO `model_nation` VALUES ('2685', '513321', '', '', '康定县', '2684', '101.964057', '30.050738', 'wm2dbnxfnx');
INSERT INTO `model_nation` VALUES ('2686', '513322', '', '', '泸定县', '2684', '102.233225', '29.912482', 'wm2dnm7uyf');
INSERT INTO `model_nation` VALUES ('2687', '513323', '', '', '丹巴县', '2684', '101.886125', '30.877083', 'wm2rwmp0nc');
INSERT INTO `model_nation` VALUES ('2688', '513324', '', '', '九龙县', '2684', '101.506942', '29.001975', 'wm0hvzehep');
INSERT INTO `model_nation` VALUES ('2689', '513325', '', '', '雅江县', '2684', '101.015735', '30.03225', 'wjrffejqt1');
INSERT INTO `model_nation` VALUES ('2690', '513326', '', '', '道孚县', '2684', '101.123327', '30.978767', 'wjxbjpeb2k');
INSERT INTO `model_nation` VALUES ('2691', '513327', '', '', '炉霍县', '2684', '100.679495', '31.392674', 'wjxde4bed6');
INSERT INTO `model_nation` VALUES ('2692', '513328', '', '', '甘孜县', '2684', '99.991753', '31.61975', 'wjx5gk5y2s');
INSERT INTO `model_nation` VALUES ('2693', '513329', '', '', '新龙县', '2684', '100.312094', '30.93896', 'wjx248m090');
INSERT INTO `model_nation` VALUES ('2694', '513330', '', '', '德格县', '2684', '98.57999', '31.806729', 'wjwhgnpz8k');
INSERT INTO `model_nation` VALUES ('2695', '513331', '', '', '白玉县', '2684', '98.824343', '31.208805', 'wjw38c3sqn');
INSERT INTO `model_nation` VALUES ('2696', '513332', '', '', '石渠县', '2684', '98.100887', '32.975302', 'wjvg86fzh3');
INSERT INTO `model_nation` VALUES ('2697', '513333', '', '', '色达县', '2684', '100.331657', '32.268777', 'wjxre47730');
INSERT INTO `model_nation` VALUES ('2698', '513334', '', '', '理塘县', '2684', '100.269862', '29.991807', 'wjr69ey6cn');
INSERT INTO `model_nation` VALUES ('2699', '513335', '', '', '巴塘县', '2684', '99.109037', '30.005723', 'wjq6xq2upb');
INSERT INTO `model_nation` VALUES ('2700', '513336', '', '', '乡城县', '2684', '99.799943', '28.930855', 'wjnux48n7n');
INSERT INTO `model_nation` VALUES ('2701', '513337', '', '', '稻城县', '2684', '100.296689', '29.037544', 'wjpm4q1gfn');
INSERT INTO `model_nation` VALUES ('2702', '513338', '', '', '得荣县', '2684', '99.288036', '28.71134', 'wjne76erdv');
INSERT INTO `model_nation` VALUES ('2703', '513400', '', '凉山彝族自治州', '', '2498', '102.258746', '27.886762', 'wkbwwuws1m');
INSERT INTO `model_nation` VALUES ('2704', '513401', '', '', '西昌市', '2703', '102.258758', '27.885786', 'wkbwwuqw3z');
INSERT INTO `model_nation` VALUES ('2705', '513422', '', '', '木里藏族自治县', '2703', '101.280184', '27.926859', 'wkbnbevvxr');
INSERT INTO `model_nation` VALUES ('2706', '513423', '', '', '盐源县', '2703', '101.508909', '27.423415', 'wkbhjbk8cp');
INSERT INTO `model_nation` VALUES ('2707', '513424', '', '', '德昌县', '2703', '102.178845', '27.403827', 'wkbevhsqge');
INSERT INTO `model_nation` VALUES ('2708', '513425', '', '', '会理县', '2703', '102.249548', '26.658702', 'wk8xwtpf5n');
INSERT INTO `model_nation` VALUES ('2709', '513426', '', '', '会东县', '2703', '102.578985', '26.630713', 'wk8zqpzxps');
INSERT INTO `model_nation` VALUES ('2710', '513427', '', '', '宁南县', '2703', '102.757374', '27.065205', 'wkc1fr1dhr');
INSERT INTO `model_nation` VALUES ('2711', '513428', '', '', '普格县', '2703', '102.541082', '27.376828', 'wkbgtru1s6');
INSERT INTO `model_nation` VALUES ('2712', '513429', '', '', '布拖县', '2703', '102.808801', '27.709062', 'wkcjekr0fx');
INSERT INTO `model_nation` VALUES ('2713', '513430', '', '', '金阳县', '2703', '103.248704', '27.695916', 'wkcmt3zkmh');
INSERT INTO `model_nation` VALUES ('2714', '513431', '', '', '昭觉县', '2703', '102.843991', '28.010554', 'wkcpk70tq9');
INSERT INTO `model_nation` VALUES ('2715', '513432', '', '', '喜德县', '2703', '102.412342', '28.305486', 'wm0c42y7kt');
INSERT INTO `model_nation` VALUES ('2716', '513433', '', '', '冕宁县', '2703', '102.170046', '28.550844', 'wm0dkvtbwx');
INSERT INTO `model_nation` VALUES ('2717', '513434', '', '', '越西县', '2703', '102.508875', '28.639632', 'wm0futstvy');
INSERT INTO `model_nation` VALUES ('2718', '513435', '', '', '甘洛县', '2703', '102.775924', '28.977094', 'wm1hfep5u9');
INSERT INTO `model_nation` VALUES ('2719', '513436', '', '', '美姑县', '2703', '103.132007', '28.327946', 'wm134ufqjz');
INSERT INTO `model_nation` VALUES ('2720', '513437', '', '', '雷波县', '2703', '103.571584', '28.262946', 'wm18uc4e8f');
INSERT INTO `model_nation` VALUES ('2721', '520000', '贵州省', '', '', '1', '106.713478', '26.578343', 'wkezhq6qh6');
INSERT INTO `model_nation` VALUES ('2722', '520100', '', '贵阳市', '', '2721', '106.713478', '26.578343', 'wkezhq6qh6');
INSERT INTO `model_nation` VALUES ('2723', '520101', '', '', '市辖区', '2722', '106.713478', '26.578343', 'wkezhq6qh6');
INSERT INTO `model_nation` VALUES ('2724', '520102', '', '', '南明区', '2722', '106.715963', '26.573743', 'wkezhms5q0');
INSERT INTO `model_nation` VALUES ('2725', '520103', '', '', '云岩区', '2722', '106.713397', '26.58301', 'wkezhr6362');
INSERT INTO `model_nation` VALUES ('2726', '520111', '', '', '花溪区', '2722', '106.670791', '26.410464', 'wkey5rgk1e');
INSERT INTO `model_nation` VALUES ('2727', '520112', '', '', '乌当区', '2722', '106.762123', '26.630928', 'wkezt2jb3u');
INSERT INTO `model_nation` VALUES ('2728', '520113', '', '', '白云区', '2722', '106.633037', '26.676849', 'wkezf2rgcv');
INSERT INTO `model_nation` VALUES ('2729', '520115', '', '', '观山湖区', '2722', '106.626323', '26.646358', 'wkezd6ffm3');
INSERT INTO `model_nation` VALUES ('2730', '520121', '', '', '开阳县', '2722', '106.969438', '27.056793', 'wku1fjsc0x');
INSERT INTO `model_nation` VALUES ('2731', '520122', '', '', '息烽县', '2722', '106.737693', '27.092665', 'wkgfhuh40w');
INSERT INTO `model_nation` VALUES ('2732', '520123', '', '', '修文县', '2722', '106.599218', '26.840672', 'wkgb9wpnjz');
INSERT INTO `model_nation` VALUES ('2733', '520181', '', '', '清镇市', '2722', '106.470278', '26.551289', 'wkexnc923r');
INSERT INTO `model_nation` VALUES ('2734', '520200', '', '六盘水市', '', '2721', '104.846743', '26.584643', 'wkdx1ze4f0');
INSERT INTO `model_nation` VALUES ('2735', '520201', '', '', '钟山区', '2734', '104.846244', '26.584805', 'wkdx1zdeww');
INSERT INTO `model_nation` VALUES ('2736', '520203', '', '', '六枝特区', '2734', '105.474235', '26.210662', 'wkej05ebpv');
INSERT INTO `model_nation` VALUES ('2737', '520221', '', '', '水城县', '2734', '104.95685', '26.540478', 'wkdwure1rz');
INSERT INTO `model_nation` VALUES ('2738', '520222', '', '', '盘县', '2734', '104.468367', '25.706966', 'wkd61pz9cm');
INSERT INTO `model_nation` VALUES ('2739', '520300', '', '遵义市', '', '2721', '106.937265', '27.706626', 'wkuj97v6fc');
INSERT INTO `model_nation` VALUES ('2740', '520301', '', '', '市辖区', '2739', '106.937265', '27.706626', 'wkuj97v6fc');
INSERT INTO `model_nation` VALUES ('2741', '520302', '', '', '红花岗区', '2739', '106.943784', '27.694395', 'wkuj99d5dc');
INSERT INTO `model_nation` VALUES ('2742', '520303', '', '', '汇川区', '2739', '106.937265', '27.706626', 'wkuj97v6fc');
INSERT INTO `model_nation` VALUES ('2743', '520321', '', '', '遵义县', '2739', '106.831668', '27.535288', 'wkguxh8kwm');
INSERT INTO `model_nation` VALUES ('2744', '520322', '', '', '桐梓县', '2739', '106.826591', '28.131559', 'wm5bnchwpy');
INSERT INTO `model_nation` VALUES ('2745', '520323', '', '', '绥阳县', '2739', '107.191024', '27.951342', 'wkupp0qh7g');
INSERT INTO `model_nation` VALUES ('2746', '520324', '', '', '正安县', '2739', '107.441872', '28.550337', 'wmh6kvkvc0');
INSERT INTO `model_nation` VALUES ('2747', '520325', '', '', '道真仡佬族苗族自治县', '2739', '107.605342', '28.880088', 'wmhs297ydn');
INSERT INTO `model_nation` VALUES ('2748', '520326', '', '', '务川仡佬族苗族自治县', '2739', '107.887857', '28.521567', 'wmhdr01w1m');
INSERT INTO `model_nation` VALUES ('2749', '520327', '', '', '凤冈县', '2739', '107.722021', '27.960858', 'wkux560gc1');
INSERT INTO `model_nation` VALUES ('2750', '520328', '', '', '湄潭县', '2739', '107.485723', '27.765839', 'wkumvysewz');
INSERT INTO `model_nation` VALUES ('2751', '520329', '', '', '余庆县', '2739', '107.892566', '27.221552', 'wkudz5scp1');
INSERT INTO `model_nation` VALUES ('2752', '520330', '', '', '习水县', '2739', '106.200954', '28.327826', 'wm590svjt9');
INSERT INTO `model_nation` VALUES ('2753', '520381', '', '', '赤水市', '2739', '105.698116', '28.587057', 'wm54thp58t');
INSERT INTO `model_nation` VALUES ('2754', '520382', '', '', '仁怀市', '2739', '106.412476', '27.803377', 'wkgwjmrnqm');
INSERT INTO `model_nation` VALUES ('2755', '520400', '', '安顺市', '', '2721', '105.932188', '26.245544', 'wkem69c7qu');
INSERT INTO `model_nation` VALUES ('2756', '520401', '', '', '市辖区', '2755', '105.932188', '26.245544', 'wkem69c7qu');
INSERT INTO `model_nation` VALUES ('2757', '520402', '', '', '西秀区', '2755', '105.946169', '26.248323', 'wkem6f7esd');
INSERT INTO `model_nation` VALUES ('2758', '520403', '', '', '平坝区', '2755', '105.932188', '26.245544', 'wkem69c7qu');
INSERT INTO `model_nation` VALUES ('2759', '520422', '', '', '普定县', '2755', '105.745609', '26.305794', 'wkejwkcd77');
INSERT INTO `model_nation` VALUES ('2760', '520423', '', '', '镇宁布依族苗族自治县', '2755', '105.768656', '26.056096', 'wkehnz67u2');
INSERT INTO `model_nation` VALUES ('2761', '520424', '', '', '关岭布依族苗族自治县', '2755', '105.618454', '25.944248', 'wke5e7j00q');
INSERT INTO `model_nation` VALUES ('2762', '520425', '', '', '紫云苗族布依族自治县', '2755', '106.084515', '25.751567', 'wke6qpbmu2');
INSERT INTO `model_nation` VALUES ('2763', '520500', '', '毕节市', '', '2721', '105.28501', '27.301693', 'wkfg7f45ys');
INSERT INTO `model_nation` VALUES ('2764', '520501', '', '', '市辖区', '2763', '105.28501', '27.301693', 'wkfg7f45ys');
INSERT INTO `model_nation` VALUES ('2765', '520502', '', '', '七星关区', '2763', '105.284852', '27.302085', 'wkfg7f4n4v');
INSERT INTO `model_nation` VALUES ('2766', '520521', '', '', '大方县', '2763', '105.609254', '27.143521', 'wkg47jq63z');
INSERT INTO `model_nation` VALUES ('2767', '520522', '', '', '黔西县', '2763', '106.038299', '27.024923', 'wkg3szwxx6');
INSERT INTO `model_nation` VALUES ('2768', '520523', '', '', '金沙县', '2763', '106.222103', '27.459693', 'wkgs1nus63');
INSERT INTO `model_nation` VALUES ('2769', '520524', '', '', '织金县', '2763', '105.768997', '26.668497', 'wkepwyfek2');
INSERT INTO `model_nation` VALUES ('2770', '520525', '', '', '纳雍县', '2763', '105.375322', '26.769875', 'wkfbmc7cyf');
INSERT INTO `model_nation` VALUES ('2771', '520526', '', '', '威宁彝族回族苗族自治县', '2763', '104.286523', '26.859099', 'wkf0v1e1s4');
INSERT INTO `model_nation` VALUES ('2772', '520527', '', '', '赫章县', '2763', '104.726438', '27.119243', 'wkf6r0gmnc');
INSERT INTO `model_nation` VALUES ('2773', '520600', '', '铜仁市', '', '2721', '109.191555', '27.718346', 'wkvtstyz5d');
INSERT INTO `model_nation` VALUES ('2774', '520601', '', '', '市辖区', '2773', '109.191555', '27.718346', 'wkvtstyz5d');
INSERT INTO `model_nation` VALUES ('2775', '520602', '', '', '碧江区', '2773', '109.192117', '27.718745', 'wkvtswp32s');
INSERT INTO `model_nation` VALUES ('2776', '520603', '', '', '万山区', '2773', '109.21199', '27.51903', 'wkvst1ttzz');
INSERT INTO `model_nation` VALUES ('2777', '520621', '', '', '江口县', '2773', '108.848427', '27.691904', 'wkvmscjj01');
INSERT INTO `model_nation` VALUES ('2778', '520622', '', '', '玉屏侗族自治县', '2773', '108.917882', '27.238024', 'wkv6yqx8fx');
INSERT INTO `model_nation` VALUES ('2779', '520623', '', '', '石阡县', '2773', '108.229854', '27.519386', 'wkuuwcf843');
INSERT INTO `model_nation` VALUES ('2780', '520624', '', '', '思南县', '2773', '108.255827', '27.941331', 'wkuyzqt6p9');
INSERT INTO `model_nation` VALUES ('2781', '520625', '', '', '印江土家族苗族自治县', '2773', '108.405517', '27.997976', 'wkvp6bfkp9');
INSERT INTO `model_nation` VALUES ('2782', '520626', '', '', '德江县', '2773', '108.117317', '28.26094', 'wmhbu28xuj');
INSERT INTO `model_nation` VALUES ('2783', '520627', '', '', '沿河土家族自治县', '2773', '108.495746', '28.560487', 'wmj4kzk0yh');
INSERT INTO `model_nation` VALUES ('2784', '520628', '', '', '松桃苗族自治县', '2773', '109.202627', '28.165419', 'wmj8hzqgmw');
INSERT INTO `model_nation` VALUES ('2785', '522300', '', '黔西南布依族苗族自治州', '', '2721', '104.897971', '25.08812', 'wk6wep0kgu');
INSERT INTO `model_nation` VALUES ('2786', '522301', '', '', '兴义市', '2785', '104.897982', '25.088599', 'wk6wep0rsj');
INSERT INTO `model_nation` VALUES ('2787', '522322', '', '', '兴仁县', '2785', '105.192778', '25.431378', 'wkdb9txh92');
INSERT INTO `model_nation` VALUES ('2788', '522323', '', '', '普安县', '2785', '104.955347', '25.786404', 'wkddsq60sy');
INSERT INTO `model_nation` VALUES ('2789', '522324', '', '', '晴隆县', '2785', '105.218773', '25.832881', 'wkdffq9zrn');
INSERT INTO `model_nation` VALUES ('2790', '522325', '', '', '贞丰县', '2785', '105.650133', '25.385752', 'wke0kjk4dx');
INSERT INTO `model_nation` VALUES ('2791', '522326', '', '', '望谟县', '2785', '106.091563', '25.166667', 'wk7rnjmw2w');
INSERT INTO `model_nation` VALUES ('2792', '522327', '', '', '册亨县', '2785', '105.81241', '24.983338', 'wk7npu44rz');
INSERT INTO `model_nation` VALUES ('2793', '522328', '', '', '安龙县', '2785', '105.471498', '25.108959', 'wk7nb4fn21');
INSERT INTO `model_nation` VALUES ('2794', '522600', '', '黔东南苗族侗族自治州', '', '2721', '107.977488', '26.583352', 'wksz1p6g1z');
INSERT INTO `model_nation` VALUES ('2795', '522601', '', '', '凯里市', '2794', '107.977541', '26.582964', 'wksz1p6bgp');
INSERT INTO `model_nation` VALUES ('2796', '522622', '', '', '黄平县', '2794', '107.901337', '26.896973', 'wku9p27q5r');
INSERT INTO `model_nation` VALUES ('2797', '522623', '', '', '施秉县', '2794', '108.12678', '27.034657', 'wkucu3x829');
INSERT INTO `model_nation` VALUES ('2798', '522624', '', '', '三穗县', '2794', '108.681121', '26.959884', 'wkv335ghtw');
INSERT INTO `model_nation` VALUES ('2799', '522625', '', '', '镇远县', '2794', '108.423656', '27.050233', 'wkv1ghren2');
INSERT INTO `model_nation` VALUES ('2800', '522626', '', '', '岑巩县', '2794', '108.816459', '27.173244', 'wkv6s4txx7');
INSERT INTO `model_nation` VALUES ('2801', '522627', '', '', '天柱县', '2794', '109.212798', '26.909684', 'wkv9j4y268');
INSERT INTO `model_nation` VALUES ('2802', '522628', '', '', '锦屏县', '2794', '109.20252', '26.680625', 'wktxucncgh');
INSERT INTO `model_nation` VALUES ('2803', '522629', '', '', '剑河县', '2794', '108.440499', '26.727349', 'wkv059efnf');
INSERT INTO `model_nation` VALUES ('2804', '522630', '', '', '台江县', '2794', '108.314637', '26.669138', 'wktp8ybqcz');
INSERT INTO `model_nation` VALUES ('2805', '522631', '', '', '黎平县', '2794', '109.136504', '26.230636', 'wktt5rnu8b');
INSERT INTO `model_nation` VALUES ('2806', '522632', '', '', '榕江县', '2794', '108.521026', '25.931085', 'wkt5t2wee0');
INSERT INTO `model_nation` VALUES ('2807', '522633', '', '', '从江县', '2794', '108.912648', '25.747058', 'wkt6qr5g2x');
INSERT INTO `model_nation` VALUES ('2808', '522634', '', '', '雷山县', '2794', '108.079613', '26.381027', 'wksy56t0te');
INSERT INTO `model_nation` VALUES ('2809', '522635', '', '', '麻江县', '2794', '107.593172', '26.494803', 'wksw8r4zqt');
INSERT INTO `model_nation` VALUES ('2810', '522636', '', '', '丹寨县', '2794', '107.794808', '26.199497', 'wksthcmz1h');
INSERT INTO `model_nation` VALUES ('2811', '522700', '', '黔南布依族苗族自治州', '', '2721', '107.517156', '26.258219', 'wksmqs5t5q');
INSERT INTO `model_nation` VALUES ('2812', '522701', '', '', '都匀市', '2811', '107.517021', '26.258205', 'wksmqs5t0h');
INSERT INTO `model_nation` VALUES ('2813', '522702', '', '', '福泉市', '2811', '107.513508', '26.702508', 'wksryt0cqk');
INSERT INTO `model_nation` VALUES ('2814', '522722', '', '', '荔波县', '2811', '107.8838', '25.412239', 'wks8wfnt48');
INSERT INTO `model_nation` VALUES ('2815', '522723', '', '', '贵定县', '2811', '107.233588', '26.580807', 'wksr0nvh7t');
INSERT INTO `model_nation` VALUES ('2816', '522725', '', '', '瓮安县', '2811', '107.478417', '27.066339', 'wku3vxr2ue');
INSERT INTO `model_nation` VALUES ('2817', '522726', '', '', '独山县', '2811', '107.542757', '25.826283', 'wks6zjw1pb');
INSERT INTO `model_nation` VALUES ('2818', '522727', '', '', '平塘县', '2811', '107.32405', '25.831803', 'wks6fnwcpt');
INSERT INTO `model_nation` VALUES ('2819', '522728', '', '', '罗甸县', '2811', '106.750006', '25.429894', 'wkebtjkgz7');
INSERT INTO `model_nation` VALUES ('2820', '522729', '', '', '长顺县', '2811', '106.447376', '26.022116', 'wkesn30tgd');
INSERT INTO `model_nation` VALUES ('2821', '522730', '', '', '龙里县', '2811', '106.977733', '26.448809', 'wksn6qfg3z');
INSERT INTO `model_nation` VALUES ('2822', '522731', '', '', '惠水县', '2811', '106.657848', '26.128637', 'wkeueh9f7f');
INSERT INTO `model_nation` VALUES ('2823', '522732', '', '', '三都水族自治县', '2811', '107.87747', '25.985183', 'wkseyf3yxj');
INSERT INTO `model_nation` VALUES ('2824', '530000', '云南省', '', '', '1', '102.712251', '25.040609', 'wk3n3q8b0g');
INSERT INTO `model_nation` VALUES ('2825', '530100', '', '昆明市', '', '2824', '102.712251', '25.040609', 'wk3n3q8b0g');
INSERT INTO `model_nation` VALUES ('2826', '530101', '', '', '市辖区', '2825', '102.712251', '25.040609', 'wk3n3q8b0g');
INSERT INTO `model_nation` VALUES ('2827', '530102', '', '', '五华区', '2825', '102.704412', '25.042165', 'wk3n3ng14m');
INSERT INTO `model_nation` VALUES ('2828', '530103', '', '', '盘龙区', '2825', '102.729044', '25.070239', 'wk3n9evh8p');
INSERT INTO `model_nation` VALUES ('2829', '530111', '', '', '官渡区', '2825', '102.723437', '25.021211', 'wk3n3dbzje');
INSERT INTO `model_nation` VALUES ('2830', '530112', '', '', '西山区', '2825', '102.705904', '25.02436', 'wk3n35s1mn');
INSERT INTO `model_nation` VALUES ('2831', '530113', '', '', '东川区', '2825', '103.182', '26.08349', 'wk9k7uqg6f');
INSERT INTO `model_nation` VALUES ('2832', '530114', '', '', '呈贡区', '2825', '102.801382', '24.889275', 'wk3je6cwtc');
INSERT INTO `model_nation` VALUES ('2833', '530122', '', '', '晋宁县', '2825', '102.594987', '24.666944', 'wk2uqd7rk7');
INSERT INTO `model_nation` VALUES ('2834', '530124', '', '', '富民县', '2825', '102.497888', '25.219667', 'wk2zkrhejy');
INSERT INTO `model_nation` VALUES ('2835', '530125', '', '', '宜良县', '2825', '103.145989', '24.918215', 'wk3mg0hx5e');
INSERT INTO `model_nation` VALUES ('2836', '530126', '', '', '石林彝族自治县', '2825', '103.271962', '24.754545', 'wk3ky42mej');
INSERT INTO `model_nation` VALUES ('2837', '530127', '', '', '嵩明县', '2825', '103.038777', '25.335087', 'wk920sne9d');
INSERT INTO `model_nation` VALUES ('2838', '530128', '', '', '禄劝彝族苗族自治县', '2825', '102.46905', '25.556533', 'wk8c7srttg');
INSERT INTO `model_nation` VALUES ('2839', '530129', '', '', '寻甸回族彝族自治县', '2825', '103.257588', '25.559474', 'wk93msvysp');
INSERT INTO `model_nation` VALUES ('2840', '530181', '', '', '安宁市', '2825', '102.485544', '24.921785', 'wk2vu0geym');
INSERT INTO `model_nation` VALUES ('2841', '530300', '', '曲靖市', '', '2824', '103.797851', '25.501557', 'wk9c1frm34');
INSERT INTO `model_nation` VALUES ('2842', '530301', '', '', '市辖区', '2841', '103.797851', '25.501557', 'wk9c1frm34');
INSERT INTO `model_nation` VALUES ('2843', '530302', '', '', '麒麟区', '2841', '103.798054', '25.501269', 'wk9c1fr7tv');
INSERT INTO `model_nation` VALUES ('2844', '530321', '', '', '马龙县', '2841', '103.578755', '25.429451', 'wk98svr9rc');
INSERT INTO `model_nation` VALUES ('2845', '530322', '', '', '陆良县', '2841', '103.655233', '25.022878', 'wk3wqer2vf');
INSERT INTO `model_nation` VALUES ('2846', '530323', '', '', '师宗县', '2841', '103.993808', '24.825681', 'wk3vnrmup6');
INSERT INTO `model_nation` VALUES ('2847', '530324', '', '', '罗平县', '2841', '104.309263', '24.885708', 'wk6jtd79vb');
INSERT INTO `model_nation` VALUES ('2848', '530325', '', '', '富源县', '2841', '104.25692', '25.67064', 'wkd4h3jw66');
INSERT INTO `model_nation` VALUES ('2849', '530326', '', '', '会泽县', '2841', '103.300041', '26.412861', 'wk9qq8kf16');
INSERT INTO `model_nation` VALUES ('2850', '530328', '', '', '沾益县', '2841', '103.819262', '25.600878', 'wk9cdkqzuj');
INSERT INTO `model_nation` VALUES ('2851', '530381', '', '', '宣威市', '2841', '104.09554', '26.227777', 'wkdj0y85cg');
INSERT INTO `model_nation` VALUES ('2852', '530400', '', '玉溪市', '', '2824', '102.543907', '24.350461', 'wk2ft2y5wn');
INSERT INTO `model_nation` VALUES ('2853', '530401', '', '', '市辖区', '2852', '102.543907', '24.350461', 'wk2ft2y5wn');
INSERT INTO `model_nation` VALUES ('2854', '530402', '', '', '红塔区', '2852', '102.543468', '24.350753', 'wk2ft2vv7v');
INSERT INTO `model_nation` VALUES ('2855', '530421', '', '', '江川县', '2852', '102.749839', '24.291006', 'wk344nh1kg');
INSERT INTO `model_nation` VALUES ('2856', '530422', '', '', '澄江县', '2852', '102.916652', '24.669679', 'wk3hmfvx7c');
INSERT INTO `model_nation` VALUES ('2857', '530423', '', '', '通海县', '2852', '102.760039', '24.112205', 'wk314m7xf2');
INSERT INTO `model_nation` VALUES ('2858', '530424', '', '', '华宁县', '2852', '102.928982', '24.189807', 'wk31w5weg4');
INSERT INTO `model_nation` VALUES ('2859', '530425', '', '', '易门县', '2852', '102.16211', '24.669598', 'wk2skfbnvd');
INSERT INTO `model_nation` VALUES ('2860', '530426', '', '', '峨山彝族自治县', '2852', '102.404358', '24.173256', 'wk2cd28e6m');
INSERT INTO `model_nation` VALUES ('2861', '530427', '', '', '新平彝族傣族自治县', '2852', '101.990903', '24.0664', 'wk28bv5sbq');
INSERT INTO `model_nation` VALUES ('2862', '530428', '', '', '元江哈尼族彝族傣族自治县', '2852', '101.999658', '23.597618', 'wk0w1pcfh6');
INSERT INTO `model_nation` VALUES ('2863', '530500', '', '保山市', '', '2824', '99.167133', '25.111802', 'whqwbe7qce');
INSERT INTO `model_nation` VALUES ('2864', '530501', '', '', '市辖区', '2863', '99.167133', '25.111802', 'whqwbe7qce');
INSERT INTO `model_nation` VALUES ('2865', '530502', '', '', '隆阳区', '2863', '99.165825', '25.112144', 'whqwbed2g4');
INSERT INTO `model_nation` VALUES ('2866', '530521', '', '', '施甸县', '2863', '99.183758', '24.730847', 'whqs8yp7th');
INSERT INTO `model_nation` VALUES ('2867', '530522', '', '', '腾冲县', '2863', '98.497292', '25.01757', 'whqn3679cm');
INSERT INTO `model_nation` VALUES ('2868', '530523', '', '', '龙陵县', '2863', '98.693567', '24.591912', 'whq5vuf6qb');
INSERT INTO `model_nation` VALUES ('2869', '530524', '', '', '昌宁县', '2863', '99.612344', '24.823662', 'whqv4xp2rc');
INSERT INTO `model_nation` VALUES ('2870', '530600', '', '昭通市', '', '2824', '103.717216', '27.336999', 'wkcg80s9d3');
INSERT INTO `model_nation` VALUES ('2871', '530601', '', '', '市辖区', '2870', '103.717216', '27.336999', 'wkcg80s9d3');
INSERT INTO `model_nation` VALUES ('2872', '530602', '', '', '昭阳区', '2870', '103.717267', '27.336636', 'wkcg80kx7q');
INSERT INTO `model_nation` VALUES ('2873', '530621', '', '', '鲁甸县', '2870', '103.549333', '27.191637', 'wkcdsq46f2');
INSERT INTO `model_nation` VALUES ('2874', '530622', '', '', '巧家县', '2870', '102.929284', '26.9117', 'wkc1n5nu40');
INSERT INTO `model_nation` VALUES ('2875', '530623', '', '', '盐津县', '2870', '104.23506', '28.106923', 'wkfpgutwsy');
INSERT INTO `model_nation` VALUES ('2876', '530624', '', '', '大关县', '2870', '103.891608', '27.747114', 'wkcvu55w9u');
INSERT INTO `model_nation` VALUES ('2877', '530625', '', '', '永善县', '2870', '103.63732', '28.231526', 'wm18w76ks9');
INSERT INTO `model_nation` VALUES ('2878', '530626', '', '', '绥江县', '2870', '103.961095', '28.599953', 'wm1ftwqnv1');
INSERT INTO `model_nation` VALUES ('2879', '530627', '', '', '镇雄县', '2870', '104.873055', '27.436267', 'wkfs46w5z6');
INSERT INTO `model_nation` VALUES ('2880', '530628', '', '', '彝良县', '2870', '104.048492', '27.627425', 'wkcvptmv3t');
INSERT INTO `model_nation` VALUES ('2881', '530629', '', '', '威信县', '2870', '105.04869', '27.843381', 'wkfwqkwp7y');
INSERT INTO `model_nation` VALUES ('2882', '530630', '', '', '水富县', '2870', '104.415376', '28.629688', 'wm46b5bun8');
INSERT INTO `model_nation` VALUES ('2883', '530700', '', '丽江市', '', '2824', '100.233026', '26.872108', 'whz2bggmqu');
INSERT INTO `model_nation` VALUES ('2884', '530701', '', '', '市辖区', '2883', '100.233026', '26.872108', 'whz2bggmqu');
INSERT INTO `model_nation` VALUES ('2885', '530702', '', '', '古城区', '2883', '100.234412', '26.872229', 'whz2bguqp4');
INSERT INTO `model_nation` VALUES ('2886', '530721', '', '', '玉龙纳西族自治县', '2883', '100.238312', '26.830593', 'whz28ur79c');
INSERT INTO `model_nation` VALUES ('2887', '530722', '', '', '永胜县', '2883', '100.750901', '26.685623', 'whxxu9ux40');
INSERT INTO `model_nation` VALUES ('2888', '530723', '', '', '华坪县', '2883', '101.267796', '26.628834', 'wk8p2rsunw');
INSERT INTO `model_nation` VALUES ('2889', '530724', '', '', '宁蒗彝族自治县', '2883', '100.852427', '27.281109', 'whzenyq7zz');
INSERT INTO `model_nation` VALUES ('2890', '530800', '', '普洱市', '', '2824', '100.972344', '22.777321', 'whpc9dmzd0');
INSERT INTO `model_nation` VALUES ('2891', '530801', '', '', '市辖区', '2890', '100.972344', '22.777321', 'whpc9dmzd0');
INSERT INTO `model_nation` VALUES ('2892', '530802', '', '', '思茅区', '2890', '100.973227', '22.776595', 'whpc9dq7q9');
INSERT INTO `model_nation` VALUES ('2893', '530821', '', '', '宁洱哈尼族彝族自治县', '2890', '101.04524', '23.062507', 'whpg5q6uud');
INSERT INTO `model_nation` VALUES ('2894', '530822', '', '', '墨江哈尼族自治县', '2890', '101.687606', '23.428165', 'wk0m3bywuy');
INSERT INTO `model_nation` VALUES ('2895', '530823', '', '', '景东彝族自治县', '2890', '100.840011', '24.448523', 'whrendtqyx');
INSERT INTO `model_nation` VALUES ('2896', '530824', '', '', '景谷傣族彝族自治县', '2890', '100.701425', '23.500278', 'whptew0e13');
INSERT INTO `model_nation` VALUES ('2897', '530825', '', '', '镇沅彝族哈尼族拉祜族自治县', '2890', '101.108512', '24.005712', 'whrbsf0grj');
INSERT INTO `model_nation` VALUES ('2898', '530826', '', '', '江城哈尼族彝族自治县', '2890', '101.859144', '22.58336', 'wk02mz5td5');
INSERT INTO `model_nation` VALUES ('2899', '530827', '', '', '孟连傣族拉祜族佤族自治县', '2890', '99.585406', '22.325924', 'w5yz407cuj');
INSERT INTO `model_nation` VALUES ('2900', '530828', '', '', '澜沧拉祜族自治县', '2890', '99.931201', '22.553083', 'whp03cxtjz');
INSERT INTO `model_nation` VALUES ('2901', '530829', '', '', '西盟佤族自治县', '2890', '99.594372', '22.644423', 'whnbf663m4');
INSERT INTO `model_nation` VALUES ('2902', '530900', '', '临沧市', '', '2824', '100.08697', '23.886567', 'whppvs3j76');
INSERT INTO `model_nation` VALUES ('2903', '530901', '', '', '市辖区', '2902', '100.08697', '23.886567', 'whppvs3j76');
INSERT INTO `model_nation` VALUES ('2904', '530902', '', '', '临翔区', '2902', '100.086486', '23.886562', 'whppvs2v21');
INSERT INTO `model_nation` VALUES ('2905', '530921', '', '', '凤庆县', '2902', '99.91871', '24.592738', 'whr5csyx4d');
INSERT INTO `model_nation` VALUES ('2906', '530922', '', '', '云县', '2902', '100.125637', '24.439026', 'whr5n2vr8k');
INSERT INTO `model_nation` VALUES ('2907', '530923', '', '', '永德县', '2902', '99.253679', '24.028159', 'whq8dw4q4m');
INSERT INTO `model_nation` VALUES ('2908', '530924', '', '', '镇康县', '2902', '98.82743', '23.761415', 'whnr0veuq0');
INSERT INTO `model_nation` VALUES ('2909', '530925', '', '', '双江拉祜族佤族布朗族傣族自治县', '2902', '99.824419', '23.477476', 'whnvx9cyjw');
INSERT INTO `model_nation` VALUES ('2910', '530926', '', '', '耿马傣族佤族自治县', '2902', '99.402495', '23.534579', 'whntvuqdy5');
INSERT INTO `model_nation` VALUES ('2911', '530927', '', '', '沧源佤族自治县', '2902', '99.2474', '23.146887', 'whnedmvb2h');
INSERT INTO `model_nation` VALUES ('2912', '532300', '', '楚雄彝族自治州', '', '2824', '101.546046', '25.041988', 'wk2nqwz84k');
INSERT INTO `model_nation` VALUES ('2913', '532301', '', '', '楚雄市', '2912', '101.546145', '25.040912', 'wk2nqwx9us');
INSERT INTO `model_nation` VALUES ('2914', '532322', '', '', '双柏县', '2912', '101.63824', '24.685094', 'wk2k2vf9ne');
INSERT INTO `model_nation` VALUES ('2915', '532323', '', '', '牟定县', '2912', '101.543044', '25.312111', 'wk2pyxvmsr');
INSERT INTO `model_nation` VALUES ('2916', '532324', '', '', '南华县', '2912', '101.274991', '25.192408', 'wk2p2d4hqm');
INSERT INTO `model_nation` VALUES ('2917', '532325', '', '', '姚安县', '2912', '101.238399', '25.505403', 'whxcpepe9x');
INSERT INTO `model_nation` VALUES ('2918', '532326', '', '', '大姚县', '2912', '101.323602', '25.722348', 'wk843dtee1');
INSERT INTO `model_nation` VALUES ('2919', '532327', '', '', '永仁县', '2912', '101.671175', '26.056316', 'wk8k1x6tn1');
INSERT INTO `model_nation` VALUES ('2920', '532328', '', '', '元谋县', '2912', '101.870837', '25.703313', 'wk86nphhds');
INSERT INTO `model_nation` VALUES ('2921', '532329', '', '', '武定县', '2912', '102.406785', '25.5301', 'wk8c4rd7e5');
INSERT INTO `model_nation` VALUES ('2922', '532331', '', '', '禄丰县', '2912', '102.075694', '25.14327', 'wk2x4c1q0j');
INSERT INTO `model_nation` VALUES ('2923', '532500', '', '红河哈尼族彝族自治州', '', '2824', '103.384182', '23.366775', 'wk1sbtf164');
INSERT INTO `model_nation` VALUES ('2924', '532501', '', '', '个旧市', '2923', '103.154752', '23.360383', 'wk1kgkdupg');
INSERT INTO `model_nation` VALUES ('2925', '532502', '', '', '开远市', '2923', '103.258679', '23.713832', 'wk1qvsyxjd');
INSERT INTO `model_nation` VALUES ('2926', '532503', '', '', '蒙自市', '2923', '103.385005', '23.366843', 'wk1sbtf9tp');
INSERT INTO `model_nation` VALUES ('2927', '532504', '', '', '弥勒市', '2923', '103.436988', '24.40837', 'wk3dcg2t09');
INSERT INTO `model_nation` VALUES ('2928', '532523', '', '', '屏边苗族自治县', '2923', '103.687229', '22.987013', 'wk1dz2wtp9');
INSERT INTO `model_nation` VALUES ('2929', '532524', '', '', '建水县', '2923', '102.820493', '23.618387', 'wk1n7exe54');
INSERT INTO `model_nation` VALUES ('2930', '532525', '', '', '石屏县', '2923', '102.484469', '23.712569', 'wk0yuhdztp');
INSERT INTO `model_nation` VALUES ('2931', '532527', '', '', '泸西县', '2923', '103.759622', '24.532368', 'wk3g91grqk');
INSERT INTO `model_nation` VALUES ('2932', '532528', '', '', '元阳县', '2923', '102.837056', '23.219773', 'wk1hh558vp');
INSERT INTO `model_nation` VALUES ('2933', '532529', '', '', '红河县', '2923', '102.42121', '23.369191', 'wk0ufwhz7h');
INSERT INTO `model_nation` VALUES ('2934', '532530', '', '', '金平苗族瑶族傣族自治县', '2923', '103.228359', '22.779982', 'wk13t4bx50');
INSERT INTO `model_nation` VALUES ('2935', '532531', '', '', '绿春县', '2923', '102.39286', '22.99352', 'wk0ff1b4yw');
INSERT INTO `model_nation` VALUES ('2936', '532532', '', '', '河口瑶族自治县', '2923', '103.961593', '22.507563', 'wk1bj9qs09');
INSERT INTO `model_nation` VALUES ('2937', '532600', '', '文山壮族苗族自治州', '', '2824', '104.24401', '23.36951', 'wk4hunk1m2');
INSERT INTO `model_nation` VALUES ('2938', '532601', '', '', '文山市', '2937', '104.244277', '23.369216', 'wk4hunhre9');
INSERT INTO `model_nation` VALUES ('2939', '532622', '', '', '砚山县', '2937', '104.343989', '23.612301', 'wk4nq6kzx5');
INSERT INTO `model_nation` VALUES ('2940', '532623', '', '', '西畴县', '2937', '104.675711', '23.437439', 'wk4mmfwsbz');
INSERT INTO `model_nation` VALUES ('2941', '532624', '', '', '麻栗坡县', '2937', '104.701899', '23.124202', 'wk47w99s5p');
INSERT INTO `model_nation` VALUES ('2942', '532625', '', '', '马关县', '2937', '104.398619', '23.011723', 'wk44zthv00');
INSERT INTO `model_nation` VALUES ('2943', '532626', '', '', '丘北县', '2937', '104.194366', '24.040982', 'wk60g080be');
INSERT INTO `model_nation` VALUES ('2944', '532627', '', '', '广南县', '2937', '105.056684', '24.050272', 'wk68yd5yyp');
INSERT INTO `model_nation` VALUES ('2945', '532628', '', '', '富宁县', '2937', '105.62856', '23.626494', 'wk5n7th67c');
INSERT INTO `model_nation` VALUES ('2946', '532800', '', '西双版纳傣族自治州', '', '2824', '100.797941', '22.001724', 'w5ztjtqc66');
INSERT INTO `model_nation` VALUES ('2947', '532801', '', '', '景洪市', '2946', '100.797947', '22.002087', 'w5ztjtqg6q');
INSERT INTO `model_nation` VALUES ('2948', '532822', '', '', '勐海县', '2946', '100.448288', '21.955866', 'w5zkvubnny');
INSERT INTO `model_nation` VALUES ('2949', '532823', '', '', '勐腊县', '2946', '101.567051', '21.479449', 'w7b4pnnygg');
INSERT INTO `model_nation` VALUES ('2950', '532900', '', '大理白族自治州', '', '2824', '100.225668', '25.589449', 'whx38dqj77');
INSERT INTO `model_nation` VALUES ('2951', '532901', '', '', '大理市', '2950', '100.241369', '25.593067', 'whx3951d3j');
INSERT INTO `model_nation` VALUES ('2952', '532922', '', '', '漾濞彝族自治县', '2950', '99.95797', '25.669543', 'whx448gpvt');
INSERT INTO `model_nation` VALUES ('2953', '532923', '', '', '祥云县', '2950', '100.554025', '25.477072', 'whx8bjvnww');
INSERT INTO `model_nation` VALUES ('2954', '532924', '', '', '宾川县', '2950', '100.578957', '25.825904', 'whxdbtrqg9');
INSERT INTO `model_nation` VALUES ('2955', '532925', '', '', '弥渡县', '2950', '100.490669', '25.342594', 'whx2ntrp63');
INSERT INTO `model_nation` VALUES ('2956', '532926', '', '', '南涧彝族自治县', '2950', '100.518683', '25.041279', 'whrqrqekp0');
INSERT INTO `model_nation` VALUES ('2957', '532927', '', '', '巍山彝族回族自治县', '2950', '100.30793', '25.230909', 'whrrd94h8n');
INSERT INTO `model_nation` VALUES ('2958', '532928', '', '', '永平县', '2950', '99.533536', '25.461281', 'whwbbgn4eq');
INSERT INTO `model_nation` VALUES ('2959', '532929', '', '', '云龙县', '2950', '99.369402', '25.884955', 'whwem0nwfc');
INSERT INTO `model_nation` VALUES ('2960', '532930', '', '', '洱源县', '2950', '99.951708', '26.111184', 'whxhd3qset');
INSERT INTO `model_nation` VALUES ('2961', '532931', '', '', '剑川县', '2950', '99.905887', '26.530066', 'whxncmthzf');
INSERT INTO `model_nation` VALUES ('2962', '532932', '', '', '鹤庆县', '2950', '100.173375', '26.55839', 'whxppdb1bf');
INSERT INTO `model_nation` VALUES ('2963', '533100', '', '德宏傣族景颇族自治州', '', '2824', '98.578363', '24.436694', 'whq550wd43');
INSERT INTO `model_nation` VALUES ('2964', '533102', '', '', '瑞丽市', '2963', '97.855883', '24.010734', 'whm8dg02xm');
INSERT INTO `model_nation` VALUES ('2965', '533103', '', '', '芒市', '2963', '98.577608', '24.436699', 'whq550w40f');
INSERT INTO `model_nation` VALUES ('2966', '533122', '', '', '梁河县', '2963', '98.298196', '24.80742', 'whmvhu499y');
INSERT INTO `model_nation` VALUES ('2967', '533123', '', '', '盈江县', '2963', '97.93393', '24.709541', 'whmssd1r9b');
INSERT INTO `model_nation` VALUES ('2968', '533124', '', '', '陇川县', '2963', '97.794441', '24.184065', 'whm996edrs');
INSERT INTO `model_nation` VALUES ('2969', '533300', '', '怒江傈僳族自治州', '', '2824', '98.854304', '25.850949', 'whw716p88n');
INSERT INTO `model_nation` VALUES ('2970', '533321', '', '', '泸水县', '2969', '98.854063', '25.851142', 'whw716p3fd');
INSERT INTO `model_nation` VALUES ('2971', '533323', '', '', '福贡县', '2969', '98.867413', '26.902738', 'why31c3pc9');
INSERT INTO `model_nation` VALUES ('2972', '533324', '', '', '贡山独龙族怒族自治县', '2969', '98.666141', '27.738054', 'whyjv1w3zs');
INSERT INTO `model_nation` VALUES ('2973', '533325', '', '', '兰坪白族普米族自治县', '2969', '99.421378', '26.453839', 'whwwqru2y1');
INSERT INTO `model_nation` VALUES ('2974', '533400', '', '迪庆藏族自治州', '', '2824', '99.706463', '27.826853', 'whyykcsp0v');
INSERT INTO `model_nation` VALUES ('2975', '533401', '', '', '香格里拉市', '2974', '99.706463', '27.826853', 'whyykcsp0v');
INSERT INTO `model_nation` VALUES ('2976', '533422', '', '', '德钦县', '2974', '98.91506', '28.483272', 'wjn64c5xpf');
INSERT INTO `model_nation` VALUES ('2977', '533423', '', '', '维西傈僳族自治县', '2974', '99.286355', '27.180948', 'whydek4h7z');
INSERT INTO `model_nation` VALUES ('2978', '540000', '西藏自治区', '', '', '1', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2979', '540100', '', '拉萨市', '', '2978', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2980', '540101', '', '', '市辖区', '2979', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2981', '540102', '', '', '城关区', '2979', '91.132911', '29.659472', 'wj2b9z2fyw');
INSERT INTO `model_nation` VALUES ('2982', '540121', '', '', '林周县', '2979', '91.261842', '29.895754', 'wj2fhdqg7h');
INSERT INTO `model_nation` VALUES ('2983', '540122', '', '', '当雄县', '2979', '91.103551', '30.474819', 'wj2v35g8dw');
INSERT INTO `model_nation` VALUES ('2984', '540123', '', '', '尼木县', '2979', '90.165545', '29.431346', 'wj0p7vbd12');
INSERT INTO `model_nation` VALUES ('2985', '540124', '', '', '曲水县', '2979', '90.738051', '29.349895', 'wj0wbycrtb');
INSERT INTO `model_nation` VALUES ('2986', '540125', '', '', '堆龙德庆县', '2979', '91.002823', '29.647347', 'wj28wv4hr6');
INSERT INTO `model_nation` VALUES ('2987', '540126', '', '', '达孜县', '2979', '91.350976', '29.670314', 'wj2by9rf05');
INSERT INTO `model_nation` VALUES ('2988', '540127', '', '', '墨竹工卡县', '2979', '91.731158', '29.834657', 'wj31xrhx6z');
INSERT INTO `model_nation` VALUES ('2989', '540200', '', '日喀则市', '', '2978', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2990', '540201', '', '', '市辖区', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2991', '540202', '', '', '桑珠孜区', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2992', '540221', '', '', '南木林县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2993', '540222', '', '', '江孜县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2994', '540223', '', '', '定日县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2995', '540224', '', '', '萨迦县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2996', '540225', '', '', '拉孜县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2997', '540226', '', '', '昂仁县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2998', '540227', '', '', '谢通门县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('2999', '540228', '', '', '白朗县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3000', '540229', '', '', '仁布县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3001', '540230', '', '', '康马县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3002', '540231', '', '', '定结县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3003', '540232', '', '', '仲巴县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3004', '540233', '', '', '亚东县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3005', '540234', '', '', '吉隆县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3006', '540235', '', '', '聂拉木县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3007', '540236', '', '', '萨嘎县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3008', '540237', '', '', '岗巴县', '2989', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3009', '540300', '', '昌都市', '', '2978', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3010', '540301', '', '', '市辖区', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3011', '540302', '', '', '卡若区', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3012', '540321', '', '', '江达县', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3013', '540322', '', '', '贡觉县', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3014', '540323', '', '', '类乌齐县', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3015', '540324', '', '', '丁青县', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3016', '540325', '', '', '察雅县', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3017', '540326', '', '', '八宿县', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3018', '540327', '', '', '左贡县', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3019', '540328', '', '', '芒康县', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3020', '540329', '', '', '洛隆县', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3021', '540330', '', '', '边坝县', '3009', '91.132212', '29.660361', 'wj2b9z82nk');
INSERT INTO `model_nation` VALUES ('3022', '542200', '', '山南地区', '', '2978', '91.766529', '29.236023', 'wj1q24q25j');
INSERT INTO `model_nation` VALUES ('3023', '542221', '', '', '乃东县', '3022', '91.76525', '29.236106', 'wj1q24m2tm');
INSERT INTO `model_nation` VALUES ('3024', '542222', '', '', '扎囊县', '3022', '91.338', '29.246476', 'wj0yqknm1d');
INSERT INTO `model_nation` VALUES ('3025', '542223', '', '', '贡嘎县', '3022', '90.985271', '29.289078', 'wj0ww7vmnr');
INSERT INTO `model_nation` VALUES ('3026', '542224', '', '', '桑日县', '3022', '92.015732', '29.259774', 'wj1qmyef9c');
INSERT INTO `model_nation` VALUES ('3027', '542225', '', '', '琼结县', '3022', '91.683753', '29.025242', 'wj1jn7fh63');
INSERT INTO `model_nation` VALUES ('3028', '542226', '', '', '曲松县', '3022', '92.201066', '29.063656', 'wj1t64fu0d');
INSERT INTO `model_nation` VALUES ('3029', '542227', '', '', '措美县', '3022', '91.432347', '28.437353', 'wj11b8g584');
INSERT INTO `model_nation` VALUES ('3030', '542228', '', '', '洛扎县', '3022', '90.858243', '28.385765', 'wj097x2znd');
INSERT INTO `model_nation` VALUES ('3031', '542229', '', '', '加查县', '3022', '92.591043', '29.140921', 'wj1vfbywpt');
INSERT INTO `model_nation` VALUES ('3032', '542231', '', '', '隆子县', '3022', '92.463309', '28.408548', 'wj1c859ez3');
INSERT INTO `model_nation` VALUES ('3033', '542232', '', '', '错那县', '3022', '91.960132', '27.991707', 'whcrhxerd2');
INSERT INTO `model_nation` VALUES ('3034', '542233', '', '', '浪卡子县', '3022', '90.398747', '28.96836', 'wj0kc1d2gm');
INSERT INTO `model_nation` VALUES ('3035', '542400', '', '那曲地区', '', '2978', '92.060214', '31.476004', 'wj97nfh1n2');
INSERT INTO `model_nation` VALUES ('3036', '542421', '', '', '那曲县', '3035', '92.061862', '31.475756', 'wj97ncvrsf');
INSERT INTO `model_nation` VALUES ('3037', '542422', '', '', '嘉黎县', '3035', '93.232907', '30.640846', 'wj6q39fpu5');
INSERT INTO `model_nation` VALUES ('3038', '542423', '', '', '比如县', '3035', '93.68044', '31.479917', 'wjde5f8pb3');
INSERT INTO `model_nation` VALUES ('3039', '542424', '', '', '聂荣县', '3035', '92.303659', '32.107855', 'wj9wsmj3z1');
INSERT INTO `model_nation` VALUES ('3040', '542425', '', '', '安多县', '3035', '91.681879', '32.260299', 'wj9pw2b9ye');
INSERT INTO `model_nation` VALUES ('3041', '542426', '', '', '申扎县', '3035', '88.709777', '30.929056', 'tvrpfwkqz9');
INSERT INTO `model_nation` VALUES ('3042', '542427', '', '', '索县', '3035', '93.784964', '31.886173', 'wjdtqhsnkj');
INSERT INTO `model_nation` VALUES ('3043', '542428', '', '', '班戈县', '3035', '90.011822', '31.394578', 'wj84870wem');
INSERT INTO `model_nation` VALUES ('3044', '542429', '', '', '巴青县', '3035', '94.054049', '31.918691', 'wjdvs685f5');
INSERT INTO `model_nation` VALUES ('3045', '542430', '', '', '尼玛县', '3035', '87.236646', '31.784979', 'tvwhc47bcj');
INSERT INTO `model_nation` VALUES ('3046', '542431', '', '', '双湖县', '3035', '88.838578', '33.18698', 'tvzhv9d20v');
INSERT INTO `model_nation` VALUES ('3047', '542500', '', '阿里地区', '', '2978', '80.105498', '32.503187', 'tvbbyv50c3');
INSERT INTO `model_nation` VALUES ('3048', '542521', '', '', '普兰县', '3047', '81.177588', '30.291896', 'tv3sr4rxnf');
INSERT INTO `model_nation` VALUES ('3049', '542522', '', '', '札达县', '3047', '79.803191', '31.478587', 'tv8epfwbj1');
INSERT INTO `model_nation` VALUES ('3050', '542523', '', '', '噶尔县', '3047', '80.105005', '32.503373', 'tvbbyv49vg');
INSERT INTO `model_nation` VALUES ('3051', '542524', '', '', '日土县', '3047', '79.731937', '33.382454', 'tvbtym54bu');
INSERT INTO `model_nation` VALUES ('3052', '542525', '', '', '革吉县', '3047', '81.142896', '32.389192', 'tvc8q2q2wx');
INSERT INTO `model_nation` VALUES ('3053', '542526', '', '', '改则县', '3047', '84.062384', '32.302076', 'tvezbbkm5x');
INSERT INTO `model_nation` VALUES ('3054', '542527', '', '', '措勤县', '3047', '85.159254', '31.016774', 'tvs83y7jf3');
INSERT INTO `model_nation` VALUES ('3055', '542600', '', '林芝地区', '', '2978', '94.362348', '29.654693', 'wj70eq2x45');
INSERT INTO `model_nation` VALUES ('3056', '542621', '', '', '林芝县', '3055', '94.360987', '29.653732', 'wj70enr9d2');
INSERT INTO `model_nation` VALUES ('3057', '542622', '', '', '工布江达县', '3055', '93.246515', '29.88447', 'wj661bk19k');
INSERT INTO `model_nation` VALUES ('3058', '542623', '', '', '米林县', '3055', '94.213679', '29.213811', 'wj4ypyhqcc');
INSERT INTO `model_nation` VALUES ('3059', '542624', '', '', '墨脱县', '3055', '95.332245', '29.32573', 'wj5yc6dff2');
INSERT INTO `model_nation` VALUES ('3060', '542625', '', '', '波密县', '3055', '95.768151', '29.858771', 'wjk1g785zw');
INSERT INTO `model_nation` VALUES ('3061', '542626', '', '', '察隅县', '3055', '97.465002', '28.660244', 'wjj71c7y50');
INSERT INTO `model_nation` VALUES ('3062', '542627', '', '', '朗县', '3055', '93.073429', '29.0446', 'wj4jjzqj01');
INSERT INTO `model_nation` VALUES ('3063', '610000', '陕西省', '', '', '1', '108.948024', '34.263161', 'wqj6zjmt2u');
INSERT INTO `model_nation` VALUES ('3064', '610100', '', '西安市', '', '3063', '108.948024', '34.263161', 'wqj6zjmt2u');
INSERT INTO `model_nation` VALUES ('3065', '610101', '', '', '市辖区', '3064', '108.948024', '34.263161', 'wqj6zjmt2u');
INSERT INTO `model_nation` VALUES ('3066', '610102', '', '', '新城区', '3064', '108.959903', '34.26927', 'wqj6zqw0vy');
INSERT INTO `model_nation` VALUES ('3067', '610103', '', '', '碑林区', '3064', '108.946994', '34.251061', 'wqj6z5hybu');
INSERT INTO `model_nation` VALUES ('3068', '610104', '', '', '莲湖区', '3064', '108.933194', '34.2656', 'wqj6yvfex6');
INSERT INTO `model_nation` VALUES ('3069', '610111', '', '', '灞桥区', '3064', '109.067261', '34.267453', 'wqjdcyhq7k');
INSERT INTO `model_nation` VALUES ('3070', '610112', '', '', '未央区', '3064', '108.946022', '34.30823', 'wqj7pjs5fm');
INSERT INTO `model_nation` VALUES ('3071', '610113', '', '', '雁塔区', '3064', '108.926593', '34.213389', 'wqj6wsmgmt');
INSERT INTO `model_nation` VALUES ('3072', '610114', '', '', '阎良区', '3064', '109.22802', '34.662141', 'wqjtjw13t7');
INSERT INTO `model_nation` VALUES ('3073', '610115', '', '', '临潼区', '3064', '109.213986', '34.372065', 'wqjet1ppy3');
INSERT INTO `model_nation` VALUES ('3074', '610116', '', '', '长安区', '3064', '108.941579', '34.157097', 'wqj6r40gdb');
INSERT INTO `model_nation` VALUES ('3075', '610117', '', '', '高陵区', '3064', '108.948024', '34.263161', 'wqj6zjmt2u');
INSERT INTO `model_nation` VALUES ('3076', '610122', '', '', '蓝田县', '3064', '109.317634', '34.156189', 'wqjdr9fwjr');
INSERT INTO `model_nation` VALUES ('3077', '610124', '', '', '周至县', '3064', '108.216465', '34.161532', 'wqhfqdbv67');
INSERT INTO `model_nation` VALUES ('3078', '610125', '', '', '户县', '3064', '108.607385', '34.108668', 'wqj4p3m3rk');
INSERT INTO `model_nation` VALUES ('3079', '610200', '', '铜川市', '', '3063', '108.979608', '34.916582', 'wqjqxukebf');
INSERT INTO `model_nation` VALUES ('3080', '610201', '', '', '市辖区', '3079', '108.979608', '34.916582', 'wqjqxukebf');
INSERT INTO `model_nation` VALUES ('3081', '610202', '', '', '王益区', '3079', '109.075862', '35.069098', 'wqjxd04s7c');
INSERT INTO `model_nation` VALUES ('3082', '610203', '', '', '印台区', '3079', '109.100814', '35.111927', 'wqjxdxuvc1');
INSERT INTO `model_nation` VALUES ('3083', '610204', '', '', '耀州区', '3079', '108.962538', '34.910206', 'wqjqxe0nen');
INSERT INTO `model_nation` VALUES ('3084', '610222', '', '', '宜君县', '3079', '109.118278', '35.398766', 'wqm97h1sb0');
INSERT INTO `model_nation` VALUES ('3085', '610300', '', '宝鸡市', '', '3063', '107.14487', '34.369315', 'wqh5w0sxb2');
INSERT INTO `model_nation` VALUES ('3086', '610301', '', '', '市辖区', '3085', '107.14487', '34.369315', 'wqh5w0sxb2');
INSERT INTO `model_nation` VALUES ('3087', '610302', '', '', '渭滨区', '3085', '107.144467', '34.371008', 'wqh5w1h1xh');
INSERT INTO `model_nation` VALUES ('3088', '610303', '', '', '金台区', '3085', '107.149943', '34.375192', 'wqh5w3b4n8');
INSERT INTO `model_nation` VALUES ('3089', '610304', '', '', '陈仓区', '3085', '107.383645', '34.352747', 'wqh77tdrk2');
INSERT INTO `model_nation` VALUES ('3090', '610322', '', '', '凤翔县', '3085', '107.400577', '34.521668', 'wqhk7uqxqc');
INSERT INTO `model_nation` VALUES ('3091', '610323', '', '', '岐山县', '3085', '107.624464', '34.44296', 'wqhecn1szc');
INSERT INTO `model_nation` VALUES ('3092', '610324', '', '', '扶风县', '3085', '107.891419', '34.375497', 'wqhex1u5u3');
INSERT INTO `model_nation` VALUES ('3093', '610326', '', '', '眉县', '3085', '107.752371', '34.272137', 'wqhdgzncsj');
INSERT INTO `model_nation` VALUES ('3094', '610327', '', '', '陇县', '3085', '106.857066', '34.893262', 'wq5yx84gyp');
INSERT INTO `model_nation` VALUES ('3095', '610328', '', '', '千阳县', '3085', '107.132987', '34.642584', 'wqhjjf7zet');
INSERT INTO `model_nation` VALUES ('3096', '610329', '', '', '麟游县', '3085', '107.796608', '34.677714', 'wqhtkbzh74');
INSERT INTO `model_nation` VALUES ('3097', '610330', '', '', '凤县', '3085', '106.525212', '33.912464', 'wq5bbj963m');
INSERT INTO `model_nation` VALUES ('3098', '610331', '', '', '太白县', '3085', '107.316533', '34.059215', 'wqh3f03923');
INSERT INTO `model_nation` VALUES ('3099', '610400', '', '咸阳市', '', '3063', '108.705117', '34.333439', 'wqj73dhwub');
INSERT INTO `model_nation` VALUES ('3100', '610401', '', '', '市辖区', '3099', '108.705117', '34.333439', 'wqj73dhwub');
INSERT INTO `model_nation` VALUES ('3101', '610402', '', '', '秦都区', '3099', '108.698636', '34.329801', 'wqj733xctf');
INSERT INTO `model_nation` VALUES ('3102', '610403', '', '', '杨陵区', '3099', '108.086348', '34.27135', 'wqhfgwfj46');
INSERT INTO `model_nation` VALUES ('3103', '610404', '', '', '渭城区', '3099', '108.730957', '34.336847', 'wqj764z6wu');
INSERT INTO `model_nation` VALUES ('3104', '610422', '', '', '三原县', '3099', '108.943481', '34.613996', 'wqjkzj61ph');
INSERT INTO `model_nation` VALUES ('3105', '610423', '', '', '泾阳县', '3099', '108.83784', '34.528493', 'wqjkkttr13');
INSERT INTO `model_nation` VALUES ('3106', '610424', '', '', '乾县', '3099', '108.247406', '34.527261', 'wqhurjrrg7');
INSERT INTO `model_nation` VALUES ('3107', '610425', '', '', '礼泉县', '3099', '108.428317', '34.482583', 'wqjh5m75dg');
INSERT INTO `model_nation` VALUES ('3108', '610426', '', '', '永寿县', '3099', '108.143129', '34.692619', 'wqhvkge7js');
INSERT INTO `model_nation` VALUES ('3109', '610427', '', '', '彬县', '3099', '108.083674', '35.034233', 'wqhz79b1hn');
INSERT INTO `model_nation` VALUES ('3110', '610428', '', '', '长武县', '3099', '107.795835', '35.206122', 'wqk8kcnd90');
INSERT INTO `model_nation` VALUES ('3111', '610429', '', '', '旬邑县', '3099', '108.337231', '35.112234', 'wqjp9rbz86');
INSERT INTO `model_nation` VALUES ('3112', '610430', '', '', '淳化县', '3099', '108.581173', '34.79797', 'wqjjyyf2ue');
INSERT INTO `model_nation` VALUES ('3113', '610431', '', '', '武功县', '3099', '108.212857', '34.259732', 'wqhfyky1qk');
INSERT INTO `model_nation` VALUES ('3114', '610481', '', '', '兴平市', '3099', '108.488493', '34.297134', 'wqj5hewgm1');
INSERT INTO `model_nation` VALUES ('3115', '610500', '', '渭南市', '', '3063', '109.502882', '34.499381', 'wqju7b3t6n');
INSERT INTO `model_nation` VALUES ('3116', '610501', '', '', '市辖区', '3115', '109.502882', '34.499381', 'wqju7b3t6n');
INSERT INTO `model_nation` VALUES ('3117', '610502', '', '', '临渭区', '3115', '109.503299', '34.501271', 'wqju7bcb7z');
INSERT INTO `model_nation` VALUES ('3118', '610521', '', '', '华县', '3115', '109.76141', '34.511958', 'wqnh3dtydp');
INSERT INTO `model_nation` VALUES ('3119', '610522', '', '', '潼关县', '3115', '110.24726', '34.544515', 'wqnks8xs7k');
INSERT INTO `model_nation` VALUES ('3120', '610523', '', '', '大荔县', '3115', '109.943123', '34.795011', 'wqnjvy4psk');
INSERT INTO `model_nation` VALUES ('3121', '610524', '', '', '合阳县', '3115', '110.147979', '35.237098', 'wqq26qxqcz');
INSERT INTO `model_nation` VALUES ('3122', '610525', '', '', '澄城县', '3115', '109.937609', '35.184', 'wqq0jtn1eu');
INSERT INTO `model_nation` VALUES ('3123', '610526', '', '', '蒲城县', '3115', '109.589653', '34.956034', 'wqjyvg89xv');
INSERT INTO `model_nation` VALUES ('3124', '610527', '', '', '白水县', '3115', '109.594309', '35.177291', 'wqmbjgu4s6');
INSERT INTO `model_nation` VALUES ('3125', '610528', '', '', '富平县', '3115', '109.187174', '34.746679', 'wqjtst7wjd');
INSERT INTO `model_nation` VALUES ('3126', '610581', '', '', '韩城市', '3115', '110.452391', '35.475238', 'wqq9c6hfpr');
INSERT INTO `model_nation` VALUES ('3127', '610582', '', '', '华阴市', '3115', '110.08952', '34.565359', 'wqnk9hktz9');
INSERT INTO `model_nation` VALUES ('3128', '610600', '', '延安市', '', '3063', '109.49081', '36.596537', 'wqtb5w0y2b');
INSERT INTO `model_nation` VALUES ('3129', '610601', '', '', '市辖区', '3128', '109.49081', '36.596537', 'wqtb5w0y2b');
INSERT INTO `model_nation` VALUES ('3130', '610602', '', '', '宝塔区', '3128', '109.49069', '36.596291', 'wqtb5w0svg');
INSERT INTO `model_nation` VALUES ('3131', '610621', '', '', '延长县', '3128', '110.012961', '36.578306', 'wqw0p6uupf');
INSERT INTO `model_nation` VALUES ('3132', '610622', '', '', '延川县', '3128', '110.190314', '36.882066', 'wqw3g6njs7');
INSERT INTO `model_nation` VALUES ('3133', '610623', '', '', '子长县', '3128', '109.675968', '37.14207', 'wqtgr9x85r');
INSERT INTO `model_nation` VALUES ('3134', '610624', '', '', '安塞县', '3128', '109.325341', '36.86441', 'wqt9xybqc0');
INSERT INTO `model_nation` VALUES ('3135', '610625', '', '', '志丹县', '3128', '108.768898', '36.823031', 'wqt37p7jen');
INSERT INTO `model_nation` VALUES ('3136', '610626', '', '', '吴起县', '3128', '108.176976', '36.924852', 'wqsfj9unf5');
INSERT INTO `model_nation` VALUES ('3137', '610627', '', '', '甘泉县', '3128', '109.34961', '36.277729', 'wqmy2k1vnd');
INSERT INTO `model_nation` VALUES ('3138', '610628', '', '', '富县', '3128', '109.384136', '35.996495', 'wqmuc0gng1');
INSERT INTO `model_nation` VALUES ('3139', '610629', '', '', '洛川县', '3128', '109.435712', '35.762133', 'wqmg6q29sb');
INSERT INTO `model_nation` VALUES ('3140', '610630', '', '', '宜川县', '3128', '110.175537', '36.050391', 'wqqm54g2sp');
INSERT INTO `model_nation` VALUES ('3141', '610631', '', '', '黄龙县', '3128', '109.83502', '35.583276', 'wqq47mert7');
INSERT INTO `model_nation` VALUES ('3142', '610632', '', '', '黄陵县', '3128', '109.262469', '35.580165', 'wqmdqm4t2p');
INSERT INTO `model_nation` VALUES ('3143', '610700', '', '汉中市', '', '3063', '107.028621', '33.077668', 'wmuh5mxg7s');
INSERT INTO `model_nation` VALUES ('3144', '610701', '', '', '市辖区', '3143', '107.028621', '33.077668', 'wmuh5mxg7s');
INSERT INTO `model_nation` VALUES ('3145', '610702', '', '', '汉台区', '3143', '107.028233', '33.077674', 'wmuh5mxe6t');
INSERT INTO `model_nation` VALUES ('3146', '610721', '', '', '南郑县', '3143', '106.942393', '33.003341', 'wmu5c8146k');
INSERT INTO `model_nation` VALUES ('3147', '610722', '', '', '城固县', '3143', '107.329887', '33.153098', 'wmukd774z9');
INSERT INTO `model_nation` VALUES ('3148', '610723', '', '', '洋县', '3143', '107.549962', '33.223283', 'wmump257xu');
INSERT INTO `model_nation` VALUES ('3149', '610724', '', '', '西乡县', '3143', '107.765858', '32.987961', 'wmuesm28y3');
INSERT INTO `model_nation` VALUES ('3150', '610725', '', '', '勉县', '3143', '106.680175', '33.155618', 'wmgueef1kp');
INSERT INTO `model_nation` VALUES ('3151', '610726', '', '', '宁强县', '3143', '106.25739', '32.830806', 'wmgdcbwm29');
INSERT INTO `model_nation` VALUES ('3152', '610727', '', '', '略阳县', '3143', '106.153899', '33.329638', 'wmgmxe6zjn');
INSERT INTO `model_nation` VALUES ('3153', '610728', '', '', '镇巴县', '3143', '107.89531', '32.535854', 'wmu9p4yznf');
INSERT INTO `model_nation` VALUES ('3154', '610729', '', '', '留坝县', '3143', '106.924377', '33.61334', 'wmup1p5gys');
INSERT INTO `model_nation` VALUES ('3155', '610730', '', '', '佛坪县', '3143', '107.988582', '33.520745', 'wmuy9q6bkr');
INSERT INTO `model_nation` VALUES ('3156', '610800', '', '榆林市', '', '3063', '109.741193', '38.290162', 'wqy1c4x075');
INSERT INTO `model_nation` VALUES ('3157', '610801', '', '', '市辖区', '3156', '109.741193', '38.290162', 'wqy1c4x075');
INSERT INTO `model_nation` VALUES ('3158', '610802', '', '', '榆阳区', '3156', '109.74791', '38.299267', 'wqy1ck5vrs');
INSERT INTO `model_nation` VALUES ('3159', '610821', '', '', '神木县', '3156', '110.497005', '38.835641', 'wqysfmv6nb');
INSERT INTO `model_nation` VALUES ('3160', '610822', '', '', '府谷县', '3156', '111.069645', '39.029243', 'wqyyp3n3y6');
INSERT INTO `model_nation` VALUES ('3161', '610823', '', '', '横山县', '3156', '109.292596', '37.964048', 'wqtxzp0kw5');
INSERT INTO `model_nation` VALUES ('3162', '610824', '', '', '靖边县', '3156', '108.80567', '37.596084', 'wqtmgujv5f');
INSERT INTO `model_nation` VALUES ('3163', '610825', '', '', '定边县', '3156', '107.601284', '37.59523', 'wqstbs0b5d');
INSERT INTO `model_nation` VALUES ('3164', '610826', '', '', '绥德县', '3156', '110.265377', '37.507701', 'wqwmmhhf1w');
INSERT INTO `model_nation` VALUES ('3165', '610827', '', '', '米脂县', '3156', '110.178683', '37.759081', 'wqwqg1vdt6');
INSERT INTO `model_nation` VALUES ('3166', '610828', '', '', '佳县', '3156', '110.493367', '38.021597', 'wqy863dgf5');
INSERT INTO `model_nation` VALUES ('3167', '610829', '', '', '吴堡县', '3156', '110.739315', '37.451925', 'wqwtpcvvm0');
INSERT INTO `model_nation` VALUES ('3168', '610830', '', '', '清涧县', '3156', '110.12146', '37.087702', 'wqw6czs580');
INSERT INTO `model_nation` VALUES ('3169', '610831', '', '', '子洲县', '3156', '110.03457', '37.611573', 'wqwjzyuxr3');
INSERT INTO `model_nation` VALUES ('3170', '610900', '', '安康市', '', '3063', '109.029273', '32.6903', 'wmv9cp0dy1');
INSERT INTO `model_nation` VALUES ('3171', '610901', '', '', '市辖区', '3170', '109.029273', '32.6903', 'wmv9cp0dy1');
INSERT INTO `model_nation` VALUES ('3172', '610902', '', '', '汉滨区', '3170', '109.029098', '32.690817', 'wmv9cp0tf1');
INSERT INTO `model_nation` VALUES ('3173', '610921', '', '', '汉阴县', '3170', '108.510946', '32.891121', 'wmv5j5xk8m');
INSERT INTO `model_nation` VALUES ('3174', '610922', '', '', '石泉县', '3170', '108.250512', '33.038512', 'wmugzq3x7c');
INSERT INTO `model_nation` VALUES ('3175', '610923', '', '', '宁陕县', '3170', '108.313714', '33.312184', 'wmvj88r9s3');
INSERT INTO `model_nation` VALUES ('3176', '610924', '', '', '紫阳县', '3170', '108.537788', '32.520176', 'wmv1jb4gcb');
INSERT INTO `model_nation` VALUES ('3177', '610925', '', '', '岚皋县', '3170', '108.900663', '32.31069', 'wmtry1gp3m');
INSERT INTO `model_nation` VALUES ('3178', '610926', '', '', '平利县', '3170', '109.361865', '32.387933', 'wmvb284ckh');
INSERT INTO `model_nation` VALUES ('3179', '610927', '', '', '镇坪县', '3170', '109.526437', '31.883395', 'wmtvkk4wnz');
INSERT INTO `model_nation` VALUES ('3180', '610928', '', '', '旬阳县', '3170', '109.368149', '32.833567', 'wmvfb9pmqs');
INSERT INTO `model_nation` VALUES ('3181', '610929', '', '', '白河县', '3170', '110.114186', '32.809484', 'wmy69sy9ne');
INSERT INTO `model_nation` VALUES ('3182', '611000', '', '商洛市', '', '3063', '109.939776', '33.868319', 'wqn0ttx9q2');
INSERT INTO `model_nation` VALUES ('3183', '611001', '', '', '市辖区', '3182', '109.939776', '33.868319', 'wqn0ttx9q2');
INSERT INTO `model_nation` VALUES ('3184', '611002', '', '', '商州区', '3182', '109.937685', '33.869208', 'wqn0ttwnmt');
INSERT INTO `model_nation` VALUES ('3185', '611021', '', '', '洛南县', '3182', '110.145716', '34.088502', 'wqn3fmtevj');
INSERT INTO `model_nation` VALUES ('3186', '611022', '', '', '丹凤县', '3182', '110.33191', '33.694711', 'wmyrwtvjzv');
INSERT INTO `model_nation` VALUES ('3187', '611023', '', '', '商南县', '3182', '110.885437', '33.526367', 'wmyyer231z');
INSERT INTO `model_nation` VALUES ('3188', '611024', '', '', '山阳县', '3182', '109.880435', '33.530411', 'wmynu2h2z9');
INSERT INTO `model_nation` VALUES ('3189', '611025', '', '', '镇安县', '3182', '109.151075', '33.423981', 'wmvw5u9ku3');
INSERT INTO `model_nation` VALUES ('3190', '611026', '', '', '柞水县', '3182', '109.111249', '33.682773', 'wmvxdgu2k7');
INSERT INTO `model_nation` VALUES ('3191', '620000', '甘肃省', '', '', '1', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3192', '620100', '', '兰州市', '', '3191', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3193', '620101', '', '', '市辖区', '3192', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3194', '620102', '', '', '城关区', '3192', '103.841032', '36.049115', 'wq3v4fw9r6');
INSERT INTO `model_nation` VALUES ('3195', '620103', '', '', '七里河区', '3192', '103.784326', '36.06673', 'wq3v1ttryj');
INSERT INTO `model_nation` VALUES ('3196', '620104', '', '', '西固区', '3192', '103.622331', '36.100369', 'wq3tmgz7zk');
INSERT INTO `model_nation` VALUES ('3197', '620105', '', '', '安宁区', '3192', '103.724038', '36.10329', 'wq3v2k3scm');
INSERT INTO `model_nation` VALUES ('3198', '620111', '', '', '红古区', '3192', '102.861814', '36.344177', 'wq3nu8m8jv');
INSERT INTO `model_nation` VALUES ('3199', '620121', '', '', '永登县', '3192', '103.262203', '36.734428', 'wq92vz31x9');
INSERT INTO `model_nation` VALUES ('3200', '620122', '', '', '皋兰县', '3192', '103.94933', '36.331254', 'wq3ytmvsfu');
INSERT INTO `model_nation` VALUES ('3201', '620123', '', '', '榆中县', '3192', '104.114975', '35.84443', 'wq65cjq0yy');
INSERT INTO `model_nation` VALUES ('3202', '620200', '', '嘉峪关市', '', '3191', '98.277304', '39.786529', 'wpjfk6gm74');
INSERT INTO `model_nation` VALUES ('3203', '620201', '', '', '市辖区', '3202', '98.277304', '39.786529', 'wpjfk6gm74');
INSERT INTO `model_nation` VALUES ('3204', '620300', '', '金昌市', '', '3191', '102.187888', '38.514238', 'wqbej76cwq');
INSERT INTO `model_nation` VALUES ('3205', '620301', '', '', '市辖区', '3204', '102.187888', '38.514238', 'wqbej76cwq');
INSERT INTO `model_nation` VALUES ('3206', '620302', '', '', '金川区', '3204', '102.187683', '38.513793', 'wqbej74z1e');
INSERT INTO `model_nation` VALUES ('3207', '620321', '', '', '永昌县', '3204', '101.971957', '38.247354', 'wqb986twyz');
INSERT INTO `model_nation` VALUES ('3208', '620400', '', '白银市', '', '3191', '104.173606', '36.54568', 'wq6pfsbyhb');
INSERT INTO `model_nation` VALUES ('3209', '620401', '', '', '市辖区', '3208', '104.173606', '36.54568', 'wq6pfsbyhb');
INSERT INTO `model_nation` VALUES ('3210', '620402', '', '', '白银区', '3208', '104.17425', '36.545649', 'wq6pfscmgf');
INSERT INTO `model_nation` VALUES ('3211', '620403', '', '', '平川区', '3208', '104.819207', '36.72921', 'wqd8cnr50s');
INSERT INTO `model_nation` VALUES ('3212', '620421', '', '', '靖远县', '3208', '104.686972', '36.561424', 'wq6rypy9xr');
INSERT INTO `model_nation` VALUES ('3213', '620422', '', '', '会宁县', '3208', '105.054337', '35.692486', 'wq6en9d5z3');
INSERT INTO `model_nation` VALUES ('3214', '620423', '', '', '景泰县', '3208', '104.066394', '37.193519', 'wqd584fgfw');
INSERT INTO `model_nation` VALUES ('3215', '620500', '', '天水市', '', '3191', '105.724998', '34.578529', 'wq5htyfde0');
INSERT INTO `model_nation` VALUES ('3216', '620501', '', '', '市辖区', '3215', '105.724998', '34.578529', 'wq5htyfde0');
INSERT INTO `model_nation` VALUES ('3217', '620502', '', '', '秦州区', '3215', '105.724477', '34.578645', 'wq5htyf5ny');
INSERT INTO `model_nation` VALUES ('3218', '620503', '', '', '麦积区', '3215', '105.897631', '34.563504', 'wq5k9u0718');
INSERT INTO `model_nation` VALUES ('3219', '620521', '', '', '清水县', '3215', '106.139878', '34.75287', 'wq5mxq8dnk');
INSERT INTO `model_nation` VALUES ('3220', '620522', '', '', '秦安县', '3215', '105.6733', '34.862354', 'wq5nkdkzym');
INSERT INTO `model_nation` VALUES ('3221', '620523', '', '', '甘谷县', '3215', '105.332347', '34.747327', 'wq4vsvs9ve');
INSERT INTO `model_nation` VALUES ('3222', '620524', '', '', '武山县', '3215', '104.891696', '34.721955', 'wq4tdbgy19');
INSERT INTO `model_nation` VALUES ('3223', '620525', '', '', '张家川回族自治县', '3215', '106.212416', '34.993237', 'wq5x0fmd2s');
INSERT INTO `model_nation` VALUES ('3224', '620600', '', '武威市', '', '3191', '102.634697', '37.929996', 'wq8zz8bq1z');
INSERT INTO `model_nation` VALUES ('3225', '620601', '', '', '市辖区', '3224', '102.634697', '37.929996', 'wq8zz8bq1z');
INSERT INTO `model_nation` VALUES ('3226', '620602', '', '', '凉州区', '3224', '102.634492', '37.93025', 'wq8zz8bptp');
INSERT INTO `model_nation` VALUES ('3227', '620621', '', '', '民勤县', '3224', '103.090654', '38.624621', 'wqc79zkkdr');
INSERT INTO `model_nation` VALUES ('3228', '620622', '', '', '古浪县', '3224', '102.898047', '37.470571', 'wq9jjt21fk');
INSERT INTO `model_nation` VALUES ('3229', '620623', '', '', '天祝藏族自治县', '3224', '103.142034', '36.971678', 'wq96743xxs');
INSERT INTO `model_nation` VALUES ('3230', '620700', '', '张掖市', '', '3191', '100.455472', '38.932897', 'wnzmmzt2w4');
INSERT INTO `model_nation` VALUES ('3231', '620701', '', '', '市辖区', '3230', '100.455472', '38.932897', 'wnzmmzt2w4');
INSERT INTO `model_nation` VALUES ('3232', '620702', '', '', '甘州区', '3230', '100.454862', '38.931774', 'wnzmmzkfpb');
INSERT INTO `model_nation` VALUES ('3233', '620721', '', '', '肃南裕固族自治县', '3230', '99.617086', '38.837269', 'wnyufy4gqr');
INSERT INTO `model_nation` VALUES ('3234', '620722', '', '', '民乐县', '3230', '100.816623', '38.434454', 'wnzdwhu2vt');
INSERT INTO `model_nation` VALUES ('3235', '620723', '', '', '临泽县', '3230', '100.166333', '39.152151', 'wnznxr6vu9');
INSERT INTO `model_nation` VALUES ('3236', '620724', '', '', '高台县', '3230', '99.81665', '39.376308', 'wpnbp2hr8e');
INSERT INTO `model_nation` VALUES ('3237', '620725', '', '', '山丹县', '3230', '101.088442', '38.784839', 'wnzuskd656');
INSERT INTO `model_nation` VALUES ('3238', '620800', '', '平凉市', '', '3191', '106.684691', '35.54279', 'wq7f5wm7v2');
INSERT INTO `model_nation` VALUES ('3239', '620801', '', '', '市辖区', '3238', '106.684691', '35.54279', 'wq7f5wm7v2');
INSERT INTO `model_nation` VALUES ('3240', '620802', '', '', '崆峒区', '3238', '106.684223', '35.54173', 'wq7f5wjjdd');
INSERT INTO `model_nation` VALUES ('3241', '620821', '', '', '泾川县', '3238', '107.365218', '35.335283', 'wqk350sfyy');
INSERT INTO `model_nation` VALUES ('3242', '620822', '', '', '灵台县', '3238', '107.620587', '35.064009', 'wqhx2znytm');
INSERT INTO `model_nation` VALUES ('3243', '620823', '', '', '崇信县', '3238', '107.031253', '35.304533', 'wqk0gdczbc');
INSERT INTO `model_nation` VALUES ('3244', '620824', '', '', '华亭县', '3238', '106.649308', '35.215342', 'wq7b6fg8hz');
INSERT INTO `model_nation` VALUES ('3245', '620825', '', '', '庄浪县', '3238', '106.041979', '35.203428', 'wq72m096v4');
INSERT INTO `model_nation` VALUES ('3246', '620826', '', '', '静宁县', '3238', '105.733489', '35.525243', 'wq74n50v8c');
INSERT INTO `model_nation` VALUES ('3247', '620900', '', '酒泉市', '', '3191', '98.510795', '39.744023', 'wpn41ejmey');
INSERT INTO `model_nation` VALUES ('3248', '620901', '', '', '市辖区', '3247', '98.510795', '39.744023', 'wpn41ejmey');
INSERT INTO `model_nation` VALUES ('3249', '620902', '', '', '肃州区', '3247', '98.511155', '39.743858', 'wpn41ejsu2');
INSERT INTO `model_nation` VALUES ('3250', '620921', '', '', '金塔县', '3247', '98.902959', '39.983036', 'wpn76wdyjf');
INSERT INTO `model_nation` VALUES ('3251', '620922', '', '', '瓜州县', '3247', '95.780591', '40.516525', 'wphn7xc3ce');
INSERT INTO `model_nation` VALUES ('3252', '620923', '', '', '肃北蒙古族自治县', '3247', '94.87728', '39.51224', 'wp52ybzx2z');
INSERT INTO `model_nation` VALUES ('3253', '620924', '', '', '阿克塞哈萨克族自治县', '3247', '94.337642', '39.631642', 'wp516wwx43');
INSERT INTO `model_nation` VALUES ('3254', '620981', '', '', '玉门市', '3247', '97.037206', '40.28682', 'wpjj0jurdz');
INSERT INTO `model_nation` VALUES ('3255', '620982', '', '', '敦煌市', '3247', '94.664279', '40.141119', 'wp5k65kqvw');
INSERT INTO `model_nation` VALUES ('3256', '621000', '', '庆阳市', '', '3191', '107.638372', '35.734218', 'wqke335ygv');
INSERT INTO `model_nation` VALUES ('3257', '621001', '', '', '市辖区', '3256', '107.638372', '35.734218', 'wqke335ygv');
INSERT INTO `model_nation` VALUES ('3258', '621002', '', '', '西峰区', '3256', '107.638824', '35.733713', 'wqke33h5yq');
INSERT INTO `model_nation` VALUES ('3259', '621021', '', '', '庆城县', '3256', '107.885664', '36.013504', 'wqksyupcy5');
INSERT INTO `model_nation` VALUES ('3260', '621022', '', '', '环县', '3256', '107.308754', '36.569322', 'wqs21c5zep');
INSERT INTO `model_nation` VALUES ('3261', '621023', '', '', '华池县', '3256', '107.986288', '36.457304', 'wqkz3kc5ny');
INSERT INTO `model_nation` VALUES ('3262', '621024', '', '', '合水县', '3256', '108.019865', '35.819005', 'wqkgf09sv6');
INSERT INTO `model_nation` VALUES ('3263', '621025', '', '', '正宁县', '3256', '108.361068', '35.490642', 'wqm1cuf5gz');
INSERT INTO `model_nation` VALUES ('3264', '621026', '', '', '宁县', '3256', '107.921182', '35.50201', 'wqk9zycy1y');
INSERT INTO `model_nation` VALUES ('3265', '621027', '', '', '镇原县', '3256', '107.195706', '35.677806', 'wqk4zqcw2c');
INSERT INTO `model_nation` VALUES ('3266', '621100', '', '定西市', '', '3191', '104.626294', '35.579578', 'wq66kv4d16');
INSERT INTO `model_nation` VALUES ('3267', '621101', '', '', '市辖区', '3266', '104.626294', '35.579578', 'wq66kv4d16');
INSERT INTO `model_nation` VALUES ('3268', '621102', '', '', '安定区', '3266', '104.62577', '35.579764', 'wq66kv45jh');
INSERT INTO `model_nation` VALUES ('3269', '621121', '', '', '通渭县', '3266', '105.250102', '35.208922', 'wq6b718fc4');
INSERT INTO `model_nation` VALUES ('3270', '621122', '', '', '陇西县', '3266', '104.637554', '35.003409', 'wq4rjh4txs');
INSERT INTO `model_nation` VALUES ('3271', '621123', '', '', '渭源县', '3266', '104.211742', '35.133023', 'wq4pg7u8tw');
INSERT INTO `model_nation` VALUES ('3272', '621124', '', '', '临洮县', '3266', '103.862186', '35.376233', 'wq3c72n1kr');
INSERT INTO `model_nation` VALUES ('3273', '621125', '', '', '漳县', '3266', '104.466756', '34.848642', 'wq4q30n25c');
INSERT INTO `model_nation` VALUES ('3274', '621126', '', '', '岷县', '3266', '104.039882', '34.439105', 'wq1gzmrw2f');
INSERT INTO `model_nation` VALUES ('3275', '621200', '', '陇南市', '', '3191', '104.929379', '33.388598', 'wmftgwpnxt');
INSERT INTO `model_nation` VALUES ('3276', '621201', '', '', '市辖区', '3275', '104.929379', '33.388598', 'wmftgwpnxt');
INSERT INTO `model_nation` VALUES ('3277', '621202', '', '', '武都区', '3275', '104.929866', '33.388155', 'wmftgwps55');
INSERT INTO `model_nation` VALUES ('3278', '621221', '', '', '成县', '3275', '105.734434', '33.739863', 'wmgpyn1kyy');
INSERT INTO `model_nation` VALUES ('3279', '621222', '', '', '文县', '3275', '104.682448', '32.942171', 'wmf7qhgqjc');
INSERT INTO `model_nation` VALUES ('3280', '621223', '', '', '宕昌县', '3275', '104.394475', '34.042655', 'wq41xt38zd');
INSERT INTO `model_nation` VALUES ('3281', '621224', '', '', '康县', '3275', '105.609534', '33.328266', 'wmgje5nx0x');
INSERT INTO `model_nation` VALUES ('3282', '621225', '', '', '西和县', '3275', '105.299737', '34.013718', 'wq4cs0hbm8');
INSERT INTO `model_nation` VALUES ('3283', '621226', '', '', '礼县', '3275', '105.181616', '34.189387', 'wq4f3ryzt7');
INSERT INTO `model_nation` VALUES ('3284', '621227', '', '', '徽县', '3275', '106.085632', '33.767785', 'wq52n51pw7');
INSERT INTO `model_nation` VALUES ('3285', '621228', '', '', '两当县', '3275', '106.306959', '33.910729', 'wq58gj627d');
INSERT INTO `model_nation` VALUES ('3286', '622900', '', '临夏回族自治州', '', '3191', '103.212006', '35.599446', 'wq36s8sty1');
INSERT INTO `model_nation` VALUES ('3287', '622901', '', '', '临夏市', '3286', '103.211634', '35.59941', 'wq36s8smt7');
INSERT INTO `model_nation` VALUES ('3288', '622921', '', '', '临夏县', '3286', '102.993873', '35.49236', 'wq31ztjvgp');
INSERT INTO `model_nation` VALUES ('3289', '622922', '', '', '康乐县', '3286', '103.709852', '35.371906', 'wq39pzr0q9');
INSERT INTO `model_nation` VALUES ('3290', '622923', '', '', '永靖县', '3286', '103.319871', '35.938933', 'wq3krn7prq');
INSERT INTO `model_nation` VALUES ('3291', '622924', '', '', '广河县', '3286', '103.576188', '35.481688', 'wq39ugjzu4');
INSERT INTO `model_nation` VALUES ('3292', '622925', '', '', '和政县', '3286', '103.350357', '35.425971', 'wq33xc17jz');
INSERT INTO `model_nation` VALUES ('3293', '622926', '', '', '东乡族自治县', '3286', '103.389568', '35.66383', 'wq3dbsmuze');
INSERT INTO `model_nation` VALUES ('3294', '622927', '', '', '积石山保安族东乡族撒拉族自治县', '3286', '102.877473', '35.712906', 'wq35jj34fb');
INSERT INTO `model_nation` VALUES ('3295', '623000', '', '甘南藏族自治州', '', '3191', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3296', '623001', '', '', '合作市', '3295', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3297', '623021', '', '', '临潭县', '3295', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3298', '623022', '', '', '卓尼县', '3295', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3299', '623023', '', '', '舟曲县', '3295', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3300', '623024', '', '', '迭部县', '3295', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3301', '623025', '', '', '玛曲县', '3295', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3302', '623026', '', '', '碌曲县', '3295', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3303', '623027', '', '', '夏河县', '3295', '103.823557', '36.058039', 'wq3v4s4j21');
INSERT INTO `model_nation` VALUES ('3304', '630000', '青海省', '', '', '1', '101.778916', '36.623178', 'wq82k511kx');
INSERT INTO `model_nation` VALUES ('3305', '630100', '', '西宁市', '', '3304', '101.778916', '36.623178', 'wq82k511kx');
INSERT INTO `model_nation` VALUES ('3306', '630101', '', '', '市辖区', '3305', '101.778916', '36.623178', 'wq82k511kx');
INSERT INTO `model_nation` VALUES ('3307', '630102', '', '', '城东区', '3305', '101.796095', '36.616043', 'wq82k3txuv');
INSERT INTO `model_nation` VALUES ('3308', '630103', '', '', '城中区', '3305', '101.784554', '36.621181', 'wq82k4tmb4');
INSERT INTO `model_nation` VALUES ('3309', '630104', '', '', '城西区', '3305', '101.763649', '36.628323', 'wq827eyp2y');
INSERT INTO `model_nation` VALUES ('3310', '630105', '', '', '城北区', '3305', '101.761297', '36.648448', 'wq827xskdj');
INSERT INTO `model_nation` VALUES ('3311', '630121', '', '', '大通回族土族自治县', '3305', '101.684183', '36.931343', 'wq861ghhtj');
INSERT INTO `model_nation` VALUES ('3312', '630122', '', '', '湟中县', '3305', '101.569475', '36.500419', 'wq2pxk8wk7');
INSERT INTO `model_nation` VALUES ('3313', '630123', '', '', '湟源县', '3305', '101.263435', '36.684818', 'wq808q3b91');
INSERT INTO `model_nation` VALUES ('3314', '630200', '', '海东市', '', '3304', '102.10327', '36.502916', 'wq2xemjkfs');
INSERT INTO `model_nation` VALUES ('3315', '630201', '', '', '市辖区', '3314', '102.10327', '36.502916', 'wq2xemjkfs');
INSERT INTO `model_nation` VALUES ('3316', '630202', '', '', '乐都区', '3314', '102.402431', '36.480291', 'wq2zd1p1je');
INSERT INTO `model_nation` VALUES ('3317', '630221', '', '', '平安县', '3314', '102.104295', '36.502714', 'wq2xemn5dx');
INSERT INTO `model_nation` VALUES ('3318', '630222', '', '', '民和回族土族自治县', '3314', '102.804209', '36.329451', 'wq3nemedrs');
INSERT INTO `model_nation` VALUES ('3319', '630223', '', '', '互助土族自治县', '3314', '101.956734', '36.83994', 'wq8984d8hn');
INSERT INTO `model_nation` VALUES ('3320', '630224', '', '', '化隆回族自治县', '3314', '102.262329', '36.098322', 'wq2tr53puy');
INSERT INTO `model_nation` VALUES ('3321', '630225', '', '', '循化撒拉族自治县', '3314', '102.486534', '35.847247', 'wq2guju3m7');
INSERT INTO `model_nation` VALUES ('3322', '632200', '', '海北藏族自治州', '', '3304', '100.901059', '36.959435', 'wnxf203bm4');
INSERT INTO `model_nation` VALUES ('3323', '632221', '', '', '门源回族自治县', '3322', '101.618461', '37.376627', 'wq8k8khq9u');
INSERT INTO `model_nation` VALUES ('3324', '632222', '', '', '祁连县', '3322', '100.249778', '38.175409', 'wnz31jxevh');
INSERT INTO `model_nation` VALUES ('3325', '632223', '', '', '海晏县', '3322', '100.90049', '36.959542', 'wnxf2032zv');
INSERT INTO `model_nation` VALUES ('3326', '632224', '', '', '刚察县', '3322', '100.138417', '37.326263', 'wnxhqen94p');
INSERT INTO `model_nation` VALUES ('3327', '632300', '', '黄南藏族自治州', '', '3304', '102.019988', '35.517744', 'wq2d19b9y5');
INSERT INTO `model_nation` VALUES ('3328', '632321', '', '', '同仁县', '3327', '102.017604', '35.516337', 'wq2d13wcwm');
INSERT INTO `model_nation` VALUES ('3329', '632322', '', '', '尖扎县', '3327', '102.031953', '35.938205', 'wq2s3y37hy');
INSERT INTO `model_nation` VALUES ('3330', '632323', '', '', '泽库县', '3327', '101.469343', '35.036842', 'wq0pkfr8rh');
INSERT INTO `model_nation` VALUES ('3331', '632324', '', '', '河南蒙古族自治县', '3327', '101.611877', '34.734522', 'wq0m85px22');
INSERT INTO `model_nation` VALUES ('3332', '632500', '', '海南藏族自治州', '', '3304', '100.619542', '36.280353', 'wnrw3ssum7');
INSERT INTO `model_nation` VALUES ('3333', '632521', '', '', '共和县', '3332', '100.619597', '36.280286', 'wnrw3ssgyx');
INSERT INTO `model_nation` VALUES ('3334', '632522', '', '', '同德县', '3332', '100.579465', '35.254492', 'wnr889zsr3');
INSERT INTO `model_nation` VALUES ('3335', '632523', '', '', '贵德县', '3332', '101.431856', '36.040456', 'wq2jh0uqve');
INSERT INTO `model_nation` VALUES ('3336', '632524', '', '', '兴海县', '3332', '99.986963', '35.58909', 'wnr47qb33p');
INSERT INTO `model_nation` VALUES ('3337', '632525', '', '', '贵南县', '3332', '100.74792', '35.587085', 'wnrdkw6mu9');
INSERT INTO `model_nation` VALUES ('3338', '632600', '', '果洛藏族自治州', '', '3304', '100.242143', '34.4736', 'wnpk15dp70');
INSERT INTO `model_nation` VALUES ('3339', '632621', '', '', '玛沁县', '3338', '100.243531', '34.473386', 'wnpk15en58');
INSERT INTO `model_nation` VALUES ('3340', '632622', '', '', '班玛县', '3338', '100.737955', '32.931589', 'wjzek750km');
INSERT INTO `model_nation` VALUES ('3341', '632623', '', '', '甘德县', '3338', '99.902589', '33.966987', 'wnp11rdb51');
INSERT INTO `model_nation` VALUES ('3342', '632624', '', '', '达日县', '3338', '99.651715', '33.753259', 'wnnb58s4vr');
INSERT INTO `model_nation` VALUES ('3343', '632625', '', '', '久治县', '3338', '101.484884', '33.430217', 'wmbnjmg11h');
INSERT INTO `model_nation` VALUES ('3344', '632626', '', '', '玛多县', '3338', '98.211343', '34.91528', 'wnjydu5k4p');
INSERT INTO `model_nation` VALUES ('3345', '632700', '', '玉树藏族自治州', '', '3304', '97.008522', '33.004049', 'wjugz2pqw2');
INSERT INTO `model_nation` VALUES ('3346', '632701', '', '', '玉树市', '3345', '97.008762', '33.00393', 'wjugz2ptgf');
INSERT INTO `model_nation` VALUES ('3347', '632722', '', '', '杂多县', '3345', '95.293423', '32.891886', 'wjgg07y91e');
INSERT INTO `model_nation` VALUES ('3348', '632723', '', '', '称多县', '3345', '97.110893', '33.367884', 'wjvjcf3ypb');
INSERT INTO `model_nation` VALUES ('3349', '632724', '', '', '治多县', '3345', '95.616843', '33.852322', 'wn5bxfdh1f');
INSERT INTO `model_nation` VALUES ('3350', '632725', '', '', '囊谦县', '3345', '96.479797', '32.203206', 'wjsx5qqmq0');
INSERT INTO `model_nation` VALUES ('3351', '632726', '', '', '曲麻莱县', '3345', '95.800674', '34.12654', 'wnh45uxct8');
INSERT INTO `model_nation` VALUES ('3352', '632800', '', '海西蒙古族藏族自治州', '', '3304', '97.370785', '37.374663', 'wnthxez5pw');
INSERT INTO `model_nation` VALUES ('3353', '632801', '', '', '格尔木市', '3352', '94.905777', '36.401541', 'wn7rpdsq2g');
INSERT INTO `model_nation` VALUES ('3354', '632802', '', '', '德令哈市', '3352', '97.370143', '37.374555', 'wnthxeyf8f');
INSERT INTO `model_nation` VALUES ('3355', '632821', '', '', '乌兰县', '3352', '98.479852', '36.930389', 'wnw40fyz4g');
INSERT INTO `model_nation` VALUES ('3356', '632822', '', '', '都兰县', '3352', '98.089161', '36.298553', 'wnmy2pfq7h');
INSERT INTO `model_nation` VALUES ('3357', '632823', '', '', '天峻县', '3352', '99.02078', '37.29906', 'wnwkjq0dz2');
INSERT INTO `model_nation` VALUES ('3358', '640000', '宁夏回族自治区', '', '', '1', '106.278179', '38.46637', 'wqgdf6t6v5');
INSERT INTO `model_nation` VALUES ('3359', '640100', '', '银川市', '', '3358', '106.278179', '38.46637', 'wqgdf6t6v5');
INSERT INTO `model_nation` VALUES ('3360', '640101', '', '', '市辖区', '3359', '106.278179', '38.46637', 'wqgdf6t6v5');
INSERT INTO `model_nation` VALUES ('3361', '640104', '', '', '兴庆区', '3359', '106.278393', '38.46747', 'wqgdf6v960');
INSERT INTO `model_nation` VALUES ('3362', '640105', '', '', '西夏区', '3359', '106.132116', '38.492424', 'wqg6zp749e');
INSERT INTO `model_nation` VALUES ('3363', '640106', '', '', '金凤区', '3359', '106.228486', '38.477353', 'wqgdck94z4');
INSERT INTO `model_nation` VALUES ('3364', '640121', '', '', '永宁县', '3359', '106.253781', '38.28043', 'wqg9cbexst');
INSERT INTO `model_nation` VALUES ('3365', '640122', '', '', '贺兰县', '3359', '106.345904', '38.554563', 'wqge7fwsx5');
INSERT INTO `model_nation` VALUES ('3366', '640181', '', '', '灵武市', '3359', '106.334701', '38.094058', 'wqg8ewy9fp');
INSERT INTO `model_nation` VALUES ('3367', '640200', '', '石嘴山市', '', '3358', '106.376173', '39.01333', 'wqgtuwhv07');
INSERT INTO `model_nation` VALUES ('3368', '640201', '', '', '市辖区', '3367', '106.376173', '39.01333', 'wqgtuwhv07');
INSERT INTO `model_nation` VALUES ('3369', '640202', '', '', '大武口区', '3367', '106.376651', '39.014158', 'wqgtuwm1gw');
INSERT INTO `model_nation` VALUES ('3370', '640205', '', '', '惠农区', '3367', '106.775513', '39.230094', 'wqgzjtxecg');
INSERT INTO `model_nation` VALUES ('3371', '640221', '', '', '平罗县', '3367', '106.54489', '38.90674', 'wqgv26z85y');
INSERT INTO `model_nation` VALUES ('3372', '640300', '', '吴忠市', '', '3358', '106.199409', '37.986165', 'wqg80ehj3w');
INSERT INTO `model_nation` VALUES ('3373', '640301', '', '', '市辖区', '3372', '106.199409', '37.986165', 'wqg80ehj3w');
INSERT INTO `model_nation` VALUES ('3374', '640302', '', '', '利通区', '3372', '106.199419', '37.985967', 'wqg80ehh3c');
INSERT INTO `model_nation` VALUES ('3375', '640303', '', '', '红寺堡区', '3372', '106.067315', '37.421616', 'wqekvs7uew');
INSERT INTO `model_nation` VALUES ('3376', '640323', '', '', '盐池县', '3372', '107.40541', '37.784222', 'wqsqun6jp3');
INSERT INTO `model_nation` VALUES ('3377', '640324', '', '', '同心县', '3372', '105.914764', '36.9829', 'wqe66hsc0b');
INSERT INTO `model_nation` VALUES ('3378', '640381', '', '', '青铜峡市', '3372', '106.075395', '38.021509', 'wqg2mc9erf');
INSERT INTO `model_nation` VALUES ('3379', '640400', '', '固原市', '', '3358', '106.285241', '36.004561', 'wq7sfd6tc8');
INSERT INTO `model_nation` VALUES ('3380', '640401', '', '', '市辖区', '3379', '106.285241', '36.004561', 'wq7sfd6tc8');
INSERT INTO `model_nation` VALUES ('3381', '640402', '', '', '原州区', '3379', '106.28477', '36.005337', 'wq7sfdd4q9');
INSERT INTO `model_nation` VALUES ('3382', '640422', '', '', '西吉县', '3379', '105.731801', '35.965384', 'wq7htgr999');
INSERT INTO `model_nation` VALUES ('3383', '640423', '', '', '隆德县', '3379', '106.12344', '35.618234', 'wq76wuher2');
INSERT INTO `model_nation` VALUES ('3384', '640424', '', '', '泾源县', '3379', '106.338674', '35.49344', 'wq79gv3kq8');
INSERT INTO `model_nation` VALUES ('3385', '640425', '', '', '彭阳县', '3379', '106.641512', '35.849975', 'wq7gfwmcpr');
INSERT INTO `model_nation` VALUES ('3386', '640500', '', '中卫市', '', '3358', '105.189568', '37.514951', 'wqdv3tksqt');
INSERT INTO `model_nation` VALUES ('3387', '640501', '', '', '市辖区', '3386', '105.189568', '37.514951', 'wqdv3tksqt');
INSERT INTO `model_nation` VALUES ('3388', '640502', '', '', '沙坡头区', '3386', '105.190536', '37.514564', 'wqdv3tm6jj');
INSERT INTO `model_nation` VALUES ('3389', '640521', '', '', '中宁县', '3386', '105.675784', '37.489736', 'wqejk8yc81');
INSERT INTO `model_nation` VALUES ('3390', '640522', '', '', '海原县', '3386', '105.647323', '36.562007', 'wq7pupfj1h');
INSERT INTO `model_nation` VALUES ('3391', '650000', '新疆维吾尔自治区', '', '', '1', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3392', '650100', '', '乌鲁木齐市', '', '3391', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3393', '650101', '', '', '市辖区', '3392', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3394', '650102', '', '', '天山区', '3392', '87.620116', '43.796428', 'tzy31ugh8t');
INSERT INTO `model_nation` VALUES ('3395', '650103', '', '', '沙依巴克区', '3392', '87.596639', '43.788872', 'tzy3179btt');
INSERT INTO `model_nation` VALUES ('3396', '650104', '', '', '新市区', '3392', '87.560653', '43.870882', 'tzy386rwrj');
INSERT INTO `model_nation` VALUES ('3397', '650105', '', '', '水磨沟区', '3392', '87.613093', '43.816747', 'tzy338tgj1');
INSERT INTO `model_nation` VALUES ('3398', '650106', '', '', '头屯河区', '3392', '87.425823', '43.876053', 'tzy1t7ms93');
INSERT INTO `model_nation` VALUES ('3399', '650107', '', '', '达坂城区', '3392', '88.30994', '43.36181', 'tzwy9tc2fe');
INSERT INTO `model_nation` VALUES ('3400', '650109', '', '', '米东区', '3392', '87.691801', '43.960982', 'tzy656z5r1');
INSERT INTO `model_nation` VALUES ('3401', '650121', '', '', '乌鲁木齐县', '3392', '87.505603', '43.982546', 'tzy4pnz8uk');
INSERT INTO `model_nation` VALUES ('3402', '650200', '', '克拉玛依市', '', '3391', '84.873946', '45.595886', 'vbh77k7r63');
INSERT INTO `model_nation` VALUES ('3403', '650201', '', '', '市辖区', '3402', '84.873946', '45.595886', 'vbh77k7r63');
INSERT INTO `model_nation` VALUES ('3404', '650202', '', '', '独山子区', '3402', '84.882267', '44.327207', 'tzuk5t92sn');
INSERT INTO `model_nation` VALUES ('3405', '650203', '', '', '克拉玛依区', '3402', '84.868918', '45.600477', 'vbh77jrdj1');
INSERT INTO `model_nation` VALUES ('3406', '650204', '', '', '白碱滩区', '3402', '85.129882', '45.689021', 'vbhecjmty4');
INSERT INTO `model_nation` VALUES ('3407', '650205', '', '', '乌尔禾区', '3402', '85.697767', '46.08776', 'vbhynn50wt');
INSERT INTO `model_nation` VALUES ('3408', '652100', '', '吐鲁番地区', '', '3391', '89.184078', '42.947613', 'tzxkm6mggx');
INSERT INTO `model_nation` VALUES ('3409', '652101', '', '', '吐鲁番市', '3408', '89.182324', '42.947627', 'tzxkm6ks4c');
INSERT INTO `model_nation` VALUES ('3410', '652122', '', '', '鄯善县', '3408', '90.212692', '42.865503', 'wp85ug6vsh');
INSERT INTO `model_nation` VALUES ('3411', '652123', '', '', '托克逊县', '3408', '88.655771', '42.793536', 'tzx53qm4mj');
INSERT INTO `model_nation` VALUES ('3412', '652200', '', '哈密地区', '', '3391', '93.51316', '42.833248', 'wpd7xvw1y8');
INSERT INTO `model_nation` VALUES ('3413', '652201', '', '', '哈密市', '3412', '93.509174', '42.833888', 'wpd7xvem3x');
INSERT INTO `model_nation` VALUES ('3414', '652222', '', '', '巴里坤哈萨克自治县', '3412', '93.021795', '43.599032', 'wpf0hbbqub');
INSERT INTO `model_nation` VALUES ('3415', '652223', '', '', '伊吾县', '3412', '94.692773', '43.252012', 'wpeq4cc1jx');
INSERT INTO `model_nation` VALUES ('3416', '652300', '', '昌吉回族自治州', '', '3391', '87.304012', '44.014577', 'tzy46ssg6z');
INSERT INTO `model_nation` VALUES ('3417', '652301', '', '', '昌吉市', '3416', '87.304112', '44.013183', 'tzy46skgm7');
INSERT INTO `model_nation` VALUES ('3418', '652302', '', '', '阜康市', '3416', '87.98384', '44.152153', 'tzye4jeuuj');
INSERT INTO `model_nation` VALUES ('3419', '652323', '', '', '呼图壁县', '3416', '86.888613', '44.189342', 'tzvg3hqme6');
INSERT INTO `model_nation` VALUES ('3420', '652324', '', '', '玛纳斯县', '3416', '86.217687', '44.305625', 'tzvk1ctfcx');
INSERT INTO `model_nation` VALUES ('3421', '652325', '', '', '奇台县', '3416', '89.591437', '44.021996', 'tzzdqtyqxy');
INSERT INTO `model_nation` VALUES ('3422', '652327', '', '', '吉木萨尔县', '3416', '89.181288', '43.997162', 'tzz6m37y49');
INSERT INTO `model_nation` VALUES ('3423', '652328', '', '', '木垒哈萨克自治县', '3416', '90.282833', '43.832442', 'wpb1q7myqr');
INSERT INTO `model_nation` VALUES ('3424', '652700', '', '博尔塔拉蒙古自治州', '', '3391', '82.074778', '44.903258', 'tzfr7wmh2v');
INSERT INTO `model_nation` VALUES ('3425', '652701', '', '', '博乐市', '3424', '82.072237', '44.903087', 'tzfr7w75mw');
INSERT INTO `model_nation` VALUES ('3426', '652702', '', '', '阿拉山口市', '3424', '82.569389', '45.16777', 'vb48yyt1q4');
INSERT INTO `model_nation` VALUES ('3427', '652722', '', '', '精河县', '3424', '82.892938', '44.605645', 'tzfvy20y9q');
INSERT INTO `model_nation` VALUES ('3428', '652723', '', '', '温泉县', '3424', '81.03099', '44.973751', 'tzcxgghznf');
INSERT INTO `model_nation` VALUES ('3429', '652800', '', '巴音郭楞蒙古自治州', '', '3391', '86.150969', '41.768552', 'tzmm87tprn');
INSERT INTO `model_nation` VALUES ('3430', '652801', '', '', '库尔勒市', '3429', '86.145948', '41.763122', 'tzmm869xf4');
INSERT INTO `model_nation` VALUES ('3431', '652822', '', '', '轮台县', '3429', '84.248542', '41.781266', 'tz7vtn5ct2');
INSERT INTO `model_nation` VALUES ('3432', '652823', '', '', '尉犁县', '3429', '86.263412', '41.337428', 'tzm74vppgp');
INSERT INTO `model_nation` VALUES ('3433', '652824', '', '', '若羌县', '3429', '88.168807', '39.023807', 'tyywn24d4h');
INSERT INTO `model_nation` VALUES ('3434', '652825', '', '', '且末县', '3429', '85.532629', '38.138562', 'tyubfqfvnx');
INSERT INTO `model_nation` VALUES ('3435', '652826', '', '', '焉耆回族自治县', '3429', '86.5698', '42.064349', 'tzmx3cw4wd');
INSERT INTO `model_nation` VALUES ('3436', '652827', '', '', '和静县', '3429', '86.391067', '42.31716', 'tzt2tzs53f');
INSERT INTO `model_nation` VALUES ('3437', '652828', '', '', '和硕县', '3429', '86.864947', '42.268863', 'tztb2wv1gz');
INSERT INTO `model_nation` VALUES ('3438', '652829', '', '', '博湖县', '3429', '86.631576', '41.980166', 'tzmwg670nn');
INSERT INTO `model_nation` VALUES ('3439', '652900', '', '阿克苏地区', '', '3391', '80.265068', '41.170712', 'tz344qzhz8');
INSERT INTO `model_nation` VALUES ('3440', '652901', '', '', '阿克苏市', '3439', '80.2629', '41.171272', 'tz344rj8j1');
INSERT INTO `model_nation` VALUES ('3441', '652922', '', '', '温宿县', '3439', '80.243273', '41.272995', 'tz34ccx2eg');
INSERT INTO `model_nation` VALUES ('3442', '652923', '', '', '库车县', '3439', '82.96304', '41.717141', 'tz6vrf7gfy');
INSERT INTO `model_nation` VALUES ('3443', '652924', '', '', '沙雅县', '3439', '82.78077', '41.226268', 'tz6fe9p07t');
INSERT INTO `model_nation` VALUES ('3444', '652925', '', '', '新和县', '3439', '82.610828', '41.551176', 'tz6sru5m5u');
INSERT INTO `model_nation` VALUES ('3445', '652926', '', '', '拜城县', '3439', '81.869881', '41.796101', 'tz6jybxzfm');
INSERT INTO `model_nation` VALUES ('3446', '652927', '', '', '乌什县', '3439', '79.230805', '41.21587', 'tz266zn5ge');
INSERT INTO `model_nation` VALUES ('3447', '652928', '', '', '阿瓦提县', '3439', '80.378426', '40.638422', 'tz1pjjczcn');
INSERT INTO `model_nation` VALUES ('3448', '652929', '', '', '柯坪县', '3439', '79.04785', '40.50624', 'tz0nqvbvuq');
INSERT INTO `model_nation` VALUES ('3449', '653000', '', '克孜勒苏柯尔克孜自治州', '', '3391', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3450', '653001', '', '', '阿图什市', '3449', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3451', '653022', '', '', '阿克陶县', '3449', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3452', '653023', '', '', '阿合奇县', '3449', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3453', '653024', '', '', '乌恰县', '3449', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3454', '653100', '', '喀什地区', '', '3391', '75.989138', '39.467664', 'txn090veg3');
INSERT INTO `model_nation` VALUES ('3455', '653101', '', '', '喀什市', '3454', '75.98838', '39.467861', 'txn090vhcw');
INSERT INTO `model_nation` VALUES ('3456', '653121', '', '', '疏附县', '3454', '75.863075', '39.378306', 'txjbn29g3b');
INSERT INTO `model_nation` VALUES ('3457', '653122', '', '', '疏勒县', '3454', '76.053653', '39.399461', 'txn04skw6x');
INSERT INTO `model_nation` VALUES ('3458', '653123', '', '', '英吉沙县', '3454', '76.174292', '38.929839', 'twyjmquqtx');
INSERT INTO `model_nation` VALUES ('3459', '653124', '', '', '泽普县', '3454', '77.273593', '38.191217', 'twycq2kzvn');
INSERT INTO `model_nation` VALUES ('3460', '653125', '', '', '莎车县', '3454', '77.248884', '38.414499', 'twyftc4utm');
INSERT INTO `model_nation` VALUES ('3461', '653126', '', '', '叶城县', '3454', '77.420353', '37.884679', 'twxp98xy2b');
INSERT INTO `model_nation` VALUES ('3462', '653127', '', '', '麦盖提县', '3454', '77.651538', '38.903384', 'twzjr40heu');
INSERT INTO `model_nation` VALUES ('3463', '653128', '', '', '岳普湖县', '3454', '76.7724', '39.235248', 'twyx4yxcys');
INSERT INTO `model_nation` VALUES ('3464', '653129', '', '', '伽师县', '3454', '76.741982', '39.494325', 'txn8dm9z1g');
INSERT INTO `model_nation` VALUES ('3465', '653130', '', '', '巴楚县', '3454', '78.55041', '39.783479', 'txpf76qet4');
INSERT INTO `model_nation` VALUES ('3466', '653131', '', '', '塔什库尔干塔吉克自治县', '3454', '75.228068', '37.775437', 'twtqzug3v5');
INSERT INTO `model_nation` VALUES ('3467', '653200', '', '和田地区', '', '3391', '79.92533', '37.110687', 'ty8g4ezc7j');
INSERT INTO `model_nation` VALUES ('3468', '653201', '', '', '和田市', '3467', '79.927542', '37.108944', 'ty8g4g3rq8');
INSERT INTO `model_nation` VALUES ('3469', '653221', '', '', '和田县', '3467', '79.81907', '37.120031', 'ty8g0m6rz5');
INSERT INTO `model_nation` VALUES ('3470', '653222', '', '', '墨玉县', '3467', '79.736629', '37.271511', 'ty8sn3n6q1');
INSERT INTO `model_nation` VALUES ('3471', '653223', '', '', '皮山县', '3467', '78.282301', '37.616332', 'twxtvrg7jb');
INSERT INTO `model_nation` VALUES ('3472', '653224', '', '', '洛浦县', '3467', '80.184038', '37.074377', 'ty94bthjzs');
INSERT INTO `model_nation` VALUES ('3473', '653225', '', '', '策勒县', '3467', '80.803572', '37.001672', 'ty96qxzq7e');
INSERT INTO `model_nation` VALUES ('3474', '653226', '', '', '于田县', '3467', '81.667845', '36.854628', 'tyd1dmhty8');
INSERT INTO `model_nation` VALUES ('3475', '653227', '', '', '民丰县', '3467', '82.692354', '37.064909', 'tydfceqwxx');
INSERT INTO `model_nation` VALUES ('3476', '654000', '', '伊犁哈萨克自治州', '', '3391', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3477', '654002', '', '', '伊宁市', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3478', '654003', '', '', '奎屯市', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3479', '654004', '', '', '霍尔果斯市', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3480', '654021', '', '', '伊宁县', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3481', '654022', '', '', '察布查尔锡伯自治县', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3482', '654023', '', '', '霍城县', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3483', '654024', '', '', '巩留县', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3484', '654025', '', '', '新源县', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3485', '654026', '', '', '昭苏县', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3486', '654027', '', '', '特克斯县', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3487', '654028', '', '', '尼勒克县', '3476', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3488', '654200', '', '', '塔城地区', '3476', '82.985732', '46.746301', 'vb71bmukgw');
INSERT INTO `model_nation` VALUES ('3489', '654201', '', '', '塔城市', '3476', '82.983988', '46.746281', 'vb71bmghg4');
INSERT INTO `model_nation` VALUES ('3490', '654202', '', '', '乌苏市', '3476', '84.677624', '44.430115', 'tzuhybk25t');
INSERT INTO `model_nation` VALUES ('3491', '654221', '', '', '额敏县', '3476', '83.622118', '46.522555', 'vb72wv5v88');
INSERT INTO `model_nation` VALUES ('3492', '654223', '', '', '沙湾县', '3476', '85.622508', '44.329544', 'tzuuhmuqm1');
INSERT INTO `model_nation` VALUES ('3493', '654224', '', '', '托里县', '3476', '83.60469', '45.935863', 'vb5mq6r5f3');
INSERT INTO `model_nation` VALUES ('3494', '654225', '', '', '裕民县', '3476', '82.982157', '46.202781', 'vb5nb6cy8q');
INSERT INTO `model_nation` VALUES ('3495', '654226', '', '', '和布克赛尔蒙古自治县', '3476', '85.733551', '46.793001', 'vbkfnymkbx');
INSERT INTO `model_nation` VALUES ('3496', '654300', '', '', '阿勒泰地区', '3476', '88.13963', '47.848393', 'vbw8jwt344');
INSERT INTO `model_nation` VALUES ('3497', '654301', '', '', '阿勒泰市', '3476', '88.138743', '47.848911', 'vbw8jwssje');
INSERT INTO `model_nation` VALUES ('3498', '654321', '', '', '布尔津县', '3476', '86.86186', '47.70453', 'vbmz2s6gh0');
INSERT INTO `model_nation` VALUES ('3499', '654322', '', '', '富蕴县', '3476', '89.524993', '46.993106', 'vbrem4y4et');
INSERT INTO `model_nation` VALUES ('3500', '654323', '', '', '福海县', '3476', '87.494569', '47.113128', 'vbqhnbxtg5');
INSERT INTO `model_nation` VALUES ('3501', '654324', '', '', '哈巴河县', '3476', '86.418964', '48.059284', 'vbt3qsbmeg');
INSERT INTO `model_nation` VALUES ('3502', '654325', '', '', '青河县', '3476', '90.381561', '46.672446', 'y02388myen');
INSERT INTO `model_nation` VALUES ('3503', '654326', '', '', '吉木乃县', '3476', '85.876064', '47.434633', 'vbmjf5jnc2');
INSERT INTO `model_nation` VALUES ('3504', '659000', '', '自治区直辖县级行政区划', '', '3391', '87.617733', '43.792818', 'tzy31u1r9h');
INSERT INTO `model_nation` VALUES ('3505', '659001', '', '', '石河子市', '3504', '86.041075', '44.305886', 'tzvhjcthqr');
INSERT INTO `model_nation` VALUES ('3506', '659002', '', '', '阿拉尔市', '3504', '81.285884', '40.541914', 'tz1y9sqtf2');
INSERT INTO `model_nation` VALUES ('3507', '659003', '', '', '图木舒克市', '3504', '79.077978', '39.867316', 'tz04z3wgfq');
INSERT INTO `model_nation` VALUES ('3508', '659004', '', '', '五家渠市', '3504', '87.526884', '44.167401', 'tzy5r8rju0');
INSERT INTO `model_nation` VALUES ('3509', '659005', '', '', '北屯市', '3504', '87.824932', '47.353177', 'vbqmqs2hjp');
INSERT INTO `model_nation` VALUES ('3510', '659006', '', '', '铁门关市', '3504', '85.501218', '41.827251', 'tzkvcwkj6u');
INSERT INTO `model_nation` VALUES ('3511', '659007', '', '', '双河市', '3504', '82.353656', '44.840524', 'tzfx44bngr');
INSERT INTO `model_nation` VALUES ('3512', '710000', '台湾省', '', '', '1', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3513', '710100', '', '台北市', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3514', '710101', '', '', '松山区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3515', '710102', '', '', '信义区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3516', '710103', '', '', '大安区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3517', '710104', '', '', '中山区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3518', '710105', '', '', '中正区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3519', '710106', '', '', '大同区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3520', '710107', '', '', '万华区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3521', '710108', '', '', '文山区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3522', '710109', '', '', '南港区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3523', '710110', '', '', '内湖区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3524', '710111', '', '', '士林区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3525', '710112', '', '', '北投区', '3513', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3526', '710200', '', '高雄市', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3527', '710201', '', '', '盐埕区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3528', '710202', '', '', '鼓山区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3529', '710203', '', '', '左营区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3530', '710204', '', '', '楠梓区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3531', '710205', '', '', '三民区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3532', '710206', '', '', '新兴区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3533', '710207', '', '', '前金区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3534', '710208', '', '', '苓雅区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3535', '710209', '', '', '前镇区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3536', '710210', '', '', '旗津区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3537', '710211', '', '', '小港区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3538', '710212', '', '', '凤山区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3539', '710213', '', '', '林园区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3540', '710214', '', '', '大寮区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3541', '710215', '', '', '大树区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3542', '710216', '', '', '大社区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3543', '710217', '', '', '仁武区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3544', '710218', '', '', '鸟松区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3545', '710219', '', '', '冈山区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3546', '710220', '', '', '桥头区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3547', '710221', '', '', '燕巢区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3548', '710222', '', '', '田寮区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3549', '710223', '', '', '阿莲区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3550', '710224', '', '', '路竹区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3551', '710225', '', '', '湖内区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3552', '710226', '', '', '茄萣区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3553', '710227', '', '', '永安区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3554', '710228', '', '', '弥陀区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3555', '710229', '', '', '梓官区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3556', '710230', '', '', '旗山区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3557', '710231', '', '', '美浓区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3558', '710232', '', '', '六龟区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3559', '710233', '', '', '甲仙区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3560', '710234', '', '', '杉林区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3561', '710235', '', '', '内门区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3562', '710236', '', '', '茂林区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3563', '710237', '', '', '桃源区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3564', '710238', '', '', '那玛夏区', '3526', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3565', '710300', '', '基隆市', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3566', '710301', '', '', '中正区', '3565', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3567', '710302', '', '', '七堵区', '3565', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3568', '710303', '', '', '暖暖区', '3565', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3569', '710304', '', '', '仁爱区', '3565', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3570', '710305', '', '', '中山区', '3565', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3571', '710306', '', '', '安乐区', '3565', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3572', '710307', '', '', '信义区', '3565', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3573', '710400', '', '台中市', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3574', '710401', '', '', '中区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3575', '710402', '', '', '东区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3576', '710403', '', '', '南区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3577', '710404', '', '', '西区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3578', '710405', '', '', '北区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3579', '710406', '', '', '西屯区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3580', '710407', '', '', '南屯区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3581', '710408', '', '', '北屯区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3582', '710409', '', '', '丰原区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3583', '710410', '', '', '东势区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3584', '710411', '', '', '大甲区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3585', '710412', '', '', '清水区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3586', '710413', '', '', '沙鹿区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3587', '710414', '', '', '梧栖区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3588', '710415', '', '', '后里区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3589', '710416', '', '', '神冈区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3590', '710417', '', '', '潭子区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3591', '710418', '', '', '大雅区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3592', '710419', '', '', '新社区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3593', '710420', '', '', '石冈区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3594', '710421', '', '', '外埔区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3595', '710422', '', '', '大安区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3596', '710423', '', '', '乌日区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3597', '710424', '', '', '大肚区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3598', '710425', '', '', '龙井区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3599', '710426', '', '', '雾峰区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3600', '710427', '', '', '太平区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3601', '710428', '', '', '大里区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3602', '710429', '', '', '和平区', '3573', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3603', '710500', '', '台南市', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3604', '710501', '', '', '东区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3605', '710502', '', '', '南区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3606', '710504', '', '', '北区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3607', '710506', '', '', '安南区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3608', '710507', '', '', '安平区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3609', '710508', '', '', '中西区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3610', '710509', '', '', '新营区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3611', '710510', '', '', '盐水区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3612', '710511', '', '', '白河区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3613', '710512', '', '', '柳营区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3614', '710513', '', '', '后壁区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3615', '710514', '', '', '东山区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3616', '710515', '', '', '麻豆区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3617', '710516', '', '', '下营区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3618', '710517', '', '', '六甲区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3619', '710518', '', '', '官田区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3620', '710519', '', '', '大内区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3621', '710520', '', '', '佳里区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3622', '710521', '', '', '学甲区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3623', '710522', '', '', '西港区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3624', '710523', '', '', '七股区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3625', '710524', '', '', '将军区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3626', '710525', '', '', '北门区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3627', '710526', '', '', '新化区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3628', '710527', '', '', '善化区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3629', '710528', '', '', '新市区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3630', '710529', '', '', '安定区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3631', '710530', '', '', '山上区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3632', '710531', '', '', '玉井区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3633', '710532', '', '', '楠西区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3634', '710533', '', '', '南化区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3635', '710534', '', '', '左镇区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3636', '710535', '', '', '仁德区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3637', '710536', '', '', '归仁区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3638', '710537', '', '', '关庙区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3639', '710538', '', '', '龙崎区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3640', '710539', '', '', '永康区', '3603', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3641', '710600', '', '新竹市', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3642', '710601', '', '', '东区', '3641', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3643', '710602', '', '', '北区', '3641', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3644', '710603', '', '', '香山区', '3641', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3645', '710700', '', '嘉义市', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3646', '710701', '', '', '东区', '3645', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3647', '710702', '', '', '西区', '3645', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3648', '710800', '', '新北市', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3649', '710801', '', '', '板桥区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3650', '710802', '', '', '三重区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3651', '710803', '', '', '中和区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3652', '710804', '', '', '永和区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3653', '710805', '', '', '新庄区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3654', '710806', '', '', '新店区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3655', '710807', '', '', '树林区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3656', '710808', '', '', '莺歌区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3657', '710809', '', '', '三峡区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3658', '710810', '', '', '淡水区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3659', '710811', '', '', '汐止区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3660', '710812', '', '', '瑞芳区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3661', '710813', '', '', '土城区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3662', '710814', '', '', '芦洲区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3663', '710815', '', '', '五股区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3664', '710816', '', '', '泰山区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3665', '710817', '', '', '林口区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3666', '710818', '', '', '深坑区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3667', '710819', '', '', '石碇区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3668', '710820', '', '', '坪林区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3669', '710821', '', '', '三芝区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3670', '710822', '', '', '石门区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3671', '710823', '', '', '八里区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3672', '710824', '', '', '平溪区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3673', '710825', '', '', '双溪区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3674', '710826', '', '', '贡寮区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3675', '710827', '', '', '金山区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3676', '710828', '', '', '万里区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3677', '710829', '', '', '乌来区', '3648', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3678', '712200', '', '宜兰县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3679', '712201', '', '', '宜兰市', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3680', '712221', '', '', '罗东镇', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3681', '712222', '', '', '苏澳镇', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3682', '712223', '', '', '头城镇', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3683', '712224', '', '', '礁溪乡', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3684', '712225', '', '', '壮围乡', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3685', '712226', '', '', '员山乡', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3686', '712227', '', '', '冬山乡', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3687', '712228', '', '', '五结乡', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3688', '712229', '', '', '三星乡', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3689', '712230', '', '', '大同乡', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3690', '712231', '', '', '南澳乡', '3678', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3691', '712300', '', '桃园县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3692', '712301', '', '', '桃园市', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3693', '712302', '', '', '中坜市', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3694', '712303', '', '', '平镇市', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3695', '712304', '', '', '八德市', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3696', '712305', '', '', '杨梅市', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3697', '712321', '', '', '大溪镇', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3698', '712323', '', '', '芦竹乡', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3699', '712324', '', '', '大园乡', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3700', '712325', '', '', '龟山乡', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3701', '712327', '', '', '龙潭乡', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3702', '712329', '', '', '新屋乡', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3703', '712330', '', '', '观音乡', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3704', '712331', '', '', '复兴乡', '3691', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3705', '712400', '', '新竹县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3706', '712401', '', '', '竹北市', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3707', '712421', '', '', '竹东镇', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3708', '712422', '', '', '新埔镇', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3709', '712423', '', '', '关西镇', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3710', '712424', '', '', '湖口乡', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3711', '712425', '', '', '新丰乡', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3712', '712426', '', '', '芎林乡', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3713', '712427', '', '', '橫山乡', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3714', '712428', '', '', '北埔乡', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3715', '712429', '', '', '宝山乡', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3716', '712430', '', '', '峨眉乡', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3717', '712431', '', '', '尖石乡', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3718', '712432', '', '', '五峰乡', '3705', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3719', '712500', '', '苗栗县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3720', '712501', '', '', '苗栗市', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3721', '712521', '', '', '苑里镇', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3722', '712522', '', '', '通霄镇', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3723', '712523', '', '', '竹南镇', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3724', '712524', '', '', '头份镇', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3725', '712525', '', '', '后龙镇', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3726', '712526', '', '', '卓兰镇', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3727', '712527', '', '', '大湖乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3728', '712528', '', '', '公馆乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3729', '712529', '', '', '铜锣乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3730', '712530', '', '', '南庄乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3731', '712531', '', '', '头屋乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3732', '712532', '', '', '三义乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3733', '712533', '', '', '西湖乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3734', '712534', '', '', '造桥乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3735', '712535', '', '', '三湾乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3736', '712536', '', '', '狮潭乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3737', '712537', '', '', '泰安乡', '3719', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3738', '712700', '', '彰化县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3739', '712701', '', '', '彰化市', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3740', '712721', '', '', '鹿港镇', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3741', '712722', '', '', '和美镇', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3742', '712723', '', '', '线西乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3743', '712724', '', '', '伸港乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3744', '712725', '', '', '福兴乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3745', '712726', '', '', '秀水乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3746', '712727', '', '', '花坛乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3747', '712728', '', '', '芬园乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3748', '712729', '', '', '员林镇', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3749', '712730', '', '', '溪湖镇', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3750', '712731', '', '', '田中镇', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3751', '712732', '', '', '大村乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3752', '712733', '', '', '埔盐乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3753', '712734', '', '', '埔心乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3754', '712735', '', '', '永靖乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3755', '712736', '', '', '社头乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3756', '712737', '', '', '二水乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3757', '712738', '', '', '北斗镇', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3758', '712739', '', '', '二林镇', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3759', '712740', '', '', '田尾乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3760', '712741', '', '', '埤头乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3761', '712742', '', '', '芳苑乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3762', '712743', '', '', '大城乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3763', '712744', '', '', '竹塘乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3764', '712745', '', '', '溪州乡', '3738', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3765', '712800', '', '南投县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3766', '712801', '', '', '南投市', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3767', '712821', '', '', '埔里镇', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3768', '712822', '', '', '草屯镇', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3769', '712823', '', '', '竹山镇', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3770', '712824', '', '', '集集镇', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3771', '712825', '', '', '名间乡', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3772', '712826', '', '', '鹿谷乡', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3773', '712827', '', '', '中寮乡', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3774', '712828', '', '', '鱼池乡', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3775', '712829', '', '', '国姓乡', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3776', '712830', '', '', '水里乡', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3777', '712831', '', '', '信义乡', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3778', '712832', '', '', '仁爱乡', '3765', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3779', '712900', '', '云林县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3780', '712901', '', '', '斗六市', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3781', '712921', '', '', '斗南镇', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3782', '712922', '', '', '虎尾镇', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3783', '712923', '', '', '西螺镇', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3784', '712924', '', '', '土库镇', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3785', '712925', '', '', '北港镇', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3786', '712926', '', '', '古坑乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3787', '712927', '', '', '大埤乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3788', '712928', '', '', '莿桐乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3789', '712929', '', '', '林内乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3790', '712930', '', '', '二仑乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3791', '712931', '', '', '仑背乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3792', '712932', '', '', '麦寮乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3793', '712933', '', '', '东势乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3794', '712934', '', '', '褒忠乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3795', '712935', '', '', '台西乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3796', '712936', '', '', '元长乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3797', '712937', '', '', '四湖乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3798', '712938', '', '', '口湖乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3799', '712939', '', '', '水林乡', '3779', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3800', '713000', '', '嘉义县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3801', '713001', '', '', '太保市', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3802', '713002', '', '', '朴子市', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3803', '713023', '', '', '布袋镇', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3804', '713024', '', '', '大林镇', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3805', '713025', '', '', '民雄乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3806', '713026', '', '', '溪口乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3807', '713027', '', '', '新港乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3808', '713028', '', '', '六脚乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3809', '713029', '', '', '东石乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3810', '713030', '', '', '义竹乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3811', '713031', '', '', '鹿草乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3812', '713032', '', '', '水上乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3813', '713033', '', '', '中埔乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3814', '713034', '', '', '竹崎乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3815', '713035', '', '', '梅山乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3816', '713036', '', '', '番路乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3817', '713037', '', '', '大埔乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3818', '713038', '', '', '阿里山乡', '3800', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3819', '713300', '', '屏东县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3820', '713301', '', '', '屏东市', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3821', '713321', '', '', '潮州镇', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3822', '713322', '', '', '东港镇', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3823', '713323', '', '', '恒春镇', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3824', '713324', '', '', '万丹乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3825', '713325', '', '', '长治乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3826', '713326', '', '', '麟洛乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3827', '713327', '', '', '九如乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3828', '713328', '', '', '里港乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3829', '713329', '', '', '盐埔乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3830', '713330', '', '', '高树乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3831', '713331', '', '', '万峦乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3832', '713332', '', '', '内埔乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3833', '713333', '', '', '竹田乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3834', '713334', '', '', '新埤乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3835', '713335', '', '', '枋寮乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3836', '713336', '', '', '新园乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3837', '713337', '', '', '崁顶乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3838', '713338', '', '', '林边乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3839', '713339', '', '', '南州乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3840', '713340', '', '', '佳冬乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3841', '713341', '', '', '琉球乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3842', '713342', '', '', '车城乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3843', '713343', '', '', '满州乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3844', '713344', '', '', '枋山乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3845', '713345', '', '', '三地门乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3846', '713346', '', '', '雾台乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3847', '713347', '', '', '玛家乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3848', '713348', '', '', '泰武乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3849', '713349', '', '', '来义乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3850', '713350', '', '', '春日乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3851', '713351', '', '', '狮子乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3852', '713352', '', '', '牡丹乡', '3819', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3853', '713400', '', '台东县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3854', '713401', '', '', '台东市', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3855', '713421', '', '', '成功镇', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3856', '713422', '', '', '关山镇', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3857', '713423', '', '', '卑南乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3858', '713424', '', '', '鹿野乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3859', '713425', '', '', '池上乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3860', '713426', '', '', '东河乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3861', '713427', '', '', '长滨乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3862', '713428', '', '', '太麻里乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3863', '713429', '', '', '大武乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3864', '713430', '', '', '绿岛乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3865', '713431', '', '', '海端乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3866', '713432', '', '', '延平乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3867', '713433', '', '', '金峰乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3868', '713434', '', '', '达仁乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3869', '713435', '', '', '兰屿乡', '3853', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3870', '713500', '', '花莲县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3871', '713501', '', '', '花莲市', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3872', '713521', '', '', '凤林镇', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3873', '713522', '', '', '玉里镇', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3874', '713523', '', '', '新城乡', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3875', '713524', '', '', '吉安乡', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3876', '713525', '', '', '寿丰乡', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3877', '713526', '', '', '光复乡', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3878', '713527', '', '', '丰滨乡', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3879', '713528', '', '', '瑞穗乡', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3880', '713529', '', '', '富里乡', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3881', '713530', '', '', '秀林乡', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3882', '713531', '', '', '万荣乡', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3883', '713532', '', '', '卓溪乡', '3870', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3884', '713600', '', '澎湖县', '', '3512', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3885', '713601', '', '', '马公市', '3884', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3886', '713621', '', '', '湖西乡', '3884', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3887', '713622', '', '', '白沙乡', '3884', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3888', '713623', '', '', '西屿乡', '3884', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3889', '713624', '', '', '望安乡', '3884', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3890', '713625', '', '', '七美乡', '3884', '116', '39', 'wwfmzesx7y');
INSERT INTO `model_nation` VALUES ('3891', '810000', '香港特别行政区', '', '', '1', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3892', '810100', '', '香港岛', '', '3891', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3893', '810101', '', '', '中西区', '3892', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3894', '810102', '', '', '湾仔区', '3892', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3895', '810103', '', '', '东区', '3892', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3896', '810104', '', '', '南区', '3892', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3897', '810200', '', '九龙', '', '3891', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3898', '810201', '', '', '油尖旺区', '3897', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3899', '810202', '', '', '深水埗区', '3897', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3900', '810203', '', '', '九龙城区', '3897', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3901', '810204', '', '', '黄大仙区', '3897', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3902', '810205', '', '', '观塘区', '3897', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3903', '810300', '', '新界', '', '3891', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3904', '810301', '', '', '荃湾区', '3903', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3905', '810302', '', '', '屯门区', '3903', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3906', '810303', '', '', '元朗区', '3903', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3907', '810304', '', '', '北区', '3903', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3908', '810305', '', '', '大埔区', '3903', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3909', '810306', '', '', '西贡区', '3903', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3910', '810307', '', '', '沙田区', '3903', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3911', '810308', '', '', '葵青区', '3903', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3912', '810309', '', '', '离岛区', '3903', '114.173355', '22.320048', 'wecnyp4rxy');
INSERT INTO `model_nation` VALUES ('3913', '820000', '澳门特别行政区', '', '', '1', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3914', '820100', '', '澳门半岛', '', '3913', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3915', '820101', '', '', '花地玛堂区', '3914', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3916', '820102', '', '', '圣安多尼堂区', '3914', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3917', '820103', '', '', '大堂区', '3914', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3918', '820104', '', '', '望德堂区', '3914', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3919', '820105', '', '', '风顺堂区', '3914', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3920', '820200', '', '氹仔岛', '', '3913', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3921', '820201', '', '', '嘉模堂区', '3920', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3922', '820300', '', '路环岛', '', '3913', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3923', '820301', '', '', '圣方济各堂区', '3922', '113.54909', '22.198951', 'webwrc5ym8');
INSERT INTO `model_nation` VALUES ('3924', '110100', '', '北京市', '', '2', '116.405285', '39.904989', 'wx4g0b7xrt');
INSERT INTO `model_nation` VALUES ('3925', '120100', '', '天津市', '', '19', '117.190182', '39.125596', 'wwgqddx715');
INSERT INTO `model_nation` VALUES ('3926', '310100', '', '上海市', '', '857', '121.472644', '31.231706', 'wtw3sjt9vg');
INSERT INTO `model_nation` VALUES ('3927', '500100', '', '重庆市', '', '2459', '106.504962', '29.533155', 'wm78p86e17');

-- ----------------------------
-- Table structure for model_uav
-- ----------------------------
DROP TABLE IF EXISTS `model_uav`;
CREATE TABLE `model_uav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `uav_model_id` int(11) NOT NULL,
  `uav_id_code` varchar(50) NOT NULL,
  `uav_sim` varchar(50) DEFAULT NULL,
  `controller_sim` varchar(50) DEFAULT NULL,
  `nation` varchar(40) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `purchase_time` datetime DEFAULT NULL,
  `mile_age` double DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `time` datetime DEFAULT NULL,
  `is_flying` tinyint(1) NOT NULL,
  `last_job` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uav_id_code` (`uav_id_code`),
  KEY `model_uav_user_id_407f70b6_fk_model_myuser_id` (`user_id`),
  KEY `model_uav_uav_model_id_7794194e_fk_model_uav_model_id` (`uav_model_id`),
  CONSTRAINT `model_uav_uav_model_id_7794194e_fk_model_uav_model_id` FOREIGN KEY (`uav_model_id`) REFERENCES `model_uav_model` (`id`),
  CONSTRAINT `model_uav_user_id_407f70b6_fk_model_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `model_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_uav
-- ----------------------------
INSERT INTO `model_uav` VALUES ('1', '1', '1', 'Deluxe20150513', '111', '111000', '150102', 'beijing', '2015-05-14 16:00:00', '30000', '1', '2016-07-13 15:39:56', '0', '20160715');
INSERT INTO `model_uav` VALUES ('2', '2', '2', 'Deluxe20150514', '111', '111', '110108', 'beijing', '2015-05-15 09:41:46', '0', '1', '2015-10-25 21:52:17', '0', '');
INSERT INTO `model_uav` VALUES ('4', '1', '1', '1', '1', '1', '110101', '1', '2015-05-17 16:00:00', '0', '1', '2015-10-25 21:52:20', '0', '');
INSERT INTO `model_uav` VALUES ('5', '1', '1', '2', '2', '2', '110101', '2', '2015-05-17 16:00:00', '0', '1', '0000-00-00 00:00:00', '0', '');
INSERT INTO `model_uav` VALUES ('7', '1', '2', '3', '3', '3', '110101', '3', '2015-05-17 16:00:00', '0', '1', '0000-00-00 00:00:00', '0', '');
INSERT INTO `model_uav` VALUES ('8', '1', '1', '222222222', '2222222222', '222222222', '', 'beijing', '2015-05-29 16:00:00', '0', '0', '0000-00-00 00:00:00', '0', '');

-- ----------------------------
-- Table structure for model_uav_desc_recover
-- ----------------------------
DROP TABLE IF EXISTS `model_uav_desc_recover`;
CREATE TABLE `model_uav_desc_recover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uav_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `lng` double NOT NULL,
  `lat` double NOT NULL,
  `height` double DEFAULT NULL,
  `AGL` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `compass` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `model_uav_desc_recover_uav_id_2c66e458_fk_model_uav_id` (`uav_id`),
  CONSTRAINT `model_uav_desc_recover_uav_id_2c66e458_fk_model_uav_id` FOREIGN KEY (`uav_id`) REFERENCES `model_uav` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_uav_desc_recover
-- ----------------------------

-- ----------------------------
-- Table structure for model_uav_desc_recover_thr
-- ----------------------------
DROP TABLE IF EXISTS `model_uav_desc_recover_thr`;
CREATE TABLE `model_uav_desc_recover_thr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc_id` int(11) NOT NULL,
  `DataFlag` varchar(20) DEFAULT NULL,
  `NumAct` int(11) NOT NULL,
  `Limit` varchar(20) DEFAULT NULL,
  `Time` int(11) NOT NULL,
  `VNorth` double DEFAULT NULL,
  `VEast` double DEFAULT NULL,
  `VDown` double DEFAULT NULL,
  `GPSFix` varchar(20) DEFAULT NULL,
  `Flag` varchar(20) DEFAULT NULL,
  `pDOP` varchar(20) DEFAULT NULL,
  `numSV` int(11) NOT NULL,
  `GPSWeek` int(11) NOT NULL,
  `GPSTow` datetime DEFAULT NULL,
  `ROLL` double DEFAULT NULL,
  `PITCH` double DEFAULT NULL,
  `YAW` double DEFAULT NULL,
  `ALT` double DEFAULT NULL,
  `TAS` double DEFAULT NULL,
  `WSouth` double DEFAULT NULL,
  `WWest` double DEFAULT NULL,
  `LRPM` double DEFAULT NULL,
  `RRPM` double DEFAULT NULL,
  `DensR` double DEFAULT NULL,
  `OAT` double DEFAULT NULL,
  `Xaccel` double DEFAULT NULL,
  `Yaccel` double DEFAULT NULL,
  `Zaccel` double DEFAULT NULL,
  `RollRate` double DEFAULT NULL,
  `PitchRate` double DEFAULT NULL,
  `YawRate` double DEFAULT NULL,
  `StaticP` double DEFAULT NULL,
  `DynP` double DEFAULT NULL,
  `XMagField` double DEFAULT NULL,
  `YMagField` double DEFAULT NULL,
  `ZMagField` double DEFAULT NULL,
  `FuelFlow` double DEFAULT NULL,
  `Fuel` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desc_id` (`desc_id`),
  CONSTRAINT `model_uav__desc_id_7e62c21759c659fd_fk_model_uav_desc_recover_id` FOREIGN KEY (`desc_id`) REFERENCES `model_uav_desc_recover` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_uav_desc_recover_thr
-- ----------------------------

-- ----------------------------
-- Table structure for model_uav_job_desc
-- ----------------------------
DROP TABLE IF EXISTS `model_uav_job_desc`;
CREATE TABLE `model_uav_job_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `AGL` double DEFAULT NULL,
  `lng` double NOT NULL,
  `lat` double NOT NULL,
  `Compass` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `model_uav_job_desc_detail_id_6e850e2a_fk_model_uav_job_detail_id` (`detail_id`),
  CONSTRAINT `model_uav_job_desc_detail_id_6e850e2a_fk_model_uav_job_detail_id` FOREIGN KEY (`detail_id`) REFERENCES `model_uav_job_detail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_uav_job_desc
-- ----------------------------
INSERT INTO `model_uav_job_desc` VALUES ('1', '12', '2016-07-15 19:23:05', '116.228758', '40.010776', '50', '0', '116.228758', '40.010776', '0');
INSERT INTO `model_uav_job_desc` VALUES ('2', '12', '2016-07-15 19:23:20', '116.228558', '40.010976', '50', '0', '116.228558', '40.010976', '0');
INSERT INTO `model_uav_job_desc` VALUES ('3', '12', '2016-07-15 19:23:35', '116.228358', '40.011176', '50', '0', '116.228358', '40.011176', '0');
INSERT INTO `model_uav_job_desc` VALUES ('4', '12', '2016-07-15 19:23:50', '116.228158', '40.011376', '50', '0', '116.228158', '40.011376', '0');
INSERT INTO `model_uav_job_desc` VALUES ('5', '12', '2016-07-15 19:24:05', '116.227858', '40.011576', '50', '0', '116.227858', '40.011576', '0');
INSERT INTO `model_uav_job_desc` VALUES ('6', '12', '2016-07-15 19:24:20', '116.227558', '40.011776', '50', '0', '116.227558', '40.011776', '0');
INSERT INTO `model_uav_job_desc` VALUES ('7', '12', '2016-07-15 19:24:30', '116.227358', '40.011876', '50', '0', '116.227358', '40.011876', '0');
INSERT INTO `model_uav_job_desc` VALUES ('8', '12', '2016-07-15 19:24:40', '116.227158', '40.011776', '50', '0', '116.227158', '40.011776', '0');
INSERT INTO `model_uav_job_desc` VALUES ('137', '1', '2015-12-26 16:09:10', '116.4', '40.4', '50', '0', '116.36848', '40.008095', null);
INSERT INTO `model_uav_job_desc` VALUES ('138', '1', '2015-12-26 16:09:15', '116.3', '40.3', '50', '0', '116.36442', '40.008164', null);
INSERT INTO `model_uav_job_desc` VALUES ('139', '1', '2015-12-26 16:09:20', '116.2', '40.2', '50', '0', '116.361024', '40.009408', null);
INSERT INTO `model_uav_job_desc` VALUES ('140', '1', '2015-12-26 16:09:25', '116.35991', '40.010016', '50', '0', '116.35991', '40.010016', null);
INSERT INTO `model_uav_job_desc` VALUES ('141', '1', '2015-12-26 16:09:30', '116.359701', '40.010536', '50', '0', '116.359701', '40.010536', null);

-- ----------------------------
-- Table structure for model_uav_job_desc_thr
-- ----------------------------
DROP TABLE IF EXISTS `model_uav_job_desc_thr`;
CREATE TABLE `model_uav_job_desc_thr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc_id` int(11) NOT NULL,
  `DataFlag` varchar(20) DEFAULT NULL,
  `NumAct` int(11) NOT NULL,
  `Limit_THR` varchar(20) DEFAULT NULL,
  `Time` int(11) NOT NULL,
  `VNorth` double DEFAULT NULL,
  `VEast` double DEFAULT NULL,
  `VDown` double DEFAULT NULL,
  `GPSFix` varchar(20) DEFAULT NULL,
  `Flag` varchar(20) DEFAULT NULL,
  `pDOP` varchar(20) DEFAULT NULL,
  `numSV` int(11) NOT NULL,
  `GPSWeek` int(11) NOT NULL,
  `GPSTow` datetime DEFAULT NULL,
  `ROLL` double DEFAULT NULL,
  `PITCH` double DEFAULT NULL,
  `YAW` double DEFAULT NULL,
  `ALT` double DEFAULT NULL,
  `TAS` double DEFAULT NULL,
  `WSouth` double DEFAULT NULL,
  `WWest` double DEFAULT NULL,
  `LRPM` double DEFAULT NULL,
  `RRPM` double DEFAULT NULL,
  `DensR` double DEFAULT NULL,
  `OAT` double DEFAULT NULL,
  `Xaccel` double DEFAULT NULL,
  `Yaccel` double DEFAULT NULL,
  `Zaccel` double DEFAULT NULL,
  `RollRate` double DEFAULT NULL,
  `PitchRate` double DEFAULT NULL,
  `YawRate` double DEFAULT NULL,
  `StaticP` double DEFAULT NULL,
  `DynP` double DEFAULT NULL,
  `XMagField` double DEFAULT NULL,
  `YMagField` double DEFAULT NULL,
  `ZMagField` double DEFAULT NULL,
  `FuelFlow` double DEFAULT NULL,
  `Fuel` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desc_id` (`desc_id`),
  CONSTRAINT `model_uav_job__desc_id_3af7116a9172ffec_fk_model_uav_job_desc_id` FOREIGN KEY (`desc_id`) REFERENCES `model_uav_job_desc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_uav_job_desc_thr
-- ----------------------------

-- ----------------------------
-- Table structure for model_uav_job_detail
-- ----------------------------
DROP TABLE IF EXISTS `model_uav_job_detail`;
CREATE TABLE `model_uav_job_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `uav_id` int(11) NOT NULL,
  `LLHT` varchar(100) DEFAULT NULL,
  `confirm` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_uav_job_detail_job_id_2ac90eae_fk_model_job_id` (`job_id`),
  KEY `model_uav_job_detail_uav_id_7ef78a1c_fk_model_uav_id` (`uav_id`),
  CONSTRAINT `model_uav_job_detail_job_id_2ac90eae_fk_model_job_id` FOREIGN KEY (`job_id`) REFERENCES `model_job` (`id`),
  CONSTRAINT `model_uav_job_detail_uav_id_7ef78a1c_fk_model_uav_id` FOREIGN KEY (`uav_id`) REFERENCES `model_uav` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_uav_job_detail
-- ----------------------------
INSERT INTO `model_uav_job_detail` VALUES ('1', '1', '1', 'job/border/LLHT.txt', '1');
INSERT INTO `model_uav_job_detail` VALUES ('5', '1', '4', '', '0');
INSERT INTO `model_uav_job_detail` VALUES ('6', '1', '7', '', '1');
INSERT INTO `model_uav_job_detail` VALUES ('7', '14', '1', '', '1');
INSERT INTO `model_uav_job_detail` VALUES ('8', '21', '1', '', '1');
INSERT INTO `model_uav_job_detail` VALUES ('11', '24', '1', '', '1');
INSERT INTO `model_uav_job_detail` VALUES ('12', '25', '1', '', '1');

-- ----------------------------
-- Table structure for model_uav_model
-- ----------------------------
DROP TABLE IF EXISTS `model_uav_model`;
CREATE TABLE `model_uav_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uav_model` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `function_type` varchar(30) DEFAULT NULL,
  `serial_number` varchar(50) DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `origin_place` varchar(50) DEFAULT NULL,
  `design_date` date DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `load_weight` int(11) NOT NULL,
  `diagonal_distance` double DEFAULT NULL,
  `propeller_num` int(11) NOT NULL,
  `max_rise` double DEFAULT NULL,
  `max_decline` double DEFAULT NULL,
  `max_speed` double DEFAULT NULL,
  `max_height` double DEFAULT NULL,
  `max_angle` double DEFAULT NULL,
  `precision_v` double DEFAULT NULL,
  `precision_h` double DEFAULT NULL,
  `GPS_mode` varchar(30) DEFAULT NULL,
  `signal_mode` varchar(30) DEFAULT NULL,
  `other` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uav_model` (`uav_model`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_uav_model
-- ----------------------------
INSERT INTO `model_uav_model` VALUES ('1', 'uav20150513', 'phantom3', 'Camera', 'phantom3', 'DaJiang', 'China', '2015-05-14', '1280', '0', '0.59', '4', '5', '3', '16', '6000', '0', '0.1', '1', 'GPS', '4G', 'other');
INSERT INTO `model_uav_model` VALUES ('2', 'uav20150514', 'uav20150514', 'uav20150514', 'uav20150514', 'uav20150514', 'uav20150514', '2015-05-15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '77', '', '');
INSERT INTO `model_uav_model` VALUES ('3', '2123123444', '231231', '231444', '321312', '3123545444', '1231231', '2016-06-20', '231', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2766', '2');

-- ----------------------------
-- Table structure for model_uav_ss
-- ----------------------------
DROP TABLE IF EXISTS `model_uav_ss`;
CREATE TABLE `model_uav_ss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uav_id` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `job_number` varchar(50) DEFAULT NULL,
  `MainPowerV` double DEFAULT NULL,
  `MainPowerA` double DEFAULT NULL,
  `ServoPowerV` double DEFAULT NULL,
  `ServoPowerA` double DEFAULT NULL,
  `InternalV` varchar(20) DEFAULT NULL,
  `BoardT` double DEFAULT NULL,
  `RSSI` double DEFAULT NULL,
  `VSWR` double DEFAULT NULL,
  `DataSource` varchar(20) DEFAULT NULL,
  `NavHealth` varchar(20) DEFAULT NULL,
  `HorizStdDev` double DEFAULT NULL,
  `VertStdDev` double DEFAULT NULL,
  `RollBias` double DEFAULT NULL,
  `PitchBias` double DEFAULT NULL,
  `YawBias` double DEFAULT NULL,
  `XAccBias` double DEFAULT NULL,
  `YAccBias` double DEFAULT NULL,
  `ZAccBias` double DEFAULT NULL,
  `XMagBias` double DEFAULT NULL,
  `YMagBias` double DEFAULT NULL,
  `ZMagBias` double DEFAULT NULL,
  `GlobalStatus` varchar(20) DEFAULT NULL,
  `Failure` varchar(20) DEFAULT NULL,
  `Actions` varchar(20) DEFAULT NULL,
  `Tracker` varchar(20) DEFAULT NULL,
  `TrackerStatus` varchar(20) DEFAULT NULL,
  `OrbitRadius` double DEFAULT NULL,
  `NumLoops` double DEFAULT NULL,
  `LoopStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `model_uav_ss_uav_id_13130f222e74f711_fk_model_uav_id` (`uav_id`),
  CONSTRAINT `model_uav_ss_uav_id_13130f222e74f711_fk_model_uav_id` FOREIGN KEY (`uav_id`) REFERENCES `model_uav` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_uav_ss
-- ----------------------------
