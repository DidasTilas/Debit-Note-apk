import '../uuid_generator.dart';
import 'package:drift/drift.dart';
import 'business.dart';



class Expense extends Table {
  TextColumn get id => text().clientDefault(generateUuid)();
  TextColumn get businessId => text().references(Business, #id)();
  TextColumn get expenseName => text().withLength(min: 2, max: 20)();
  IntColumn get expenseAmount => integer()();
  DateTimeColumn get date => dateTime()();
}
