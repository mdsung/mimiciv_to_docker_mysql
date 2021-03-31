alter table admissions
    drop index admissions_idx01 ,
    drop index admissions_idx02 ,
    drop index admissions_idx03 ,
    drop index admissions_idx04 ;

-- -------------
-- chartevents
-- -------------
alter table chartevents 
    drop index chartevents_idx01 ,
    drop index chartevents_idx02 ,
    drop index chartevents_idx03 ;

-- Perhaps not useful to index on just value? Index just for popular subset?
-- CREATE INDEX CHARTEVENTS_idx05 ON CHARTEVENTS ;

-- -----------
-- d_hcpcs
-- -----------

alter table d_hcpcs
    drop index d_hcpcs_idx01 ;

-- -----------
-- d_icd_diagnoses
-- -----------

alter table d_icd_diagnoses
    drop index d_icd_diagnoses_icd_code_icd_version ;

-- -----------
-- d_icd_procedures
-- -----------

alter table d_icd_procedures
    drop index d_icd_procedures_idx01 ;

-- ---------
-- d_items
-- ---------

alter table d_items
    drop index d_items_idx01 ,
    drop index d_items_idx02 ,
    drop index d_items_idx03 ,
    drop index d_items_idx04 ,
    drop index d_items_idx05 ;

-- -------------
-- d_labitems
-- -------------

alter table d_labitems
    drop index d_labitems_idx01 ,
    drop index d_labitems_idx02 ,
    drop index d_labitems_idx03 ;

-- -----------------
-- datetimeevents
-- -----------------

alter table datetimeevents
    drop index datetimeevents_idx01 ,
    drop index datetimeevents_idx02 ,
    drop index datetimeevents_idx03 ,
    drop index datetimeevents_idx04 ;

-- ----------------
-- diagnoses_icd
-- ----------------

alter table diagnoses_icd 
    drop index diagnoses_icd_idx01 ,
    drop index diagnoses_icd_idx02 ;

-- ------------
-- drgcodes
-- ------------

alter table drgcodes
    drop index drgcodes_idx01 ,
    drop index drgcodes_idx02 ,
    drop index drgcodes_idx03 ;

-- ----------------
-- emar
-- ----------------

alter table emar
    drop primary key,
    drop index emar_idx01 ,
    drop index emar_idx03 ,
    drop index emar_idx04 ,
    drop index emar_idx05 ,
    drop index emar_idx06 ;

-- ----------------
-- emar_detail
-- ----------------

alter table emar_detail
    drop index emar_idx01 ,
    drop index emar_idx02 ,
    drop index emar_idx04 ,
    drop index emar_idx05 ,
    drop index emar_idx06 ;

-- ----------------
-- hcpsevents
-- ----------------

alter table hcpcsevents
    drop index hcpcsevents_idx01 ,
    drop index hcpcsevents_idx02 ;
  
-- --------------
-- icustays
-- --------------

alter table icustays
    drop index icustays_idx01 ,
    drop index icustays_idx02 ,
    drop index icustays_idx03 ;

-- --------------
-- inputevents
-- --------------

alter table inputevents
    drop index inputevents_idx01 ,
    drop index inputevents_idx02 ,
    drop index inputevents_idx03 ,
    drop index inputevents_idx04 ,
    drop index inputevents_idx05 ,
    drop index inputevents_idx06 ;

-- ------------
-- labevents
-- ------------

alter table labevents 
    drop index labevents_idx01 ,
    drop index labevents_idx02 ,
    drop index labevents_idx03 ,
    drop index labevents_idx04 ,
    drop index labevents_idx05 ,
    drop index labevents_idx06 ;
-- Note: itemid  must be part of the primary key.

-- --------------------
-- microbiologyevents
-- --------------------

alter table microbiologyevents 
    drop index microbiologyevents_idx01 ,
    drop index microbiologyevents_idx02 ,
    drop index microbiologyevents_idx03 ;

-- --------------
-- outputevents
-- --------------

alter table outputevents
    drop index outputevents_idx01 ,
    drop index outputevents_idx02 ,
    drop index outputevents_idx03 ,
    drop index outputevents_idx04 ,
    drop index outputevents_idx05 ;

-- -----------
-- patients
-- -----------

-- note that subject_id is already indexed as it is 

alter table patients
    drop index patients_idx01 ,
    drop index patients_idx02 ,
    drop index patients_idx03 ,
    drop index patients_idx04 ;

-- ----------------
-- pharmacy
-- ----------------

alter table pharmacy
    drop index pharmacy_idx01 ,
    drop index pharmacy_idx02 ,
    drop index pharmacy_idx03 ,
    drop index pharmacy_idx04 ;

-- ----------------
-- poe
-- ----------------

alter table poe
    drop index poe_idx01 ,
    drop index poe_idx02 ,
    drop index poe_idx03 ;

-- ----------------
-- poe-detail
-- ----------------

alter table poe_detail
    drop index poe_detail_idx01 ,
    drop index poe_detail_idx02 ,
    drop index poe_detail_idx03 ;

-- ----------------
-- prescriptions
-- ----------------

alter table prescriptions
    drop index prescriptions_idx01 ,
    drop index prescriptions_idx02 ,
    drop index prescriptions_idx03 ,
    drop index prescriptions_idx04 ,
    drop index prescriptions_idx05 ;

-- -----------------
-- procedureevents
-- -----------------

alter table procedureevents
    drop index procedureevents_mv_idx01 ,
    drop index procedureevents_mv_idx02 ,
    drop index procedureevents_mv_idx03 ,
    drop index procedureevents_mv_idx04 ,
    drop index procedureevents_mv_idx05 ;
      
-- -----------------
-- procedures_icd
-- -----------------

alter table procedures_icd
    drop index procedures_icd_idx01 ,
    drop index procedures_icd_idx02 ;

-- -----------
-- services
-- -----------

alter table services
    drop index services_idx01 ,
    drop index services_idx02 ,
    drop index services_idx03 ;

-- -----------
-- transfers
-- -----------

alter table transfers
    drop index transfers_idx01 ,
    drop index transfers_idx02 ,
    drop index transfers_idx03 ,
    drop index transfers_idx04 ,
    drop index transfers_idx05 ;