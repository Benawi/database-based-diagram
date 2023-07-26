CREATE TABLE patients (
	id SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(255),
	date_of_birth DATE
);

CREATE TABLE invoices (
	id SERIAL PRIMARY KEY NOT NULL,
	total_amount DECIMAL,
	generated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_history_id INT
);

CREATE TABLE medical_histories (
	id SERIAL PRIMARY KEY NOT NULL,
	admitted_at TIMESTAMP,
	patient_id INT,
	status VARCHAR(255)
);

CREATE TABLE invoice_items (
	id SERIAL PRIMARY KEY NOT NULL,
	unit_price DECIMAL,
	quantity INT,
	total_price DECIMAL,
	invoice_id INT,
	treatment_id INT
);

CREATE TABLE treatments (
	id SERIAL PRIMARY KEY NOT NULL,
	type VARCHAR(255),
	name VARCHAR(255)
);

CREATE TABLE treatments_histories (
	medical_histories_id INT,
	treatments_id INT,
	PRIMARY KEY (medical_histories_id, treatments_id)
);

ALTER TABLE medical_histories ADD CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES patients(id);
ALTER TABLE invoices ADD CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);
ALTER TABLE invoice_items ADD CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id);
ALTER TABLE invoice_items ADD CONSTRAINT fk_invoices FOREIGN KEY (invoice_id) REFERENCES invoices(id);
ALTER TABLE treatments_histories ADD CONSTRAINT fk_treatments FOREIGN KEY (treatments_id) REFERENCES treatments(id);
ALTER TABLE treatments_histories ADD CONSTRAINT fk_histories FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id);

CREATE INDEX idx_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_medical_history_id ON invoices(medical_history_id);
CREATE INDEX idx_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_treatment_id ON invoice_items(treatment_id);
CREATE INDEX idx_medical_histories_id ON treatments_histories(medical_histories_id);
CREATE INDEX idx_treatments_id ON treatments_histories(treatments_id);