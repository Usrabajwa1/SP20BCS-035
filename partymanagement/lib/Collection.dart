import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqflite/sqflite.dart';

import 'Collection.dart';
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
      ), home: collection(),
    );
  }
}
class collection extends StatefulWidget {
  const collection({Key? key}) : super(key: key);

  @override
  _collectionState createState() => _collectionState();
}

class _collectionState extends State<collection> {
  final DatabaseService _databaseService = DatabaseService();


  Future<List<collections>> getcollection() async {
    return await _databaseService.collection();
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
          title: Text('Collections'),
          centerTitle: true,
          bottom: const
          TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Collections'),
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
                    builder: (_) => CollectionsFormPage(),
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
class CollectionsFormPage extends StatefulWidget {
  const CollectionsFormPage({Key? key}) : super(key: key);

  @override
  _CollectionsFormPageState createState() => _CollectionsFormPageState();
}

class _CollectionsFormPageState extends State<CollectionsFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();

  Future<void> _onSave() async {
    final name = _nameController.text;
    final description = _descController.text;

    await DatabaseService
        .insertcollections(collections(name: name, description: description));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Add a new collection'),
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
      'CREATE TABLE collection INTEGER PRIMARY KEY, name TEXT, description TEXT)',
    );

  }

  // Define a function that inserts breeds into the database
  static Future<void> insertcollections(collections collection) async {
// Get a reference to the database.
    final db = await _databaseService.database;

    // Insert the Breed into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same breed is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'boys',
      collection.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<collections>> collection() async {

    final db = await _databaseService.database;


    final List<Map<String, dynamic>> maps = await db.query('collections');

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(maps.length, (index) => collections.fromMap(maps[index]));
  }

  static Future<collections> collectionn(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
    await db.query('collections', where: 'id = ?', whereArgs: [id]);
    return collections.fromMap(maps[0]);
  }


  // A method that updates a breed data from the breeds table.
  Future<void> updatecollections(collections collection) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Update the given breed
    await db.update(
      'Boys',
      collection.toMap(),
      // Ensure that the Breed has a matching id.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [collection.id],
    );
  }


  // A method that deletes a breed data from the breeds table.
  Future<void> deletecollections(int id) async {
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

  join(String databasePath, String s) {}
}
class collections {
  final int? id;
  final String name;
  final String description;

  collections({
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

  factory collections.fromMap(Map<String, dynamic> map) {
    return collections(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory collections.fromJson(String source) => collections.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each breed when using the print statement.
  @override
  String toString() => 'collections(id: $id, name: $name, description: $description)';
}
class collectionsBuilder extends StatelessWidget {
  const collectionsBuilder({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<collections>> future;

  get collection => null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<collections>>(
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
              return _buildCollectionCard(collection, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildCollectionCard(collections collection, BuildContext context) {
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
                collection.id.toString(),
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
                    collection.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(collection.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}