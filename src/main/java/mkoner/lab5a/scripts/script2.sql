USE cs489_advantis_dental_surgeries;

-- Insert Roles
INSERT INTO Role (id, name) VALUES 
(1, 'Dentist'),
(2, 'Patient');

-- Insert Surgeries
INSERT INTO Surgery (id, name, phoneNumber) VALUES
(1, 'Surgery S15', '111-111-1111'), -- S15
(2, 'Surgery S10', '222-222-2222'), -- S10
(3, 'Surgery S13', '333-333-3333'); -- S13

-- Insert Dentists into User table
INSERT INTO `User` (id, firstName, lastName, phoneNumber, emailAddress, password, role_id) VALUES
(1, 'Tony', 'Smith', '123-456-7890', 'tony@example.com', 'pass123', 1),
(2, 'Helen', 'Pearson', '123-456-7891', 'helen@example.com', 'pass123', 1),
(3, 'Robin', 'Plevin', '123-456-7892', 'robin@example.com', 'pass123', 1);

-- Insert Dentists into Dentist table
INSERT INTO Dentist (id, specialization) VALUES
(1, 'General Dentistry'),
(2, 'Orthodontics'),
(3, 'Periodontics');

-- Insert Patients into User table
INSERT INTO `User` (id, firstName, lastName, phoneNumber, emailAddress, password, role_id) VALUES
(10, 'Gillian', 'White', '555-111-2222', 'gillian@example.com', 'pass123', 2),
(11, 'Jill', 'Bell', '555-111-3333', 'jill@example.com', 'pass123', 2),
(12, 'Ian', 'MacKay', '555-111-4444', 'ian@example.com', 'pass123', 2),
(13, 'John', 'Walker', '555-111-5555', 'john@example.com', 'pass123', 2);

-- Insert Patients into Patient table
INSERT INTO Patient (id, dateOfBirth) VALUES
(10, '1990-01-01'),
(11, '1985-02-02'),
(12, '1978-03-03'),
(13, '1992-04-04');

-- Insert Appointments
INSERT INTO Appointment (dateTime, status, patient_id, dentist_id, surgery_id) VALUES
('2013-09-12 10:00:00', 'Scheduled', 10, 1, 1), -- Gillian White with Tony Smith at S15
('2013-09-12 12:00:00', 'Scheduled', 11, 1, 1), -- Jill Bell with Tony Smith at S15
('2013-09-12 10:00:00', 'Scheduled', 12, 2, 2), -- Ian MacKay with Helen Pearson at S10
('2013-09-14 14:00:00', 'Scheduled', 12, 2, 2), -- Ian MacKay with Helen Pearson at S10
('2013-09-14 16:30:00', 'Scheduled', 11, 3, 1), -- Jill Bell with Robin Plevin at S15
('2013-09-15 18:00:00', 'Scheduled', 13, 3, 3); -- John Walker with Robin Plevin at S13
