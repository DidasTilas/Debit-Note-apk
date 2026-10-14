import 'package:drift/drift.dart';
import 'business.dart';
import '../uuid_generator.dart';


class Customer extends Table {
  TextColumn get id => text().clientDefault(generateUuid)();
  TextColumn get customerName => text().withLength(min: 1, max: 100)();
  TextColumn get businessId => text().references(Business, #id)();
  TextColumn get location => text().withLength(min: 10, max: 100)();
  IntColumn get phoneNumber => integer()();
}
