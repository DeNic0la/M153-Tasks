
create table Info (
    info_number integer,
    info_text varchar(10)
);
insert into Info (info_number, info_text) values
(1, 'First'),
(2, 'Second'),
(3, 'Third'),
(4, 'Fourth'),
(5, 'Fifth');

DELIMITER $$
create trigger DeleteTest
    BEFORE DELETE
    ON Info FOR EACH ROW
    BEGIN
        SIGNAL SQLSTATE 'MYSQL' SET MESSAGE_TEXT = 'SE Supirior SQL Dialect';
    END$$

DELIMITER ;

DELETE FROM Info
where info_number = 1;

drop trigger
if exists DeleteTest;


DELIMITER $$
create trigger DeleteTest
    BEFORE DELETE
    ON Info
    BEGIN
        SIGNAL SQLSTATE 'MYSQL' SET MESSAGE_TEXT = 'SE Supirior SQL Dialect';
    END$$

DELIMITER ;