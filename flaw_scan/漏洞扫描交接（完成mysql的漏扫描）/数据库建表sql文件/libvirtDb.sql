SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `libvirt_flaw_scan`;

CREATE TABLE `libvirt_flaw_scan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cve_id` varchar(100) NOT NULL,
  `f_name` varchar(1000) DEFAULT NULL COMMENT '漏洞名称',
  `f_severity` varchar(1000) DEFAULT NULL COMMENT '严重性',
  `f_describe` varchar(1000) DEFAULT NULL,
  `pub_date` varchar(100) DEFAULT NULL,
  `ud_date` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL COMMENT '涉及产品，多个用逗号隔开',
  `version` varchar(1000) DEFAULT NULL COMMENT '涉及产品版本（1.1.2,1.2.1_3.0,3.1）',
  `influence` varchar(1000) DEFAULT NULL COMMENT '机密性、完整性、可用性、攻击复杂度、攻击向量、身份认证的集体描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

