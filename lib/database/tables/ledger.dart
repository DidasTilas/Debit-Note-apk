import 'package:drift/drift.dart';
import 'customer.dart';
import 'business.dart';
import 'product.dart';
import '../uuid_generator.dart';


class Ledger extends Table {
  TextColumn get id => text().clientDefault(generateUuid)();
  TextColumn get businessId => text().references(Business, #id)();
  TextColumn get customerId => text().references(Customer, #id)();
  TextColumn get productId => text().references(Product, #id)();
  IntColumn get quantitySold => integer()();
  IntColumn get quantityPaid => integer()();
  IntColumn get amount => integer()();
}
