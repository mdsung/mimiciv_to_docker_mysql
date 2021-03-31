alter table admissions
    drop index admissions_idx01 (subject_id,hadm_id),
    drop index admissions_idx02 (admittime, dischtime, deathtime),
    drop index admissions_idx03 (admission_type),
    drop unique index admissions_idx04 (hadm_id);

-- -------------
-- chartevents
-- -------------
alter table chartevents 
    drop index chartevents_idx01 (subject_id, hadm_id, stay_id),
    drop index chartevents_idx02 (itemid),
    drop index chartevents_idx03 (charttime, storetime);

-- Perhaps not useful to index on just value? Index just for popular subset?
-- CREATE INDEX CHARTEVENTS_idx05 ON CHARTEVENTS (VALUE);

-- -----------
-- d_hcpcs
-- -----------

alter table d_hcpcs
    drop unique index d_hcpcs_idx01 (code);

-- -----------
-- d_icd_diagnoses
-- -----------

alter table d_icd_diagnoses
    drop unique index d_icd_diagnoses_icd_code_icd_version (icd_code, icd_version);

-- -----------
-- d_icd_procedures
-- -----------

alter table d_icd_procedures
    drop unique index d_icd_procedures_idx01 (icd_code);

-- ---------
-- d_items
-- ---------

alter table d_items
    drop unique index d_items_idx01 (itemid),
    drop index d_items_idx02 (label(200)),
    drop index d_items_idx03 (category),
    drop index d_items_idx04 (abbreviation),
    drop index d_items_idx05 (param_type);

-- -------------
-- d_labitems
-- -------------

alter table d_labitems
    drop unique index d_labitems_idx01 (itemid),
    drop index d_labitems_idx02 (label, fluid, category),
    drop index d_labitems_idx03 (loinc_code);

-- -----------------
-- datetimeevents
-- -----------------

alter table datetimeevents
    drop index datetimeevents_idx01 (subject_id, hadm_id, stay_id),
    drop index datetimeevents_idx02 (itemid),
    drop index datetimeevents_idx03 (charttime),
    drop index datetimeevents_idx04 (value);

-- ----------------
-- diagnoses_icd
-- ----------------

alter table diagnoses_icd 
    drop index diagnoses_icd_idx01 (subject_id, hadm_id),
    drop index diagnoses_icd_idx02 (icd_code, icd_version, seq_num);

-- ------------
-- drgcodes
-- ------------

alter table drgcodes
    drop index drgcodes_idx01 (subject_id, hadm_id),
    drop index drgcodes_idx02 (drg_code, drg_type),
    drop index drgcodes_idx03 (description(255), drg_severity);

-- ----------------
-- emar
-- ----------------

alter table emar
    drop primary key(emar_id),
    drop index emar_idx01 (subject_id, hadm_id, emar_seq),
    drop index emar_idx03 (poe_id),
    drop index emar_idx04 (pharmacy_id),
    drop index emar_idx05 (charttime, scheduletime, storetime),
    drop index emar_idx06 (medication);

-- ----------------
-- emar_detail
-- ----------------

alter table emar_detail
    drop index emar_idx01 (subject_id, emar_seq),
    drop index emar_idx02 (emar_id),
    drop index emar_idx04 (pharmacy_id),
    drop index emar_idx05 (product_description(200)),
    drop index emar_idx06 (product_code);

-- ----------------
-- hcpsevents
-- ----------------

alter table hcpcsevents
    drop index hcpcsevents_idx01 (subject_id, hadm_id, seq_num),
    drop index hcpcsevents_idx02 (hcpcs_cd);
  
-- --------------
-- icustays
-- --------------

alter table icustays
    drop index icustays_idx01 (subject_id, hadm_id, stay_id),
    drop index icustays_idx02 (first_careunit, last_careunit),
    drop index icustays_idx03 (intime, outtime);

-- --------------
-- inputevents
-- --------------

