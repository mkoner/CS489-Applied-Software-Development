-- Display the list of ALL Dentists registered in the system, sorted in ascending
-- order of their lastNames
SELECT u.id as id, u.firstName as firstName, u.lastName as lastName, 
u.emailAddress as email, d.specialization as specialization from user u
join dentist d on u.id = d.id
order by u.lastName asc;

-- Display the list of ALL Appointments that have been scheduled at a Surgery
-- Location 
select * from appointment a where a.status = 'Scheduled' and a.surgery_id = 1;

-- Display the list of the Appointments booked for a given Patient on a given Date. 
select * from appointment a where DATE(a.dateTime) = '2013-09-12' and 
a.patient_id = 10 and a.status = 'Scheduled';


-- Display the list of ALL Appointments for a given Dentist by their dentist_Id
-- number. Include in the result, the Patient information.
select a.id as aptId, a.dateTime as aptDateTime, a.status as status,
concat(up.firstName , ' ', up.lastName) as patientName,
concat(ud.firstName , ' ', ud.lastName) as dentistName
from appointment a
join patient p on a.patient_id = p.id
join user up on p.id = up.id
join dentist d on a.dentist_id = d.id
join user ud on d.id = ud.id
where a.dentist_id = 1;
