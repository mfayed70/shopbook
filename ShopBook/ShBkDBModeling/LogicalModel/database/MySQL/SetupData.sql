-- Script date 7/10/2019 9:33:56 PM
-- Server version: 5.7.10-log
-- Client version: 4.1
--

INSERT INTO `shopbook`.`SIZE_CLASSES`(`SZ_CLASS_CODE`, `SZ_CLASS_NAME`, `NOTES`, `LAST_MODIFIED`) VALUES
('Z00', 'Reserved', 'n/a', null);

INSERT INTO UNITS(FROM_UNIT, UNIT_NAME, BASIC_UNIT, MULTIPLY_BY) VALUES
('U000', 'Reserved', 'Y', 0);

INSERT INTO CATEGORIES(CAT_CODE, CAT_NAME, NOTES, CAT_IMG_NAME, CAT_IMG_TYPE) VALUES
('C0000', 'Reserved', 'n/a', '', '');

INSERT INTO BRANDS(BRAND_CODE, BRAND_NAME, NOTES, REGISTER_STATUS, LAST_MODIFIED) VALUES
('B00000', 'Reserved', 'n/a', 'N', '2019-07-11 19:53:39');

INSERT INTO MODELS(MODEL_CODE, MODEL_NAME, NOTES, REGISTER_STATUS, ORIG_MODEL_NO) VALUES
('M0000000', 'Reserved', '', 'I', 'N/A');

INSERT INTO MANUFACTURES(MNF_CODE, MNF_NAME, NOTES, REGISTER_STATUS, LAST_MODIFIED) VALUES
('F00000', 'Reserved', 'n/a', 'R', '2019-07-11 20:10:04');
