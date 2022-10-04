CREATE DEFINER=`shopbook`@`localhost` TRIGGER `shopbook`.`before_insert_units_pk` BEFORE INSERT ON `UNITS` FOR EACH ROW
BEGIN
declare xx varchar(3) default null;
 select MIN(c.start) FROM (
SELECT substr(a.FROM_UNIT,2)+1 AS start
    FROM units AS a, units AS b
    WHERE substr(a.FROM_UNIT,2) < substr(b.FROM_UNIT,2)
    GROUP BY substr(a.FROM_UNIT,2)
    HAVING start < MIN(substr(b.FROM_UNIT,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(units.FROM_UNIT,2)),0) +1 into xx
FROM units;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('00',xx)
  when LENGTH(xx) = 2
      then concat('0',xx)
  ELSE  xx END
  into xx;              

  SET NEW.FROM_UNIT = CONCAT('U',XX);
END