alter table inputevents
    drop index inputevents_idx01 (subject_id, hadm_id, stay_id),
    drop index inputevents_idx02 (stay_id),
    drop index inputevents_idx03 (starttime, endtime),
    drop index inputevents_idx04 (itemid),
    drop index inputevents_idx05 (rate),
    drop index inputevents_idx06 (amount);

-- ------------
-- labevents
-- ------------

alter table labevents 
    drop index labevents_idx01 (subject_id, hadm_id),
    drop index labevents_idx02 (itemid),
    drop index labevents_idx03 (charttime),
    drop index labevents_idx04 (valuenum),
    drop index labevents_idx05 (value(200)),
    drop unique index labevents_idx06 (labevent_id, itemid);
-- Note: itemid (by which labevents in partitioned) must be part of the primary key.

-- --------------------
-- microbiologyevents
-- --------------------

alter table microbiologyevents 
    drop index microbiologyevents_idx01 (subject_id, hadm_id),
    drop index microbiologyevents_idx02 (chartdate, charttime),
    drop index microbiologyevents_idx03 (spec_itemid, org_itemid, ab_itemid);

-- --------------
-- outputevents
-- --------------

alter table outputevents
    drop index outputevents_idx01 (subject_id, hadm_id),
    drop index outputevents_idx02 (stay_id),
    drop index outputevents_idx03 (charttime, storetime),
    drop index outputevents_idx04 (itemid),
    drop index outputevents_idx05 (value);

-- -----------
-- patients
-- -----------

-- note that subject_id is already indexed as it is unique

alter table patients
    drop unique index patients_idx01 (subject_id),
    drop index patients_idx02 (dod),
    drop index patients_idx03 (anchor_age),
    drop index patients_idx04 (anchor_year);

-- ----------------
-- pharmacy
-- ----------------

alter table pharmacy
    drop index pharmacy_idx01 (subject_id, hadm_id),
    drop index pharmacy_idx02 (pharmacy_id),
    drop index pharmacy_idx03 (starttime, stoptime),
    drop index pharmacy_idx04 (medication);

-- ----------------
-- poe
-- ----------------

alter table poe
    drop unique index poe_idx01 (poe_id, poe_seq),
    drop index poe_idx02 (subject_id, hadm_id),
    drop index poe_idx03 (order_type);

-- ----------------
-- poe-detail
-- ----------------

alter table poe_detail
    drop index poe_detail_idx01 (poe_id, poe_seq),
    drop index poe_detail_idx02 (subject_id),
    drop index poe_detail_idx03 (field_name);

-- ----------------
-- prescriptions
-- ----------------

alter table prescriptions
    drop index prescriptions_idx01 (subject_id, hadm_id),
    drop index prescriptions_idx02 (pharmacy_id),
    drop index prescriptions_idx03 (drug_type),
    drop index prescriptions_idx04 (drug),
    drop index prescriptions_idx05 (starttime, stoptime);

-- -----------------
-- procedureevents
-- -----------------

alter table procedureevents
    drop index procedureevents_mv_idx01 (subject_id, hadm_id),
    drop index procedureevents_mv_idx02 (stay_id),
    drop index procedureevents_mv_idx03 (itemid),
    drop index procedureevents_mv_idx04 (starttime, endtime),
    drop index procedureevents_mv_idx05 (ordercategoryname);
      
-- -----------------
-- procedures_icd
-- -----------------

alter table procedures_icd
    drop index procedures_icd_idx01 (subject_id, hadm_id, seq_num),
    drop index procedures_icd_idx02 (icd_code, icd_version);

-- -----------
-- services
-- -----------

alter table services
    drop index services_idx01 (subject_id, hadm_id),
    drop index services_idx02 (transfertime),
    drop index services_idx03 (curr_service, prev_service);

-- -----------
-- transfers
-- -----------

alter table transfers
    drop index transfers_idx01 (subject_id, hadm_id),
    drop index transfers_idx02 (eventtype),
    drop index transfers_idx03 (careunit),
    drop index transfers_idx04 (intime, outtime),
    drop index transfers_idx05 (transfer_id);