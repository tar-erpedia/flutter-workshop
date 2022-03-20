import 'package:flutter_workshop/globals.dart';
import 'package:flutter_workshop/model/shift.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_web/sqflite_web.dart';

Future<void> loadMainDB() async {
  // ByteData data = await rootBundle.load(join("assets", "data", "main.sql"));
  // final String query = data.buffer.toString();
  final databaseFactory = databaseFactoryWeb;
  final db = await databaseFactory.openDatabase(
    inMemoryDatabasePath,
    options: OpenDatabaseOptions(
      version: 10,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE IF NOT EXISTS "shifts" (
        	"date"	INTEGER NOT NULL,
        	"shift"	INTEGER NOT NULL,
        	"toran"	TEXT,
        	UNIQUE("date","shift"),
        	PRIMARY KEY("date","shift")
        );
        INSERT INTO "shifts" VALUES (1647734400,0,'Gil Z');
        INSERT INTO "shifts" VALUES (1647734400,1,'Mihal');
        ''');
      },
    ),
  );
  final rows = await db.rawQuery("SELECT * FROM shifts");
  shifts = rows.map((row) => Shift.fromRow(row)).toList();
}