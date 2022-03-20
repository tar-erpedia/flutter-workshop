CREATE TABLE IF NOT EXISTS "shifts" (
	"date"	INTEGER NOT NULL,
	"shift"	INTEGER NOT NULL,
	"toran"	TEXT,
	UNIQUE("date","shift"),
	PRIMARY KEY("date","shift")
);
INSERT INTO "shifts" VALUES (1647734400,0,'Gil Z');
INSERT INTO "shifts" VALUES (1647734400,1,'Mihal');