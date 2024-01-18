CREATE DATABASE industrial_records;
USE industrial_records;
#DROP TABLE raw_material;
CREATE TABLE industrial_records.raw_material (
  rid INT NOT NULL,
  material_name VARCHAR(45) NULL,
  cost INT NULL CHECK (cost >= 0),
  PRIMARY KEY (rid)
);

CREATE TABLE industrial_records.employer (
  ename VARCHAR(45) NOT NULL,
  designation VARCHAR(45) NULL,
  PRIMARY KEY (ename));

#DROP TABLE worker;
CREATE TABLE industrial_records.worker (
  wid INT NOT NULL,
  name_ VARCHAR(45) NULL,
  address VARCHAR(90) NULL,
  skill_level INT NULL,
  midw INT NULL,
  enamew VARCHAR(45) NULL,
  PRIMARY KEY (wid)
);

CREATE TABLE industrial_records.machinery (
  mid INT NOT NULL,
  no_of_shifts INT NULL,
  products_per_shift INT NULL,
  level_ INT NULL  check(level_>0),
  consumption INT NULL,
  pidm INT NULL,
  enamem VARCHAR(45) NULL,
  PRIMARY KEY (mid)
);

CREATE TABLE industrial_records.product (
  pid INT NOT NULL,
  type_ VARCHAR(45) NULL,
  price INT NULL,
  quantity INT NULL,
  PRIMARY KEY (pid));

CREATE TABLE industrial_records.shipping (
  order_no INT NOT NULL  CHECK(order_no > 0),
  destination VARCHAR(45) NULL,
  pids INT NULL,
  no_of_products INT NULL ,
  PRIMARY KEY (order_no)
);

CREATE TABLE industrial_records.salaries (
  skill_level INT NOT NULL,
  salary INT NULL,
  PRIMARY KEY (skill_level));

CREATE TABLE industrial_records.charging (
  destination VARCHAR(45) NOT NULL,
  charges INT NULL,
  PRIMARY KEY (destination));


CREATE TABLE industrial_records.utilized_by (
  rid INT NOT NULL,
  mid INT NOT NULL,
  PRIMARY KEY (rid, mid));



ALTER TABLE industrial_records.utilized_by 
ADD INDEX `mid_idx` (`mid` ASC) VISIBLE;
;
ALTER TABLE industrial_records.utilized_by 
ADD CONSTRAINT rid
  FOREIGN KEY (rid)
  REFERENCES industrial_records.raw_material (rid)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT mid
  FOREIGN KEY (mid)
  REFERENCES industrial_records.machinery (mid)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


ALTER TABLE industrial_records.worker 
ADD INDEX skill1_idx (skill_level ASC) VISIBLE;
;
ALTER TABLE industrial_records.worker 
ADD CONSTRAINT midw
  FOREIGN KEY (midw)
  REFERENCES industrial_records.machinery (mid)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT enamew
  FOREIGN KEY (enamew)
  REFERENCES industrial_records.employer (ename)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;
  

ALTER TABLE industrial_records.salaries 
ADD CONSTRAINT skill_level
  FOREIGN KEY (skill_level)
  REFERENCES industrial_records.worker (skill_level )
  ON DELETE CASCADE
  ON UPDATE CASCADE;




ALTER TABLE industrial_records.machinery 
ADD CONSTRAINT enamem
  FOREIGN KEY (enamem)
  REFERENCES industrial_records.employer (ename)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT pidm
  FOREIGN KEY (pidm)
  REFERENCES industrial_records.product (pid)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;



ALTER TABLE industrial_records.shipping 
ADD INDEX pid_idx (pids ASC) VISIBLE;
;
ALTER TABLE industrial_records.shipping 
ADD CONSTRAINT pid
  FOREIGN KEY (pids)
  REFERENCES industrial_records.product (pid)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;


ALTER TABLE industrial_records.shipping 
ADD INDEX dest_idx (destination ASC) VISIBLE;
;


ALTER TABLE industrial_records.charging 
ADD CONSTRAINT destination
  FOREIGN KEY (destination)
  REFERENCES industrial_records.shipping (destination)
  ON DELETE CASCADE
  ON UPDATE CASCADE;