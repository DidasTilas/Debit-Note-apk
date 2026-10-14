import 'package:drift/drift.dart';
import 'business.dart';
import '../uuid_generator.dart';


class Product extends Table {
  TextColumn get id => text().clientDefault(generateUuid)();
  TextColumn get productName => text().withLength(min: 2, max: 100)();
  TextColumn get businessId => text().references(Business, #id)();
  TextColumn get unit => text().withLength(min: 2, max: 20)();
  TextColumn get cost => text().withLength(min: 2, max: 20)();
  TextColumn get price => text().withLength(min: 2, max: 20)();
  TextColumn get arrived => text().withLength(min: 2, max: 20)();
  TextColumn get soldOut => text().withLength(min: 2, max: 20)();
  DateTimeColumn get dateIn => dateTime()();
  IntColumn get unPaid => integer()();
  DateTimeColumn get dateOut => dateTime()();
}
