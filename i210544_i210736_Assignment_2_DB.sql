create database DB_Ass2
use DB_Ass2


CREATE TABLE corp (
    corp_id INT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    phone# VARCHAR(255) NOT NULL,
    PRIMARY KEY (corp_id)
);

CREATE TABLE emp (
    emp_id INT,
    name VARCHAR(255) NOT NULL,
    position VARCHAR(255) NOT NULL,
    phone# VARCHAR(255) NOT NULL,
    shift_type VARCHAR(255) NOT NULL,
    start_time INT NOT NULL,
    end_time INT NOT NULL,
    salary FLOAT NOT NULL,
    maintainance_hrs INT NOT NULL,
    PRIMARY KEY (emp_id)
);

CREATE TABLE hang (
    hang_id INT,
    location VARCHAR(255) NOT NULL,
    capacity INT NOT NULL,
    PRIMARY KEY (hang_id)
);

CREATE TABLE own (
    own_id INT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (own_id)
);

CREATE TABLE plane (
    plane_id INT NOT NULL,
    reg# VARCHAR(10) NOT NULL,
    type VARCHAR(255) NOT NULL,
    maintenance_required INT NOT NULL,
    purchase_date DATE NOT NULL,
    purchase_price INT NOT NULL,
    own_id INT,
    corp_id INT,
    hang_id INT NOT NULL,
	capacity INT NOT NULL,
	purchase_from INT,
    PRIMARY KEY (plane_id),
    FOREIGN KEY (own_id) REFERENCES own(own_id),
    FOREIGN KEY (corp_id) REFERENCES corp(corp_id),
    FOREIGN KEY (hang_id) REFERENCES hang(hang_id),
    FOREIGN KEY (purchase_from) REFERENCES corp(corp_id)
);

CREATE TABLE pilot (
    pilot_id INT,
    name VARCHAR(255) NOT NULL,
    lic_id VARCHAR(20) NOT NULL,
    type_allowed VARCHAR(255) NOT NULL,
    PRIMARY KEY (pilot_id)
);

CREATE TABLE service (
    serv_id INT,
    date DATE NOT NULL,
    description VARCHAR(255) NOT NULL,
    serv_type VARCHAR(255) NOT NULL,
    duration_minutes INT NOT NULL,
    plane_id INT NOT NULL,
    emp_id INT NOT NULL,
    PRIMARY KEY (serv_id),
    FOREIGN KEY (plane_id) REFERENCES plane(plane_id),
    FOREIGN KEY (emp_id) REFERENCES emp(emp_id)
);

select * from emp
select * from hang
select * from own
select * from corp
select * from plane
select * from pilot
select * from service

