----- *** Creating a disease database *** -----

CREATE DATABASE disease;

--- Creating entities ---

-- Patient table --

CREATE TABLE patient (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    email_address VARCHAR(255) NOT NULL,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    contact_information VARCHAR(50) NOT NULL,
    medical_history VARCHAR(255) NOT NULL,
    severity_type VARCHAR(100) NOT NULL,
    severity_score INT NOT NULL,
    length_of_hospital_stay VARCHAR(100) NOT NULL,
    diagnosis_month VARCHAR(100) NOT NULL
);


-- Medication table --

CREATE TABLE medication (
    medication_id SERIAL PRIMARY KEY,
    medication_name VARCHAR(255) NOT NULL,
    medication_type VARCHAR(50) NOT NULL,
    medication_description VARCHAR(255) NOT NULL,
    dosage VARCHAR(50) NOT NULL
);


-- Patient_Medication table --

CREATE TABLE patient_medication (
    patient_medication_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    medication_id INTEGER NOT NULL,
    doctor_name VARCHAR(50) NOT NULL,
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patient (patient_id),
    CONSTRAINT fk_medication FOREIGN KEY (medication_id) REFERENCES medication (medication_id)
);


-- Hospital table --

CREATE TABLE hospital (
    hospital_id SERIAL PRIMARY KEY,
    hospital_name VARCHAR(255) NOT NULL,
    hospital_phone_number VARCHAR(20) NOT NULL,
    hospital_city VARCHAR(50) NOT NULL,
    hospital_state VARCHAR(50) NOT NULL,
    hospital_postal_code VARCHAR(10) NOT NULL
);


-- Patient_Hospital table --

CREATE TABLE patient_hospital (
    patient_hospital_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    hospital_id INTEGER NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE NOT NULL,
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patient (patient_id),
    CONSTRAINT fk_hospital FOREIGN KEY (hospital_id)REFERENCES hospital (hospital_id)

);


-- Insurance table --

CREATE TABLE insurance (
    insurance_id SERIAL PRIMARY KEY,
    insurance_type VARCHAR(50) NOT NULL,
    insurance_company VARCHAR(255) NOT NULL,
    policy_number VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);


-- Patient_Insurance table --

CREATE TABLE patient_insurance (
    patient_insurance_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    insurance_id INTEGER NOT NULL,
    CONSTRAINT fk_patient FOREIGN KEY (patient_id)REFERENCES patient (patient_id),
    CONSTRAINT fk_insurance FOREIGN KEY (insurance_id)REFERENCES insurance (insurance_id)
);


-- Symptoms table --

CREATE TABLE symptoms (
    symptom_id SERIAL PRIMARY KEY,
	symptom_name VARCHAR(255) NOT NULL,
    symptom_1 VARCHAR(255) NOT NULL,
    symptom_2 VARCHAR(255) NOT NULL,
    symptom_3 VARCHAR(255) NOT NULL,
	total_symptoms INTEGER NOT NULL
);


-- Patient_Symptoms table --

CREATE TABLE patient_symptoms (
    patient_symptoms_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    symptom_id INTEGER NOT NULL,
	CONSTRAINT fk_patient FOREIGN KEY (patient_id)REFERENCES patient (patient_id),
    CONSTRAINT fk_symptoms FOREIGN KEY (symptom_id)REFERENCES symptoms (symptom_id)

);


-- Disease table --

CREATE TABLE disease (
    disease_id SERIAL PRIMARY KEY,
    disease_name VARCHAR(255) NOT NULL,
    disease_type VARCHAR(50) NOT NULL,
    disease_description VARCHAR(255) NOT NULL,
    disease_duration VARCHAR(50) NOT NULL
);


-- Patient_Disease table --

CREATE TABLE patient_disease (
    patient_disease_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    disease_id INTEGER NOT NULL,
	CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patient (patient_id),
    CONSTRAINT fk_disease FOREIGN KEY (disease_id) REFERENCES disease (disease_id)
);


-- Disease_Symptom table --

CREATE TABLE disease_symptom (
    disease_symptom_id SERIAL PRIMARY KEY,
    disease_id INTEGER NOT NULL,
    symptom_id INTEGER NOT NULL,
	CONSTRAINT fk_disease FOREIGN KEY (disease_id)REFERENCES disease (disease_id),
    CONSTRAINT fk_symptoms FOREIGN KEY (symptom_id)REFERENCES symptoms (symptom_id)
);


-- Hospital_Insurance table --

CREATE TABLE hospital_insurance (
    hospital_insurance_id SERIAL PRIMARY KEY,
    hospital_id INTEGER NOT NULL,
    insurance_id INTEGER NOT NULL,
	CONSTRAINT fk_hospital FOREIGN KEY (hospital_id) REFERENCES hospital (hospital_id),
    CONSTRAINT fk_insurance FOREIGN KEY (insurance_id) REFERENCES insurance (insurance_id)
);


--- Inserting data into the above tables ---

INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, email_address, street_address, city, state, postal_code, contact_information, medical_history, 
					 severity_type, severity_score, length_of_hospital_stay, diagnosis_month)
