USE fioretti_M153;
CREATE TABLE `customer`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `given_name` VARCHAR(255) NOT NULL,
    `family_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `order`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `fk_customer_id` INT NOT NULL,
    `order_date` DATE NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE `article`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `fk_delivery_company_id` INT NULL,
    `fk_producer_company_id` INT NULL,
    `name` VARCHAR(255) NOT NULL,
    `price` INT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE `article_order`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `fk_order_id` INT NULL,
    `fk_article_id` INT NULL,
    `article_amount` INT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE `adress`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `fk_customer_id` INT NULL,
    `street` VARCHAR(255) NOT NULL,
    `house_number` VARCHAR(255) NOT NULL,
    `zip_code` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE `company`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
/* COMMIT Before here*/
ALTER TABLE
    `order`
    ADD FOREIGN KEY(`fk_customer_id`) REFERENCES `customer`(`id`);
ALTER TABLE
    `article` ADD FOREIGN KEY(`fk_delivery_company_id`) REFERENCES `company`(`id`);
ALTER TABLE
    `article` ADD FOREIGN KEY(`fk_producer_company_id`) REFERENCES `company`(`id`);
ALTER TABLE
    `article_order` ADD FOREIGN KEY(`fk_order_id`) REFERENCES `order`(`id`);
ALTER TABLE
    `article_order` ADD FOREIGN KEY(`fk_article_id`) REFERENCES `article`(`id`);
ALTER TABLE
    `adress` ADD FOREIGN KEY(`fk_customer_id`) REFERENCES `customer`(`id`);