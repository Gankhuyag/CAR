
INSERT INTO phone(area,number,prefix) VALUES(214,333,4422);
INSERT INTO phone(area,number,prefix) VALUES(321,333,4445);
INSERT INTO phone(area,number,prefix) VALUES(256,111,3224);

INSERT INTO credential(username,password,enable) VALUES ('eshankuthu','$2a$10$I.ZaU4E9KFwaui74Y6et7On/WdqaJbZgePDPxjXOfeQBIjP5BlnP.',1);
INSERT INTO credential(username,password,enable) VALUES('Henok','$2a$10$4oklApWP6lKvilDFwBxX7O./Konz8/CQoCYju23IIzZKxJ6LnBj3K',1);
INSERT INTO credential(username,password,enable) VALUES ('Steward','$2a$10$j.fxfvcD5KyGtwUnVg8NZeGKANuEq.xWYmCPwJsMVXeV4BZukuexm',1);

INSERT INTO user (email,firstName,lastName,userStatus, phone_id,user_userId) VALUES ('kuthu.eshan@gmail.com','eshan ','kuthu','APPROVED',1,'eshankuthu');
INSERT INTO user (email,firstName,lastName,userStatus, phone_id,user_userId) VALUES ('Henok@gmail.com','Henok ','Yared ','APPROVED',2,'Henok');
INSERT INTO user (email,firstName,lastName,userStatus, phone_id,user_userId) VALUES ('Dickson@gmail.com','Steward','Dickson','APPROVED',3,'Steward');

INSERT INTO authority (authority,username)  VALUES ('ROLE_ADMIN','eshankuthu');
INSERT INTO authority (authority,username) VALUES ('ROLE_USER','Henok');
INSERT INTO authority (authority,username)  VALUES('ROLE_USER','Steward');

INSERT INTO property VALUES (1,'6','You may preview the vehicle on Monday and Tuesday.Please call the yard ahead of time to ensure prompt service.',1060,'/CAS/resources/images/0.png','Taurus',62917,'2011 Ford Taurus ',1);
INSERT INTO property VALUES (2,'4','Hybrid SUV ,Year 2008',1500,'/CAS/resources/images/0.png','Escape Hybrid',212688,'2008 Ford Escape Hybrid',2);
INSERT INTO property VALUES (3,'8','If the winning bidder lives within 50 miles of Times Square, NY, the vehicle must be picked up within 2 business days of payment ',2000,'/CAS/resources/images/0.png','E350',153831,'2006 Ford E350',3);


INSERT INTO auction VALUES (1,0,1060,'2017-12-04 17:00:00',1060,'2017-11-27 09:00:00','ACTIVE',NULL,1);
INSERT INTO auction VALUES (2,0,1500,'2017-12-04 17:00:00',1500,'2017-11-27 09:00:00','ACTIVE',NULL,2);
INSERT INTO auction VALUES (3,0,2000,'2017-12-04 17:00:00',2000,'2017-11-27 09:00:00','PENDING',NULL,3);


INSERT INTO bid VALUES (1,1068,'2017-11-20 23:14:57',1,2);
INSERT INTO bid VALUES (2,1067,'2017-11-20 23:22:52',1,3);
INSERT INTO bid VALUES (3,1700,'2017-11-20 23:23:20',2,3);