VALUES
(1, 'John', 'Doe', '1985-03-15', 'M', 'johndoe@email.com', '123 Main St', 'Los Angeles', 'CA', '90001', '555-123-4567', 'None', 'Low', 1.8, 8, 'January'),
(2, 'Jane', 'Doe', '1990-07-22', 'F', 'janedoe@email.com', '456 Maple Ave', 'San Francisco', 'CA', '94101', '555-987-6543', 'Asthma', 'Medium', 3.5, 15, 'February'),
(3, 'Robert', 'Smith', '1972-11-05', 'M', 'rsmith@email.com', '789 Oak St', 'New York', 'NY', '10001', '555-555-1212', 'High blood pressure', 'High', 4.3, 18, 'April'),
(4, 'Emily', 'Johnson', '1988-04-02', 'F', 'emilyj@gmail.com', '987 Pine St', 'Seattle', 'WA', '98101', '555-555-1212', 'Diabetes', 'Low', 2.0, 3, 'June'),
(5, 'David', 'Williams', '1979-09-12', 'M', 'davidw@yahoo.com', '234 Elm St', 'Chicago', 'IL', '60601', '555-555-1212', 'None', 'Low', 1.5, 1, 'July'),
(6, 'Sarah', 'Brown', '1982-02-28', 'F', 'sbrown@gmail.com', '345 Walnut Ave', 'Miami', 'FL', '33101', '555-555-1212', 'Depression', 'Medium', 3.9, 12, 'August'),
(7, 'Michael', 'Garcia', '1995-05-20', 'M', 'mgarcia@hotmail.com', '678 Cedar Rd', 'Houston', 'TX', '77001', '555-555-1212', 'None', 'Low', 1.7, 5, 'September'),
(8, 'Amanda', 'Davis', '1984-08-08', 'F', 'adavis@gmail.com', '890 Pine Ave', 'Boston', 'MA', '02101', '555-555-1212', 'Asthma', 'Medium', 3.2, 4, 'November'),
(9, 'Christopher', 'Wilson', '1975-01-10', 'M', 'cwilson@hotmail.com', '1234 Maple St', 'Denver', 'CO', '80201', '555-555-1212', 'High cholesterol', 'High', 4.8, 19, 'December'),
(10, 'Melissa', 'Martinez', '1991-06-30', 'F', 'mmartinez@yahoo.com', '5678 Oak Ave', 'Phoenix', 'AZ', '85001', '555-555-1212', 'None', 'Low', 1.6, 2, 'November'),
(11, 'Martha', 'Garcia', '1987-07-12', 'F', 'martha.garcia@email.com', '123 Main St', 'Los Angeles', 'CA', '90001', '555-123-4567', 'Hypertension', 'Low', 1.8, 4, 'January'),
(12, 'Kyle', 'Nguyen', '1995-05-20', 'M', 'kyle.nguyen@email.com', '456 Oak St', 'San Francisco', 'CA', '94102', '555-987-6543', 'Asthma', 'Low', 1.4, 5, 'March'),
(13, 'Emma', 'Wong', '1989-11-01', 'F', 'emma.wong@email.com', '789 Pine St', 'Seattle', 'WA', '98101', '555-555-1212', 'Diabetes', 'Medium', 2.3, 22, 'July'),
(14, 'Mohamed', 'Ahmed', '1978-02-10', 'M', 'mohamed.ahmed@email.com', '1010 Market St', 'Chicago', 'IL', '60601', '555-456-7890', 'Heart disease', 'Medium', 2.9, 7, 'September'),
(15, 'Samantha', 'Kim', '2000-12-30', 'F', 'samantha.kim@email.com', '1234 Maple St', 'New York', 'NY', '10001', '555-111-2222', 'Anxiety', 'Medium', 3.3, 13, 'November'),
(16, 'Andrew', 'Lopez', '1982-08-15', 'M', 'andrew.lopez@email.com', '5678 Elm St', 'Miami', 'FL', '33101', '555-222-3333', 'Hypertension', 'High', 4.3, 24, 'December'),
(17, 'Jasmine', 'Singh', '1997-03-22', 'F', 'jasmine.singh@email.com', '9012 Cedar St', 'Dallas', 'TX', '75201', '555-333-4444', 'Asthma', 'Low', 1.9, 15, 'June'),
(18, 'David', 'Park', '1992-09-08', 'M', 'david.park@email.com', '3456 Birch St', 'Atlanta', 'GA', '30301', '555-444-5555', 'Diabetes', 'Low', 1.1, 6, 'July'),
(19, 'Aaliyah', 'Lee', '1985-06-18', 'F', 'aaliyah.lee@email.com', '7890 Spruce St', 'Denver', 'CO', '80201', '555-555-5555', 'Heart disease', 'Medium', 2.5, 30, 'November'),
(20, 'Jason', 'Chen', '1999-01-25', 'M', 'jason.chen@email.com', '1111 Cedar St', 'Portland', 'OR', '97201', '555-666-7777', 'Anxiety', 'Medium', 3.3, 12, 'September'),
(21, 'Jessica', 'Garcia', '1994-09-12', 'F', 'jessica.garcia@example.com', '1234 Elm St', 'Los Angeles', 'CA', '90001', '(555) 555-2121', 'Asthma', 'High', 4.7, 23, 'November'),
(22, 'Mohammed', 'Khan', '1988-05-18', 'M', 'mkhan@example.com', '5678 Oak Ave', 'Houston', 'TX', '77002', '(555) 555-3434', 'Diabetes', 'High', 4.9, 27, 'July'),
(23, 'Tina', 'Lee', '1979-12-04', 'F', 'tina.lee@example.com', '4321 Maple Blvd', 'New York', 'NY', '10001', '(555) 555-1212', 'Anxiety', 'Medium', 3.5, 18, 'September'),
(24, 'David', 'Nguyen', '2001-06-22', 'M', 'david.nguyen@example.com', '9100 Pine St', 'Seattle', 'WA', '98101', '(555) 555-7878', 'Migraines', 'Medium', 2.3, 12, 'June'),
(25, 'Maria', 'Gonzalez', '1996-03-15', 'F', 'maria.gonzalez@example.com', '6789 Cedar Rd', 'Chicago', 'IL', '60601', '(555) 555-4545', 'Allergies', 'Medium', 3.3, 17, 'September'),
(26, 'John', 'Miller', '1990-11-30', 'M', 'johnmiller@example.com', '3456 Pine St', 'San Francisco', 'CA', '94101', '(555) 555-8989', 'High Cholesterol', 'Low', 1.3, 7, 'December'),
(27, 'Eva', 'Hernandez', '1985-07-12', 'F', 'eva.hernandez@example.com', '7890 Maple Ave', 'Miami', 'FL', '33101', '(555) 555-3434', 'Depression', 'Medium', 3.4, 18, 'September'),
(28, 'Mark', 'Taylor', '1977-04-08', 'M', 'marktaylor@example.com', '2345 Oak St', 'Dallas', 'TX', '75201', '(555) 555-6565', 'Diabetes', 'Medium', 2.6, 35, 'September'),
(29, 'Emily', 'Smith', '1998-01-02', 'F', 'emilysmith@example.com', '1234 Pine St', 'Boston', 'MA', '02101', '(555) 555-7878', 'Asthma', 'Low', 1.7, 8, 'November'),
(30, 'Alex', 'Kim', '1995-08-20', 'M', 'alexkim@example.com', '4567 Cedar Ave', 'San Diego', 'CA', '92101', '(555) 555-4545', 'Anxiety', 'Medium', 3.8, 22, 'Februrary'),
(31, 'Maggie', 'Johnson', '1989-06-24', 'F', 'maggie.johnson@example.com', '9460 Pineapple Ave', 'Los Angeles', 'CA', '90046', '+1-424-555-5555', 'None', 'High', 4.4, 27, 'June'), 
(32, 'Adam', 'Garcia', '1975-01-12', 'M', 'adam.garcia@example.com', '4812 Vineyard Blvd', 'Houston', 'TX', '77002', '+1-713-555-5555', 'None', 'High', 4.2, 28, 'September'),
(33, 'Jenna', 'Kim', '2001-08-18', 'F', 'jenna.kim@example.com', '9833 Redwood St', 'San Francisco', 'CA', '94117', '+1-415-555-5555', 'Asthma', 'Medium', 3.3, 7, 'July'),
(34, 'Nate', 'Wilson', '1981-12-03', 'M', 'nate.wilson@example.com', '2345 Oceanview Dr', 'Miami', 'FL', '33130', '+1-305-555-5555', 'Diabetes', 'Low', 1.0, 7, 'July'),
(35, 'Lila', 'Davis', '1993-04-29', 'F', 'lila.davis@example.com', '8921 Sunset Blvd', 'Los Angeles', 'CA', '90069', '+1-424-555-5555', 'None', 'High', 4.3, 14, 'December'),
(36, 'Oscar', 'Chen', '1972-11-11', 'M', 'oscar.chen@example.com', '1288 Market St', 'San Francisco', 'CA', '94102', '+1-415-555-5555', 'High cholesterol', 'High', 4.1, 14, 'December'),
(37, 'Brianna', 'Lee', '1985-07-21', 'F', 'brianna.lee@example.com', '3456 Main St', 'New York', 'NY', '10001', '+1-212-555-5555', 'Depression', 'Medium', 2.3, 18, 'November'),
(38, 'Zack', 'Wang', '1996-02-15', 'M', 'zack.wang@example.com', '5632 Maple Ave', 'Chicago', 'IL', '60602', '+1-312-555-5555', 'Allergies', 'Low', 0.3, 3, 'January'),
(39, 'Melanie', 'Nguyen', '2000-05-08', 'F', 'melanie.nguyen@example.com', '7890 Park Blvd', 'San Diego', 'CA', '92101', '+1-619-555-5555', 'Migraine', 'Medium', 2.3, 22, 'September'),
(40, 'Henry', 'Kim', '1988-09-02', 'M', 'henry.kim@example.com', '4567 Oak St', 'San Francisco', 'CA', '94110', '+1-415-555-5555', 'Asthma', 'Low', 1.1, 6, 'March');

