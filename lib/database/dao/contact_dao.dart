import 'package:poc_byte_bank_v2/models/contact.dart';
import 'package:poc_byte_bank_v2/database/app_database.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER) ';

  Future<int> save(Contact contact) async {
    final Database db = await createDatabase.call();
    return db.insert(_tableName, contact.toMap());
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase.call();
    final List<Map<String, Object?>> result = await db.query(_tableName);
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact =
          Contact(row[_id], row[_name], row[_accountNumber]);
      contacts.add(contact);
    }
    return contacts;
  }
}
