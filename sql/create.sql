create table post
(
	id int auto_increment not null primary key,
	title varchar(255) not null,
    description text,
    exp varchar(255),
    hire int,
    address varchar(255),
    deadline date,
    salary double not null,
    type varchar(255) not null,
    category varchar(255) not null,
    company_id int not null references company,
    user_id int not null references user

);

alter table post
add apply_count int default 0;

update post
set apply_count = 0;

CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `description` text,
  `email` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name_company` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`id`),
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELIMITER //

CREATE TRIGGER after_user_insert
AFTER INSERT ON user
FOR EACH ROW
BEGIN
    -- Check if the new user has role_id = 3
    IF NEW.role_id = 3 THEN
        INSERT INTO company (user_id)
        VALUES (NEW.id);
    END IF;
END;

//

DELIMITER ;

create table applicant
(
	user_id int references user,
    company_id int references company,
    created date default now()
);