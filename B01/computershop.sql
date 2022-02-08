CREATE TABLE `Customer`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `given_name` VARCHAR(255) NOT NULL,
    `family_name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `Order`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `fk_customer_id` INT NOT NULL,
    `order_date` DATE NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE `Article`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `fk_delivery_company_id` INT NULL,
    `fk_producer_company_id` INT NULL,
    `name` VARCHAR(255) NOT NULL,
    `price` INT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE `Article_Order`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `fk_order_id` INT NULL,
    `fk_article_id` INT NULL,
    `article_amount` INT NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE `Adress`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `fk_customer_id` INT NULL,
    `street` VARCHAR(255) NOT NULL,
    `house_number` VARCHAR(255) NOT NULL,
    `zip_code` INT NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE `Company`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);
/* COMMIT Before here*/
ALTER TABLE
    `Order` 
    ADD FOREIGN KEY(`fk_customer_id`) REFERENCES `Customer`(`id`);
ALTER TABLE
    `Article` ADD FOREIGN KEY(`fk_delivery_company_id`) REFERENCES `Company`(`id`);
ALTER TABLE
    `Article` ADD FOREIGN KEY(`fk_producer_company_id`) REFERENCES `Company`(`id`);
ALTER TABLE
    `Article_Order` ADD FOREIGN KEY(`fk_order_id`) REFERENCES `Order`(`id`);
ALTER TABLE
    `Article_Order` ADD FOREIGN KEY(`fk_article_id`) REFERENCES `Article`(`id`);
ALTER TABLE
    `Adress` ADD FOREIGN KEY(`fk_customer_id`) REFERENCES `Customer`(`id`);