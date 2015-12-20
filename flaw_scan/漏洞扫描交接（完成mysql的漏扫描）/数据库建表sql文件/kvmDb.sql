/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : cloud

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-09-14 21:00:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for flaw_scan
-- ----------------------------
DROP TABLE IF EXISTS `flaw_scan`;
CREATE TABLE `flaw_scan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cve_id` varchar(30) NOT NULL,
  `f_name` varchar(100) DEFAULT NULL COMMENT '漏洞名称',
  `f_severity` varchar(50) DEFAULT NULL COMMENT '严重性',
  `f_describe` varchar(1000) DEFAULT NULL,
  `pub_date` varchar(20) DEFAULT NULL,
  `ud_date` varchar(20) DEFAULT NULL,
  `product` varchar(20) DEFAULT NULL COMMENT '涉及产品，多个用逗号隔开',
  `version` varchar(1000) DEFAULT NULL COMMENT '涉及产品版本（1.1.2,1.2.1_3.0,3.1）',
  `influence` varchar(1000) DEFAULT NULL COMMENT '机密性、完整性、可用性、攻击复杂度、攻击向量、身份认证的集体描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flaw_scan
-- ----------------------------
INSERT INTO `flaw_scan` VALUES ('1', 'CVE-2015-3214', 'QEMU\'pit_ioport_read()\'函数内存损坏漏洞', '分值：6.9 中等', 'QEMU是法国程序员法布里斯-贝拉（Fabrice Bellard）所研发\n的一套模拟处理器软件。该软件具有速度快、跨平台等特点。\nQEMU中存在内存损坏漏洞，该漏洞源于程序没有对用户提\n交的输入执行正确的边界检查。攻击者可利用该漏洞以\n‘托管的QEMU进程’权限在主机上执行任意代码\n，或造成拒绝服务。', '\'2015-08-31 06:59:07', '\'2015-08-31 13:52:14', 'qemu,linux', '2.3.0_2.6.32', '机密性影响:	COMPLETE	[完全的信息泄露导致所有系统文件暴露]\n完整性影响:	COMPLETE	[系统完整性可被完全破坏]\n可用性影响:	COMPLETE	[可能导致系统完全宕机]\n攻击复杂度:	MEDIUM	[漏洞利用存在一定的访问条件]\n攻击向量:	LOCAL	[漏洞利用需要具有物理访问权限或本地帐户]\n身份认证:	NONE	[漏洞利用无需身份认证]');
INSERT INTO `flaw_scan` VALUES ('2', 'CVE-2015-4037', 'QEMU‘net/slirp.c’安全漏洞(CNNVD-201507-175)', '分值:	1.9	[轻微(LOW)]', 'QEMU中存在安全漏洞，该漏洞源于程序以不安全的方式创\n建临时文件。本地攻击者可利用该漏洞实施符号链接攻击，\n在受影响应用程序上下文中覆盖任意文件。QEMU 2.3.0版本\n中存在漏洞，其他版本也可能受到影响。', '\'2015-08-26 15:59:05', '\'2015-08-27 10:01:35', 'null', '', '机密性影响:	NONE	[对系统的机密性无影响]\n完整性影响:	NONE	[不会对系统完整性产生影响]\n可用性影响:	PARTIAL	[可能会导致性能下降或中断资源访问]\n攻击复杂度:	MEDIUM	[漏洞利用存在一定的访问条件]\n攻击向量:	LOCAL	[漏洞利用需要具有物理访问权限或本地帐户]\n身份认证:	NONE	[漏洞利用无需身份认证]');
INSERT INTO `flaw_scan` VALUES ('3', 'CVE-2015-3209', 'QEMU PCNET控制器基于堆的缓冲区溢出漏洞(CNNVD-201506-282)\n\n', '分值:	7.5	[严重(HIGH)]', 'QEMU的PCNET控制器中存在基于堆的缓冲区溢出漏洞。\n远程攻击者可通过在发送设置TXSTATUS_STARTPACKET\n位的数据包后，发送设置TXSTATUS_DEVICEOWNS位的\n特制数据包利用该漏洞执行任意代码。', '\'2015-06-15 11:59:00', '\'2015-06-17 12:23:12', 'qemu,xen', '_4.5.0', '机密性影响:	COMPLETE	[完全的信息泄露导致所有系统文件暴露]\n完整性影响:	COMPLETE	[系统完整性可被完全破坏]\n可用性影响:	COMPLETE	[可能导致系统完全宕机]\n攻击复杂度:	LOW	[漏洞利用没有访问限制 ]\n攻击向量:	LOCAL	[漏洞利用需要具有物理访问权限或本地帐户]\n身份认证:	NONE	[漏洞利用无需身份认证]');
INSERT INTO `flaw_scan` VALUES ('4', 'CVE-2015-4106', 'QEMU 安全漏洞(CNNVD-201506-048)\n\n', '分值:	7.2	[严重(HIGH)]', 'QEMU中存在安全漏洞，该漏洞源于程序没有正确限制写访\n问PCI pass-through设备的PCI配置空间。\n本地x86 HVM虚拟机端攻击者可利用该漏洞获取权限，\n造成拒绝服务（主机崩溃），获取敏感信息。', '\'2015-06-03 16:59:09', '\'2015-06-04 21:37:59', 'null', null, '机密性影响:	COMPLETE	[完全的信息泄露导致所有系统文件暴露]\n完整性影响:	COMPLETE	[系统完整性可被完全破坏]\n可用性影响:	COMPLETE	[可能导致系统完全宕机]\n攻击复杂度:	LOW	[漏洞利用没有访问限制 ]\n攻击向量:	LOCAL	[漏洞利用需要具有物理访问权限或本地帐户]\n身份认证:	NONE	[漏洞利用无需身份认证]');
INSERT INTO `flaw_scan` VALUES ('5', 'CVE-2015-3456', 'Xen QEMU Floppy Disk Controller 安全漏洞(CNNVD-201505-207)', 'CVSS分值:	7.7	[严重(HIGH)]', 'Xen 4.5.x及之前版本和KVM中使用的QEMU中的\nFloppy Disk Controller(FDC)存在安全漏洞。本地虚拟机端攻击\n者可借助FD_CMD_READ_ID或\nFD_CMD_DRIVE_SPECIFICATION_COMMAND命令利用该漏\n洞造成拒绝服务（越边界写入和虚拟机崩溃），或执行任意代\n码', '\'2015-05-13 14:59:00', '\'2015-07-16 22:02:17', 'qemu,xen', '2.3.0,4.5.0', 'H)]\n机密性影响:	COMPLETE	[完全的信息泄露导致所有系统文件暴露]\n完整性影响:	COMPLETE	[系统完整性可被完全破坏]\n可用性影响:	COMPLETE	[可能导致系统完全宕机]\n攻击复杂度:	LOW	[漏洞利用没有访问限制 ]\n攻击向量:	ADJACENT_NETWORK	[--]\n身份认证:	SINGLE_INSTANCE	[--]');
