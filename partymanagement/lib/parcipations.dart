import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqflite/sqflite.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.tealAccent),
      ), home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Girls>> _getGirls() async {
    return await _databaseService.girls();
  }

  Future<List<Boys>> _getBoys() async {
    return await _databaseService.boy();
  }

  Future<void> _onDogDelete(Girls girl) async {
    await _databaseService.deleteGirls(girl.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:
      Scaffold(
        backgroundColor: Colors.black,
        appBar:
        AppBar(
          backgroundColor: Colors.purple,
          title: Text('Participations'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Girls'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Boys'),
              ),
            ],
          ),
        ),
        body:
        TabBarView(

          children: [
            
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.purple,
              onPressed: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (_) => BoysFormPage(),
                    fullscreenDialog: true,
                  ),
                )
                    .then((_) => setState(() {}));
              },
              heroTag: 'addBreed',
              child: FaIcon(FontAwesomeIcons.plus),
            ),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
class BoysFormPage extends StatefulWidget {
  const BoysFormPage({Key? key}) : super(key: key);

  @override
  _BoysFormPageState createState() => _BoysFormPageState();
}

class _BoysFormPageState extends State<BoysFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();

  Future<void> _onSave() async {
    final name = _nameController.text;
    final description = _descController.text;

    await DatabaseService
        .insertBoys(Boys(name: name, description: description));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Add a new boys'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(

              controller: _nameController,
              decoration: InputDecoration(

                border: OutlineInputBorder(),
                filled: true,

                fillColor: Colors.white38,
                hintText: 'Enter name of the boy here',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descController,
              maxLines: 7,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,

                fillColor: Colors.white38,
                hintText: 'Enter description about the participation here',
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: _onSave,
                style:  ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                ),

                child: Text(
                  'Save the Boys',
                  style: TextStyle(
                    backgroundColor: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    final path = join(databasePath, 'flutter_sqlite_database.db');
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  // When the database is first created, create a table to store breeds
  // and a table to store dogs.
  Future<void> _onCreate(Database db, int version) async {
    // Run the CREATE {breeds} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE boy INTEGER PRIMARY KEY, name TEXT, description TEXT)',
    );
    // Run the CREATE {dogs} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE girl(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, color INTEGER, breedId INTEGER, FOREIGN KEY (breedId) REFERENCES breeds(id) ON DELETE SET NULL)',
    );
  }

  // Define a function that inserts breeds into the database
  static Future<void> insertBoys(Boys boy) async {
// Get a reference to the database.
    final db = await _databaseService.database;

    // Insert the Breed into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same breed is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'boys',
      boy.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertGirl(Girls girl) async {
    final db = await _databaseService.database;
    await db.insert(
      'Girl',
      girl.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Boys>> boy() async {

    final db = await _databaseService.database;


    final List<Map<String, dynamic>> maps = await db.query('boys');

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(maps.length, (index) => Boys.fromMap(maps[index]));
  }

  static Future<Boys> boys(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
    await db.query('breeds', where: 'id = ?', whereArgs: [id]);
    return Boys.fromMap(maps[0]);
  }
  Future<List<Girls>> girls() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');
    return List.generate(maps.length, (index) => Girls.fromMap(maps[index]));
  }

  // A method that updates a breed data from the breeds table.
  Future<void> updateBoys(Boys boy) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Update the given breed
    await db.update(
      'Boys',
      boy.toMap(),
      // Ensure that the Breed has a matching id.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [boy.id],
    );
  }

  Future<void> updateGirls(Girls girl) async {
    final db = await _databaseService.database;
    await db.update('dogs', girl.toMap(), where: 'id = ?', whereArgs: [girl.id]);
  }

  // A method that deletes a breed data from the breeds table.
  Future<void> deleteBoys(int id) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Remove the Breed from the database.
    await db.delete(
      'boys',
      // Use a `where` clause to delete a specific breed.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> deleteGirls(int id) async {
    final db = await _databaseService.database;
    await db.delete('girl', where: 'id = ?', whereArgs: [id]);
  }

  join(String databasePath, String s) {}
}
class Boys {
  final int? id;
  final String name;
  final String description;

  Boys({
    this.id,
    required this.name,
    required this.description,
  });

  // Convert a Breed into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Boys.fromMap(Map<String, dynamic> map) {
    return Boys(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Boys.fromJson(String source) => Boys.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each breed when using the print statement.
  @override
  String toString() => 'boys(id: $id, name: $name, description: $description)';
}
class Girls{
  final int? id;
  final String name;
  final int age;
  final Color color;
  final int boysId;

  Girls({
    this.id,
    required this.name,
    required this.age,
    required this.color,
    required this.boysId,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'color': color.value,
      'boysId': boysId,
    };
  }

  factory Girls.fromMap(Map<String, dynamic> map) {
    return Girls(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
      color: Color(map['color']),
      boysId: map['breedId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Girls.fromJson(String source) =>Girls.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Girls(id: $id, name: $name, age: $age, color: $color, boysId: $boysId)';
  }
}
class BoysBuilder extends StatelessWidget {
  const BoysBuilder({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<Boys>> future;

  get boys => null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Boys>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final breed = snapshot.data![index];
              return buildBoyCard(boys, context);
            },
          ),
        );
      },
    );
  }

  Widget buildBoyCard(Boys boy, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              alignment: Alignment.center,
              child: Text(
                boy.id.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    boy.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(boy.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}