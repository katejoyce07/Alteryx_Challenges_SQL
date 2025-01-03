CREATE TABLE `challenge1_reference` (
  `Range` VARCHAR(1024),
  `Region` VARCHAR(1024),
  `Sales Rep` VARCHAR(1024),
  `Expect Revenue` BIGINT
);

INSERT INTO `challenge1_reference` (`Range`,`Region`,`Sales Rep`,`Expect Revenue`)
VALUES
('2000-2019','R1','John',1000000),
('2020-2039','R2','Ted',3245234),
('2040-2059','R3','Nick',456654),
('2060-2079','R4','Mike',234545),
('2080-2100','R5','Paul',1232345);
