import 'package:drift/drift.dart';
import '../uuid_generator.dart';


class User extends Table {
  TextColumn get id => text().clientDefault(generateUuid)();
  TextColumn get username => text().withLength(min: 3, max: 25)();
  TextColumn get firstName => text().withLength(min: 2, max: 20)();
  TextColumn get lastName => text().withLength(min: 2, max: 20)();
  TextColumn get passWord => text().withLength(min: 8, max: 15)();
}
