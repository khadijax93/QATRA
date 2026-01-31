-- ============================
-- QATRA
-- Donor Eligibility Trigger
-- Oracle SQL Compatible
-- ============================
CREATE OR REPLACE TRIGGER trg_donor_ineligibility
AFTER INSERT ON donations
FOR EACH ROW
BEGIN
    UPDATE donors
    SET eligible = 'N',
        last_donation_date = SYSDATE
    WHERE donor_id = :NEW.donor_id;
END;
/

