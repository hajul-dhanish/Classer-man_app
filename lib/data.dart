// import 'package:flutter/material.dart';

// WidgetsFlutterBinding.ensureInitialized();

//   final database = openDatabase(
//     join(await getDatabasesPath(), 'Face-DataBase'),
//     onCreate: (db, version) {
//       return db.execute(
//         'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
//       );
//     },
//     version: 1,
//   );

//   Future<void> insertDog(Dog dog) async {
//     final db = await database;

//     await db.insert(
//       'dogs',
//       dog.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Dog>> dogs() async {
//     final db = await database;

//     final List<Map<String, dynamic>> maps = await db.query('dogs');

//     return List.generate(maps.length, (i) {
//       return Dog(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         rrn: maps[i]['age'],
//       );
//     });
//   }

//   Future<void> updateDog(Dog dog) async {
//     final db = await database;

//     await db.update(
//       'dogs',
//       dog.toMap(),
//       where: 'id = ?',
//       whereArgs: [dog.id],
//     );
//   }

//   Future<void> deleteDog(int id) async {
//     final db = await database;

//     await db.delete(
//       'dogs',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }

//   var fido = const Dog(
//     id: 0,
//     name: 'Fido',
//     rrn: 35,
//   );

//   await insertDog(fido);

//   print(await dogs());

//   fido = Dog(
//     id: fido.id,
//     name: fido.name,
//     rrn: fido.rrn + 7,
//   );
//   await updateDog(fido);

//   print(await dogs());

//   await deleteDog(fido.id);

//   print(await dogs());

// class Dog {
//   final int id;
//   final String name;
//   final int rrn;

//   const Dog({
//     required this.id,
//     required this.name,
//     required this.rrn,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'age': rrn,
//     };
//   }

//   @override
//   String toString() {
//     return 'Dog{id: $id, name: $name, rrn: $rrn}';
//   }
// }

// Future<Widget> MySqlite() async {
//   return Container();
// }
