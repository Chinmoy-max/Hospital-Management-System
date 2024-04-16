-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2020 at 12:42 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `DOCTORS` (
    `DID` INT(11) NOT NULL,
    `EMAIL` VARCHAR(50) NOT NULL,
    `DOCTORNAME` VARCHAR(50) NOT NULL,
    `DEPT` VARCHAR(100) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `DOCTORS` (
    `DID`,
    `EMAIL`,
    `DOCTORNAME`,
    `DEPT`
) VALUES (
    1,
    'anees@gmail.com',
    'anees',
    'Cardiologists'
),
(
    2,
    'amrutha@gmail.com',
    'amrutha bhatta',
    'Dermatologists'
),
(
    3,
    'aadithyaa@gmail.com',
    'aadithyaa',
    'Anesthesiologists'
),
(
    4,
    'anees@gmail',
    'anees',
    'Endocrinologists'
);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `PATIENTS` (
    `PID` INT(11) NOT NULL,
    `EMAIL` VARCHAR(50) NOT NULL,
    `NAME` VARCHAR(50) NOT NULL,
    `GENDER` VARCHAR(50) NOT NULL,
    `SLOT` VARCHAR(50) NOT NULL,
    `DISEASE` VARCHAR(50) NOT NULL,
    `TIME` TIME NOT NULL,
    `DATE` DATE NOT NULL,
    `DEPT` VARCHAR(50) NOT NULL,
    `NUMBER` VARCHAR(12) NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;

--
-- Dumping data for table `patients`
--

INSERT INTO `PATIENTS` (
    `PID`,
    `EMAIL`,
    `NAME`,
    `GENDER`,
    `SLOT`,
    `DISEASE`,
    `TIME`,
    `DATE`,
    `DEPT`,
    `NUMBER`
) VALUES (
    2,
    'anees1@gmail.com',
    'anees1 rehman khan',
    'Male1',
    'evening1',
    'cold1',
    '21:20:00',
    '2020-02-02',
    'ortho11predict',
    '9874561110'
),
(
    5,
    'patient@gmail.com',
    'patien',
    'Male',
    'morning',
    'fevr',
    '18:06:00',
    '2020-11-18',
    'Cardiologists',
    '9874563210'
),
(
    7,
    'patient@gmail.com',
    'anees',
    'Male',
    'evening',
    'cold',
    '22:18:00',
    '2020-11-05',
    'Dermatologists',
    '9874563210'
),
(
    8,
    'patient@gmail.com',
    'anees',
    'Male',
    'evening',
    'cold',
    '22:18:00',
    '2020-11-05',
    'Dermatologists',
    '9874563210'
),
(
    9,
    'aneesurrehman423@gmail.com',
    'anees',
    'Male',
    'morning',
    'cold',
    '17:27:00',
    '2020-11-26',
    'Anesthesiologists',
    '9874563210'
),
(
    10,
    'anees@gmail.com',
    'anees',
    'Male',
    'evening',
    'fever',
    '16:25:00',
    '2020-12-09',
    'Cardiologists',
    '9874589654'
);

--
-- Triggers `patients`
--
DELIMITER $$

CREATE TRIGGER `PATIENTDELETE` BEFORE
    DELETE ON `PATIENTS` FOR EACH ROW
        INSERT INTO TRIGR VALUES(NULL, OLD.PID, OLD.EMAIL, OLD.NAME, 'PATIENT DELETED', NOW()) $$ DELIMITER;
        DELIMITER $$ CREATE TRIGGER `PATIENTUPDATE` AFTER
            UPDATE ON `PATIENTS` FOR EACH ROW
                INSERT INTO TRIGR VALUES(NULL, NEW.PID, NEW.EMAIL, NEW.NAME, 'PATIENT UPDATED', NOW()) $$ DELIMITER;
                DELIMITER $$ CREATE TRIGGER `PATIENTINSERTION` AFTER
                    INSERT ON `PATIENTS` FOR EACH ROW
                        INSERT INTO TRIGR VALUES(NULL, NEW.PID, NEW.EMAIL, NEW.NAME, 'PATIENT INSERTED', NOW()) $$ DELIMITER;
 -- --------------------------------------------------------
 --
 -- Table structure for table `test`
 --
                        CREATE TABLE `TEST` ( `ID` INT(11) NOT NULL, `NAME` VARCHAR(20) NOT NULL, `EMAIL` VARCHAR(20) NOT NULL ) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;
 --
 -- Dumping data for table `test`
 --
                            INSERT INTO `TEST` (`ID`, `NAME`, `EMAIL`) VALUES (1, 'ANEES', 'ARK@GMAIL.COM'), (2, 'test', 'test@gmail.com');
 -- --------------------------------------------------------
 --
 -- Table structure for table `trigr`
 --
                            CREATE TABLE `TRIGR` ( `TID` INT(11) NOT NULL, `PID` INT(11) NOT NULL, `EMAIL` VARCHAR(50) NOT NULL, `NAME` VARCHAR(50) NOT NULL, `ACTION` VARCHAR(50) NOT NULL, `TIMESTAMP` DATETIME NOT NULL ) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;
 --
 -- Dumping data for table `trigr`
 --
                                INSERT INTO `TRIGR` (`TID`, `PID`, `EMAIL`, `NAME`, `ACTION`, `TIMESTAMP`) VALUES (1, 12, 'anees@gmail.com', 'ANEES', 'PATIENT INSERTED', '2020-12-02 16:35:10'), (2, 11, 'anees@gmail.com', 'anees', 'PATIENT INSERTED', '2020-12-02 16:37:34'), (3, 10, 'anees@gmail.com', 'anees', 'PATIENT UPDATED', '2020-12-02 16:38:27'), (4, 11, 'anees@gmail.com', 'anees', 'PATIENT UPDATED', '2020-12-02 16:38:33'), (5, 12, 'anees@gmail.com', 'ANEES', 'Patient Deleted', '2020-12-02 16:40:40'), (6, 11, 'anees@gmail.com', 'anees', 'PATIENT DELETED', '2020-12-02 16:41:10'), (7, 13, 'testing@gmail.com', 'testing', 'PATIENT INSERTED', '2020-12-02 16:50:21'), (8, 13, 'testing@gmail.com', 'testing', 'PATIENT UPDATED', '2020-12-02 16:50:32'), (9, 13, 'testing@gmail.com', 'testing', 'PATIENT DELETED', '2020-12-02 16:50:57');
 -- --------------------------------------------------------
 --
 -- Table structure for table `user`
 --
                                CREATE TABLE `USER` ( `ID` INT(11) NOT NULL, `USERNAME` VARCHAR(50) NOT NULL, `EMAIL` VARCHAR(50) NOT NULL, `PASSWORD` VARCHAR(1000) NOT NULL ) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4;
 --
 -- Dumping data for table `user`
 --
                                    INSERT INTO `USER` (`ID`, `USERNAME`, `EMAIL`, `PASSWORD`) VALUES (1, 'anees', 'anees@gmail.com', 'pbkdf2:sha256:150000$qOazJJcZ$f5075ddfa6ff3762a50aeeec0fca9e29af238c12900f32ffa64077c60d1945bd'), (2, 'anant', 'anant@gmail.com', 'pbkdf2:sha256:150000$BgQmgmxX$e1931665c21165cc0a0976350c90bd2ace0ae332fead96706e3853a29476438f'), (3, 'harshith', 'harshit@gmail.com', 'pbkdf2:sha256:150000$hp3FYWOJ$07162a675cfd7b64a50ac674fa8736481ab671c6c9e8d8eb4babb108d102f986'), (4, 'abcd', 'abcd@gmail.com', 'pbkdf2:sha256:150000$hj5e3AC2$220f9dfc7f8545f92798eadb628be4ed25494612ba26667eba19eaf65ce55f46'), (5, 'testing', 'testin@gmal.com', 'pbkdf2:sha256:150000$Tl5vPQ8O$5a862a3c1d8ab0fab47c57a403f3b09c9d6f8e5fc285718f69f38d7a7d5a84ca'), (6, 'abc', 'abc@gmail.com', 'pbkdf2:sha256:150000$V7InBfpt$0a7da8fed41610f8e6ce204120d905c8f91414a9950c382fc57199ac5c517290'), (7, 'amrutha', 'amrutha@gmail.com', 'pbkdf2:sha256:150000$LTzH8Hpq$ea5f92c85a4d4cacc80aff688805c32a501a7418d2a79795cca35915b3b0c5e7'), (8, 'aadithyaa', 'aadithyaa@gmail.com', 'pbkdf2:sha256:150000$xnyJ2Nh9$4ca83d4a314a0bce6e96d875fd12490ac6f06a9e8946786404721716ea72c5da'), (9, 'patient', 'aneesurrehman423@gmail.com', 'pbkdf2:sha256:150000$sgvOgGig$3a23dafc906bbea4dbe14ac4ec9c53a2b30abada092dad6819cd8714c406355e'), (10, 'testing', 'testing@gmail.com', 'pbkdf2:sha256:150000$envTLrmD$b3859abccfd5b190ee46479d033e2283fe4858957f42bf0a39292aad14ea5ad7');
 --
 -- Indexes for dumped tables
 --
 --
 -- Indexes for table `doctors`
 --
                                    ALTER TABLE `DOCTORS` ADD PRIMARY KEY (`DID`);
 --
 -- Indexes for table `patients`
 --
                                    ALTER TABLE `PATIENTS` ADD PRIMARY KEY (`PID`);
 --
 -- Indexes for table `test`
 --
                                    ALTER TABLE `TEST` ADD PRIMARY KEY (`ID`);
 --
 -- Indexes for table `trigr`
 --
                                    ALTER TABLE `TRIGR` ADD PRIMARY KEY (`TID`);
 --
 -- Indexes for table `user`
 --
                                    ALTER TABLE `USER` ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `EMAIL` (`EMAIL`);
 --
 -- AUTO_INCREMENT for dumped tables
 --
 --
 -- AUTO_INCREMENT for table `doctors`
 --
                                    ALTER TABLE `DOCTORS` MODIFY `DID` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
 --
 -- AUTO_INCREMENT for table `patients`
 --
                                    ALTER TABLE `PATIENTS` MODIFY `PID` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
 --
 -- AUTO_INCREMENT for table `test`
 --
                                    ALTER TABLE `TEST` MODIFY `ID` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
 --
 -- AUTO_INCREMENT for table `trigr`
 --
                                    ALTER TABLE `TRIGR` MODIFY `TID` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
 --
 -- AUTO_INCREMENT for table `user`
 --
                                    ALTER TABLE `USER` MODIFY `ID` INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
                                    COMMIT;
 /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
 /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
 /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;