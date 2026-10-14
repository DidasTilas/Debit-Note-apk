import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/customer.dart';
import 'tables/ledger.dart';
import 'tables/product.dart';
import 'tables/user.dart';
import 'tables/expense.dart';
import 'tables/business.dart';
import 'uuid_generator.dart';
part 'database_helper.g.dart';

@DriftDatabase(tables: [Customer, Ledger, Business, Product, User, Expense])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'denibook.sqlite'));
    print('**************************************************');
    print('📂 EXACT SQLITE FILE PATH: ${file.path}');
    print('**************************************************');
    return NativeDatabase.createInBackground(file);
  });
}