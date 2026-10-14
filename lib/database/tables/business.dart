import 'package:drift/drift.dart';
import 'user.dart';
import '../uuid_generator.dart';


class Business extends Table {
  TextColumn get id => text().clientDefault(generateUuid)();
  TextColumn get businessName => text().withLength(min: 8, max: 100)();
  TextColumn get ownerId => text().references(User, #id)();
}
