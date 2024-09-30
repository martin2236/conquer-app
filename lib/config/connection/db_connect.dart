import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBase {
  
  static Future<void> initializeDatabase() async {
    try {
      // Obtener el path de la base de datos
      final databasePath = await getDatabasesPath();
      final path = join(databasePath, 'conquer.db');
      
      // Abrir la base de datos o crearla si no existe
      await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          // Crear la tabla si no existe
          await db.execute('''
            CREATE TABLE IF NOT EXISTS item_images (
              item_id INTEGER PRIMARY KEY,
              image_path TEXT NOT NULL
            )
          ''');
          print('Tablas creadas');
        },
        onOpen: (Database db) async {
          print('Base de datos abierta');
        },
      );
    } catch (e) {
      print('Error al abrir o crear la base de datos: $e');
    }
  }
}
