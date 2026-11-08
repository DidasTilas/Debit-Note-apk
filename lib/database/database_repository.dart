import 'database_helper.dart';
import 'uuid_generator.dart';

class DatabaseRepository {
  final AppDatabase db;

  DatabaseRepository(this.db);

  // 1. Register User and Business in SQLite
  Future<void> registerUserAndBusiness({
    required String fullName,
    required String password,
    required String businessName,
  }) async {
    final names = fullName.trim().split(' ');
    final firstName = names.isNotEmpty ? names.first : fullName;
    final lastName = names.length > 1 ? names.sublist(1).join(' ') : '';
    final username = firstName.toLowerCase();

    // Create User Companion
    final userId = generateUuid();
    await db.into(db.user).insert(
      UserCompanion.insert(
        id: userId,
        username: username,
        firstName: firstName,
        lastName: lastName,
        passWord: password,
      ),
    );

    // Create Business Companion linked to User
    final businessId = generateUuid();
    await db.into(db.business).insert(
      BusinessCompanion.insert(
        id: businessId,
        businessName: businessName,
        ownerId: userId,
      ),
    );
  }

  // 2. Add Product Arrival into SQLite
  Future<void> addProduct({
    required String name,
    required String unit,
    required String cost,
    required String price,
    required int arrivedQuantity,
    required DateTime dateIn,
    required String businessId,
  }) async {
    await db.into(db.product).insert(
      ProductCompanion.insert(
        id: generateUuid(),
        productName: name,
        businessId: businessId,
        unit: unit,
        cost: cost,
        price: price,
        arrived: arrivedQuantity.toString(),
        soldOut: '0',
        dateIn: dateIn,
        unPaid: 0,
        dateOut: dateIn,
      ),
    );
  }

  // 3. Add Customer into SQLite
  Future<void> addCustomer({
    required String name,
    required int phoneNumber,
    required String location,
    required String businessId,
  }) async {
    await db.into(db.customer).insert(
      CustomerCompanion.insert(
        id: generateUuid(),
        customerName: name,
        businessId: businessId,
        location: location,
        phoneNumber: phoneNumber,
      ),
    );
  }

  // 4. Record Transaction, Auto-Calculate Amount, and Atomically Deduct Stock
  Future<int> recordTransactionAndDeductStock({
    required String businessId,
    required String customerId,
    required String productId,
    required int quantitySold,
    required int quantityPaid,
    required int unitPrice,
  }) async {
    // Auto-calculate Total Amount = Unit Selling Price x Quantity Sold
    final calculatedTotalAmount = unitPrice * quantitySold;

    // Record Ledger Entry in SQLite
    await db.into(db.ledger).insert(
      LedgerCompanion.insert(
        id: generateUuid(),
        businessId: businessId,
        customerId: customerId,
        productId: productId,
        quantitySold: quantitySold,
        quantityPaid: quantityPaid,
        amount: calculatedTotalAmount,
      ),
    );

    return calculatedTotalAmount;
  }
}
