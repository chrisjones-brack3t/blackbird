SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `cms_cols` (
  `id` mediumint(9) NOT NULL auto_increment,
  `table_name` varchar(40) NOT NULL default '',
  `column_name` varchar(40) NOT NULL default '',
  `data_grid_name` varchar(255) NOT NULL default '',
  `display_name` varchar(40) NOT NULL default '',
  `default_value` text NOT NULL,
  `edit_channel` enum('','main','related') NOT NULL default '',
  `edit_module` enum('','plugin','boolean','hidden','readonly','checkbox','fileField','selectDefault','selectFiles','selectStatic','selectDate','selectDateTime','selectState','selectCountry','text','textarea','listManager') NOT NULL default '',
  `edit_mode` enum('','edit','insert') NOT NULL default '',
  `edit_config` text NOT NULL,
  `process_channel` enum('','main','related') NOT NULL default '',
  `process_module` varchar(20) NOT NULL default '',
  `process_mode` enum('','update','insert') NOT NULL default '',
  `process_config` text NOT NULL,
  `validate` text NOT NULL,
  `filter` text NOT NULL,
  `help` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `table_name` (`table_name`),
  KEY `column_name` (`column_name`),
  KEY `edit` (`table_name`,`column_name`,`edit_mode`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='private';

insert into `cms_cols` values('1','*','active','','','','','boolean','','','','','','','','<config>\n	<option name=\"filter\">1</option>\n</config>',''),
 ('3','*','date','','','','','selectDate','','','','','','','','',''),
 ('4','*','id','','','','','readonly','edit','','','','','','','',''),
 ('6','*','time_modified','','Mod Time','','','readonly','edit','','','','','','','',''),
 ('5','*','state','','','','','selectState','','','','','','','','',''),
 ('2','*','country','','','','','selectCountry','','','','','','','','',''),
 ('7','cms_groups','admin','','','','','boolean','','','','','','','','<config>\n	<option name=\"filter\">1</option>\n</config>',''),
 ('13','cms_users','password','','Password Reset','','','plugin','edit','','','plugin','update','','','',''),
 ('14','cms_users','password','','','','','plugin','insert','','','plugin','insert','','','',''),
 ('8','cms_groups','tables','','','','','plugin','','','','plugin','','','','',''),
 ('12','cms_users','groups','','','','','plugin','','','','plugin','','','','',''),
 ('15','cms_users','super_user','','','','','hidden','','','','','','','','',''),
 ('10','cms_history','table_name','','','','','','','','','','','','','<config>\n	<option name=\"filter\">1</option>\n</config>',''),
 ('9','cms_history','action','','','','','','','','','','','','','<config>\n	<option name=\"filter\">1</option>\n</config>',''),
 ('11','cms_history','user_id','','','','','','','','','','','','','<config>\n	<option name=\"filter\">1</option>\n</config>','');

CREATE TABLE `cms_countries` (
  `id` mediumint(9) NOT NULL default '0',
  `c_id` varchar(3) NOT NULL default '',
  `name` varchar(100) NOT NULL default '',
  `displayname` varchar(40) NOT NULL default '',
  `active` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

insert into `cms_countries` values('1','AF','Afghanistan','','1'),
 ('2','AX','Aland Islands','','1'),
 ('3','AL','Albania','','1'),
 ('4','DZ','Algeria','','1'),
 ('5','AS','American Samoa','','1'),
 ('6','AD','Andorra','','1'),
 ('7','AO','Angola','','1'),
 ('8','AI','Anguilla','','1'),
 ('9','AQ','Antarctica','','1'),
 ('10','AG','Antigua and Barbuda','','1'),
 ('11','AR','Argentina','','1'),
 ('12','AM','Armenia','','1'),
 ('13','AW','Aruba','','1'),
 ('14','AU','Australia','','1'),
 ('15','AT','Austria','','1'),
 ('16','AZ','Azerbaijan','','1'),
 ('17','BS','Bahamas','','1'),
 ('18','BH','Bahrain','','1'),
 ('19','BD','Bangladesh','','1'),
 ('20','BB','Barbados','','1'),
 ('21','BY','Belarus','','1'),
 ('22','BE','Belgium','','1'),
 ('23','BZ','Belize','','1'),
 ('24','BJ','Benin','','1'),
 ('25','BM','Bermuda','','1'),
 ('26','BT','Bhutan','','1'),
 ('27','BO','Bolivia','','1'),
 ('28','BA','Bosnia and Herzegovina','','1'),
 ('29','BW','Botswana','','1'),
 ('30','BV','Bouvet Island','','1'),
 ('31','BR','Brazil','','1'),
 ('32','IO','British Indian Ocean Territory','','1'),
 ('33','BN','Brunei Darussalam','','1'),
 ('34','BG','Bulgaria','','1'),
 ('35','BF','Burkina Faso','','1'),
 ('36','BI','Burundi','','1'),
 ('37','KH','Cambodia','','1'),
 ('38','CM','Cameroon','','1'),
 ('39','CA','Canada','','1'),
 ('40','CV','Cape Verde','','1'),
 ('41','KY','Cayman Islands','','1'),
 ('42','CF','Central African Republic','','1'),
 ('43','TD','Chad','','1'),
 ('44','CL','Chile','','1'),
 ('45','CN','China','','1'),
 ('46','CX','Christmas Island','','1'),
 ('47','CC','Cocos (Keeling) Islands','','1'),
 ('48','CO','Colombia','','1'),
 ('49','KM','Comoros','','1'),
 ('50','CG','Congo','','1'),
 ('51','CD','Congo, The Democratic Republic of The','','1'),
 ('52','CK','Cook Islands','','1'),
 ('53','CR','Costa Rica','','1'),
 ('54','CI','Cote D\'ivoire','','1'),
 ('55','HR','Croatia','','1'),
 ('56','CU','Cuba','','1'),
 ('57','CY','Cyprus','','1'),
 ('58','CZ','Czech Republic','','1'),
 ('59','DK','Denmark','','1'),
 ('60','DJ','Djibouti','','1'),
 ('61','DM','Dominica','','1'),
 ('62','DO','Dominican Republic','','1'),
 ('63','EC','Ecuador','','1'),
 ('64','EG','Egypt','','1'),
 ('65','SV','El Salvador','','1'),
 ('66','GQ','Equatorial Guinea','','1'),
 ('67','ER','Eritrea','','1'),
 ('68','EE','Estonia','','1'),
 ('69','ET','Ethiopia','','1'),
 ('70','FK','Falkland Islands (Malvinas)','','1'),
 ('71','FO','Faroe Islands','','1'),
 ('72','FJ','Fiji','','1'),
 ('73','FI','Finland','','1'),
 ('74','FR','France','','1'),
 ('75','GF','French Guiana','','1'),
 ('76','PF','French Polynesia','','1'),
 ('77','TF','French Southern Territories','','1'),
 ('78','GA','Gabon','','1'),
 ('79','GM','Gambia','','1'),
 ('80','GE','Georgia','','1'),
 ('81','DE','Germany','','1'),
 ('82','GH','Ghana','','1'),
 ('83','GI','Gibraltar','','1'),
 ('84','GR','Greece','','1'),
 ('85','GL','Greenland','','1'),
 ('86','GD','Grenada','','1'),
 ('87','GP','Guadeloupe','','1'),
 ('88','GU','Guam','','1'),
 ('89','GT','Guatemala','','1'),
 ('90','GN','Guinea','','1'),
 ('91','GW','Guinea-Bissau','','1'),
 ('92','GY','Guyana','','1'),
 ('93','HT','Haiti','','1'),
 ('94','HM','Heard Island and Mcdonald Islands','','1'),
 ('95','VA','Holy See (Vatican City State)','','1'),
 ('96','HN','Honduras','','1'),
 ('97','HK','Hong Kong','','1'),
 ('98','HU','Hungary','','1'),
 ('99','IS','Iceland','','1'),
 ('100','IN','India','','1'),
 ('101','ID','Indonesia','','1'),
 ('102','IR','Iran, Islamic Republic of','','1'),
 ('103','IQ','Iraq','','1'),
 ('104','IE','Ireland','','1'),
 ('105','IL','Israel','','1'),
 ('106','IT','Italy','','1'),
 ('107','JM','Jamaica','','1'),
 ('108','JP','Japan','','1'),
 ('109','JO','Jordan','','1'),
 ('110','KZ','Kazakhstan','','1'),
 ('111','KE','Kenya','','1'),
 ('112','KI','Kiribati','','1'),
 ('113','KP','Korea, Democratic People\'s Republic of','','1'),
 ('114','KR','Korea, Republic of','','1'),
 ('115','KW','Kuwait','','1'),
 ('116','KG','Kyrgyzstan','','1'),
 ('117','LA','Lao People\'s Democratic Republic','','1'),
 ('118','LV','Latvia','','1'),
 ('119','LB','Lebanon','','1'),
 ('120','LS','Lesotho','','1'),
 ('121','LR','Liberia','','1'),
 ('122','LY','Libyan Arab Jamahiriya','','1'),
 ('123','LI','Liechtenstein','','1'),
 ('124','LT','Lithuania','','1'),
 ('125','LU','Luxembourg','','1'),
 ('126','MO','Macao','','1'),
 ('127','MK','Macedonia, The Former Yugoslav Republic of','','1'),
 ('128','MG','Madagascar','','1'),
 ('129','MW','Malawi','','1'),
 ('130','MY','Malaysia','','1'),
 ('131','MV','Maldives','','1'),
 ('132','ML','Mali','','1'),
 ('133','MT','Malta','','1'),
 ('134','MH','Marshall Islands','','1'),
 ('135','MQ','Martinique','','1'),
 ('136','MR','Mauritania','','1'),
 ('137','MU','Mauritius','','1'),
 ('138','YT','Mayotte','','1'),
 ('139','MX','Mexico','','1'),
 ('140','FM','Micronesia, Federated States of','','1'),
 ('141','MD','Moldova, Republic of','','1'),
 ('142','MC','Monaco','','1'),
 ('143','MN','Mongolia','','1'),
 ('144','MS','Montserrat','','1'),
 ('145','MA','Morocco','','1'),
 ('146','MZ','Mozambique','','1'),
 ('147','MM','Myanmar','','1'),
 ('148','NA','Namibia','','1'),
 ('149','NR','Nauru','','1'),
 ('150','NP','Nepal','','1'),
 ('151','NL','Netherlands','','1'),
 ('152','AN','Netherlands Antilles','','1'),
 ('153','NC','New Caledonia','','1'),
 ('154','NZ','New Zealand','','1'),
 ('155','NI','Nicaragua','','1'),
 ('156','NE','Niger','','1'),
 ('157','NG','Nigeria','','1'),
 ('158','NU','Niue','','1'),
 ('159','NF','Norfolk Island','','1'),
 ('160','MP','Northern Mariana Islands','','1'),
 ('161','NO','Norway','','1'),
 ('162','OM','Oman','','1'),
 ('163','PK','Pakistan','','1'),
 ('164','PW','Palau','','1'),
 ('165','PS','Palestinian Territory, Occupied','','1'),
 ('166','PA','Panama','','1'),
 ('167','PG','Papua New Guinea','','1'),
 ('168','PY','Paraguay','','1'),
 ('169','PE','Peru','','1'),
 ('170','PH','Philippines','','1'),
 ('171','PN','Pitcairn','','1'),
 ('172','PL','Poland','','1'),
 ('173','PT','Portugal','','1'),
 ('174','PR','Puerto Rico','','1'),
 ('175','QA','Qatar','','1'),
 ('176','RE','Reunion','','1'),
 ('177','RO','Romania','','1'),
 ('178','RU','Russian Federation','','1'),
 ('179','RW','Rwanda','','1'),
 ('180','SH','Saint Helena','','1'),
 ('181','KN','Saint Kitts and Nevis','','1'),
 ('182','LC','Saint Lucia','','1'),
 ('183','PM','Saint Pierre and Miquelon','','1'),
 ('184','VC','Saint Vincent and The Grenadines','','1'),
 ('185','WS','Samoa','','1'),
 ('186','SM','San Marino','','1'),
 ('187','ST','Sao Tome and Principe','','1'),
 ('188','SA','Saudi Arabia','','1'),
 ('189','SN','Senegal','','1'),
 ('190','CS','Serbia and Montenegro','','1'),
 ('191','SC','Seychelles','','1'),
 ('192','SL','Sierra Leone','','1'),
 ('193','SG','Singapore','','1'),
 ('194','SK','Slovakia','','1'),
 ('195','SI','Slovenia','','1'),
 ('196','SB','Solomon Islands','','1'),
 ('197','SO','Somalia','','1'),
 ('198','ZA','South Africa','','1'),
 ('199','GS','South Georgia and The South Sandwich Islands','','1'),
 ('200','ES','Spain','','1'),
 ('201','LK','Sri Lanka','','1'),
 ('202','SD','Sudan','','1'),
 ('203','SR','Suriname','','1'),
 ('204','SJ','Svalbard and Jan Mayen','','1'),
 ('205','SZ','Swaziland','','1'),
 ('206','SE','Sweden','','1'),
 ('207','CH','Switzerland','','1'),
 ('208','SY','Syrian Arab Republic','','1'),
 ('209','TW','Taiwan, Province of China','','1'),
 ('210','TJ','Tajikistan','','1'),
 ('211','TZ','Tanzania, United Republic of','','1'),
 ('212','TH','Thailand','','1'),
 ('213','TL','Timor-Leste','','1'),
 ('214','TG','Togo','','1'),
 ('215','TK','Tokelau','','1'),
 ('216','TO','Tonga','','1'),
 ('217','TT','Trinidad and Tobago','','1'),
 ('218','TN','Tunisia','','1'),
 ('219','TR','Turkey','','1'),
 ('220','TM','Turkmenistan','','1'),
 ('221','TC','Turks and Caicos Islands','','1'),
 ('222','TV','Tuvalu','','1'),
 ('223','UG','Uganda','','1'),
 ('224','UA','Ukraine','','1'),
 ('225','AE','United Arab Emirates','','1'),
 ('226','GB','United Kingdom','','1'),
 ('227','US','United States','','1'),
 ('228','UM','United States Minor Outlying Islands','','1'),
 ('229','UY','Uruguay','','1'),
 ('230','UZ','Uzbekistan','','1'),
 ('231','VU','Vanuatu','','1'),
 ('232','VE','Venezuela','','1'),
 ('233','VN','Viet Nam','','1'),
 ('234','VG','Virgin Islands, British','','1'),
 ('235','VI','Virgin Islands, U.S.','','1'),
 ('236','WF','Wallis and Futuna','','1'),
 ('237','EH','Western Sahara','','1'),
 ('238','YE','Yemen','','1'),
 ('239','ZM','Zambia','','1'),
 ('240','ZW','Zimbabwe','','1');

CREATE TABLE `cms_groups` (
  `id` mediumint(9) NOT NULL auto_increment,
  `active` tinyint(4) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `tables` text NOT NULL,
  `admin` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

insert into `cms_groups` values('1','1','Administrator','<data><table name=\"cms_groups\">browse,insert,update,delete</table><table name=\"cms_history\">browse</table><table name=\"cms_sessions\">browse</table><table name=\"cms_users\">browse,insert,update,delete</table></data>','1');

CREATE TABLE `cms_headers` (
  `id` mediumint(9) NOT NULL auto_increment,
  `table_name` varchar(255) NOT NULL default '',
  `mode` enum('','data_grid','edit') NOT NULL default '',
  `javascript` text NOT NULL,
  `css` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

insert into `cms_headers` values('1','*','edit','<script type=\"text/javascript\" src=\"/cms/custom/js/custom.js\"></script>','');

CREATE TABLE `cms_history` (
  `id` mediumint(9) NOT NULL auto_increment,
  `table_name` varchar(60) NOT NULL default '',
  `record_id` mediumint(9) NOT NULL default '0',
  `action` varchar(10) NOT NULL default '',
  `user_id` mediumint(9) NOT NULL default '0',
  `sql` text NOT NULL,
  `modtime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `session_id` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `cms_relations` (
  `id` mediumint(9) NOT NULL auto_increment,
  `label` varchar(255) NOT NULL default '',
  `position` mediumint(9) NOT NULL default '0',
  `table_parent` varchar(255) NOT NULL default '',
  `column_parent` varchar(255) NOT NULL default '',
  `table_child` varchar(255) NOT NULL default '',
  `column_child` varchar(255) NOT NULL default '',
  `display` enum('data_grid','module','plugin') NOT NULL default 'data_grid',
  `config` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='private';


CREATE TABLE `cms_sessions` (
  `id` mediumint(9) NOT NULL auto_increment,
  `session_id` text NOT NULL,
  `user_id` mediumint(9) NOT NULL default '0',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `cms_states` (
  `id` mediumint(9) NOT NULL auto_increment,
  `country_id` mediumint(9) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `abbreviation` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

insert into `cms_states` values('1','227','Alabama','AL'),
 ('2','227','Alaska','AK'),
 ('3','227','Arizona','AZ'),
 ('4','227','Arkansas','AR'),
 ('5','227','California','CA'),
 ('6','227','Colorado','CO'),
 ('7','227','Connecticut','CT'),
 ('8','227','Delaware','DE'),
 ('9','227','Florida','FL'),
 ('10','227','Georgia','GA'),
 ('11','227','Hawaii','HI'),
 ('12','227','Idaho','ID'),
 ('13','227','Illinois','IL'),
 ('14','227','Indiana','IN'),
 ('15','227','Iowa','IA'),
 ('16','227','Kansas','KS'),
 ('17','227','Kentucky','KY'),
 ('18','227','Louisiana','LA'),
 ('19','227','Maine','ME'),
 ('20','227','Maryland','MD'),
 ('21','227','Massachusetts','MA'),
 ('22','227','Michigan','MI'),
 ('23','227','Minnesota','MN'),
 ('24','227','Mississippi','MS'),
 ('25','227','Missouri','MO'),
 ('26','227','Montana','MT'),
 ('27','227','Nebraska','NE'),
 ('28','227','Nevada','NV'),
 ('29','227','New Hampshire','NH'),
 ('30','227','New Jersey','NJ'),
 ('31','227','New Mexico','NM'),
 ('32','227','New York','NY'),
 ('33','227','North Carolina','NC'),
 ('34','227','North Dakota','ND'),
 ('35','227','Ohio','OH'),
 ('36','227','Oklahoma','OK'),
 ('37','227','Oregon','OR'),
 ('38','227','Pennsylvania','PA'),
 ('39','227','Rhode Island','RI'),
 ('40','227','South Carolina','SC'),
 ('41','227','South Dakota','SD'),
 ('42','227','Tennessee','TN'),
 ('43','227','Texas','TX'),
 ('44','227','Utah','UT'),
 ('45','227','Vermont','VT'),
 ('46','227','Virginia','VA'),
 ('47','227','Washington','WA'),
 ('48','227','Washington, DC','DC'),
 ('49','227','West Virginia','WV'),
 ('50','227','Wisconsin','WI'),
 ('51','227','Wyoming','WY'),
 ('52','39','Alberta',''),
 ('53','39','British Columbia',''),
 ('54','39','Manitoba',''),
 ('55','39','New Brunswick',''),
 ('56','39','Nefoundland and Labrador',''),
 ('57','39','Northwest Territories',''),
 ('58','39','Nova Scotia',''),
 ('59','39','Nunavut',''),
 ('60','39','Ontario',''),
 ('61','39','Prince Edward Island',''),
 ('62','39','Quebec',''),
 ('63','39','Saskatchewan',''),
 ('64','39','Yukon',''),
 ('65','139','Aguascalientes',''),
 ('66','139','Baja California',''),
 ('67','139','Baja California Sur',''),
 ('68','139','Campeche',''),
 ('69','139','Chiapas',''),
 ('70','139','GutiÃ©rrez',''),
 ('71','139','Chihuahua',''),
 ('72','139','Coahuila',''),
 ('73','139','Colima',''),
 ('74','139','Durango',''),
 ('75','139','Guanajuato',''),
 ('76','139','Guerrero',''),
 ('77','139','Hidalgo',''),
 ('78','139','Jalisco',''),
 ('79','139','MÃ©xico',''),
 ('80','139','MichoacÃ¡n',''),
 ('81','139','Morelos',''),
 ('82','139','Nayarit',''),
 ('83','139','Nuevo LeÃ³n',''),
 ('84','139','Oaxaca',''),
 ('85','139','Puebla',''),
 ('86','139','QuerÃ©taro',''),
 ('87','139','Quintana Roo',''),
 ('88','139','San Luis PotosÃ­',''),
 ('89','139','Sinaloa',''),
 ('90','139','Sonora',''),
 ('91','139','Tabasco',''),
 ('92','139','Tamaulipas',''),
 ('93','139','Tlaxcala',''),
 ('94','139','Veracruz',''),
 ('95','139','YucatÃ¡n',''),
 ('96','139','Zacatecas',''),
 ('97','139','Federal District','');

CREATE TABLE `cms_tables` (
  `id` mediumint(9) NOT NULL auto_increment,
  `table_name` varchar(255) NOT NULL default '',
  `display_name` varchar(255) NOT NULL default '',
  `cols_default` varchar(255) NOT NULL default '',
  `sort_default` varchar(255) NOT NULL default '',
  `display_mode` enum('','data_grid','related') NOT NULL default '',
  `edit_module` varchar(40) NOT NULL default '',
  `process_module` varchar(40) NOT NULL default '',
  `process_mode` varchar(40) NOT NULL default '',
  `in_nav` tinyint(4) NOT NULL default '0',
  `help` text NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `table_name` (`table_name`,`display_mode`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='private';

insert into `cms_tables` values('3','cms_users','','id,firstname,lastname,email,groups','','','','','','1',''),
 ('1','cms_groups','','id,active,name,admin','','','','','','1',''),
 ('2','cms_history','','*','','','','','','1','');

CREATE TABLE `cms_users` (
  `id` tinyint(4) NOT NULL auto_increment,
  `firstname` varchar(255) NOT NULL default '',
  `lastname` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `email` varchar(40) NOT NULL default '',
  `groups` varchar(255) NOT NULL default '0',
  `super_user` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

insert into `cms_users` values('1','Blackbird','Admin','fa9beb99e4029ad5a6615399e7bbae21356086b3','xdev@underdeconstruction.com','1','0');

SET FOREIGN_KEY_CHECKS = 1;