INSERT INTO disease (disease_id, disease_name, disease_type, disease_description, disease_duration)
VALUES
(1, 'Diabetes', 'Metabolic', 'A chronic condition that affects how your body processes blood sugar (glucose)', 'Long-term'),
(2, 'Influenza', 'Viral infection', 'A contagious respiratory illness caused by influenza viruses.', '1-2 weeks'),
(3, 'Hypertension', 'Chronic condition', 'High blood pressure that can cause damage to the heart, blood vessels, and other organs.', 'Long-term'),
(4, 'Diabetes', 'Metabolic', 'A chronic condition that affects how your body processes blood sugar (glucose).', 'Long-term'),
(5, 'Asthma', 'Chronic respiratory disease', 'A chronic respiratory disease characterized by inflammation of the airways.', 'Long-term'),
(6, 'Gastroenteritis', 'Infection', 'Inflammation of the stomach and intestines that can cause diarrhea, vomiting, and stomach cramps.', '1-2 weeks'),
(7, 'Migraine', 'Neurological disorder', 'A headache disorder characterized by recurrent headaches that are moderate to severe.', '4-72 hours'),
(8, 'Arthritis', 'Joint disorder', 'Inflammation of one or more joints that can cause pain, stiffness, and swelling.', 'Long-term'),
(9, 'Anemia', 'Blood disorder', 'A condition characterized by a lack of red blood cells or hemoglobin in the blood.', 'Long-term'),
(10, 'Depression', 'Mental disorder', 'A mood disorder that causes a persistent feeling of sadness and loss of interest in activities.', 'Long-term'),
(11, 'Migraine', 'Neurological', 'A severe headache that can last from hours to days, often accompanied by nausea and sensitivity to light and sound', 'Variable'),
(12, 'Pneumonia', 'Respiratory', 'A lung infection that causes inflammation in the air sacs', '1-3 weeks'),
(13, 'Arthritis', 'Musculoskeletal', 'Inflammation and stiffness of one or more joints', 'Long-term'),
(14, 'Asthma', 'Respiratory', 'A chronic condition that affects the airways, making it difficult to breathe', 'Long-term'),
(15, 'Diabetes', 'Endocrine', 'A condition in which the body is unable to properly regulate blood sugar levels', 'Long-term'),
(16, 'Eczema', 'Dermatological', 'A chronic skin condition that causes itchy, inflamed patches', 'Long-term'),
(17, 'Gastroenteritis', 'Gastrointestinal', 'Inflammation of the stomach and intestines, causing diarrhea, nausea, and vomiting', 'Variable'),
(18, 'Hypertension', 'Cardiovascular', 'High blood pressure that can lead to heart disease, stroke, and other health problems', 'Long-term'),
(19, 'Malaria', 'Infectious', 'A parasitic disease spread by mosquitoes that can cause fever, chills, and flu-like symptoms', 'Variable'),
(20, 'Obesity', 'Endocrine', 'A condition characterized by excess body fat that can lead to other health problems', 'Long-term'),
(21, 'Influenza', 'Viral', 'A respiratory illness caused by influenza viruses that infect the nose, throat, and lungs.', '7 days'),
(22, 'Pneumonia', 'Bacterial', 'A lung infection that can range from mild to severe.', '2-3 weeks'),
(23, 'Diabetes', 'Chronic', 'A metabolic disease where the body does not produce enough insulin or cannot use it effectively.', 'Lifelong'),
(24, 'Malaria', 'Parasitic', 'A mosquito-borne infectious disease that affects humans and other animals.', 'Several days to several weeks'),
(25, 'Hypertension', 'Chronic', 'A condition characterized by elevated blood pressure in the arteries.', 'Lifelong'),
(26, 'Influenza', 'Viral', 'A respiratory illness caused by influenza viruses that infect the nose, throat, and lungs.', '7 days'),
(27, 'Tuberculosis', 'Bacterial', 'A bacterial infection that primarily affects the lungs.', '6-9 months'),
(28, 'Arthritis', 'Chronic', 'A group of diseases that cause inflammation and stiffness in the joints.', 'Lifelong'),
(29, 'Migraine', 'Neurological', 'A headache of varying intensity, often accompanied by nausea and sensitivity to light and sound.', 'Short-term'),
(30, 'Pneumonia', 'Bacterial', 'A lung infection that can range from mild to severe.', '2-3 weeks'),
(31, 'Diabetes', 'Metabolic', 'A chronic disease that affects the way your body processes blood sugar (glucose).', 'Long-term'),
(32, 'Hypertension', 'Cardiovascular', 'High blood pressure, which can cause serious health problems.', 'Long-term'),
(33, 'Migraine', 'Neurological', 'A headache of varying intensity, often accompanied by nausea and sensitivity to light and sound.', 'Short-term'),
(34, 'Asthma', 'Respiratory', 'A condition in which a person airways become inflamed, narrow and swell, and produce extra mucus, making it difficult to breathe.', 'Long-term'),
(35, 'Diabetes', 'Metabolic', 'A chronic disease that affects the way your body processes blood sugar (glucose).', 'Long-term'),
(36, 'Migraine', 'Neurological', 'A headache of varying intensity, often accompanied by nausea and sensitivity to light and sound.', 'Short-term'),
(37, 'Hypertension', 'Cardiovascular', 'High blood pressure, which can cause serious health problems.', 'Long-term'),
(38, 'Cancer', 'Oncological', 'A disease caused by an uncontrolled division of abnormal cells in a part of the body.', 'Varies'),
(39, 'Asthma', 'Respiratory', 'A condition in which a person airways become inflamed, narrow and swell, and produce extra mucus, making it difficult to breathe.', 'Long-term'),
(40, 'Hepatitis C', 'Infectious', 'A viral infection that causes liver inflammation, sometimes leading to serious liver damage.', 'Long-term');


