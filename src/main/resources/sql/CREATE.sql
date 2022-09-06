CREATE TABLE if not exists operator (
    Id SERIAL PRIMARY KEY,
    Name varchar(255),
	Desription text
);
ALTER TABLE operator
  RENAME COLUMN Desription TO Description;

CREATE TABLE if not exists customer (
	Id SERIAL PRIMARY KEY,
    name varchar(255)
);

CREATE TABLE if not exists tarif_plan (
	Id SERIAL PRIMARY KEY,
    name varchar(255),
	internet_limit_mb int NOT NULL,
	is_unlimit_internet boolean DEFAULT false NOT NULL,
	voice_limit_min int NOT NULL,
	is_unlimit_voice boolean DEFAULT false NOT NULL,
	sms_limit_min int NOT NULL,
	is_unlimit_sms boolean DEFAULT false NOT NULL
);
ALTER TABLE tarif_plan
  RENAME TO tariff_plan;

CREATE TABLE if not exists phone_number (
    Id SERIAL PRIMARY KEY,
	number int NOT NULL, /* phone number value */
    operator int NOT NULL, /* operator ID */
	tariff_plan int NOT NULL, /* tariff plan ID */
	customer int, /* customer ID */
	CONSTRAINT fk_phone_number_operator FOREIGN KEY (operator) REFERENCES operator (id),
	CONSTRAINT fk_phone_number_tariff_plan FOREIGN KEY (tariff_plan) REFERENCES tariff_plan (id),
	CONSTRAINT fk_phone_number_customer FOREIGN KEY (customer) REFERENCES customer (id)
);

CREATE TABLE if not exists sms (
    Id SERIAL PRIMARY KEY,
    from_id int NOT NULL,
    to_id int NOT NULL,
	sms_text varchar(255),
	CONSTRAINT fk_sms_from_phone_number FOREIGN KEY (from_id) REFERENCES phone_number (id),
	CONSTRAINT fk_sms_to_phone_number FOREIGN KEY (to_id) REFERENCES phone_number (id)
);

CREATE TABLE if not exists voice_call (
    Id SERIAL PRIMARY KEY,
    from_id int NOT NULL,
    to_id int NOT NULL,
	is_group boolean DEFAULT false NOT NULL,
	CONSTRAINT fk_voice_call_from_phone_number FOREIGN KEY (from_id) REFERENCES phone_number (id),
	CONSTRAINT fk_voice_call_to_phone_number FOREIGN KEY (to_id) REFERENCES phone_number (id)
);


