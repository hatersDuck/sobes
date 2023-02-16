CREATE TABLE "banks" (
	"id"	INTEGER,
	"name"	TEXT,
	"acronym"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "IBL" (
	"id"	INTEGER,
	"bank_id"	INTEGER,
	"sum_credit"	REAL NOT NULL,
	"interes_rate"	REAL,
	"start_date"	TEXT NOT NULL,
	"end_date"	TEXT,
	FOREIGN KEY("bank_id") REFERENCES "banks"("id") ON DELETE SET NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "plan_" (
	"id"	INTEGER,
	"bank_id"	INTEGER NOT NULL,
	"plan_date"	TEXT,
	"amount"	REAL,
	FOREIGN KEY("bank_id") REFERENCES "banks"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE "fact" (
	"id"	INTEGER,
	"IBL_ID"	INTEGER NOT NULL,
	"expences_date"	TEXT NOT NULL,
	"amount"	REAL NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("IBL_ID") REFERENCES "IBL"("id")
);
