
# Triggers - What happens when...

## Trigger:

```mysql
DELIMITER $$
create trigger DeleteTest
    BEFORE DELETE
    ON Info FOR EACH ROW
    BEGIN
        SIGNAL SQLSTATE 'MYSQL' SET MESSAGE_TEXT = 'SE Supirior SQL Dialect';
    END$$

DELIMITER ;
```

## Tasks

```mysql
DELETE FROM Info
where info_number = 0;
```
-> Es passiert gar nichts

```mysql
DELETE FROM Info
where info_number = 1;
```
-> Die Nachricht wird ausgegeben

### Erklären sie die Funktion des erstellten Triggers:

Vor jedem Delete auf der INFO Tabelle wird dieser pro Rehie einmal ausgeführt.


## Upgraded Triggers
