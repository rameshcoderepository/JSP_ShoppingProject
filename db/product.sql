/*
SQLyog Community
MySQL - 5.0.15-nt : Database - product
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`product` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `product`;

/*Table structure for table `bankdetails` */

DROP TABLE IF EXISTS `bankdetails`;

CREATE TABLE `bankdetails` (
  `username` varchar(50) default NULL,
  `totalamt` varchar(50) default NULL,
  `accountnumber` varchar(50) default NULL,
  `ifsc` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bankdetails` */

insert  into `bankdetails`(`username`,`totalamt`,`accountnumber`,`ifsc`) values ('priya','$ 106.00','23412342134','42314324');
insert  into `bankdetails`(`username`,`totalamt`,`accountnumber`,`ifsc`) values ('priya','$ 143.10','344324','43534534');
insert  into `bankdetails`(`username`,`totalamt`,`accountnumber`,`ifsc`) values ('priya','$ 90.10','2321','324234');
insert  into `bankdetails`(`username`,`totalamt`,`accountnumber`,`ifsc`) values ('priya','$ 90.10','2321','324234');
insert  into `bankdetails`(`username`,`totalamt`,`accountnumber`,`ifsc`) values ('kayal','$ 143.10','3432','3243');
insert  into `bankdetails`(`username`,`totalamt`,`accountnumber`,`ifsc`) values ('priya','$ 106.00','123','12');
insert  into `bankdetails`(`username`,`totalamt`,`accountnumber`,`ifsc`) values ('maha','$ 53.00','566','555');
insert  into `bankdetails`(`username`,`totalamt`,`accountnumber`,`ifsc`) values ('priya','$ 159.00','76545','64564');
insert  into `bankdetails`(`username`,`totalamt`,`accountnumber`,`ifsc`) values ('kayal','$ 31.80','564546','44');

/*Table structure for table `billing` */

DROP TABLE IF EXISTS `billing`;

CREATE TABLE `billing` (
  `pid` varchar(100) default NULL,
  `itemname` varchar(100) default NULL,
  `qty` varchar(100) default NULL,
  `price` varchar(100) default NULL,
  `totprice` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `billing` */

insert  into `billing`(`pid`,`itemname`,`qty`,`price`,`totprice`) values ('1','Honey','2','50','100');
insert  into `billing`(`pid`,`itemname`,`qty`,`price`,`totprice`) values ('1','soap','3','10','30');

/*Table structure for table `product_items` */

DROP TABLE IF EXISTS `product_items`;

CREATE TABLE `product_items` (
  `itemid` varchar(25) NOT NULL,
  `itemname` varchar(25) default NULL,
  `mfddate` varchar(25) default NULL,
  `expdate` varchar(25) default NULL,
  `noOfQty` varchar(25) default NULL,
  `price` varchar(25) default NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `product_items` */

insert  into `product_items`(`itemid`,`itemname`,`mfddate`,`expdate`,`noOfQty`,`price`) values ('1','Dettol','11-02-2021','21-02-2022','3','35');
insert  into `product_items`(`itemid`,`itemname`,`mfddate`,`expdate`,`noOfQty`,`price`) values ('2','soap','12-02-2021','12-01-2022','8','30');
insert  into `product_items`(`itemid`,`itemname`,`mfddate`,`expdate`,`noOfQty`,`price`) values ('3','egg','01-02-2021','15-02-2021','47','15');
insert  into `product_items`(`itemid`,`itemname`,`mfddate`,`expdate`,`noOfQty`,`price`) values ('4','toothpaste','15-02-2021','15-10-2021','20','50');
insert  into `product_items`(`itemid`,`itemname`,`mfddate`,`expdate`,`noOfQty`,`price`) values ('5','chocolate','03-02-2021','15-11-2021','39','100');
insert  into `product_items`(`itemid`,`itemname`,`mfddate`,`expdate`,`noOfQty`,`price`) values ('6','Ariel Powder','03-02-2021','03-08-2021','16','151');

/*Table structure for table `promise_transaction` */

DROP TABLE IF EXISTS `promise_transaction`;

CREATE TABLE `promise_transaction` (
  `cusid` int(50) default NULL,
  `username` varchar(50) default NULL,
  `amtpaid` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `promise_transaction` */

insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 106.00');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 143.10');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 53.00');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 90.10');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (8,'kayal','$ 143.10');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 106.00');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (3,'maha','$ 53.00');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 143.10');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 143.10');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 121.90');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 121.90');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 121.90');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 159.00');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 175.96');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 175.96');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 175.96');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 175.96');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 175.96');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 175.96');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (5,'priya','$ 175.96');
insert  into `promise_transaction`(`cusid`,`username`,`amtpaid`) values (8,'kayal','$ 31.80');

/*Table structure for table `register` */

DROP TABLE IF EXISTS `register`;

CREATE TABLE `register` (
  `cusid` int(50) NOT NULL auto_increment,
  `username` varchar(20) default NULL,
  `mailid` varchar(50) default NULL,
  `password` varchar(20) default NULL,
  `cpassword` varchar(20) default NULL,
  `mobnum` varchar(10) default NULL,
  `category` varchar(10) default NULL,
  PRIMARY KEY  (`cusid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `register` */

insert  into `register`(`cusid`,`username`,`mailid`,`password`,`cpassword`,`mobnum`,`category`) values (1,'ramesh','ramesh@gamil.com','ramesh','ramesh','87945465','3');
insert  into `register`(`cusid`,`username`,`mailid`,`password`,`cpassword`,`mobnum`,`category`) values (2,'test','test@gmail.com','test','test','8745125121','3');
insert  into `register`(`cusid`,`username`,`mailid`,`password`,`cpassword`,`mobnum`,`category`) values (3,'maha','maha','73214','784372','47832432','1');
insert  into `register`(`cusid`,`username`,`mailid`,`password`,`cpassword`,`mobnum`,`category`) values (4,'hg','hjg','ghjghj','hjghj','ghjgj','2');
insert  into `register`(`cusid`,`username`,`mailid`,`password`,`cpassword`,`mobnum`,`category`) values (5,'priya','priya@gmail.com','priya','priya','9660032155','1');
insert  into `register`(`cusid`,`username`,`mailid`,`password`,`cpassword`,`mobnum`,`category`) values (6,'girija','girija@gmail.com','girija','girija','8768216612','1');
insert  into `register`(`cusid`,`username`,`mailid`,`password`,`cpassword`,`mobnum`,`category`) values (7,'sita','sita@gmail.com','sita','sita','9600123219','1');
insert  into `register`(`cusid`,`username`,`mailid`,`password`,`cpassword`,`mobnum`,`category`) values (8,'kayal','kayal@gmail.com','kayal','kayal','9884512346','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
