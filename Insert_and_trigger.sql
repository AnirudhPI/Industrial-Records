INSERT INTO industrial_records.product (pid, type_, price, quantity) VALUES ('111', 'toyA', '50', '3000');
INSERT INTO industrial_records.product (pid, type_, price, quantity) VALUES ('222', 'toyB', '70', '4500');
INSERT INTO industrial_records.product (pid, type_, price, quantity) VALUES ('333', 'toyC', '150', '9000');



INSERT INTO industrial_records.employer (ename, designation) VALUES ('rahul', 'level1');
INSERT INTO industrial_records.employer (ename, designation) VALUES ('ramesh', 'level2');
INSERT INTO industrial_records.employer (ename, designation) VALUES ('ravi', 'level3');


INSERT INTO industrial_records.raw_material (rid, material_name, cost) VALUES ('101', 'polyethylene', '7000');
INSERT INTO industrial_records.raw_material (rid, material_name, cost) VALUES ('102', 'pvc', '10000');
INSERT INTO industrial_records.raw_material (rid, material_name, cost) VALUES ('103', 'polypropylene', '18000');


INSERT INTO industrial_records.machinery (mid, no_of_shifts, products_per_shift, level_, consumption, pidm, enamem) VALUES ('8001', '2', '1000', '1', '24', '111', 'rahul');
INSERT INTO industrial_records.machinery (mid, no_of_shifts, products_per_shift, level_, consumption, pidm, enamem) VALUES ('8002', '1', '1000', '1', '12', '111', 'rahul');
INSERT INTO industrial_records.machinery (mid, no_of_shifts, products_per_shift, level_, consumption, pidm, enamem) VALUES ('8003', '2', '900', '2', '30', '222', 'ramesh');
INSERT INTO industrial_records.machinery (mid, no_of_shifts, products_per_shift, level_, consumption, pidm, enamem) VALUES ('8004', '3', '900', '2', '45', '222', 'ramesh');
INSERT INTO industrial_records.machinery (mid, no_of_shifts, products_per_shift, level_, consumption, pidm, enamem) VALUES ('8005', '2', '3000', '3', '60', '333', 'ravi');
INSERT INTO industrial_records.machinery (mid, no_of_shifts, products_per_shift, level_, consumption, pidm, enamem) VALUES ('8006', '1', '3000', '3', '30', '333', 'ravi');


INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('101', '8001');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('101', '8002');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('101', '8003');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('101', '8004');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('102', '8003');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('102', '8004');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('102', '8005');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('102', '8006');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('103', '8005');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('103', '8006');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('103', '8001');
INSERT INTO industrial_records.utilized_by (rid, mid) VALUES ('103', '8002');



INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12341', 'aa', 'b#01', '1', '8001', 'rahul');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12342', 'bb', 'b#02', '1', '8001', 'rahul');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12343', 'cc', 'b#03', '1', '8002', 'rahul');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12344', 'dd', 'b#04', '1', '8002', 'rahul');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12345', 'ee', 'b#05', '2', '8003', 'ramesh');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12346', 'ff', 'b#06', '2', '8003', 'ramesh');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12347', 'gg', 'b#07', '2', '8004', 'ramesh');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12348', 'hh', 'b#08', '2', '8004', 'ramesh');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12349', 'ii', 'b#09', '3', '8005', 'ravi');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12350', 'jj', 'b#10', '3', '8005', 'ravi');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12351', 'kk', 'b#11', '3', '8006', 'ravi');
INSERT INTO industrial_records.worker (wid, name_, address, skill_level, midw, enamew) VALUES ('12352', 'll', 'b#12', '3', '8006', 'ravi');


INSERT INTO industrial_records.salaries (skill_level, salary) VALUES ('1', '15000');
INSERT INTO industrial_records.salaries (skill_level, salary) VALUES ('2', '30000');
INSERT INTO industrial_records.salaries (skill_level, salary) VALUES ('3', '40000');




INSERT INTO industrial_records.shipping (order_no, destination, pids, no_of_products) VALUES ('35531', 'mumbai', '111', '2000');
INSERT INTO industrial_records.shipping (order_no, destination, pids, no_of_products) VALUES ('35532', 'chennai', '222', '1000');
INSERT INTO industrial_records.shipping (order_no, destination, pids, no_of_products) VALUES ('35533', 'bangalore', '333', '2000');
INSERT INTO industrial_records.shipping (order_no, destination, pids, no_of_products) VALUES ('35534', 'chennai', '222', '1500');
INSERT INTO industrial_records.shipping (order_no, destination, pids, no_of_products) VALUES ('35535', 'bangalore', '333', '3000');


INSERT INTO industrial_records.charging (destination, charges) VALUES ('mumbai', '3000');
INSERT INTO industrial_records.charging (destination, charges) VALUES ('bangalore', '1000');
INSERT INTO industrial_records.charging (destination, charges) VALUES ('chennai', '2000');



DELIMITER $$
USE industrial_records$$
CREATE DEFINER = CURRENT_USER TRIGGER industrial_records.shipping_AFTER_INSERT AFTER INSERT ON shipping FOR EACH ROW
BEGIN
	UPDATE product 
    SET product.quantity = product.quantity - NEW.no_of_products
    WHERE product.pid = NEW.pids;
END$$
DELIMITER ;