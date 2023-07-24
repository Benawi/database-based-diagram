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