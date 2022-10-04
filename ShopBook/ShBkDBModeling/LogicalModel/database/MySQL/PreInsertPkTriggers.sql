/*--------Units Table before Insert trigger*/
CREATE 
	DEFINER = 'shopbook'@'localhost'
TRIGGER shopbook.before_insert_units_pk
	BEFORE INSERT
	ON shopbook.units
	FOR EACH ROW
begin
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
  end;
/*-------Size Classes Table before Insert trigger*/
CREATE 
	DEFINER = 'shopbook'@'localhost'
TRIGGER shopbook.before_insert_sizeClasses_pK
	BEFORE INSERT
	ON shopbook.size_classes
	FOR EACH ROW
begin
declare xx varchar(3) default 0;
 select MIN(c.start) FROM (
SELECT substr(a.SZ_CLASS_CODE,2)+1 AS start
    FROM size_classes AS a, size_classes AS b
    WHERE substr(a.SZ_CLASS_CODE,2) < substr(b.SZ_CLASS_CODE,2)
    GROUP BY substr(a.SZ_CLASS_CODE,2)
    HAVING start < MIN(substr(b.SZ_CLASS_CODE,2)) ) c into xx;

  if (xx is null) then
select COALESCE(max(substr(size_classes.SZ_CLASS_CODE,2)),0) +1 into xx
FROM size_classes;
  end if;
  select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0',xx)
  ELSE  xx END
  into xx; 
  SET NEW.SZ_CLASS_CODE = concat('Z',xx);
  end;
/*------- Size Class Table After insert trigger*/
CREATE 
	DEFINER = 'shopbook'@'localhost'
TRIGGER shopbook.after_insert_sizeClass_pK
	AFTER INSERT
	ON shopbook.size_classes
	FOR EACH ROW
BEGIN
  DECLARE xx varchar(2) default NULL;
insert INTO size_class_dets (SZ_DET_CODE, SZ_DET_NAME, SZ_CLASS_CODE, NOTES) VALUES
  (concat(NEW.sz_class_code,'D00'), 'Reserved', NEW.sz_class_code, 'n/a');
END;
/*----- Size Class Dets Table before Insert trigger*/
CREATE 
	DEFINER = 'shopbook'@'localhost'
TRIGGER shopbook.before_insert_sizeClassDet_pK
	BEFORE INSERT
	ON shopbook.size_class_dets
	FOR EACH ROW
begin
declare xx varchar(3) default 0;
declare det_exist int(2) default 0;
 select MIN(c.start) FROM (
SELECT substr(a.SZ_DET_CODE,5)+1 AS start
    FROM size_class_dets AS a, size_class_dets AS b
    WHERE  a.SZ_CLASS_CODE = New.sz_class_code
    and   substr(a.SZ_DET_CODE,5) < substr(b.SZ_DET_CODE,5)
    GROUP BY substr(a.SZ_DET_CODE,5)
    HAVING start < MIN(substr(b.SZ_DET_CODE,5)) ) c into xx;
 select count(*) into det_exist from size_class_dets 
    where SZ_CLASS_CODE = New.SZ_CLASS_CODE;
  if (xx is null and det_exist > 0) then
select COALESCE(max(substr(size_class_dets.sz_det_code,5)),0) +1 into xx
FROM size_class_dets where SZ_CLASS_CODE = NEW.SZ_CLASS_CODE;
  select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0',xx)
  ELSE  xx END
  into xx; 
  set xx = concat('D',xx);
  SET NEW.sz_det_code = concat(NEW.sz_class_code,xx);
  elseif (xx is not null and det_exist > 0) then
   select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0',xx)
  ELSE  xx END
  into xx; 
  set xx = concat('D',xx);
  SET NEW.sz_det_code = concat(NEW.sz_class_code,xx);
  end if;
  end;
/*------  Brands Table before Insert trigger*/
CREATE 
	DEFINER = 'shopbook'@'localhost'
TRIGGER shopbook.before_insert_brands_pK
	BEFORE INSERT
	ON shopbook.brands
	FOR EACH ROW