INSERT INTO symptoms (symptom_id, symptom_name, symptom_1, symptom_2, symptom_3, total_symptoms)
VALUES
(1, 'Diabetes',  'Frequent urination', 'Extreme thirst', 'None' , 2),
(2, 'Fever', 'High body temperature', 'Chills', 'Headache', 3),
(3, 'Hypertension', 'High blood pressure', 'Headache', 'Chest pain', 3),
(4, 'Diabetes', 'Frequent urination', 'Increased thirst', 'Blurred vision', 3),
(5, 'Asthma', 'Shortness of breath', 'Wheezing', 'Chest tightness', 3),
(6, 'Gastroenteritis', 'Diarrhea', 'Nausea', 'Vomiting', 3),
(7, 'Migraine', 'Pain on one side of the head', 'Sensitivity to light', 'Nausea', 3),
(8, 'Arthritis', 'Joint pain', 'Joint stiffness', 'Joint swelling', 3),
(9, 'Anemia', 'Fatigue', 'Weakness', 'Pale skin', 3),
(10, 'Depression', 'Feeling sad or hopeless', 'Loss of interest in activities', 'Sleep problems', 3),
(11, 'Headache', 'Pain in the forehead or temples', 'Sensitivity to light or sound', 'Nausea or vomiting', 3),
(12, 'Cough', 'A persistent cough', 'Shortness of breath', 'Chest pain', 3),
(13, 'Joint pain', 'Pain or stiffness in one or more joints', 'Swelling or redness in the joints', 'Decreased range of motion', 3),
(14, 'Wheezing', 'A high-pitched whistling sound when breathing', 'Shortness of breath', 'Tightness in the chest', 3),
(15, 'Frequent urination', 'Needing to urinate more often than usual', 'Feeling thirsty or hungry', 'Fatigue or weakness', 3),
(16, 'Itchy skin', 'Dry or scaly patches on the skin', 'Redness or swelling', 'Blisters or oozing', 3),
(17, 'Nausea', 'Feeling sick to your stomach', 'Loss of appetite', 'Vomiting', 3),
(18, 'Dizziness', 'Feeling lightheaded or faint', 'Balance problems', 'Blurred vision or headache', 3),
(19, 'Fever', 'A temperature above 100.4 F (38 C)', 'Chills or sweating', 'Fatigue or weakness', 3),
(20, 'Fatigue', 'Feeling tired or weak', 'Difficulty concentrating', 'Muscle aches or soreness', 3),
(21, 'Fever', 'High body temperature', 'Chills', 'Sweating', 3),
(22, 'Cough', 'Persistent coughing', 'Chest pain', 'Shortness of breath', 3),
(23, 'Fatigue', 'Feeling tired', 'Weakness', 'Lack of energy', 3),
(24, 'Nausea', 'Feeling sick', 'Vomiting', 'Loss of appetite', 3),
(25, 'Headache', 'Pain in the head', 'Pressure in the head', 'Dizziness', 3),
(26, 'Joint pain', 'Pain in the joints', 'Swelling', 'Stiffness', 3),
(27, 'Weight loss', 'Unintentional weight loss', 'Loss of appetite', 'Fatigue', 3),
(28, 'Fever', 'High body temperature', 'Chills', 'Sweating', 3),
(29, 'Migraine', 'Throbbing headache', 'Sensitivity to light', 'None', 2),
(30, 'Weakness', 'Lack of strength', 'Fatigue', 'Tiredness', 3),
(31, 'Diabetes', 'Increased thirst', 'Frequent urination', 'Extreme hunger', 3),
(32, 'Hypertension', 'Headache', 'Shortness of breath', 'Chest pain', 3),
(33, 'Migraine', 'Throbbing headache', 'Sensitivity to light', 'Nausea', 3),
(34, 'Asthma', 'Shortness of breath', 'Chest tightness', 'Wheezing', 3),
(35, 'Diabetes', 'Increased thirst', 'Frequent urination', 'Extreme hunger', 3),
(36, 'Migraine', 'Throbbing headache', 'Sensitivity to light', 'Nausea', 3),
(37, 'Hypertension', 'Headache', 'Shortness of breath', 'Chest pain', 3),
(38, 'Cancer', 'Fatigue', 'Unexplained weight loss', 'Pain', 3),
(39, 'Asthma', 'Shortness of breath', 'Chest tightness', 'Wheezing', 3),
(40, 'Hepatitis C', 'Fatigue', 'Fever', 'Abdominal pain', 3);
	
INSERT INTO medication (medication_id, medication_name, medication_type, medication_description, dosage) 
VALUES
(1, 'Metformin', 'Antidiabetic', 'Used to treat type 2 diabetes', '500mg-2000mg per day'),
(2, 'Tamiflu', 'Antiviral', 'Used to treat and prevent influenza', '75mg twice a day for 5 days'),
(3, 'Lisinopril', 'ACE inhibitor', 'Used to treat hypertension and heart failure', '10mg-40mg once a day'),
(4, 'Insulin', 'Antidiabetic', 'Used to treat type 1 and type 2 diabetes', 'Varies depending on patient'),
(5, 'Albuterol', 'Bronchodilator', 'Used to treat asthma and other breathing problems', '2 puffs every 4-6 hours'),
(6, 'Loperamide', 'Antidiarrheal', 'Used to treat diarrhea', '4mg initially, followed by 2mg'),
(7, 'Sumatriptan', 'Triptan', 'Used to treat migraines', 'Up to 200mg per day'),
(8, 'Ibuprofen', 'Nonsteroidal anti-inflammatory drug', 'Used to treat pain and inflammation', '200mg-400mg every 4-6 hours'),
(9, 'Iron supplements', 'Iron supplement', 'Used to treat iron-deficiency anemia', 'Varies depending on patient'),
(10, 'Fluoxetine', 'Selective serotonin reuptake inhibitor', 'Used to treat depression and other mood disorders', '20mg-80mg per day'),
(11, 'Ibuprofen', 'Nonsteroidal Anti-Inflammatory Drug', 'Relieves pain, reduces fever, and reduces inflammation', '200-800 mg every 6-8 hours'),
(12, 'Acetaminophen', 'Analgesic', 'Relieves pain and reduces fever', '325-1000 mg every 4-6 hours'),
(13, 'Azithromycin', 'Antibiotic', 'Treats bacterial infections', '250 mg daily for 4 days'),
(14, 'Albuterol', 'Bronchodilator', 'Relieves bronchospasm and improves breathing', '2 puffs every 4-6 hours'),
(15, 'Metformin', 'Antidiabetic', 'Controls blood sugar levels in type 2 diabetes', '500-1000 mg twice daily'),
(16, 'Hydrocortisone', 'Corticosteroid', 'Relieves inflammation and itching', '2-3 times daily'),
(17, 'Doxycycline', 'Antibiotic', 'Treats bacterial infections', '100 mg twice daily for 7-14 days'),
(18, 'Lisinopril', 'ACE Inhibitor', 'Lowers blood pressure and reduces the risk of heart attack and stroke', '10-40 mg once daily'),
(19, 'Chloroquine', 'Antimalarial', 'Treats and prevents malaria', '5 mg/kg at 6, 24, and 48 hours'),
(20, 'Orlistat', 'Lipase inhibitor', 'Treats obesity by blocking the absorption of fat', '120 mg with each meal'),
(21, 'Tamiflu', 'Antiviral', 'Used to treat and prevent influenza (flu) caused by certain types of viruses.', '75 mg twice daily for 5 days'),
(22, 'Azithromycin', 'Antibiotic', 'Used to treat pneumonia caused by bacteria.', '500 mg once daily for 3 days'),
(23, 'Metformin', 'Antidiabetic', 'Used to control high blood sugar in patients with type 2 diabetes.', '500 mg twice daily with meals'),
(24, 'Chloroquine', 'Antimalarial', 'Used to treat uncomplicated malaria caused by Plasmodium falciparum.', '300 mg once daily for 3 days'),
(25, 'Lisinopril', 'Antihypertensive', 'Used to treat high blood pressure.', '10 mg once daily'),
(26, 'Ibuprofen', 'NSAID', 'Used to relieve pain and reduce fever.', '400 mg every 4-6 hours as needed'),
(27, 'Rifampicin', 'Antibiotic', 'Used to treat tuberculosis.', '600-900 mg once daily'),
(28, 'Prednisone', 'Corticosteroid', 'Used to reduce inflammation in various conditions such as arthritis.', '5-60 mg once daily'),
(29, 'Sumatriptan', 'Antimigraine', 'Used to relieve migraine headaches.', '50-100 mg once at onset of headache'),
(30, 'Levofloxacin', 'Antibiotic', 'Used to treat pneumonia caused by bacteria.', '500 mg once daily for 7-14 days'),
(31, 'Metformin', 'Antidiabetic', 'Used to control high blood sugar in people with type 2 diabetes.', '500mg-2g/day'),
(32, 'Lisinopril', 'ACE inhibitor', 'Used to treat high blood pressure (hypertension) in adults and children who are at least 6 years old.', '10-40mg/day'),
(33, 'Sumatriptan', 'Triptan', 'Used to treat migraines and cluster headaches.', '25-100mg/day'),
(34, 'Albuterol', 'Beta-2 agonist', 'Used to treat and prevent bronchospasm in people with reversible obstructive airway disease.', '2-4mg every 4-6 hours'),
(35, 'Insulin glargine', 'Antidiabetic', 'Used to control high blood sugar in people with type 1 and type 2 diabetes.', 'Dose varies depending on patient'),
(36, 'Naratriptan', 'Triptan', 'Used to treat migraines.', '2.5mg/day'),
(37, 'Amlodipine', 'Calcium channel blocker', 'Used to treat high blood pressure and chest pain (angina).', '5-10mg/day'),
(38, 'Tamoxifen', 'Selective estrogen receptor modulator (SERM)', 'Used to treat breast cancer in women and men.', '20-40mg/day'),
(39, 'Budesonide', 'Inhaled corticosteroid', 'Used to treat asthma and other breathing problems.', '1-4mg/day'),
(40, 'Sofosbuvir', 'Antiviral', 'Used to treat hepatitis C.', '400mg/day');

