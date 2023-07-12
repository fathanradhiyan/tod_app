part of 'databases.dart';

class QuestionDatabase {
  static final QuestionDatabase instance = QuestionDatabase._init();

  static Database? _database;

  QuestionDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('tod_question.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final questionIdType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final questionType = 'TEXT NOT NULL';
    final isTruthType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE $tableQuestions (
    ${QuestionFields.questionId} $questionIdType,
    ${QuestionFields.question} $questionType, 
    ${QuestionFields.isTruth} $isTruthType
    )
    ''');
  }

  Future<Question> create(Question item) async {
    final db = await instance.database;
    final id = await db.insert(tableQuestions, item.toJson());
    return item.copy(questionId: id);
  }

  Future<Question> readItem(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableQuestions,
      columns: QuestionFields.values,
      where: '${QuestionFields.questionId} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Question.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Question>> readAllItems({String? search}) async {
    final db = await instance.database;

    final result = await db.query(tableQuestions,
      where: search != null? '${QuestionFields.questionId} like ? or ${QuestionFields.question} like ?' : null,
      whereArgs: search != null? ['%$search%', '%$search%'] : null
    );

    return result.map((json) => Question.fromJson(json)).toList();

  }

  Future<void> update(Question item) async {
    final db = await instance.database;

    await db.update(
      tableQuestions,
      item.toJson(),
      where: '${QuestionFields.questionId} = ?',
      whereArgs: [item.questionId]
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableQuestions,
      where: '${QuestionFields.questionId} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
