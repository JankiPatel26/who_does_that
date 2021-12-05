  set termout on
  set feedback on
  prompt Building WHO_DOES_THAT database.  Please wait ...

  set linesize 160;
  set wrap off;

  column description format A20;
  column membership_name format A20;

  create table MEMBERSHIP(
  membership_id NUMBER(10) NOT NULL,
  membership_name VARCHAR(20) CONSTRAINT validmembership_name CHECK (membership_name LIKE 'U-%' OR membership_name LIKE 'B-%'),
  monthly_cost   decimal(10,2),
  yearly_cost  decimal(10,2),
  description VARCHAR(500),
  user_type VARCHAR(20),
  PRIMARY KEY (membership_id)
  );

  insert into MEMBERSHIP values(1, 'U-MLB � Basic',0,NULL,'Full access to search Who Does That? database of businesses, phone numbers,and real-time reviews.','customer_user');
  insert into MEMBERSHIP values(2,'U-MLS � Standard',4.99,NULL , 'All features of the BASIC plan,Ability to set additional user preferences,Free access to CONNECT,Ability to link social media accounts','customer_user');
  insert into MEMBERSHIP values(3,'U-MLP � Premium',9.99,NULL,'All features of the STANDARD plan,CONNECT-PAY,Ability to schedule services and appointments,Free membership to �WDT � Winners� (Loyalty program)','customer_user');
  insert into MEMBERSHIP values(4,'B-MLB � Basic',9.99,99.00,'Business name and contact information available to all users,Access to 5 most recent reviews,Links to business website and Facebook page made available to all users','business_user');
  insert into MEMBERSHIP values(5,'B-MLS � Standard',NULL,349.99,'All features of the STANDARD plan,free connect, connect-pay, �DUMPS� containing all connection and Click information,Access to ALL reviews,FREE social media blasts with business information','business_user');

 column name format A20;
 column e-mail_id format A20;
 column password format A20;
 column email_id format A20;
 column location_id format A20;
 column signup_date format A20;
 column membership_start_date format A20;
 column membership_end_date format A20;
 column business_URL format A20;
 column operating_hours format A20;
 column SOCIAL_MEDIA_URL1 format A20;
 column SOCIAL_MEDIA_URL2 format A20;
 column SOCIAL_MEDIA_URL3 format A20;

 create table WDT_USER(
 user_id  NUMBER(10) NOT NULL,
 name     VARCHAR(100),
 email_iD VARCHAR(150),
 password VARCHAR(50),
 location_id CHAR(50) CONSTRAINT validlocation_id CHECK (location_id LIKE 'L%'),
 membership_id NUMBER(10) NOT NULL,
 signUp_date  DATE NOT NULL,
 approval_status   CHAR(20),
 membership_start_date  DATE,
 membership_end_date DATE,
 payment_duration  VARCHAR(20),
 super_id   CHAR(10) NOT NULL CONSTRAINT validsuper_id CHECK (super_id LIKE 'S%'),
 phone      VARCHAR(15),
 user_type  VARCHAR(20) NOT NULL,
 business_URL VARCHAR(200),
 business_photo VARCHAR(200),
 description  VARCHAR(500),
 operating_hours  VARCHAR(150),
 social_media_URL1 VARCHAR(500),
 social_media_URL2 VARCHAR(500),
 social_media_URL3 VARCHAR(500),
 average_rating    decimal(10,1),
 click_count      NUMBER(5),
 response_time    VARCHAR(15),
 loyalty_point     NUMBER(5),
 rating_preference decimal(10,1),
 PRIMARY KEY (user_id),
 FOREIGN KEY (membership_id) REFERENCES MEMBERSHIP(membership_id)
);