INSERT INTO hospital (hospital_id, hospital_name, hospital_phone_number, hospital_city, hospital_state, hospital_postal_code)
VALUES
(1, 'Good Samaritan Hospital', '555-111-1111', 'Los Angeles', 'CA', '90001'),
(2, 'St. Mary Medical Center', '555-222-2222', 'San Francisco', 'CA', '94101'),
(3, 'NYU Langone Medical Center', '555-333-3333', 'New York', 'NY', '10001'),
(4, 'Swedish Medical Center', '555-444-4444', 'Seattle', 'WA', '98101'),
(5, 'Northwestern Memorial Hospital', '555-555-5555', 'Chicago', 'IL', '60601'),
(6, 'University of Miami Hospital', '555-666-6666', 'Miami', 'FL', '33101'),
(7, 'Memorial Hermann Hospital', '555-777-7777', 'Houston', 'TX', '77001'),
(8, 'Massachusetts General Hospital', '555-888-8888', 'Boston', 'MA', '02101'),
(9, 'UCHealth University of Colorado Hospital', '555-999-9999', 'Denver', 'CO', '80201'),
(10, 'Mayo Clinic Hospital', '555-123-4567', 'Phoenix', 'AZ', '85001'),
(11, 'Los Angeles General Hospital', '555-123-4567', 'Los Angeles', 'CA', '90001'),
(12, 'San Francisco Memorial Hospital', '555-987-6543', 'San Francisco', 'CA', '94102'),
(13, 'Seattle Medical Center', '555-555-1212', 'Seattle', 'WA', '98101'),
(14, 'Chicago Heart Center', '555-456-7890', 'Chicago', 'IL', '60601'),
(15, 'New York Presbyterian Hospital', '555-111-2222', 'New York', 'NY', '10001'),
(16, 'Miami Children Hospital', '555-222-3333', 'Miami', 'FL', '33101'),
(17, 'Dallas General Hospital', '555-333-4444', 'Dallas', 'TX', '75201'),
(18, 'Atlanta Medical Center', '555-444-5555', 'Atlanta', 'GA', '30301'),
(19, 'Denver Health', '555-555-5555', 'Denver', 'CO', '80201'),
(20, 'Portland Community Hospital', '555-666-7777', 'Portland', 'OR', '97201'),
(21, 'Memorial Hospital', '(555) 555-1212', 'Los Angeles', 'CA', '90001'),
(22, 'Houston Medical Center', '(555) 555-3434', 'Houston', 'TX', '77002'),
(23, 'New York General Hospital', '(555) 555-2121', 'New York', 'NY', '10001'),
(24, 'Seattle Children Hospital', '(555) 555-7878', 'Seattle', 'WA', '98101'),
(25, 'Chicago Medical Center', '(555) 555-4545', 'Chicago', 'IL', '60601'),
(26, 'San Francisco General Hospital', '(555) 555-8989', 'San Francisco', 'CA', '94101'),
(27, 'Miami Regional Medical Center', '(555) 555-3434', 'Miami', 'FL', '33101'),
(28, 'Dallas General Hospital', '(555) 555-6565', 'Dallas', 'TX', '75201'),
(29, 'Boston Medical Center', '(555) 555-7878', 'Boston', 'MA', '02101'),
(30, 'San Diego Children Hospital', '(555) 555-4545', 'San Diego', 'CA', '92101'),
(31, 'Los Angeles Medical Center', '+1-310-555-5555', 'Los Angeles', 'CA', '90048'),
(32, 'Houston General Hospital', '+1-713-555-5555', 'Houston', 'TX', '77030'),
(33, 'San Francisco General Hospital', '+1-415-555-5555', 'San Francisco', 'CA', '94110'),
(34, 'Miami Children Hospital', '+1-305-555-5555', 'Miami', 'FL', '33155'),
(35, 'Cedars-Sinai Medical Center', '+1-310-555-5555', 'Los Angeles', 'CA', '90048'),
(36, 'California Pacific Medical Center', '+1-415-555-5555', 'San Francisco', 'CA', '94115'),
(37, 'New York Presbyterian Hospital', '+1-212-555-5555', 'New York', 'NY', '10021'),
(38, 'Northwestern Memorial Hospital', '+1-312-555-5555', 'Chicago', 'IL', '60611'),
(39, 'UC San Diego Medical Center', '+1-619-555-5555', 'San Diego', 'CA', '92103'),
(40, 'San Francisco VA Medical Center', '+1-415-555-5555', 'San Francisco', 'CA', '94121');