BEGIN
    declare xx varchar(5) default null;
select MIN(c.start) FROM (
SELECT substr(a.BRAND_CODE,2)+1 AS start
    FROM brands AS a, brands AS b
    WHERE substr(a.BRAND_CODE,2) < substr(b.BRAND_CODE,2)
    GROUP BY substr(a.BRAND_CODE,2)
    HAVING start < MIN(substr(b.BRAND_CODE,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(brands.BRAND_CODE,2)),0) +1 into xx
FROM brands;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 4 
      then concat('0',xx)
  ELSE  xx END
  into xx;              
  SET NEW.BRAND_CODE = CONCAT('B',XX);
END;
/*----- Categories Table before Insert trigger*/
CREATE 
	DEFINER = 'shopbook'@'localhost'
TRIGGER shopbook.before_insert_categories_pK
	BEFORE INSERT
	ON shopbook.categories
	FOR EACH ROW
BEGIN
  declare xx varchar(4) default null;
select MIN(c.start) FROM (
SELECT substr(a.CAT_CODE,2)+1 AS start
    FROM categories AS a, categories AS b
    WHERE substr(a.CAT_CODE,2) < substr(b.CAT_CODE,2)
    GROUP BY substr(a.CAT_CODE,2)
    HAVING start < MIN(substr(b.CAT_CODE,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(categories.CAT_CODE,2)),0) +1 into xx
FROM categories;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('0',xx)
  ELSE  xx END
  into xx;              
  SET NEW.CAT_CODE = CONCAT('C',XX);
END;
/*----- Mnufacture Table before Insert trigger*/
CREATE 
	DEFINER = 'shopbook'@'localhost'
TRIGGER shopbook.before_insert_manufacture_pK
	BEFORE INSERT
	ON shopbook.manufactures
	FOR EACH ROW
BEGIN
        declare xx varchar(5) default null;
select MIN(c.start) FROM (
SELECT substr(a.MNF_CODE,2)+1 AS start
    FROM manufactures AS a, manufactures AS b
    WHERE substr(a.MNF_CODE,2) < substr(b.MNF_CODE,2)
    GROUP BY substr(a.MNF_CODE,2)
    HAVING start < MIN(substr(b.MNF_CODE,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(manufactures.MNF_CODE,2)),0) +1 into xx
FROM manufactures;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('000',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('00',xx)
  WHEN  LENGTH(xx) = 4 
      then concat('0',xx)
  ELSE  xx END
  into xx;              
  SET NEW.MNF_CODE = CONCAT('F',XX);
END;
/*------ Models Table before Insert trigger*/
CREATE 
	DEFINER = 'shopbook'@'localhost'
TRIGGER shopbook.before_insert_models_pK
	BEFORE INSERT
	ON shopbook.models
	FOR EACH ROW
BEGIN
          declare xx varchar(8) default null;
select MIN(c.start) FROM (
SELECT substr(a.MODEL_CODE,2)+1 AS start
    FROM models AS a, models AS b
    WHERE substr(a.MODEL_CODE,2) < substr(b.MODEL_CODE,2)
    GROUP BY substr(a.MODEL_CODE,2)
    HAVING start < MIN(substr(b.MODEL_CODE,2)) ) c into xx;
  if xx is null then
select COALESCE(max(substr(models.MODEL_CODE,2)),0) +1 into xx
FROM models;
end IF;
select case 
  WHEN  LENGTH(xx) = 1 
      then concat('0000000',xx)
  WHEN  LENGTH(xx) = 2 
      then concat('000000',xx)
  WHEN  LENGTH(xx) = 3 
      then concat('00000',xx)
  WHEN  LENGTH(xx) = 4 
      then concat('0000',xx)
   WHEN  LENGTH(xx) = 5 
      then concat('000',xx)
   WHEN  LENGTH(xx) = 6 
      then concat('00',xx)
   WHEN  LENGTH(xx) = 7 
      then concat('0',xx)
  ELSE  xx END
  into xx;              
  SET NEW.MODEL_CODE = CONCAT('M',XX);
END;