insert into WDT_USER values(10,'jeck smith','j_s108@gmail.com','jeck_2','L001',1,TO_DATE('2020/09/01','yyyy/mm/dd'),'approved',TO_DATE('2020/09/01', 'yyyy/mm/dd'),TO_DATE('2020/10/01', 'yyyy/mm/dd'),'monthly','S001','010-102-1123','customer_user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into WDT_USER values(20,'steve Johnson','steve@gmil.com','steve_3','L002',2,TO_DATE('2020/10/01','yyyy/mm/dd'),'approved',TO_DATE('2020/10/01','yyyy/mm/dd'),TO_DATE('2020/11/01','yyyy/mm/dd'),'monthly','S001','123-123-1223','customer_user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert into WDT_USER values(30,'Liam Brown','lib@gmil.com','Liam_1','L003',3,TO_DATE('2020/05/04','yyyy/mm/dd'),'approved',TO_DATE('2020/05/04','yyyy/mm/dd'),TO_DATE('2020/06/04','yyyy/mm/dd'),'monthly','S002','124-485-7900','customer_user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,3.0);
insert into WDT_USER values(40,'inchi restaurant','inrest100@gmail.com','Noah_1','L004',4,TO_DATE('2019/10/01','yyyy/mm/dd'),'approved',TO_DATE('2019/10/01','yyyy/mm/dd'),TO_DATE('2020/10/01','yyyy/mm/dd'),'yearly','S002','234-006-8695','business_user','www.inchirestaurant.com','https://imgbb.com/upload','indian chines restaurant. Provide indian, chines traditional food,sea food, choctails, continental. Home delivery available.','Mon - Fri : 10AM to 11PM, SAT-SUN: 9.00 AM TO 1.00 PM',
                              'www.facebook.com/inchirestaurant26','https://www.linkedin.com/inchi','https://twitter.com/inchirest',
                                3.5,56,'30 mins',NULL,NULL);
insert into WDT_USER values(50,'olive automobile','olive@gmail.com','Olive_2','L005',5,TO_DATE('2019/05/02','yyyy/mm/dd'),'approved',TO_DATE('2019/05/02','yyyy/mm/dd'),TO_DATE('2020/05/02','yyyy/mm/dd'),'yearly','S003','987-102-7905','business_user','www.oliveautomobile.us','https://imgbb.com/upload1','ProReflection is a auto detailing company that provides professional and quality service in the Austin area.  We specialize in ceramic coating , clear-bra / paint protection film installation , paint correction.',
                              'Mon - Fri : 10AM to 11PM, SAT: 10 AM TO 3 PM , SUN: HOLIDAY',
                              'www.facebook.com/oliveauto111','https://www.linkedin.com/olive','https://twitter.com/oliveauto',
                                4.0,90,'30 mins',NULL,NULL);

column category_name format A20;
column category_id format A20;
column parent_category format A20;

create table CATEGORY(
  category_id  CHAR(10) NOT NULL,
  category_name   VARCHAR(100) NOT NULL,
  parent_category CHAR(10),
  PRIMARY KEY (category_id),
  FOREIGN KEY (parent_category) REFERENCES CATEGORY(category_id)
  );

insert into CATEGORY values('A0001','Automotive ',NULL);
insert into CATEGORY values('R0001','Food',NULL);
insert into CATEGORY values('A0101','repair and replace','A0001');
insert into CATEGORY values('R5050','general','R0001');
insert into CATEGORY values('N5069','delivery','R0001');

  create table BUSINESS_CATEGORY_RELATION(
     business_id  NUMBER(10) NOT NULL,
     category_id  CHAR(10) NOT NULL,
     PRIMARY KEY (business_id,category_id),
     FOREIGN KEY (business_id) REFERENCES WDT_USER(user_id),
     FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
     );

insert into BUSINESS_CATEGORY_RELATION values(40,'R0001');
insert into BUSINESS_CATEGORY_RELATION values(40,'R5050');
insert into BUSINESS_CATEGORY_RELATION values(40,'N5069');
insert into BUSINESS_CATEGORY_RELATION values(50,'A0001');
insert into BUSINESS_CATEGORY_RELATION values(50,'A0101');

column job_id format A20;
column customer_id format A20;
column business_id format A20;
column employee_name format A20;
column job_status format A20;
column job_description format A20;

  create table JOB(
   job_id NUMBER(10) NOT NULL,
   customer_id NUMBER(10) NOT NULL,
   business_id NUMBER(10) NOT NULL,
   employee_name VARCHAR(100) NOT NULL,
   job_status VARCHAR(100) NOT NULL,
   job_amount decimal(10,2) NOT NULL,
   job_description VARCHAR(100),
   category_id CHAR(10),
   start_date DATE,
   completion_date DATE,
   PRIMARY KEY (job_id),
   FOREIGN KEY (customer_id) REFERENCES WDT_USER(user_id),
   FOREIGN KEY (business_id) REFERENCES WDT_USER(user_id),
   FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
   );

   insert into JOB values(10110,10,40,'john parker','completed',50.00,'order of continental food ITEM 5','R0001',TO_DATE('2020/09/03','yyyy/mm/dd'),TO_DATE('2020/09/03','yyyy/mm/dd'));
   insert into JOB values(10111,10,50,'jonny K.','completed',25.00,'tires replacement of car','A0101',TO_DATE('2020/09/04','yyyy/mm/dd'),TO_DATE('2020/09/05','yyyy/mm/dd'));
   insert into JOB values(10112,20,40,'smith paul','completed',27.50,'delivery of indian food','N5069',TO_DATE('2020/10/04','yyyy/mm/dd'),TO_DATE('2020/10/04','yyyy/mm/dd'));
   insert into JOB values(10113,20,50,'lisa M.','completed',30.00,'freeze checking and replacement of parts','A0101',TO_DATE('2020/05/01','yyyy/mm/dd'),TO_DATE('2020/05/05','yyyy/mm/dd'));
   insert into JOB values(10114,30,40,'kitty S.','processing',75.00,'online order of seafood','R5050',TO_DATE('2020/03/02','yyyy/mm/dd'),NULL);

   column review_text format A20;
   column review_date format A20;

   create table REVIEW(
    review_id NUMBER(10) NOT NULL,
    customer_id NUMBER(10) NOT NULL,
    business_id NUMBER(10) NOT NULL,
    review_date DATE,
    rating decimal(10,1),
    review_text VARCHAR(50),
    PRIMARY KEY (review_id),
    FOREIGN KEY (customer_id) REFERENCES WDT_USER(user_id),
    FOREIGN KEY (business_id) REFERENCES WDT_USER(user_id)
    );

insert into REVIEW values(111,10,40,TO_DATE('2020/09/04','yyyy/mm/dd'),TO_NUMBER('3.5'),'nice food but slow service');
insert into REVIEW values(222,10,50,TO_DATE('2020/09/10','yyyy/mm/dd'),4.0,'perfect sevice, fast');
insert into REVIEW values(333,20,40,TO_DATE('2020/10/10','yyyy/mm/dd'),2.0,'not tasty');
insert into REVIEW values(444,20,50,TO_DATE('2020/10/07','yyyy/mm/dd'),4.0,'parts quality is good,good service');
insert into REVIEW values(555,30,40,TO_DATE('2020/05/08','yyyy/mm/dd'),4.5,'amazing food, very tasty');

    create table MESSAGE(
    message_id NUMBER(10) NOT NULL,
    message_text VARCHAR(50),
    sent_time TIMESTAMP(2),
    sender_id NUMBER(10),
    receiver_id NUMBER(10),
    PRIMARY KEY (message_id),
    FOREIGN KEY (sender_id) REFERENCES WDT_USER(user_id),
    FOREIGN KEY (receiver_id) REFERENCES WDT_USER(user_id)
    );


insert into MESSAGE values(145978,'Do you have item X in stock?',TO_TIMESTAMP('2020/10/04 12:00:17','YYYY/MM/DD HH24:MI:SS'),10,50);
insert into MESSAGE values(149853,'are you available today?',TO_TIMESTAMP('2020/05/01 11:10:20','YYYY/MM/DD HH24:MI:SS'),10,50);
insert into MESSAGE values(234934,'can we meet today?',TO_TIMESTAMP('2020/10/03 15:05:15','YYYY/MM/DD HH24:MI:SS'),20,50);
insert into MESSAGE values(355346,'can you delivery food in 30 mins?',TO_TIMESTAMP('2020/09/15 14:08:20','YYYY/MM/DD HH24:MI:SS'),20,50);
insert into MESSAGE values(306467,'Do you have item Y in stock?',TO_TIMESTAMP('2020/03/08 17:30:16','YYYY/MM/DD HH24:MI:SS'),20,50);

select customer_id,business_id,rating from review where customer_id = '10';
