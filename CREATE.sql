CREATE TABLE SAMOCHODY (
	VIN CHAR(17) PRIMARY KEY NOT NULL, 
	NR_TABLICY VARCHAR NOT NULL, 
	MARKA VARCHAR(20) NOT NULL, 
	ROCZNIK CHAR(4) NOT NULL,
	PRZEBIEG INT NOT NULL,
	KOLOR VARCHAR NOT NULL,

	CONSTRAINT ZLY_VIN CHECK (LENGTH (VIN) = 17)
);

CREATE TABLE SPRZEDALI(
	IMIE VARCHAR(20) NOT NULL,
	NAZWISKO VARCHAR(20) NOT NULL,
	PESEL CHAR(11) PRIMARY KEY,
	ULICA VARCHAR NOT NULL,
	KOD_POCZTOWY CHAR(6) NOT NULL,
	DATA_URODZENIA DATE,
	MIASTO VARCHAR NOT NULL,

	CONSTRAINT ZLY_PESEL CHECK (LENGTH (PESEL) = 11),
	CONSTRAINT ZA_MLODY CHECK (DATA_URODZENIA < (CURRENT_DATE - '18 years'::interval)::date)
);

CREATE TABLE KUPILI(
	IMIE VARCHAR(20) NOT NULL,
	NAZWISKO VARCHAR(20) NOT NULL,
	PESEL CHAR(11) PRIMARY KEY,
	ULICA VARCHAR NOT NULL,
	KOD_POCZTOWY CHAR(6) NOT NULL,
	DATA_URODZENIA DATE,
	MIASTO VARCHAR NOT NULL,

	CONSTRAINT ZLY_PESEL CHECK (LENGTH (PESEL) = 11),
	CONSTRAINT ZA_MLODY CHECK (DATA_URODZENIA < (CURRENT_DATE - '18 years'::interval)::date)	
);

CREATE TABLE WYSTAWIONE(
	PESEL CHAR(11) CHECK (LENGTH (PESEL) = 11) REFERENCES SPRZEDALI(PESEL) ON DELETE CASCADE,
	VIN CHAR(17) CHECK (LENGTH (VIN) = 17) REFERENCES SAMOCHODY(VIN) ON DELETE CASCADE
);

CREATE TABLE SPRZEDANE(
	PESEL CHAR(11) CHECK (LENGTH (PESEL) = 11) REFERENCES KUPILI(PESEL) ON DELETE CASCADE,
	VIN CHAR(17) CHECK (LENGTH (VIN) = 17) REFERENCES SAMOCHODY(VIN) ON DELETE CASCADE
);

					  