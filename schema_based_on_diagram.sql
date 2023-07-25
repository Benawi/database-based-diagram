CREATE TABLE patients (
    id BIGINT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE treatments (
    id BIGINT NOT NULL PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100)
);

CREATE TABLE medical_histories (
    id BIGINT NOT NULL PRIMARY KEY,
    admitted_at TIMESTAMP,
    patients_id INTEGER REFERENCES patients(id),
    treatment_id INTEGER REFERENCES treatments(id)
);

CREATE TABLE invoices (
    id BIGINT NOT NULL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INTEGER REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id BIGINT NOT NULL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INTEGER,
    total_price DECIMAL,
    invoice_id INTEGER REFERENCES invoices(id),
    treatment_id INTEGER REFERENCES treatments(id)
);


-- Indexes
CREATE INDEX id_invoice_items_treatments_id ON invoice_items (treatment_id);
CREATE INDEX id_invoice_items_invoice_id ON invoice_items (invoice_id);
CREATE INDEX id_invoices_medical_history_id ON invoices (medical_history_id);
CREATE INDEX id_medical_histories_patients_id ON medical_histories (patients_id);
CREATE INDEX id_medical_histories_treatments_id ON medical_histories (treatment_id); 