INSERT INTO insurance (insurance_id, insurance_company, policy_number, insurance_type, start_date, end_date)
VALUES
(1, 'Blue Cross Blue Shield', 'BCBS1234', 'PPO', '2022-01-01', '2022-12-31'),
(2, 'United Healthcare', 'UHC5678', 'HMO', '2022-01-01', '2022-12-31'),
(3, 'Aetna', 'AET9101', 'POS', '2022-01-01', '2022-12-31'),
(4, 'Cigna', 'CIG1112', 'EPO', '2022-01-01', '2022-12-31'),
(5, 'Humana', 'HUM1314', 'HDHP', '2022-01-01', '2022-12-31'),
(6, 'Kaiser Permanente', 'KP1516', 'HMO', '2022-01-01', '2022-12-31'),
(7, 'Molina Healthcare', 'MOL1718', 'Medicaid', '2022-01-01', '2022-12-31'),
(8, 'Medicare', 'MED1920', 'Original Medicare', '2022-01-01', '2022-12-31'),
(9, 'Amerigroup', 'AMG2122', 'Medicare Advantage', '2022-01-01', '2022-12-31'),
(10, 'Health Net', 'HNT2324', 'PPO', '2022-01-01', '2022-12-31'),
(11, 'Aetna', 'AE-2101', 'PPO', '2021-01-01', '2022-12-31'),
(12, 'Blue Cross Blue Shield', 'BCBS-2222', 'HMO', '2022-04-15', '2023-04-14'),
(13, 'UnitedHealthcare', 'UHC-1234', 'POS', '2021-07-01', '2022-06-30'),
(14, 'Cigna', 'CG-9876', 'EPO', '2021-03-01', '2022-02-28'),
(15, 'Humana', 'HM-5432', 'HMO', '2022-01-01', '2022-12-31'),
(16, 'Kaiser Permanente', 'KP-9876', 'HMO', '2021-06-01', '2022-05-31'),
(17, 'Aetna', 'AE-2102', 'PPO', '2022-01-01', '2023-12-31'),
(18, 'Cigna', 'CG-5555', 'POS', '2021-08-01', '2022-07-31'),
(19, 'Humana', 'HM-1111', 'EPO', '2021-04-01', '2022-03-31'),
(20, 'UnitedHealthcare', 'UHC-5678', 'HMO', '2022-02-01', '2023-01-31'),
(21, 'Aetna', 'AP123456', 'PPO', '2022-01-01', '2022-12-31'),
(22, 'Blue Cross Blue Shield', 'BCBS98765', 'HMO', '2022-03-15', '2023-03-14'),
(23, 'Cigna', 'CG789012', 'POS', '2022-02-01', '2022-11-30'),
(24, 'Humana', 'HM345678', 'HMO', '2022-01-01', '2022-12-31'),
(25, 'UnitedHealthcare', 'UHC456789', 'PPO', '2022-04-01', '2022-09-30'),
(26, 'Aetna', 'AP987654', 'HMO', '2022-01-01', '2022-12-31'),
(27, 'Blue Cross Blue Shield', 'BCBS12345', 'PPO', '2022-01-01', '2022-12-31'),
(28, 'Cigna', 'CG567890', 'HMO', '2022-02-01', '2022-11-30'),
(29, 'Humana', 'HM123456', 'PPO', '2022-03-01', '2022-08-31'),
(30, 'UnitedHealthcare', 'UHC789012', 'POS', '2022-01-01', '2022-12-31'),
(31, 'Aetna', 'ABC123', 'PPO', '2020-01-01', '2021-12-31'),
(32, 'Blue Cross Blue Shield', 'DEF456', 'HMO', '2020-06-01', '2021-05-31'),
(33, 'Cigna', 'GHI789', 'POS', '2021-01-01', '2022-12-31'),
(34, 'Humana', 'JKL012', 'HSA', '2020-03-15', '2021-03-14'),
(35, 'UnitedHealthcare', 'MNO345', 'EPO', '2020-02-01', '2021-01-31'),
(36, 'Aetna', 'PQR678', 'PPO', '2021-04-01', '2022-03-31'),
(37, 'Cigna', 'STU901', 'POS', '2020-01-01', '2021-12-31'),
(38, 'Blue Cross Blue Shield', 'VWX234', 'HMO', '2021-06-01', '2022-05-31'),
(39, 'Humana', 'YZA567', 'HSA', '2020-08-15', '2021-08-14'),
(40, 'UnitedHealthcare', 'BCD890', 'EPO', '2020-07-01', '2021-06-30');

INSERT INTO patient_medication (patient_medication_id, patient_id, medication_id, doctor_name)
VALUES
(1, 1, 1, 'Dr. Smith'),
(2, 2, 2, 'Dr. Rodriguez'),
(3, 3, 3, 'Dr. Lee'),
(4, 4, 4, 'Dr. Garcia'),
(5, 5, 5, 'Dr. Johnson'),
(6, 6, 6, 'Dr. Davis'),
(7, 7, 7, 'Dr. Kim'),
(8, 8, 8, 'Dr. Wilson'),
(9, 9, 9, 'Dr. Chen'),
(10, 10, 10, 'Dr. Nguyen'),
(11, 11, 11, 'Dr. Rodriguez'),
(12, 12, 12, 'Dr. Lee'),
(13, 13, 13, 'Dr. Garcia'),
(14, 14, 14, 'Dr. Johnson'),
(15, 15, 15, 'Dr. Davis'),
(16, 16, 16, 'Dr. Kim'),
(17, 17, 17, 'Dr. Wilson'),
(18, 18, 18, 'Dr. Chen'),
(19, 19, 19, 'Dr. Nguyen'),
(20, 20, 20, 'Dr. Smith'),
(21, 21, 21, 'Dr. Lee'),
(22, 22, 22, 'Dr. Garcia'),
(23, 23, 23, 'Dr. Johnson'),
(24, 24, 24, 'Dr. Davis'),
(25, 25, 25, 'Dr. Kim'),
(26, 26, 26, 'Dr. Wilson'),
(27, 27, 27, 'Dr. Chen'),
(28, 28, 28, 'Dr. Nguyen'),
(29, 29, 29, 'Dr. Smith'),
(30, 30, 30, 'Dr. Rodriguez'),
(31, 31, 31, 'Dr. Garcia'),
(32, 32, 32, 'Dr. Johnson'),
(33, 33, 33, 'Dr. Davis'),
(34, 34, 34, 'Dr. Kim'),
(35, 35, 35, 'Dr. Wilson'),
(36, 36, 36, 'Dr. Chen'),
(37, 37, 37, 'Dr. Nguyen'),
(38, 38, 38, 'Dr. Smith'),
(39, 39, 39, 'Dr. Rodriguez'),
(40, 40, 40, 'Dr. Garcia');