--dummy data
INSERT INTO corp (corp_id, name, location, phone#)
VALUES
    (1, 'ABC Inc.', 'New York', '123-456-7890'),
    (2, 'XYZ Corp.', 'Chicago', '987-654-3210'),
    (3, 'DEF Co.', 'San Francisco', '456-789-0123'),
    (4, 'GHI LLC', 'Los Angeles', '789-012-3456'),
    (5, 'JKL Enterprises', 'Miami', '234-567-8901'),
    (6, 'MNO Industries', 'Boston', '876-543-2109'),
    (7, 'PQR Corporation', 'Houston', '345-678-9012'),
    (8, 'STU Inc.', 'Dallas', '678-901-2345'),
    (9, 'VWX Corporation', 'Seattle', '901-234-5678'),
    (10, 'YZA Co.', 'Atlanta', '432-109-8765'),
    (11, 'BCD Inc.', 'Denver', '210-987-6543'),
    (12, 'EFG Corp.', 'Washington D.C.', '543-210-9876'),
    (13, 'HIJ Co.', 'San Diego', '678-901-2345'),
    (14, 'KLM Enterprises', 'Phoenix', '321-654-0987'),
    (15, 'NOP Industries', 'Las Vegas', '765-432-1098'),
    (16, 'QRS Corporation', 'Portland', '987-654-3210'),
    (17, 'TUV Inc.', 'Austin', '210-987-6543'),
    (18, 'WXY Corporation', 'New Orleans', '432-109-8765'),
    (19, 'ZAB Co.', 'Philadelphia', '654-098-3210'),
    (20, 'CDE Inc.', 'Detroit', '109-876-5432');

INSERT INTO emp (emp_id, name, position, phone#, shift_type, start_time, end_time, salary, maintainance_hrs)
VALUES
    (1, 'John Doe', 'Manager', '555-1234', 'Day', 8, 17, 7500.00, 40),
    (2, 'Jane Smith', 'Assistant Manager', '555-5678', 'Night', 17, 2, 6500.00, 35),
    (3, 'Bob Johnson', 'Maintenance Technician', '555-9876', 'Day', 8, 17, 5000.00, 45),
    (4, 'Alice Brown', 'Maintenance Technician', '555-4321', 'Night', 17, 2, 5000.00, 45),
    (5, 'David Lee', 'Security Guard', '555-5555', 'Day', 8, 17, 4500.00, 10),
    (6, 'Karen Davis', 'Security Guard', '555-1111', 'Night', 17, 2, 4500.00, 6),
    (7, 'Mark Taylor', 'Janitor', '555-2222', 'Day', 8, 17, 4000.00, 30),
    (8, 'Maria Rodriguez', 'Janitor', '555-3333', 'Night', 17, 2, 4000.00, 30),
    (9, 'Chris Brown', 'Sales Associate', '555-4444', 'Day', 8, 17, 6000.00, 2),
    (10, 'Amanda White', 'Sales Associate', '555-5556', 'Night', 17, 2, 6000.00, 20),
    (11, 'Mike Wilson', 'IT Specialist', '555-6666', 'Day', 8, 17, 8000.00, 9),
    (12, 'Jenny Chen', 'IT Specialist', '555-7777', 'Night', 17, 2, 8000.00, 20),
    (13, 'Steven Johnson', 'Customer Service Representative', '555-8888', 'Day', 8, 17, 5500.00, 1),
    (14, 'Nancy Lee', 'Customer Service Representative', '555-9999', 'Night', 17, 2, 5500.00, 10),
    (15, 'Eric Davis', 'Accountant', '555-0000', 'Day', 8, 17, 9000.00, 15),
    (16, 'Rachel Miller', 'Accountant', '555-1212', 'Night', 17, 2, 9000.00, 15),
    (17, 'Tom Jackson', 'Human Resources Specialist', '555-3434', 'Day', 8, 17, 7000.00, 3),
    (18, 'Sophie Wilson', 'Human Resources Specialist', '555-5656', 'Night', 17, 2, 7000.00, 2),
    (19, 'Brian Parker', 'Marketing Manager', '555-7878', 'Day', 8, 17, 8500.00, 18),
    (20, 'Melissa Gomez', 'Marketing Manager', '555-9090', 'Night', 17, 2,150.00,3);

INSERT INTO hang (hang_id, location, capacity)
VALUES
    (1, 'New York', 5),
    (2, 'Los Angeles', 7),
    (3, 'Chicago', 10),
    (4, 'Houston', 6),
    (5, 'Philadelphia', 15),
    (6, 'Phoenix', 6),
    (7, 'San Antonio', 5),
    (8, 'San Diego', 8),
    (9, 'Dallas', 7),
    (10, 'San Jose', 7),
    (11, 'Austin', 6),
    (12, 'Jacksonville', 6),
    (13, 'Fort Worth', 8),
    (14, 'Columbus', 5),
    (15, 'San Francisco', 9),
    (16, 'Charlotte', 4),
    (17, 'Indianapolis', 6),
    (18, 'Seattle', 6),
    (19, 'Denver', 5),
    (20, 'Washington', 5);

INSERT INTO own (own_id, name, address, phone)
VALUES 
	(1, 'John Smith', '123 Main St, Anytown USA', '555-1234'),
	(2, 'Jane Doe', '456 Oak St, Anytown USA', '555-5678'),
	(3, 'Bob Johnson', '789 Elm St, Anytown USA', '555-9012'),
	(4, 'Mary Brown', '321 Maple St, Anytown USA', '555-3456'),
	(5, 'David Lee', '654 Pine St, Anytown USA', '555-7890'),
	(6, 'Susan Kim', '987 Cedar St, Anytown USA', '555-2345'),
	(7, 'Michael Chen', '246 Birch St, Anytown USA', '555-6789'),
	(8, 'Karen Patel', '369 Walnut St, Anytown USA', '555-0123'),
	(9, 'William Wong', '582 Cherry St, Anytown USA', '555-4567'),
	(10, 'Jennifer Davis', '795 Sycamore St, Anytown USA', '555-8901'),
	(11, 'Richard Nguyen', '135 Oakwood Ave, Anytown USA', '555-2345'),
	(12, 'Emily Taylor', '468 Elmwood Ave, Anytown USA', '555-6789'),
	(13, 'Thomas Lee', '791 Maplewood Ave, Anytown USA', '555-0123'),
	(14, 'Laura Martinez', '234 Pinecrest Rd, Anytown USA', '555-4567'),
	(15, 'George Wilson', '567 Forest Rd, Anytown USA', '555-8901'),
	(16, 'Victoria Garcia', '890 River Rd, Anytown USA', '555-2345'),
	(17, 'Kevin Scott', '123 Lakeview Dr, Anytown USA', '555-6789'),
	(18, 'Amanda Baker', '456 Hilltop Dr, Anytown USA', '555-0123'),
	(19, 'Brian Ramirez', '789 Meadow Ln, Anytown USA', '555-4567'),
	(20, 'Julia Hernandez', '321 Brookside Dr, Anytown USA', '555-8901');

INSERT INTO plane (plane_id, reg#, type, maintenance_required, purchase_date, purchase_price, own_id, corp_id, hang_id, capacity, purchase_from)
VALUES 
    (1, 'ABC123', 'A320', 1, '2022-04-15', 50000000, 2, 1, 5, 150, null),
    (2, 'DEF456', 'B737', 0, '2022-05-20', 60000000, 1, 3, 8, 200, 2),
    (3, 'GHI789', 'A330', 1, '2022-07-10', 70000000, 3, 2, 7, 250, 1),
    (4, 'JKL012', 'B777', 0, '2022-08-01', 80000000, 4, 4, 9, 300, null),
    (5, 'MNO345', 'A380', 1, '2022-09-05', 90000000, 2, 5, 10, 350, 3),
    (6, 'PQR678', 'B747', 0, '2022-10-10', 100000000, 1, 6, 11, 400, null),
    (7, 'STU901', 'A320', 1, '2022-11-15', 50000000, 2, 7, 5, 150, null),
    (8, 'VWX234', 'B737', 0, '2022-12-20', 60000000, 3, 8, 8, 200, 4),
    (9, 'YZA567', 'A330', 1, '2023-01-10', 70000000, 1, 9, 7, 250, 2),
    (10, 'BCD890', 'B777', 0, '2023-02-01', 80000000, 5, 10, 9, 300, null),
    (11, 'EFG123', 'A380', 1, '2023-03-05', 90000000, 4, 11, 10, 350, 3),
    (12, 'HIJ456', 'B747', 0, '2023-04-10', 100000000, 2, 12, 11, 400, null),
    (13, 'KLM789', 'A320', 1, '2023-05-15', 50000000, 3, 13, 5, 150, null),
    (14, 'NOP012', 'B737', 0, '2023-06-20', 60000000, 1, 14, 8, 200, 5),
    (15, 'QRS345', 'A330', 1, '2023-07-10', 70000000, 2, 15, 7, 250, 4),
    (16, 'TUV678', 'B777', 0, '2023-08-01', 80000000, 4, 16, 9, 300, null),
	(17, 'WXY901', 'A380', 1, '2023-09-05', 90000000, 3, 17, 10, 350, 2),
    (18, 'ZAB234', 'B747', 0, '2023-10-10', 100000000, 1, 18, 11, 400, null),
    (19, 'CDE567', 'A320', 1, '2023-11-15', 50000000, 5, 19, 5, 150, null),
    (20, 'FGH890', 'B737', 0, '2023-12-20', 60000000, 2, 20, 8, 200, 3),
    (21, 'IJK123', 'A330', 1, '2023-01-10', 70000000, 4, 1, 7, 250, 4),
    (22, 'LMN456', 'B777', 0, '2023-02-01', 80000000, 3, 2, 9, 300, null),
    (23, 'OPQ789', 'A380', 1, '2022-03-05', 90000000, 1, 3, 10, 350, 2),
    (24, 'RST012', 'B747', 0, '2023-04-10', 100000000, 5, 4, 11, 400, null),
    (25, 'UVW345', 'A320', 1, '2022-05-15', 50000000, 4, 5, 5, 150, null),
    (26, 'XYZ678', 'B737', 0, '2022-06-20', 60000000, 2, 6, 8, 200, 1),
    (27, 'ABC901', 'A330', 1, '2022-07-10', 70000000, 3, 7, 7, 250, 5),
    (28, 'DEF234', 'B777', 0, '2023-08-01', 80000000, 1, 8, 9, 300, null),
    (29, 'GHI567', 'A380', 1, '2023-09-05', 90000000, 5, 9, 10, 350, 3),
    (30, 'JKL890', 'B747', 0, '2023-10-10', 100000000, 4, 10, 11, 400, null),
	(31, 'ABC123', 'A320', 1, '2023-11-15', 50000000, 3, 11, 5, 150, null),
    (32, 'DEF456', 'B737', 0, '2023-12-20', 60000000, 1, 12, 8, 200, 2),
    (33, 'GHI789', 'A330', 1, '2023-01-10', 70000000, 5, 13, 7, 250, null),
    (34, 'JKL012', 'B777', 0, '2022-02-01', 80000000, 2, 14, 9, 300, 4),
    (35, 'MNO345', 'A380', 1, '2022-03-05', 90000000, 4, 15, 10, 350, null),
    (36, 'PQR678', 'B747', 0, '2021-04-10', 100000000, 3, 16, 11, 400, 1),
    (37, 'STU901', 'A320', 1, '2021-05-15', 50000000, 1, 17, 5, 150, null),
    (38, 'VWX234', 'B737', 0, '2022-06-20', 60000000, 5, 18, 8, 200, 3),
    (39, 'YZA567', 'A330', 1, '2022-07-10', 70000000, 2, 19, 7, 250, null),
    (40, 'BCD890', 'B777', 0, '2023-08-01', 80000000, 4, 20, 9, 300, 2),
    (41, 'EFG123', 'A380', 1, '2023-09-05', 90000000, 1, 1, 10, 350, null),
    (42, 'HIJ456', 'B747', 0, '2022-10-10', 100000000, 5, 2, 11, 400, 3),
    (43, 'KLM789', 'A320', 1, '2022-11-15', 50000000, 4, 3, 5, 150, null),
    (44, 'NOP012', 'B737', 0, '2023-12-20', 60000000, 2, 4, 8, 200, 1),
    (45, 'QRS345', 'A330', 1, '2021-01-10', 70000000, 3, 5, 7, 250, null),
    (46, 'TUV678', 'B777', 0, '2020-02-01', 80000000, 1, 6, 9, 300, 5),
    (47, 'TUZ678', 'B707', 0, '2020-12-01', 2000000, 3, 2, 6, 300, 5),
	(48, 'ZAB234', 'B747', 0, '2021-04-10', 100000000, 2, 7, 11, 400, 4),
    (49, 'CDE567', 'A320', 1, '2023-05-15', 50000000, 5, 8, 5, 150, null),
    (50, 'FGH890', 'B737', 0, '2023-06-20', 60000000, 3, 9, 8, 200, 2),
    (51, 'IJK123', 'A330', 1, '2023-07-10', 70000000, 4, 10, 7, 250, null),
    (52, 'LMN456', 'B777', 0, '2022-08-01', 80000000, 1, 11, 9, 300, 3),
    (53, 'OPQ789', 'A380', 1, '2022-09-05', 90000000, 2, 12, 10, 350, null),
    (54, 'RST012', 'B747', 0, '2022-10-10', 100000000, 5, 13, 11, 400, 1),
    (55, 'UVW345', 'A320', 1, '2022-11-15', 50000000, 3, 14, 5, 150, null),
    (56, 'XYZ678', 'B737', 0, '2023-12-20', 60000000, 4, 15, 8, 200, 5),
    (57, 'ABC901', 'A330', 1, '2022-01-10', 70000000, 1, 16, 7, 250, null),
    (58, 'DEF234', 'B777', 0, '2023-02-01', 80000000, 2, 17, 9, 300, 4),
    (59, 'GHI567', 'A380', 1, '2022-03-05', 90000000, 5, 18, 10, 350, null),
    (60, 'JKL890', 'B747', 0, '2022-04-10', 100000000, 3, 19, 11, 400, 2);


INSERT INTO pilot (pilot_id, name, lic_id, type_allowed) VALUES
	(1, 'John Smith', 'P12345', 'B737'),
	(2, 'Jane Doe', 'P54321', 'A320'),
	(3, 'Mike Johnson', 'P98765', 'B777'),
	(4, 'Sara Lee', 'P23456', 'A330'),
	(5, 'David Brown', 'P65432', 'B747'),
	(6, 'Mary Jones', 'P56789', 'A380'),
	(7, 'Tom Wilson', 'P34567', 'B787'),
	(8, 'Emily Chen', 'P87654', 'A350'),
	(9, 'Chris Lee', 'P43210', 'B737'),
	(10, 'Laura Wang', 'P09876', 'A320'),
	(11, 'Andrew Kim', 'P23456', 'B777'),
	(12, 'Stephanie Lee', 'P65432', 'A330'),
	(13, 'Peter Park', 'P56789', 'B747'),
	(14, 'Linda Chen', 'P34567', 'A380'),
	(15, 'Tim Lee', 'P87654', 'B787'),
	(16, 'Jennifer Kim', 'P43210', 'A350'),
	(17, 'Scott Chen', 'P12345', 'B737'),
	(18, 'Amy Lee', 'P54321', 'A320'),
	(19, 'Justin Smith', 'P98765', 'B777'),
	(20, 'Grace Lee', 'P23456', 'A330');

INSERT INTO service (serv_id, date, description, serv_type, duration_minutes, plane_id, emp_id) VALUES
	(1, '2022-08-20', 'Engine checkup', 'A320', 120, 7, 11),
	(2, '2022-11-30', 'Landing gear inspection', 'B737', 90, 29, 4),
	(3, '2023-01-15', 'Routine maintenance', 'A330', 180, 12, 6),
	(4, '2022-12-10', 'Oil change', 'B747', 60, 44, 18),
	(5, '2022-09-02', 'Avionics test', 'A320', 120, 27, 13),
	(6, '2022-11-25', 'Fuel system check', 'B737', 90, 36, 16),
	(7, '2023-02-01', 'Engine overhaul', 'A330', 360, 3, 10),
	(8, '2022-09-17', 'Hydraulic system maintenance', 'B747', 180, 51, 6),
	(9, '2022-12-08', 'Landing gear inspection', 'A320', 90, 13, 19),
	(10, '2022-11-29', 'Routine maintenance', 'B737', 120, 42, 7),
	(11, '2023-03-02', 'Avionics test', 'A330', 180, 28, 9),
	(12, '2022-10-01', 'Fuel system check', 'B747', 60, 55, 5),
	(13, '2022-08-25', 'Engine overhaul', 'A320', 360, 19, 2),
	(14, '2023-02-20', 'Hydraulic system maintenance', 'B737', 120, 49, 20),
	(15, '2022-10-27', 'Landing gear inspection', 'A330', 90, 7, 8),
	(16, '2022-12-15', 'Routine maintenance', 'B747', 180, 38, 4),
	(17, '2022-09-05', 'Avionics test', 'A320', 120, 47, 1),
	(18, '2022-11-20', 'Fuel system check', 'B737', 90, 18, 9),
	(19, '2023-01-10', 'Engine overhaul', 'A330', 360, 33, 15),
	(20, '2022-09-23', 'Hydraulic system maintenance', 'B747', 120, 2, 17),
	(21, '2022-12-05', 'Landing gear inspection', 'A320', 90, 52, 12),
	(22, '2022-11-24', 'Routine maintenance', 'B737', 120, 22, 17),
	(23, '2023-03-01', 'Avionics test', 'A330', 180, 41, 14),
	(24, '2022-10-02', 'Fuel system check', 'B747', 60, 5, 3),
	(25, '2021-06-15', 'Oil change', 'AC3', 45, 55, 11),
	(26, '2022-09-28', 'Battery replacement', 'DW2', 60, 17, 7),
	(27, '2021-05-02', 'Engine tune-up', 'SU4', 90, 32, 4),
	(28, '2022-10-13', 'Landing gear inspection', 'CR1', 120, 42, 17),
	(29, '2022-03-06', 'Routine maintenance', 'AC3', 180, 19, 3),
	(30, '2021-11-19', 'Fuel system check', 'DW2', 30, 7, 15),
	(31, '2022-04-11', 'Hydraulic system repair', 'SU4', 75, 33, 12),
	(32, '2022-06-25', 'Propeller replacement', 'CR1', 180, 47, 7),
	(33, '2021-12-31', 'Cabin cleaning', 'AC3', 45, 13, 14),
	(34, '2022-02-14', 'Wing inspection', 'DW2', 60, 22, 19),
	(35, '2021-09-01', 'Fuselage repair', 'SU4', 120, 10, 2),
	(36, '2022-11-30', 'Electrical system maintenance', 'CR1', 90, 56, 5),
	(37, '2022-07-09', 'Engine overhaul', 'AC3', 240, 31, 1),
	(38, '2022-05-22', 'Avionics upgrade', 'DW2', 180, 52, 10),
	(39, '2022-08-11', 'Brake system repair', 'SU4', 120, 27, 8),
	(40, '2021-11-07', 'Radiator cleaning', 'CR1', 30, 9, 20),
	(41, '2023-03-18', 'Engine Check', 'B737', 90, 43, 16),
	(42, '2023-03-22', 'Fueling', 'A320', 45, 56, 3),
	(43, '2023-03-26', 'Landing Gear Maintenance', 'B747', 120, 19, 8),
	(44, '2023-03-28', 'Interior Cleaning', 'A330', 60, 12, 18),
	(45, '2023-03-31', 'Engine Overhaul', 'B737', 240, 52, 13),
	(46, '2023-04-02', 'Hydraulic System Check', 'A320', 90, 7, 9),
	(47, '2023-04-05', 'Fueling', 'B747', 45, 34, 15),
	(48, '2023-04-08', 'Aircraft Inspection', 'A330', 180, 25, 7),
	(49, '2023-04-11', 'Engine Check', 'B737', 90, 46, 6),
	(50, '2023-04-14', 'Landing Gear Maintenance', 'A320', 120, 22, 8),
	(51, '2023-04-18', 'Interior Cleaning', 'B747', 60, 60, 11),
	(52, '2023-04-20', 'Engine Overhaul', 'A330', 240, 30, 7),
	(53, '2023-04-23', 'Hydraulic System Check', 'B737', 90, 5, 17),
	(54, '2023-04-26', 'Fueling', 'A320', 45, 48, 19),
	(55, '2023-04-29', 'Aircraft Inspection', 'B747', 180, 15, 1),
	(56, '2023-05-02', 'Engine Check', 'A330', 90, 58, 14),
	(57, '2023-05-05', 'Landing Gear Maintenance', 'B737', 120, 37, 20),
	(58, '2023-05-08', 'Interior Cleaning', 'A320', 60, 16, 4),
	(59, '2023-05-12', 'Hydraulic System Check', 'B747', 90, 40, 19),
	(60, '2023-05-15', 'Fueling', 'A330', 45, 10, 5);
--Task3
SELECT plane_id,reg#,type,own_id,corp_id,hang_id
FROM plane
WHERE (maintenance_required=1);

--Task4
SELECT corp.name, corp.location
FROM corp
JOIN plane ON corp.corp_id = plane.corp_id
WHERE plane.capacity > 200

--Task5
SELECT AVG(salary) AS Avg_Salary_Night
FROM emp
WHERE shift_type = 'Night' AND (start_time >= 22 OR end_time <= 6)

--Task6
SELECT TOP 5 emp_id,name, maintainance_hrs AS total_hours
FROM emp
ORDER BY total_hours DESC

--Task7
SELECT plane.type, service.plane_id, service.serv_id
FROM service
LEFT JOIN plane ON service.plane_id = plane.plane_id
WHERE service.date >= DATEADD(week,-1,GETDATE())

--Task8
SELECT own.name, own.phone
FROM own
JOIN plane ON plane.own_id = own.own_id
WHERE plane.purchase_date >= DATEADD(month,-1,GETDATE()) AND plane.purchase_date <= GETDATE()

--Task9
SELECT pilot.name AS pilot_name, COUNT(DISTINCT plane.plane_id) AS num_authorized_planes
FROM pilot 
JOIN plane ON pilot.type_allowed = plane.type
GROUP BY pilot.name

--Task10
SELECT Top 1 hang.location, hang.capacity - COUNT(plane.hang_id) AS available_space
FROM hang
LEFT JOIN plane ON plane.hang_id=hang.hang_id 
GROUP BY hang.capacity,hang.location
ORDER BY available_space DESC

--Task11
SELECT corp.name, COUNT(plane.plane_id) AS num_planes
FROM corp 
INNER JOIN plane ON plane.corp_id = corp.corp_id
GROUP BY corp.name
ORDER BY num_planes DESC;

--Task12
SELECT plane.type, AVG(service.duration_minutes) AS avg_hours
FROM plane
INNER JOIN service ON plane.plane_id = service.plane_id
GROUP BY plane.type

--Task13

--Task14
SELECT own.name, own.phone
FROM own 
INNER JOIN plane ON own.own_id = plane.own_id
INNER JOIN corp ON plane.corp_id = corp.corp_id
INNER JOIN hang ON corp.location = hang.hang_id
WHERE hang.location = own.address

--Task15

--Task16
SELECT emp.name, SUM(service.duration_minutes) as total_hours
FROM emp
JOIN service ON emp.emp_id = service.emp_id
JOIN plane ON plane.plane_id = service.plane_id
JOIN corp ON plane.corp_id = corp.corp_id
WHERE corp.name = 'XYZ Corp.'
GROUP BY emp.name
ORDER BY total_hours DESC;

--Task17

--Task18

--Task19
SELECT hang.location, COUNT(plane.plane_id) AS total_planes
FROM hang
LEFT JOIN plane ON hang.hang_id = plane.hang_id
GROUP BY hang.location

--Task20
SELECT type, COUNT(*) AS total_planes
FROM plane
GROUP BY type;

--Task21
SELECT plane.plane_id, COUNT(*) AS total_services
FROM service
INNER JOIN plane ON service.plane_id = plane.plane_id
GROUP BY plane.plane_id

--Task22
SELECT shift_type, AVG(salary) AS avg_salary
FROM emp
GROUP BY shift_type;

--Task23
SELECT own.name, COUNT(plane.plane_id) AS total_planes
FROM own
JOIN plane ON own.own_id = plane.own_id
GROUP BY own.name;

--Task24
SELECT plane.type, COUNT(plane.plane_id) AS num_planes_authorized
FROM plane
INNER JOIN pilot p ON type_allowed = plane.type
GROUP BY plane.type;

