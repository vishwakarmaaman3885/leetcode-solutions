# Aman
with first_positive as(
    select patient_id, min(test_date) as first_positive_date
    from covid_tests
    where result = "Positive"
    group by patient_id),
first_negative_after_positive  as(
    select fp.patient_id, 
    min(ct.test_date) as first_negative_date
    from first_positive as fp
    join covid_tests as ct on fp.patient_id = ct.patient_id
    where ct.result = "Negative"
     AND ct.test_date > fp.first_positive_date
    group by fp.patient_id)
    select p.patient_id, p.patient_name,p.age, 
    datediff(fn.first_negative_date,fp.first_positive_date) as recovery_time
    from first_positive as fp
    join first_negative_after_positive as fn on fp.patient_id=fn.patient_id
    join patients as p on p.patient_id=fp.patient_id
    order by recovery_time asc, p.patient_name asc;
    