INSERT INTO patient_hospital(patient_hospital_id, patient_id, hospital_id, admission_date, discharge_date)
VALUES
(1, 1, 1, '2022-02-15', '2022-02-20'),
(2, 2, 2, '2022-03-05', '2022-03-10'),
(3, 3, 3, '2022-04-02', '2022-04-08'),
(4, 4, 4, '2022-05-01', '2022-05-06'),
(5, 5, 5, '2022-06-03', '2022-06-08'),
(6, 6, 6, '2022-07-08', '2022-07-12'),
(7, 7, 7, '2022-08-12', '2022-08-17'),
(8, 8, 8, '2022-09-15', '2022-09-19'),
(9, 9, 9, '2022-10-18', '2022-10-22'),
(10, 10, 10, '2022-11-20', '2022-11-26'),
(11, 11, 11, '2022-12-22', '2022-12-27'),
(12, 12, 12, '2023-01-24', '2023-01-28'),
(13, 13, 13, '2023-02-25', '2023-03-01'),
(14, 14, 14, '2023-03-28', '2023-04-02'),
(15, 15, 15, '2023-04-30', '2023-05-05'),
(16, 16, 16, '2023-05-31', '2023-06-04'),
(17, 17, 17, '2023-06-30', '2023-07-06'),
(18, 18, 18, '2023-07-31', '2023-08-05'),
(19, 19, 19, '2023-08-31', '2023-09-04'),
(20, 20, 20, '2023-09-30', '2023-10-06'),
(21, 21, 21, '2023-10-31', '2023-11-05'),
(22, 22, 22, '2023-11-30', '2023-12-05'),
(23, 23, 23, '2023-12-31', '2024-01-05'),
(24, 24, 24, '2024-01-31', '2024-02-05'),
(25, 25, 25, '2024-02-29', '2024-03-05'),
(26, 26, 26, '2024-03-31', '2024-04-05'),
(27, 27, 27, '2024-04-30', '2024-05-06'),
(28, 28, 28, '2024-02-11', '2024-02-29'),
(29, 29, 29, '2024-03-15', '2024-02-20'),
(30, 30, 30, '2024-04-02', '2024-04-20'),
(31, 31, 31, '2022-01-07', '2022-01-11'),
(32, 32, 32, '2022-03-15', '2022-03-21'),
(33, 33, 33, '2022-05-02', '2022-05-04'),
(34, 34, 34, '2022-05-14', '2022-05-18'),
(35, 35, 35, '2022-01-01', '2022-01-04'),
(36, 36, 36, '2022-02-09', '2022-02-16'),
(37, 37, 37, '2022-08-01', '2022-08-05'),
(38, 38, 38, '2022-09-08', '2022-09-11'),
(39, 39, 39, '2022-10-19', '2022-10-23'),
(40, 40, 40, '2022-12-01', '2022-12-05');

INSERT INTO hospital_insurance (hospital_insurance_id, hospital_id, insurance_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35),
(36, 36, 36),
(37, 37, 37),
(38, 38, 38),
(39, 39, 39),
(40, 40, 40);
	
INSERT INTO patient_insurance (patient_insurance_id, patient_id, insurance_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35),
(36, 36, 36),
(37, 37, 37),
(38, 38, 38),
(39, 39, 39),
(40, 40, 40);
	
INSERT INTO patient_symptoms (patient_symptoms_id, patient_id, symptom_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35),
(36, 36, 36),
(37, 37, 37),
(38, 38, 38),
(39, 39, 39),
(40, 40, 40);
	
INSERT INTO patient_disease (patient_disease_id, patient_id, disease_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35),
(36, 36, 36),
(37, 37, 37),
(38, 38, 38),
(39, 39, 39),
(40, 40, 40);
	
INSERT INTO disease_symptom (disease_symptom_id, disease_id, symptom_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35),
(36, 36, 36),
(37, 37, 37),
(38, 38, 38),
(39, 39, 39),
(40, 40, 40);


----- 

--1: Top 5 most common diseases in the dataset:
	
SELECT disease_name, COUNT(*) AS total_cases
FROM disease
GROUP BY disease_name
ORDER BY total_cases DESC
LIMIT 5;

	
--2: Top 5 most common symptoms in the dataset:

SELECT symptom_name, COUNT(*) AS total_occurrences
FROM symptoms
GROUP BY symptom_name
ORDER BY total_occurrences DESC
LIMIT 5;

--3: Top 5 symptoms that are most commonly associated with each disease:

SELECT d.disease_name, s.symptom_name, COUNT(*) AS total_occurrences
FROM disease d
JOIN disease_symptom ds ON d.disease_id = ds.disease_id
JOIN disease di ON d.disease_id = di.disease_id
JOIN symptoms s ON ds.symptom_id = s.symptom_id
GROUP BY d.disease_name, s.symptom_name
ORDER BY d.disease_name, total_occurrences DESC
LIMIT 5;

	
--4: Finding the average number of symptoms associated with each disease in the dataset
	
SELECT AVG(num_symptoms) AS average_num_symptoms
FROM (
    SELECT d.disease_name, COUNT(*) AS num_symptoms
    FROM disease AS d
    JOIN disease_symptom AS ds ON d.disease_id = ds.disease_id
    JOIN symptoms AS s ON ds.symptom_id = s.symptom_id
    GROUP BY d.disease_name
) AS subquery;

--- DML Operations ---

-- 1. Update the hospital in the patient_hospital table
UPDATE patient_hospital SET hospital_id = 5 WHERE patient_id = 4;

SELECT * FROM patient_hospital;

-- 2. Trying to delete a hospital id and its associated insurance and patient_hospital entries:

DELETE FROM hospital WHERE hospital_id = 6;

-- 3. Inserting a new patient record:

INSERT INTO patient (patient_id, first_name, last_name, date_of_birth, gender, email_address, street_address, city, state, postal_code, contact_information, medical_history,
					severity_type, severity_score, length_of_hospital_stay, diagnosis_month)
VALUES
(41, 'Sameer', 'Popat', '1990-01-01', 'M', 'sameerpopat@gmail.com', '145 KP St', 'New York', 'NY', '10001', '514-123-4567', 'None', 'Low', 1.1, 6, 'March');

SELECT * FROM patient;

------------------------------------------------------
------------------------------------------------------

----- *** Dimensional Modeling *** -----

--- Fact table: patient ---

CREATE TABLE db_warehouse.patient_fact (
patient_id SERIAL PRIMARY KEY,
symptom_id INT NOT NULL,
disease_id INT NOT NULL,
hospital_id INT NOT NULL,
insurance_id INT NOT NULL,
medication_id INT NOT NULL,
medical_history VARCHAR(1000) NOT NULL,
severity_type VARCHAR(100) NOT NULL,
severity_score INT NOT NULL,
length_of_hospital_stay VARCHAR(100) NOT NULL,
diagnosis_month VARCHAR(100) NOT NULL,
CONSTRAINT fk_symptoms FOREIGN KEY (symptom_id) REFERENCES db_warehouse.symptom_dim (symptom_id),
CONSTRAINT fk_disease FOREIGN KEY (disease_id) REFERENCES db_warehouse.disease_dim (disease_id),
CONSTRAINT fk_hospital FOREIGN KEY (hospital_id) REFERENCES db_warehouse.hospital_dim (hospital_id),
CONSTRAINT fk_insurance FOREIGN KEY (insurance_id) REFERENCES db_warehouse.insurance_dim (insurance_id),
CONSTRAINT fk_medication FOREIGN KEY (medication_id) REFERENCES db_warehouse.medication_dim (medication_id),
CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES db_warehouse.patient_dim (patient_id)
);

--- Dimension table: patient ---

CREATE TABLE db_warehouse.patient_dim (
patient_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
gender VARCHAR(10) NOT NULL,
email_address VARCHAR(255) NOT NULL,
street_address VARCHAR(255) NOT NULL,
city VARCHAR(50) NOT NULL,
state VARCHAR(50) NOT NULL,
postal_code VARCHAR(10) NOT NULL,
contact_information VARCHAR(50) NOT NULL
);

--- Dimension table: medication ---

CREATE TABLE db_warehouse.medication_dim (
medication_id SERIAL PRIMARY KEY,
medication_name VARCHAR(255) NOT NULL,
medication_type VARCHAR(50) NOT NULL,
medication_description VARCHAR(255) NOT NULL,
dosage VARCHAR(50) NOT NULL
);

--- Dimension table: hospital ---

CREATE TABLE db_warehouse.hospital_dim (
hospital_id SERIAL PRIMARY KEY,
hospital_name VARCHAR(255) NOT NULL,
hospital_phone_number VARCHAR(20) NOT NULL,
hospital_city VARCHAR(50) NOT NULL,
hospital_state VARCHAR(50) NOT NULL,
hospital_postal_code VARCHAR(10) NOT NULL
);


--- Dimension table: insurance ---

CREATE TABLE db_warehouse.insurance_dim (
insurance_id SERIAL PRIMARY KEY,
insurance_type VARCHAR(50) NOT NULL,
insurance_company VARCHAR(255) NOT NULL,
policy_number VARCHAR(50) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL
);

--- Dimension table: symptoms ---

CREATE TABLE db_warehouse.symptom_dim (
symptom_id SERIAL PRIMARY KEY,
symptom_name VARCHAR(255) NOT NULL,
symptom_1 VARCHAR(255) NOT NULL,
symptom_2 VARCHAR(255) NOT NULL,
symptom_3 VARCHAR(255) NOT NULL,
total_symptoms INTEGER NOT NULL
);

-- Dimension table: disease --

CREATE TABLE db_warehouse.disease_dim (
disease_id SERIAL PRIMARY KEY,
disease_name VARCHAR(255) NOT NULL,
disease_type VARCHAR(50) NOT NULL,
disease_description VARCHAR(255) NOT NULL,
disease_duration VARCHAR(50) NOT NULL
);


---

----- Loading the data from OLTP model into Dimensional model-----

CREATE OR REPLACE PROCEDURE DATA_LOAD_DW() LANGUAGE PLPGSQL AS $$
BEGIN

  insert into db_warehouse."disease_dim"("disease_id", "disease_name", "disease_type", "disease_description", "disease_duration")
  (select * from public."disease");						  
insert into db_warehouse."symptom_dim"("symptom_id", "symptom_name", "symptom_1", "symptom_2", "symptom_3", "total_symptoms")
  (select * from public."symptoms");					  
insert into db_warehouse."hospital_dim"("hospital_id", "hospital_name", "hospital_phone_number", "hospital_city", "hospital_state", "hospital_postal_code")
  (select * from public."hospital");
insert into db_warehouse."insurance_dim"("insurance_id", "insurance_company", "policy_number", "insurance_type", "start_date", "end_date")
  (select * from public."insurance");
insert into db_warehouse."medication_dim"("medication_id", "medication_name", "medication_type", "medication_description", "dosage")
  (select * from public."medication");									 
insert into db_warehouse."patient_dim"("patient_id", "first_name", "last_name", "date_of_birth", "gender", "email_address", "street_address", "city", "state", "postal_code", 
						    "contact_information")
  (select "patient_id", "first_name", "last_name", "date_of_birth", "gender", "email_address", "street_address", "city", "state", "postal_code", 
						    "contact_information" from public."patient");		
insert into db_warehouse."patient_fact" (patient_id, symptom_id, disease_id, hospital_id, insurance_id, medication_id, medical_history, severity_type, severity_score, length_of_hospital_stay, diagnosis_month)  
 (SELECT p.patient_id, s.symptom_id, d.disease_id, h.hospital_id, i.insurance_id, m.medication_id, p.medical_history, p.severity_type, p.severity_score, p.length_of_hospital_stay, 
p.diagnosis_month
FROM patient p
JOIN patient_medication pm ON p.patient_id = pm.patient_id
JOIN medication m ON pm.medication_id = m.medication_id
JOIN patient_hospital ph ON p.patient_id = ph.patient_id
JOIN hospital h ON ph.hospital_id = h.hospital_id
JOIN patient_insurance pi ON p.patient_id = pi.patient_id
JOIN insurance i ON pi.insurance_id = i.insurance_id
JOIN patient_symptoms ps ON p.patient_id = ps.patient_id
JOIN symptoms s ON ps.symptom_id = s.symptom_id
JOIN patient_disease pd ON p.patient_id = pd.patient_id
JOIN disease d ON pd.disease_id = d.disease_id
JOIN disease_symptom ds ON d.disease_id = ds.disease_id AND ps.symptom_id = ds.symptom_id
JOIN hospital_insurance hi ON h.hospital_id = hi.hospital_id AND pi.insurance_id = hi.insurance_id
);

END;
$$;

--- Calling the procedure

CALL DATA_LOAD_DW();

--- Analytical queries ---

--- 1. Find the number of patients diagnosed with top 10 disease types:


SELECT dd.disease_type, COUNT(pf.patient_id) AS num_patients
FROM db_warehouse.patient_fact AS pf
JOIN db_warehouse.disease_dim AS dd ON pf.disease_id = dd.disease_id
GROUP BY dd.disease_type
ORDER BY 2  DESC
LIMIT 10;

--- 2. Count of patients by top 10 disease name, symptom name and severity type:

SELECT dd.disease_name, sd.symptom_name, pf.severity_type, COUNT(pf.patient_id) as patient_count
FROM db_warehouse.patient_fact as pf
JOIN db_warehouse.disease_dim as dd ON pf.disease_id = dd.disease_id
JOIN db_warehouse.symptom_dim as sd ON pf.symptom_id = sd.symptom_id
GROUP BY dd.disease_name, sd.symptom_name, pf.severity_type
ORDER BY patient_count DESC
LIMIT 10;


--- 3. Average severity score and length of hospital stay by disease name:

SELECT dd.disease_name, AVG(pf.severity_score) as avg_severity_score, AVG(pf.length_of_hospital_stay::integer) as avg_length_of_stay
FROM db_warehouse.patient_fact as pf
JOIN db_warehouse.disease_dim as dd ON pf.disease_id = dd.disease_id
GROUP BY dd.disease_name
ORDER BY avg_severity_score DESC;


--- 4. What is the average length of hospital stay for patients with each severity type?
					
SELECT severity_type, AVG(CAST(length_of_hospital_stay AS numeric)) AS avg_length_of_stay
FROM db_warehouse.patient_fact
GROUP BY severity_type
ORDER BY 2 DESC;

--------------------------------------------
----------------END-------------------------
							  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  
										  