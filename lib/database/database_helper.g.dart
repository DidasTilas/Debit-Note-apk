// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_helper.dart';

// ignore_for_file: type=lint
class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: generateUuid,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 25,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passWordMeta = const VerificationMeta(
    'passWord',
  );
  @override
  late final GeneratedColumn<String> passWord = GeneratedColumn<String>(
    'pass_word',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 8,
      maxTextLength: 15,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    username,
    firstName,
    lastName,
    passWord,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('pass_word')) {
      context.handle(
        _passWordMeta,
        passWord.isAcceptableOrUnknown(data['pass_word']!, _passWordMeta),
      );
    } else if (isInserting) {
      context.missing(_passWordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      passWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pass_word'],
      )!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final String id;
  final String username;
  final String firstName;
  final String lastName;
  final String passWord;
  const UserData({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.passWord,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['username'] = Variable<String>(username);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['pass_word'] = Variable<String>(passWord);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      username: Value(username),
      firstName: Value(firstName),
      lastName: Value(lastName),
      passWord: Value(passWord),
    );
  }

  factory UserData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      passWord: serializer.fromJson<String>(json['passWord']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'passWord': serializer.toJson<String>(passWord),
    };
  }

  UserData copyWith({
    String? id,
    String? username,
    String? firstName,
    String? lastName,
    String? passWord,
  }) => UserData(
    id: id ?? this.id,
    username: username ?? this.username,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    passWord: passWord ?? this.passWord,
  );
  UserData copyWithCompanion(UserCompanion data) {
    return UserData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      passWord: data.passWord.present ? data.passWord.value : this.passWord,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('passWord: $passWord')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, firstName, lastName, passWord);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.username == this.username &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.passWord == this.passWord);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<String> id;
  final Value<String> username;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> passWord;
  final Value<int> rowid;
  const UserCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.passWord = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String firstName,
    required String lastName,
    required String passWord,
    this.rowid = const Value.absent(),
  }) : username = Value(username),
       firstName = Value(firstName),
       lastName = Value(lastName),
       passWord = Value(passWord);
  static Insertable<UserData> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? passWord,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (passWord != null) 'pass_word': passWord,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCompanion copyWith({
    Value<String>? id,
    Value<String>? username,
    Value<String>? firstName,
    Value<String>? lastName,
    Value<String>? passWord,
    Value<int>? rowid,
  }) {
    return UserCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      passWord: passWord ?? this.passWord,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (passWord.present) {
      map['pass_word'] = Variable<String>(passWord.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('passWord: $passWord, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BusinessTable extends Business
    with TableInfo<$BusinessTable, BusinessData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: generateUuid,
  );
  static const VerificationMeta _businessNameMeta = const VerificationMeta(
    'businessName',
  );
  @override
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
    'business_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 8,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, businessName, ownerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'business';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusinessData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_name')) {
      context.handle(
        _businessNameMeta,
        businessName.isAcceptableOrUnknown(
          data['business_name']!,
          _businessNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_businessNameMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  BusinessData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      businessName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_name'],
      )!,
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
    );
  }

  @override
  $BusinessTable createAlias(String alias) {
    return $BusinessTable(attachedDatabase, alias);
  }
}

class BusinessData extends DataClass implements Insertable<BusinessData> {
  final String id;
  final String businessName;
  final String ownerId;
  const BusinessData({
    required this.id,
    required this.businessName,
    required this.ownerId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['business_name'] = Variable<String>(businessName);
    map['owner_id'] = Variable<String>(ownerId);
    return map;
  }

  BusinessCompanion toCompanion(bool nullToAbsent) {
    return BusinessCompanion(
      id: Value(id),
      businessName: Value(businessName),
      ownerId: Value(ownerId),
    );
  }

  factory BusinessData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessData(
      id: serializer.fromJson<String>(json['id']),
      businessName: serializer.fromJson<String>(json['businessName']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'businessName': serializer.toJson<String>(businessName),
      'ownerId': serializer.toJson<String>(ownerId),
    };
  }

  BusinessData copyWith({String? id, String? businessName, String? ownerId}) =>
      BusinessData(
        id: id ?? this.id,
        businessName: businessName ?? this.businessName,
        ownerId: ownerId ?? this.ownerId,
      );
  BusinessData copyWithCompanion(BusinessCompanion data) {
    return BusinessData(
      id: data.id.present ? data.id.value : this.id,
      businessName: data.businessName.present
          ? data.businessName.value
          : this.businessName,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessData(')
          ..write('id: $id, ')
          ..write('businessName: $businessName, ')
          ..write('ownerId: $ownerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, businessName, ownerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessData &&
          other.id == this.id &&
          other.businessName == this.businessName &&
          other.ownerId == this.ownerId);
}

class BusinessCompanion extends UpdateCompanion<BusinessData> {
  final Value<String> id;
  final Value<String> businessName;
  final Value<String> ownerId;
  final Value<int> rowid;
  const BusinessCompanion({
    this.id = const Value.absent(),
    this.businessName = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BusinessCompanion.insert({
    this.id = const Value.absent(),
    required String businessName,
    required String ownerId,
    this.rowid = const Value.absent(),
  }) : businessName = Value(businessName),
       ownerId = Value(ownerId);
  static Insertable<BusinessData> custom({
    Expression<String>? id,
    Expression<String>? businessName,
    Expression<String>? ownerId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessName != null) 'business_name': businessName,
      if (ownerId != null) 'owner_id': ownerId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BusinessCompanion copyWith({
    Value<String>? id,
    Value<String>? businessName,
    Value<String>? ownerId,
    Value<int>? rowid,
  }) {
    return BusinessCompanion(
      id: id ?? this.id,
      businessName: businessName ?? this.businessName,
      ownerId: ownerId ?? this.ownerId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (businessName.present) {
      map['business_name'] = Variable<String>(businessName.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessCompanion(')
          ..write('id: $id, ')
          ..write('businessName: $businessName, ')
          ..write('ownerId: $ownerId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomerTable extends Customer
    with TableInfo<$CustomerTable, CustomerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: generateUuid,
  );
  static const VerificationMeta _customerNameMeta = const VerificationMeta(
    'customerName',
  );
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
    'customer_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessIdMeta = const VerificationMeta(
    'businessId',
  );
  @override
  late final GeneratedColumn<String> businessId = GeneratedColumn<String>(
    'business_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES business (id)',
    ),
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 10,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<int> phoneNumber = GeneratedColumn<int>(
    'phone_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customerName,
    businessId,
    location,
    phoneNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomerData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('customer_name')) {
      context.handle(
        _customerNameMeta,
        customerName.isAcceptableOrUnknown(
          data['customer_name']!,
          _customerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('business_id')) {
      context.handle(
        _businessIdMeta,
        businessId.isAcceptableOrUnknown(data['business_id']!, _businessIdMeta),
      );
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CustomerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      customerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_name'],
      )!,
      businessId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_id'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}phone_number'],
      )!,
    );
  }

  @override
  $CustomerTable createAlias(String alias) {
    return $CustomerTable(attachedDatabase, alias);
  }
}

class CustomerData extends DataClass implements Insertable<CustomerData> {
  final String id;
  final String customerName;
  final String businessId;
  final String location;
  final int phoneNumber;
  const CustomerData({
    required this.id,
    required this.customerName,
    required this.businessId,
    required this.location,
    required this.phoneNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['customer_name'] = Variable<String>(customerName);
    map['business_id'] = Variable<String>(businessId);
    map['location'] = Variable<String>(location);
    map['phone_number'] = Variable<int>(phoneNumber);
    return map;
  }

  CustomerCompanion toCompanion(bool nullToAbsent) {
    return CustomerCompanion(
      id: Value(id),
      customerName: Value(customerName),
      businessId: Value(businessId),
      location: Value(location),
      phoneNumber: Value(phoneNumber),
    );
  }

  factory CustomerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerData(
      id: serializer.fromJson<String>(json['id']),
      customerName: serializer.fromJson<String>(json['customerName']),
      businessId: serializer.fromJson<String>(json['businessId']),
      location: serializer.fromJson<String>(json['location']),
      phoneNumber: serializer.fromJson<int>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'customerName': serializer.toJson<String>(customerName),
      'businessId': serializer.toJson<String>(businessId),
      'location': serializer.toJson<String>(location),
      'phoneNumber': serializer.toJson<int>(phoneNumber),
    };
  }

  CustomerData copyWith({
    String? id,
    String? customerName,
    String? businessId,
    String? location,
    int? phoneNumber,
  }) => CustomerData(
    id: id ?? this.id,
    customerName: customerName ?? this.customerName,
    businessId: businessId ?? this.businessId,
    location: location ?? this.location,
    phoneNumber: phoneNumber ?? this.phoneNumber,
  );
  CustomerData copyWithCompanion(CustomerCompanion data) {
    return CustomerData(
      id: data.id.present ? data.id.value : this.id,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      businessId: data.businessId.present
          ? data.businessId.value
          : this.businessId,
      location: data.location.present ? data.location.value : this.location,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerData(')
          ..write('id: $id, ')
          ..write('customerName: $customerName, ')
          ..write('businessId: $businessId, ')
          ..write('location: $location, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, customerName, businessId, location, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerData &&
          other.id == this.id &&
          other.customerName == this.customerName &&
          other.businessId == this.businessId &&
          other.location == this.location &&
          other.phoneNumber == this.phoneNumber);
}

class CustomerCompanion extends UpdateCompanion<CustomerData> {
  final Value<String> id;
  final Value<String> customerName;
  final Value<String> businessId;
  final Value<String> location;
  final Value<int> phoneNumber;
  final Value<int> rowid;
  const CustomerCompanion({
    this.id = const Value.absent(),
    this.customerName = const Value.absent(),
    this.businessId = const Value.absent(),
    this.location = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomerCompanion.insert({
    this.id = const Value.absent(),
    required String customerName,
    required String businessId,
    required String location,
    required int phoneNumber,
    this.rowid = const Value.absent(),
  }) : customerName = Value(customerName),
       businessId = Value(businessId),
       location = Value(location),
       phoneNumber = Value(phoneNumber);
  static Insertable<CustomerData> custom({
    Expression<String>? id,
    Expression<String>? customerName,
    Expression<String>? businessId,
    Expression<String>? location,
    Expression<int>? phoneNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customerName != null) 'customer_name': customerName,
      if (businessId != null) 'business_id': businessId,
      if (location != null) 'location': location,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomerCompanion copyWith({
    Value<String>? id,
    Value<String>? customerName,
    Value<String>? businessId,
    Value<String>? location,
    Value<int>? phoneNumber,
    Value<int>? rowid,
  }) {
    return CustomerCompanion(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      businessId: businessId ?? this.businessId,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<String>(businessId.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<int>(phoneNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomerCompanion(')
          ..write('id: $id, ')
          ..write('customerName: $customerName, ')
          ..write('businessId: $businessId, ')
          ..write('location: $location, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductTable extends Product with TableInfo<$ProductTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: generateUuid,
  );
  static const VerificationMeta _productNameMeta = const VerificationMeta(
    'productName',
  );
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
    'product_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessIdMeta = const VerificationMeta(
    'businessId',
  );
  @override
  late final GeneratedColumn<String> businessId = GeneratedColumn<String>(
    'business_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES business (id)',
    ),
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<String> cost = GeneratedColumn<String>(
    'cost',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
    'price',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _arrivedMeta = const VerificationMeta(
    'arrived',
  );
  @override
  late final GeneratedColumn<String> arrived = GeneratedColumn<String>(
    'arrived',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _soldOutMeta = const VerificationMeta(
    'soldOut',
  );
  @override
  late final GeneratedColumn<String> soldOut = GeneratedColumn<String>(
    'sold_out',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateInMeta = const VerificationMeta('dateIn');
  @override
  late final GeneratedColumn<DateTime> dateIn = GeneratedColumn<DateTime>(
    'date_in',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unPaidMeta = const VerificationMeta('unPaid');
  @override
  late final GeneratedColumn<int> unPaid = GeneratedColumn<int>(
    'un_paid',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateOutMeta = const VerificationMeta(
    'dateOut',
  );
  @override
  late final GeneratedColumn<DateTime> dateOut = GeneratedColumn<DateTime>(
    'date_out',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    productName,
    businessId,
    unit,
    cost,
    price,
    arrived,
    soldOut,
    dateIn,
    unPaid,
    dateOut,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_name')) {
      context.handle(
        _productNameMeta,
        productName.isAcceptableOrUnknown(
          data['product_name']!,
          _productNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('business_id')) {
      context.handle(
        _businessIdMeta,
        businessId.isAcceptableOrUnknown(data['business_id']!, _businessIdMeta),
      );
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    } else if (isInserting) {
      context.missing(_costMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('arrived')) {
      context.handle(
        _arrivedMeta,
        arrived.isAcceptableOrUnknown(data['arrived']!, _arrivedMeta),
      );
    } else if (isInserting) {
      context.missing(_arrivedMeta);
    }
    if (data.containsKey('sold_out')) {
      context.handle(
        _soldOutMeta,
        soldOut.isAcceptableOrUnknown(data['sold_out']!, _soldOutMeta),
      );
    } else if (isInserting) {
      context.missing(_soldOutMeta);
    }
    if (data.containsKey('date_in')) {
      context.handle(
        _dateInMeta,
        dateIn.isAcceptableOrUnknown(data['date_in']!, _dateInMeta),
      );
    } else if (isInserting) {
      context.missing(_dateInMeta);
    }
    if (data.containsKey('un_paid')) {
      context.handle(
        _unPaidMeta,
        unPaid.isAcceptableOrUnknown(data['un_paid']!, _unPaidMeta),
      );
    } else if (isInserting) {
      context.missing(_unPaidMeta);
    }
    if (data.containsKey('date_out')) {
      context.handle(
        _dateOutMeta,
        dateOut.isAcceptableOrUnknown(data['date_out']!, _dateOutMeta),
      );
    } else if (isInserting) {
      context.missing(_dateOutMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      productName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name'],
      )!,
      businessId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_id'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cost'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}price'],
      )!,
      arrived: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}arrived'],
      )!,
      soldOut: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sold_out'],
      )!,
      dateIn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_in'],
      )!,
      unPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}un_paid'],
      )!,
      dateOut: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_out'],
      )!,
    );
  }

  @override
  $ProductTable createAlias(String alias) {
    return $ProductTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final String id;
  final String productName;
  final String businessId;
  final String unit;
  final String cost;
  final String price;
  final String arrived;
  final String soldOut;
  final DateTime dateIn;
  final int unPaid;
  final DateTime dateOut;
  const ProductData({
    required this.id,
    required this.productName,
    required this.businessId,
    required this.unit,
    required this.cost,
    required this.price,
    required this.arrived,
    required this.soldOut,
    required this.dateIn,
    required this.unPaid,
    required this.dateOut,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_name'] = Variable<String>(productName);
    map['business_id'] = Variable<String>(businessId);
    map['unit'] = Variable<String>(unit);
    map['cost'] = Variable<String>(cost);
    map['price'] = Variable<String>(price);
    map['arrived'] = Variable<String>(arrived);
    map['sold_out'] = Variable<String>(soldOut);
    map['date_in'] = Variable<DateTime>(dateIn);
    map['un_paid'] = Variable<int>(unPaid);
    map['date_out'] = Variable<DateTime>(dateOut);
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: Value(id),
      productName: Value(productName),
      businessId: Value(businessId),
      unit: Value(unit),
      cost: Value(cost),
      price: Value(price),
      arrived: Value(arrived),
      soldOut: Value(soldOut),
      dateIn: Value(dateIn),
      unPaid: Value(unPaid),
      dateOut: Value(dateOut),
    );
  }

  factory ProductData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<String>(json['id']),
      productName: serializer.fromJson<String>(json['productName']),
      businessId: serializer.fromJson<String>(json['businessId']),
      unit: serializer.fromJson<String>(json['unit']),
      cost: serializer.fromJson<String>(json['cost']),
      price: serializer.fromJson<String>(json['price']),
      arrived: serializer.fromJson<String>(json['arrived']),
      soldOut: serializer.fromJson<String>(json['soldOut']),
      dateIn: serializer.fromJson<DateTime>(json['dateIn']),
      unPaid: serializer.fromJson<int>(json['unPaid']),
      dateOut: serializer.fromJson<DateTime>(json['dateOut']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productName': serializer.toJson<String>(productName),
      'businessId': serializer.toJson<String>(businessId),
      'unit': serializer.toJson<String>(unit),
      'cost': serializer.toJson<String>(cost),
      'price': serializer.toJson<String>(price),
      'arrived': serializer.toJson<String>(arrived),
      'soldOut': serializer.toJson<String>(soldOut),
      'dateIn': serializer.toJson<DateTime>(dateIn),
      'unPaid': serializer.toJson<int>(unPaid),
      'dateOut': serializer.toJson<DateTime>(dateOut),
    };
  }

  ProductData copyWith({
    String? id,
    String? productName,
    String? businessId,
    String? unit,
    String? cost,
    String? price,
    String? arrived,
    String? soldOut,
    DateTime? dateIn,
    int? unPaid,
    DateTime? dateOut,
  }) => ProductData(
    id: id ?? this.id,
    productName: productName ?? this.productName,
    businessId: businessId ?? this.businessId,
    unit: unit ?? this.unit,
    cost: cost ?? this.cost,
    price: price ?? this.price,
    arrived: arrived ?? this.arrived,
    soldOut: soldOut ?? this.soldOut,
    dateIn: dateIn ?? this.dateIn,
    unPaid: unPaid ?? this.unPaid,
    dateOut: dateOut ?? this.dateOut,
  );
  ProductData copyWithCompanion(ProductCompanion data) {
    return ProductData(
      id: data.id.present ? data.id.value : this.id,
      productName: data.productName.present
          ? data.productName.value
          : this.productName,
      businessId: data.businessId.present
          ? data.businessId.value
          : this.businessId,
      unit: data.unit.present ? data.unit.value : this.unit,
      cost: data.cost.present ? data.cost.value : this.cost,
      price: data.price.present ? data.price.value : this.price,
      arrived: data.arrived.present ? data.arrived.value : this.arrived,
      soldOut: data.soldOut.present ? data.soldOut.value : this.soldOut,
      dateIn: data.dateIn.present ? data.dateIn.value : this.dateIn,
      unPaid: data.unPaid.present ? data.unPaid.value : this.unPaid,
      dateOut: data.dateOut.present ? data.dateOut.value : this.dateOut,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('id: $id, ')
          ..write('productName: $productName, ')
          ..write('businessId: $businessId, ')
          ..write('unit: $unit, ')
          ..write('cost: $cost, ')
          ..write('price: $price, ')
          ..write('arrived: $arrived, ')
          ..write('soldOut: $soldOut, ')
          ..write('dateIn: $dateIn, ')
          ..write('unPaid: $unPaid, ')
          ..write('dateOut: $dateOut')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    productName,
    businessId,
    unit,
    cost,
    price,
    arrived,
    soldOut,
    dateIn,
    unPaid,
    dateOut,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.productName == this.productName &&
          other.businessId == this.businessId &&
          other.unit == this.unit &&
          other.cost == this.cost &&
          other.price == this.price &&
          other.arrived == this.arrived &&
          other.soldOut == this.soldOut &&
          other.dateIn == this.dateIn &&
          other.unPaid == this.unPaid &&
          other.dateOut == this.dateOut);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<String> id;
  final Value<String> productName;
  final Value<String> businessId;
  final Value<String> unit;
  final Value<String> cost;
  final Value<String> price;
  final Value<String> arrived;
  final Value<String> soldOut;
  final Value<DateTime> dateIn;
  final Value<int> unPaid;
  final Value<DateTime> dateOut;
  final Value<int> rowid;
  const ProductCompanion({
    this.id = const Value.absent(),
    this.productName = const Value.absent(),
    this.businessId = const Value.absent(),
    this.unit = const Value.absent(),
    this.cost = const Value.absent(),
    this.price = const Value.absent(),
    this.arrived = const Value.absent(),
    this.soldOut = const Value.absent(),
    this.dateIn = const Value.absent(),
    this.unPaid = const Value.absent(),
    this.dateOut = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductCompanion.insert({
    this.id = const Value.absent(),
    required String productName,
    required String businessId,
    required String unit,
    required String cost,
    required String price,
    required String arrived,
    required String soldOut,
    required DateTime dateIn,
    required int unPaid,
    required DateTime dateOut,
    this.rowid = const Value.absent(),
  }) : productName = Value(productName),
       businessId = Value(businessId),
       unit = Value(unit),
       cost = Value(cost),
       price = Value(price),
       arrived = Value(arrived),
       soldOut = Value(soldOut),
       dateIn = Value(dateIn),
       unPaid = Value(unPaid),
       dateOut = Value(dateOut);
  static Insertable<ProductData> custom({
    Expression<String>? id,
    Expression<String>? productName,
    Expression<String>? businessId,
    Expression<String>? unit,
    Expression<String>? cost,
    Expression<String>? price,
    Expression<String>? arrived,
    Expression<String>? soldOut,
    Expression<DateTime>? dateIn,
    Expression<int>? unPaid,
    Expression<DateTime>? dateOut,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productName != null) 'product_name': productName,
      if (businessId != null) 'business_id': businessId,
      if (unit != null) 'unit': unit,
      if (cost != null) 'cost': cost,
      if (price != null) 'price': price,
      if (arrived != null) 'arrived': arrived,
      if (soldOut != null) 'sold_out': soldOut,
      if (dateIn != null) 'date_in': dateIn,
      if (unPaid != null) 'un_paid': unPaid,
      if (dateOut != null) 'date_out': dateOut,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductCompanion copyWith({
    Value<String>? id,
    Value<String>? productName,
    Value<String>? businessId,
    Value<String>? unit,
    Value<String>? cost,
    Value<String>? price,
    Value<String>? arrived,
    Value<String>? soldOut,
    Value<DateTime>? dateIn,
    Value<int>? unPaid,
    Value<DateTime>? dateOut,
    Value<int>? rowid,
  }) {
    return ProductCompanion(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      businessId: businessId ?? this.businessId,
      unit: unit ?? this.unit,
      cost: cost ?? this.cost,
      price: price ?? this.price,
      arrived: arrived ?? this.arrived,
      soldOut: soldOut ?? this.soldOut,
      dateIn: dateIn ?? this.dateIn,
      unPaid: unPaid ?? this.unPaid,
      dateOut: dateOut ?? this.dateOut,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<String>(businessId.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (cost.present) {
      map['cost'] = Variable<String>(cost.value);
    }
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    if (arrived.present) {
      map['arrived'] = Variable<String>(arrived.value);
    }
    if (soldOut.present) {
      map['sold_out'] = Variable<String>(soldOut.value);
    }
    if (dateIn.present) {
      map['date_in'] = Variable<DateTime>(dateIn.value);
    }
    if (unPaid.present) {
      map['un_paid'] = Variable<int>(unPaid.value);
    }
    if (dateOut.present) {
      map['date_out'] = Variable<DateTime>(dateOut.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('id: $id, ')
          ..write('productName: $productName, ')
          ..write('businessId: $businessId, ')
          ..write('unit: $unit, ')
          ..write('cost: $cost, ')
          ..write('price: $price, ')
          ..write('arrived: $arrived, ')
          ..write('soldOut: $soldOut, ')
          ..write('dateIn: $dateIn, ')
          ..write('unPaid: $unPaid, ')
          ..write('dateOut: $dateOut, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LedgerTable extends Ledger with TableInfo<$LedgerTable, LedgerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LedgerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: generateUuid,
  );
  static const VerificationMeta _businessIdMeta = const VerificationMeta(
    'businessId',
  );
  @override
  late final GeneratedColumn<String> businessId = GeneratedColumn<String>(
    'business_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES business (id)',
    ),
  );
  static const VerificationMeta _customerIdMeta = const VerificationMeta(
    'customerId',
  );
  @override
  late final GeneratedColumn<String> customerId = GeneratedColumn<String>(
    'customer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES customer (id)',
    ),
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES product (id)',
    ),
  );
  static const VerificationMeta _quantitySoldMeta = const VerificationMeta(
    'quantitySold',
  );
  @override
  late final GeneratedColumn<int> quantitySold = GeneratedColumn<int>(
    'quantity_sold',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityPaidMeta = const VerificationMeta(
    'quantityPaid',
  );
  @override
  late final GeneratedColumn<int> quantityPaid = GeneratedColumn<int>(
    'quantity_paid',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    businessId,
    customerId,
    productId,
    quantitySold,
    quantityPaid,
    amount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ledger';
  @override
  VerificationContext validateIntegrity(
    Insertable<LedgerData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_id')) {
      context.handle(
        _businessIdMeta,
        businessId.isAcceptableOrUnknown(data['business_id']!, _businessIdMeta),
      );
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('customer_id')) {
      context.handle(
        _customerIdMeta,
        customerId.isAcceptableOrUnknown(data['customer_id']!, _customerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_customerIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('quantity_sold')) {
      context.handle(
        _quantitySoldMeta,
        quantitySold.isAcceptableOrUnknown(
          data['quantity_sold']!,
          _quantitySoldMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantitySoldMeta);
    }
    if (data.containsKey('quantity_paid')) {
      context.handle(
        _quantityPaidMeta,
        quantityPaid.isAcceptableOrUnknown(
          data['quantity_paid']!,
          _quantityPaidMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantityPaidMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LedgerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LedgerData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      businessId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_id'],
      )!,
      customerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      quantitySold: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity_sold'],
      )!,
      quantityPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity_paid'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $LedgerTable createAlias(String alias) {
    return $LedgerTable(attachedDatabase, alias);
  }
}

class LedgerData extends DataClass implements Insertable<LedgerData> {
  final String id;
  final String businessId;
  final String customerId;
  final String productId;
  final int quantitySold;
  final int quantityPaid;
  final int amount;
  const LedgerData({
    required this.id,
    required this.businessId,
    required this.customerId,
    required this.productId,
    required this.quantitySold,
    required this.quantityPaid,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['business_id'] = Variable<String>(businessId);
    map['customer_id'] = Variable<String>(customerId);
    map['product_id'] = Variable<String>(productId);
    map['quantity_sold'] = Variable<int>(quantitySold);
    map['quantity_paid'] = Variable<int>(quantityPaid);
    map['amount'] = Variable<int>(amount);
    return map;
  }

  LedgerCompanion toCompanion(bool nullToAbsent) {
    return LedgerCompanion(
      id: Value(id),
      businessId: Value(businessId),
      customerId: Value(customerId),
      productId: Value(productId),
      quantitySold: Value(quantitySold),
      quantityPaid: Value(quantityPaid),
      amount: Value(amount),
    );
  }

  factory LedgerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LedgerData(
      id: serializer.fromJson<String>(json['id']),
      businessId: serializer.fromJson<String>(json['businessId']),
      customerId: serializer.fromJson<String>(json['customerId']),
      productId: serializer.fromJson<String>(json['productId']),
      quantitySold: serializer.fromJson<int>(json['quantitySold']),
      quantityPaid: serializer.fromJson<int>(json['quantityPaid']),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'businessId': serializer.toJson<String>(businessId),
      'customerId': serializer.toJson<String>(customerId),
      'productId': serializer.toJson<String>(productId),
      'quantitySold': serializer.toJson<int>(quantitySold),
      'quantityPaid': serializer.toJson<int>(quantityPaid),
      'amount': serializer.toJson<int>(amount),
    };
  }

  LedgerData copyWith({
    String? id,
    String? businessId,
    String? customerId,
    String? productId,
    int? quantitySold,
    int? quantityPaid,
    int? amount,
  }) => LedgerData(
    id: id ?? this.id,
    businessId: businessId ?? this.businessId,
    customerId: customerId ?? this.customerId,
    productId: productId ?? this.productId,
    quantitySold: quantitySold ?? this.quantitySold,
    quantityPaid: quantityPaid ?? this.quantityPaid,
    amount: amount ?? this.amount,
  );
  LedgerData copyWithCompanion(LedgerCompanion data) {
    return LedgerData(
      id: data.id.present ? data.id.value : this.id,
      businessId: data.businessId.present
          ? data.businessId.value
          : this.businessId,
      customerId: data.customerId.present
          ? data.customerId.value
          : this.customerId,
      productId: data.productId.present ? data.productId.value : this.productId,
      quantitySold: data.quantitySold.present
          ? data.quantitySold.value
          : this.quantitySold,
      quantityPaid: data.quantityPaid.present
          ? data.quantityPaid.value
          : this.quantityPaid,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LedgerData(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('customerId: $customerId, ')
          ..write('productId: $productId, ')
          ..write('quantitySold: $quantitySold, ')
          ..write('quantityPaid: $quantityPaid, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    businessId,
    customerId,
    productId,
    quantitySold,
    quantityPaid,
    amount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LedgerData &&
          other.id == this.id &&
          other.businessId == this.businessId &&
          other.customerId == this.customerId &&
          other.productId == this.productId &&
          other.quantitySold == this.quantitySold &&
          other.quantityPaid == this.quantityPaid &&
          other.amount == this.amount);
}

class LedgerCompanion extends UpdateCompanion<LedgerData> {
  final Value<String> id;
  final Value<String> businessId;
  final Value<String> customerId;
  final Value<String> productId;
  final Value<int> quantitySold;
  final Value<int> quantityPaid;
  final Value<int> amount;
  final Value<int> rowid;
  const LedgerCompanion({
    this.id = const Value.absent(),
    this.businessId = const Value.absent(),
    this.customerId = const Value.absent(),
    this.productId = const Value.absent(),
    this.quantitySold = const Value.absent(),
    this.quantityPaid = const Value.absent(),
    this.amount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LedgerCompanion.insert({
    this.id = const Value.absent(),
    required String businessId,
    required String customerId,
    required String productId,
    required int quantitySold,
    required int quantityPaid,
    required int amount,
    this.rowid = const Value.absent(),
  }) : businessId = Value(businessId),
       customerId = Value(customerId),
       productId = Value(productId),
       quantitySold = Value(quantitySold),
       quantityPaid = Value(quantityPaid),
       amount = Value(amount);
  static Insertable<LedgerData> custom({
    Expression<String>? id,
    Expression<String>? businessId,
    Expression<String>? customerId,
    Expression<String>? productId,
    Expression<int>? quantitySold,
    Expression<int>? quantityPaid,
    Expression<int>? amount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessId != null) 'business_id': businessId,
      if (customerId != null) 'customer_id': customerId,
      if (productId != null) 'product_id': productId,
      if (quantitySold != null) 'quantity_sold': quantitySold,
      if (quantityPaid != null) 'quantity_paid': quantityPaid,
      if (amount != null) 'amount': amount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LedgerCompanion copyWith({
    Value<String>? id,
    Value<String>? businessId,
    Value<String>? customerId,
    Value<String>? productId,
    Value<int>? quantitySold,
    Value<int>? quantityPaid,
    Value<int>? amount,
    Value<int>? rowid,
  }) {
    return LedgerCompanion(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      customerId: customerId ?? this.customerId,
      productId: productId ?? this.productId,
      quantitySold: quantitySold ?? this.quantitySold,
      quantityPaid: quantityPaid ?? this.quantityPaid,
      amount: amount ?? this.amount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<String>(businessId.value);
    }
    if (customerId.present) {
      map['customer_id'] = Variable<String>(customerId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (quantitySold.present) {
      map['quantity_sold'] = Variable<int>(quantitySold.value);
    }
    if (quantityPaid.present) {
      map['quantity_paid'] = Variable<int>(quantityPaid.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LedgerCompanion(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('customerId: $customerId, ')
          ..write('productId: $productId, ')
          ..write('quantitySold: $quantitySold, ')
          ..write('quantityPaid: $quantityPaid, ')
          ..write('amount: $amount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExpenseTable extends Expense with TableInfo<$ExpenseTable, ExpenseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: generateUuid,
  );
  static const VerificationMeta _businessIdMeta = const VerificationMeta(
    'businessId',
  );
  @override
  late final GeneratedColumn<String> businessId = GeneratedColumn<String>(
    'business_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES business (id)',
    ),
  );
  static const VerificationMeta _expenseNameMeta = const VerificationMeta(
    'expenseName',
  );
  @override
  late final GeneratedColumn<String> expenseName = GeneratedColumn<String>(
    'expense_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expenseAmountMeta = const VerificationMeta(
    'expenseAmount',
  );
  @override
  late final GeneratedColumn<int> expenseAmount = GeneratedColumn<int>(
    'expense_amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    businessId,
    expenseName,
    expenseAmount,
    date,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExpenseData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_id')) {
      context.handle(
        _businessIdMeta,
        businessId.isAcceptableOrUnknown(data['business_id']!, _businessIdMeta),
      );
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('expense_name')) {
      context.handle(
        _expenseNameMeta,
        expenseName.isAcceptableOrUnknown(
          data['expense_name']!,
          _expenseNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expenseNameMeta);
    }
    if (data.containsKey('expense_amount')) {
      context.handle(
        _expenseAmountMeta,
        expenseAmount.isAcceptableOrUnknown(
          data['expense_amount']!,
          _expenseAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_expenseAmountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ExpenseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      businessId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_id'],
      )!,
      expenseName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expense_name'],
      )!,
      expenseAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}expense_amount'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $ExpenseTable createAlias(String alias) {
    return $ExpenseTable(attachedDatabase, alias);
  }
}

class ExpenseData extends DataClass implements Insertable<ExpenseData> {
  final String id;
  final String businessId;
  final String expenseName;
  final int expenseAmount;
  final DateTime date;
  const ExpenseData({
    required this.id,
    required this.businessId,
    required this.expenseName,
    required this.expenseAmount,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['business_id'] = Variable<String>(businessId);
    map['expense_name'] = Variable<String>(expenseName);
    map['expense_amount'] = Variable<int>(expenseAmount);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  ExpenseCompanion toCompanion(bool nullToAbsent) {
    return ExpenseCompanion(
      id: Value(id),
      businessId: Value(businessId),
      expenseName: Value(expenseName),
      expenseAmount: Value(expenseAmount),
      date: Value(date),
    );
  }

  factory ExpenseData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseData(
      id: serializer.fromJson<String>(json['id']),
      businessId: serializer.fromJson<String>(json['businessId']),
      expenseName: serializer.fromJson<String>(json['expenseName']),
      expenseAmount: serializer.fromJson<int>(json['expenseAmount']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'businessId': serializer.toJson<String>(businessId),
      'expenseName': serializer.toJson<String>(expenseName),
      'expenseAmount': serializer.toJson<int>(expenseAmount),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  ExpenseData copyWith({
    String? id,
    String? businessId,
    String? expenseName,
    int? expenseAmount,
    DateTime? date,
  }) => ExpenseData(
    id: id ?? this.id,
    businessId: businessId ?? this.businessId,
    expenseName: expenseName ?? this.expenseName,
    expenseAmount: expenseAmount ?? this.expenseAmount,
    date: date ?? this.date,
  );
  ExpenseData copyWithCompanion(ExpenseCompanion data) {
    return ExpenseData(
      id: data.id.present ? data.id.value : this.id,
      businessId: data.businessId.present
          ? data.businessId.value
          : this.businessId,
      expenseName: data.expenseName.present
          ? data.expenseName.value
          : this.expenseName,
      expenseAmount: data.expenseAmount.present
          ? data.expenseAmount.value
          : this.expenseAmount,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseData(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('expenseName: $expenseName, ')
          ..write('expenseAmount: $expenseAmount, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, businessId, expenseName, expenseAmount, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseData &&
          other.id == this.id &&
          other.businessId == this.businessId &&
          other.expenseName == this.expenseName &&
          other.expenseAmount == this.expenseAmount &&
          other.date == this.date);
}

class ExpenseCompanion extends UpdateCompanion<ExpenseData> {
  final Value<String> id;
  final Value<String> businessId;
  final Value<String> expenseName;
  final Value<int> expenseAmount;
  final Value<DateTime> date;
  final Value<int> rowid;
  const ExpenseCompanion({
    this.id = const Value.absent(),
    this.businessId = const Value.absent(),
    this.expenseName = const Value.absent(),
    this.expenseAmount = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExpenseCompanion.insert({
    this.id = const Value.absent(),
    required String businessId,
    required String expenseName,
    required int expenseAmount,
    required DateTime date,
    this.rowid = const Value.absent(),
  }) : businessId = Value(businessId),
       expenseName = Value(expenseName),
       expenseAmount = Value(expenseAmount),
       date = Value(date);
  static Insertable<ExpenseData> custom({
    Expression<String>? id,
    Expression<String>? businessId,
    Expression<String>? expenseName,
    Expression<int>? expenseAmount,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessId != null) 'business_id': businessId,
      if (expenseName != null) 'expense_name': expenseName,
      if (expenseAmount != null) 'expense_amount': expenseAmount,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExpenseCompanion copyWith({
    Value<String>? id,
    Value<String>? businessId,
    Value<String>? expenseName,
    Value<int>? expenseAmount,
    Value<DateTime>? date,
    Value<int>? rowid,
  }) {
    return ExpenseCompanion(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      expenseName: expenseName ?? this.expenseName,
      expenseAmount: expenseAmount ?? this.expenseAmount,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<String>(businessId.value);
    }
    if (expenseName.present) {
      map['expense_name'] = Variable<String>(expenseName.value);
    }
    if (expenseAmount.present) {
      map['expense_amount'] = Variable<int>(expenseAmount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCompanion(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('expenseName: $expenseName, ')
          ..write('expenseAmount: $expenseAmount, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTable user = $UserTable(this);
  late final $BusinessTable business = $BusinessTable(this);
  late final $CustomerTable customer = $CustomerTable(this);
  late final $ProductTable product = $ProductTable(this);
  late final $LedgerTable ledger = $LedgerTable(this);
  late final $ExpenseTable expense = $ExpenseTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    user,
    business,
    customer,
    product,
    ledger,
    expense,
  ];
}

typedef $$UserTableCreateCompanionBuilder =
    UserCompanion Function({
      Value<String> id,
      required String username,
      required String firstName,
      required String lastName,
      required String passWord,
      Value<int> rowid,
    });
typedef $$UserTableUpdateCompanionBuilder =
    UserCompanion Function({
      Value<String> id,
      Value<String> username,
      Value<String> firstName,
      Value<String> lastName,
      Value<String> passWord,
      Value<int> rowid,
    });

final class $$UserTableReferences
    extends BaseReferences<_$AppDatabase, $UserTable, UserData> {
  $$UserTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BusinessTable, List<BusinessData>>
  _businessRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.business,
    aliasName: 'user__id__business__owner_id',
  );

  $$BusinessTableProcessedTableManager get businessRefs {
    final manager = $$BusinessTableTableManager(
      $_db,
      $_db.business,
    ).filter((f) => f.ownerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_businessRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserTableFilterComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passWord => $composableBuilder(
    column: $table.passWord,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> businessRefs(
    Expression<bool> Function($$BusinessTableFilterComposer f) f,
  ) {
    final $$BusinessTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.ownerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableFilterComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableOrderingComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passWord => $composableBuilder(
    column: $table.passWord,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get passWord =>
      $composableBuilder(column: $table.passWord, builder: (column) => column);

  Expression<T> businessRefs<T extends Object>(
    Expression<T> Function($$BusinessTableAnnotationComposer a) f,
  ) {
    final $$BusinessTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.ownerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableAnnotationComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserTable,
          UserData,
          $$UserTableFilterComposer,
          $$UserTableOrderingComposer,
          $$UserTableAnnotationComposer,
          $$UserTableCreateCompanionBuilder,
          $$UserTableUpdateCompanionBuilder,
          (UserData, $$UserTableReferences),
          UserData,
          PrefetchHooks Function({bool businessRefs})
        > {
  $$UserTableTableManager(_$AppDatabase db, $UserTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String> passWord = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion(
                id: id,
                username: username,
                firstName: firstName,
                lastName: lastName,
                passWord: passWord,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String username,
                required String firstName,
                required String lastName,
                required String passWord,
                Value<int> rowid = const Value.absent(),
              }) => UserCompanion.insert(
                id: id,
                username: username,
                firstName: firstName,
                lastName: lastName,
                passWord: passWord,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UserTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({businessRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (businessRefs) db.business],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (businessRefs)
                    await $_getPrefetchedData<
                      UserData,
                      $UserTable,
                      BusinessData
                    >(
                      currentTable: table,
                      referencedTable: $$UserTableReferences._businessRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$UserTableReferences(db, table, p0).businessRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.ownerId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UserTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserTable,
      UserData,
      $$UserTableFilterComposer,
      $$UserTableOrderingComposer,
      $$UserTableAnnotationComposer,
      $$UserTableCreateCompanionBuilder,
      $$UserTableUpdateCompanionBuilder,
      (UserData, $$UserTableReferences),
      UserData,
      PrefetchHooks Function({bool businessRefs})
    >;
typedef $$BusinessTableCreateCompanionBuilder =
    BusinessCompanion Function({
      Value<String> id,
      required String businessName,
      required String ownerId,
      Value<int> rowid,
    });
typedef $$BusinessTableUpdateCompanionBuilder =
    BusinessCompanion Function({
      Value<String> id,
      Value<String> businessName,
      Value<String> ownerId,
      Value<int> rowid,
    });

final class $$BusinessTableReferences
    extends BaseReferences<_$AppDatabase, $BusinessTable, BusinessData> {
  $$BusinessTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTable _ownerIdTable(_$AppDatabase db) =>
      db.user.createAlias('business__owner_id__user__id');

  $$UserTableProcessedTableManager get ownerId {
    final $_column = $_itemColumn<String>('owner_id')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ownerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CustomerTable, List<CustomerData>>
  _customerRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.customer,
    aliasName: 'business__id__customer__business_id',
  );

  $$CustomerTableProcessedTableManager get customerRefs {
    final manager = $$CustomerTableTableManager(
      $_db,
      $_db.customer,
    ).filter((f) => f.businessId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_customerRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProductTable, List<ProductData>>
  _productRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.product,
    aliasName: 'business__id__product__business_id',
  );

  $$ProductTableProcessedTableManager get productRefs {
    final manager = $$ProductTableTableManager(
      $_db,
      $_db.product,
    ).filter((f) => f.businessId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LedgerTable, List<LedgerData>> _ledgerRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ledger,
    aliasName: 'business__id__ledger__business_id',
  );

  $$LedgerTableProcessedTableManager get ledgerRefs {
    final manager = $$LedgerTableTableManager(
      $_db,
      $_db.ledger,
    ).filter((f) => f.businessId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_ledgerRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExpenseTable, List<ExpenseData>>
  _expenseRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.expense,
    aliasName: 'business__id__expense__business_id',
  );

  $$ExpenseTableProcessedTableManager get expenseRefs {
    final manager = $$ExpenseTableTableManager(
      $_db,
      $_db.expense,
    ).filter((f) => f.businessId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_expenseRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BusinessTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessTable> {
  $$BusinessTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnFilters(column),
  );

  $$UserTableFilterComposer get ownerId {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> customerRefs(
    Expression<bool> Function($$CustomerTableFilterComposer f) f,
  ) {
    final $$CustomerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customer,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableFilterComposer(
            $db: $db,
            $table: $db.customer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productRefs(
    Expression<bool> Function($$ProductTableFilterComposer f) f,
  ) {
    final $$ProductTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableFilterComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ledgerRefs(
    Expression<bool> Function($$LedgerTableFilterComposer f) f,
  ) {
    final $$LedgerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableFilterComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> expenseRefs(
    Expression<bool> Function($$ExpenseTableFilterComposer f) f,
  ) {
    final $$ExpenseTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expense,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpenseTableFilterComposer(
            $db: $db,
            $table: $db.expense,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BusinessTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessTable> {
  $$BusinessTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserTableOrderingComposer get ownerId {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusinessTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessTable> {
  $$BusinessTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => column,
  );

  $$UserTableAnnotationComposer get ownerId {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ownerId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> customerRefs<T extends Object>(
    Expression<T> Function($$CustomerTableAnnotationComposer a) f,
  ) {
    final $$CustomerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customer,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableAnnotationComposer(
            $db: $db,
            $table: $db.customer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> productRefs<T extends Object>(
    Expression<T> Function($$ProductTableAnnotationComposer a) f,
  ) {
    final $$ProductTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableAnnotationComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ledgerRefs<T extends Object>(
    Expression<T> Function($$LedgerTableAnnotationComposer a) f,
  ) {
    final $$LedgerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableAnnotationComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> expenseRefs<T extends Object>(
    Expression<T> Function($$ExpenseTableAnnotationComposer a) f,
  ) {
    final $$ExpenseTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.expense,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExpenseTableAnnotationComposer(
            $db: $db,
            $table: $db.expense,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BusinessTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessTable,
          BusinessData,
          $$BusinessTableFilterComposer,
          $$BusinessTableOrderingComposer,
          $$BusinessTableAnnotationComposer,
          $$BusinessTableCreateCompanionBuilder,
          $$BusinessTableUpdateCompanionBuilder,
          (BusinessData, $$BusinessTableReferences),
          BusinessData,
          PrefetchHooks Function({
            bool ownerId,
            bool customerRefs,
            bool productRefs,
            bool ledgerRefs,
            bool expenseRefs,
          })
        > {
  $$BusinessTableTableManager(_$AppDatabase db, $BusinessTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusinessCompanion(
                id: id,
                businessName: businessName,
                ownerId: ownerId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String businessName,
                required String ownerId,
                Value<int> rowid = const Value.absent(),
              }) => BusinessCompanion.insert(
                id: id,
                businessName: businessName,
                ownerId: ownerId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BusinessTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                ownerId = false,
                customerRefs = false,
                productRefs = false,
                ledgerRefs = false,
                expenseRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (customerRefs) db.customer,
                    if (productRefs) db.product,
                    if (ledgerRefs) db.ledger,
                    if (expenseRefs) db.expense,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (ownerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ownerId,
                                    referencedTable: $$BusinessTableReferences
                                        ._ownerIdTable(db),
                                    referencedColumn: $$BusinessTableReferences
                                        ._ownerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (customerRefs)
                        await $_getPrefetchedData<
                          BusinessData,
                          $BusinessTable,
                          CustomerData
                        >(
                          currentTable: table,
                          referencedTable: $$BusinessTableReferences
                              ._customerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BusinessTableReferences(
                                db,
                                table,
                                p0,
                              ).customerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.businessId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (productRefs)
                        await $_getPrefetchedData<
                          BusinessData,
                          $BusinessTable,
                          ProductData
                        >(
                          currentTable: table,
                          referencedTable: $$BusinessTableReferences
                              ._productRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BusinessTableReferences(
                                db,
                                table,
                                p0,
                              ).productRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.businessId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ledgerRefs)
                        await $_getPrefetchedData<
                          BusinessData,
                          $BusinessTable,
                          LedgerData
                        >(
                          currentTable: table,
                          referencedTable: $$BusinessTableReferences
                              ._ledgerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BusinessTableReferences(
                                db,
                                table,
                                p0,
                              ).ledgerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.businessId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (expenseRefs)
                        await $_getPrefetchedData<
                          BusinessData,
                          $BusinessTable,
                          ExpenseData
                        >(
                          currentTable: table,
                          referencedTable: $$BusinessTableReferences
                              ._expenseRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BusinessTableReferences(
                                db,
                                table,
                                p0,
                              ).expenseRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.businessId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BusinessTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessTable,
      BusinessData,
      $$BusinessTableFilterComposer,
      $$BusinessTableOrderingComposer,
      $$BusinessTableAnnotationComposer,
      $$BusinessTableCreateCompanionBuilder,
      $$BusinessTableUpdateCompanionBuilder,
      (BusinessData, $$BusinessTableReferences),
      BusinessData,
      PrefetchHooks Function({
        bool ownerId,
        bool customerRefs,
        bool productRefs,
        bool ledgerRefs,
        bool expenseRefs,
      })
    >;
typedef $$CustomerTableCreateCompanionBuilder =
    CustomerCompanion Function({
      Value<String> id,
      required String customerName,
      required String businessId,
      required String location,
      required int phoneNumber,
      Value<int> rowid,
    });
typedef $$CustomerTableUpdateCompanionBuilder =
    CustomerCompanion Function({
      Value<String> id,
      Value<String> customerName,
      Value<String> businessId,
      Value<String> location,
      Value<int> phoneNumber,
      Value<int> rowid,
    });

final class $$CustomerTableReferences
    extends BaseReferences<_$AppDatabase, $CustomerTable, CustomerData> {
  $$CustomerTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BusinessTable _businessIdTable(_$AppDatabase db) =>
      db.business.createAlias('customer__business_id__business__id');

  $$BusinessTableProcessedTableManager get businessId {
    final $_column = $_itemColumn<String>('business_id')!;

    final manager = $$BusinessTableTableManager(
      $_db,
      $_db.business,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_businessIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LedgerTable, List<LedgerData>> _ledgerRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ledger,
    aliasName: 'customer__id__ledger__customer_id',
  );

  $$LedgerTableProcessedTableManager get ledgerRefs {
    final manager = $$LedgerTableTableManager(
      $_db,
      $_db.ledger,
    ).filter((f) => f.customerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_ledgerRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CustomerTableFilterComposer
    extends Composer<_$AppDatabase, $CustomerTable> {
  $$CustomerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnFilters(column),
  );

  $$BusinessTableFilterComposer get businessId {
    final $$BusinessTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableFilterComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> ledgerRefs(
    Expression<bool> Function($$LedgerTableFilterComposer f) f,
  ) {
    final $$LedgerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableFilterComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomerTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomerTable> {
  $$CustomerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => ColumnOrderings(column),
  );

  $$BusinessTableOrderingComposer get businessId {
    final $$BusinessTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableOrderingComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomerTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomerTable> {
  $$CustomerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<int> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  $$BusinessTableAnnotationComposer get businessId {
    final $$BusinessTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableAnnotationComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> ledgerRefs<T extends Object>(
    Expression<T> Function($$LedgerTableAnnotationComposer a) f,
  ) {
    final $$LedgerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.customerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableAnnotationComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomerTable,
          CustomerData,
          $$CustomerTableFilterComposer,
          $$CustomerTableOrderingComposer,
          $$CustomerTableAnnotationComposer,
          $$CustomerTableCreateCompanionBuilder,
          $$CustomerTableUpdateCompanionBuilder,
          (CustomerData, $$CustomerTableReferences),
          CustomerData,
          PrefetchHooks Function({bool businessId, bool ledgerRefs})
        > {
  $$CustomerTableTableManager(_$AppDatabase db, $CustomerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> customerName = const Value.absent(),
                Value<String> businessId = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<int> phoneNumber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CustomerCompanion(
                id: id,
                customerName: customerName,
                businessId: businessId,
                location: location,
                phoneNumber: phoneNumber,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String customerName,
                required String businessId,
                required String location,
                required int phoneNumber,
                Value<int> rowid = const Value.absent(),
              }) => CustomerCompanion.insert(
                id: id,
                customerName: customerName,
                businessId: businessId,
                location: location,
                phoneNumber: phoneNumber,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CustomerTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({businessId = false, ledgerRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (ledgerRefs) db.ledger],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (businessId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.businessId,
                                referencedTable: $$CustomerTableReferences
                                    ._businessIdTable(db),
                                referencedColumn: $$CustomerTableReferences
                                    ._businessIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (ledgerRefs)
                    await $_getPrefetchedData<
                      CustomerData,
                      $CustomerTable,
                      LedgerData
                    >(
                      currentTable: table,
                      referencedTable: $$CustomerTableReferences
                          ._ledgerRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CustomerTableReferences(db, table, p0).ledgerRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.customerId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CustomerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomerTable,
      CustomerData,
      $$CustomerTableFilterComposer,
      $$CustomerTableOrderingComposer,
      $$CustomerTableAnnotationComposer,
      $$CustomerTableCreateCompanionBuilder,
      $$CustomerTableUpdateCompanionBuilder,
      (CustomerData, $$CustomerTableReferences),
      CustomerData,
      PrefetchHooks Function({bool businessId, bool ledgerRefs})
    >;
typedef $$ProductTableCreateCompanionBuilder =
    ProductCompanion Function({
      Value<String> id,
      required String productName,
      required String businessId,
      required String unit,
      required String cost,
      required String price,
      required String arrived,
      required String soldOut,
      required DateTime dateIn,
      required int unPaid,
      required DateTime dateOut,
      Value<int> rowid,
    });
typedef $$ProductTableUpdateCompanionBuilder =
    ProductCompanion Function({
      Value<String> id,
      Value<String> productName,
      Value<String> businessId,
      Value<String> unit,
      Value<String> cost,
      Value<String> price,
      Value<String> arrived,
      Value<String> soldOut,
      Value<DateTime> dateIn,
      Value<int> unPaid,
      Value<DateTime> dateOut,
      Value<int> rowid,
    });

final class $$ProductTableReferences
    extends BaseReferences<_$AppDatabase, $ProductTable, ProductData> {
  $$ProductTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BusinessTable _businessIdTable(_$AppDatabase db) =>
      db.business.createAlias('product__business_id__business__id');

  $$BusinessTableProcessedTableManager get businessId {
    final $_column = $_itemColumn<String>('business_id')!;

    final manager = $$BusinessTableTableManager(
      $_db,
      $_db.business,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_businessIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LedgerTable, List<LedgerData>> _ledgerRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.ledger,
    aliasName: 'product__id__ledger__product_id',
  );

  $$LedgerTableProcessedTableManager get ledgerRefs {
    final manager = $$LedgerTableTableManager(
      $_db,
      $_db.ledger,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_ledgerRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProductTableFilterComposer
    extends Composer<_$AppDatabase, $ProductTable> {
  $$ProductTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get arrived => $composableBuilder(
    column: $table.arrived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get soldOut => $composableBuilder(
    column: $table.soldOut,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateIn => $composableBuilder(
    column: $table.dateIn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unPaid => $composableBuilder(
    column: $table.unPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOut => $composableBuilder(
    column: $table.dateOut,
    builder: (column) => ColumnFilters(column),
  );

  $$BusinessTableFilterComposer get businessId {
    final $$BusinessTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableFilterComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> ledgerRefs(
    Expression<bool> Function($$LedgerTableFilterComposer f) f,
  ) {
    final $$LedgerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableFilterComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductTable> {
  $$ProductTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get arrived => $composableBuilder(
    column: $table.arrived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get soldOut => $composableBuilder(
    column: $table.soldOut,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateIn => $composableBuilder(
    column: $table.dateIn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unPaid => $composableBuilder(
    column: $table.unPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOut => $composableBuilder(
    column: $table.dateOut,
    builder: (column) => ColumnOrderings(column),
  );

  $$BusinessTableOrderingComposer get businessId {
    final $$BusinessTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableOrderingComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductTable> {
  $$ProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get arrived =>
      $composableBuilder(column: $table.arrived, builder: (column) => column);

  GeneratedColumn<String> get soldOut =>
      $composableBuilder(column: $table.soldOut, builder: (column) => column);

  GeneratedColumn<DateTime> get dateIn =>
      $composableBuilder(column: $table.dateIn, builder: (column) => column);

  GeneratedColumn<int> get unPaid =>
      $composableBuilder(column: $table.unPaid, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOut =>
      $composableBuilder(column: $table.dateOut, builder: (column) => column);

  $$BusinessTableAnnotationComposer get businessId {
    final $$BusinessTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableAnnotationComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> ledgerRefs<T extends Object>(
    Expression<T> Function($$LedgerTableAnnotationComposer a) f,
  ) {
    final $$LedgerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ledger,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LedgerTableAnnotationComposer(
            $db: $db,
            $table: $db.ledger,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProductTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductTable,
          ProductData,
          $$ProductTableFilterComposer,
          $$ProductTableOrderingComposer,
          $$ProductTableAnnotationComposer,
          $$ProductTableCreateCompanionBuilder,
          $$ProductTableUpdateCompanionBuilder,
          (ProductData, $$ProductTableReferences),
          ProductData,
          PrefetchHooks Function({bool businessId, bool ledgerRefs})
        > {
  $$ProductTableTableManager(_$AppDatabase db, $ProductTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> productName = const Value.absent(),
                Value<String> businessId = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String> cost = const Value.absent(),
                Value<String> price = const Value.absent(),
                Value<String> arrived = const Value.absent(),
                Value<String> soldOut = const Value.absent(),
                Value<DateTime> dateIn = const Value.absent(),
                Value<int> unPaid = const Value.absent(),
                Value<DateTime> dateOut = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductCompanion(
                id: id,
                productName: productName,
                businessId: businessId,
                unit: unit,
                cost: cost,
                price: price,
                arrived: arrived,
                soldOut: soldOut,
                dateIn: dateIn,
                unPaid: unPaid,
                dateOut: dateOut,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String productName,
                required String businessId,
                required String unit,
                required String cost,
                required String price,
                required String arrived,
                required String soldOut,
                required DateTime dateIn,
                required int unPaid,
                required DateTime dateOut,
                Value<int> rowid = const Value.absent(),
              }) => ProductCompanion.insert(
                id: id,
                productName: productName,
                businessId: businessId,
                unit: unit,
                cost: cost,
                price: price,
                arrived: arrived,
                soldOut: soldOut,
                dateIn: dateIn,
                unPaid: unPaid,
                dateOut: dateOut,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({businessId = false, ledgerRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (ledgerRefs) db.ledger],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (businessId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.businessId,
                                referencedTable: $$ProductTableReferences
                                    ._businessIdTable(db),
                                referencedColumn: $$ProductTableReferences
                                    ._businessIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (ledgerRefs)
                    await $_getPrefetchedData<
                      ProductData,
                      $ProductTable,
                      LedgerData
                    >(
                      currentTable: table,
                      referencedTable: $$ProductTableReferences
                          ._ledgerRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProductTableReferences(db, table, p0).ledgerRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.productId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProductTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductTable,
      ProductData,
      $$ProductTableFilterComposer,
      $$ProductTableOrderingComposer,
      $$ProductTableAnnotationComposer,
      $$ProductTableCreateCompanionBuilder,
      $$ProductTableUpdateCompanionBuilder,
      (ProductData, $$ProductTableReferences),
      ProductData,
      PrefetchHooks Function({bool businessId, bool ledgerRefs})
    >;
typedef $$LedgerTableCreateCompanionBuilder =
    LedgerCompanion Function({
      Value<String> id,
      required String businessId,
      required String customerId,
      required String productId,
      required int quantitySold,
      required int quantityPaid,
      required int amount,
      Value<int> rowid,
    });
typedef $$LedgerTableUpdateCompanionBuilder =
    LedgerCompanion Function({
      Value<String> id,
      Value<String> businessId,
      Value<String> customerId,
      Value<String> productId,
      Value<int> quantitySold,
      Value<int> quantityPaid,
      Value<int> amount,
      Value<int> rowid,
    });

final class $$LedgerTableReferences
    extends BaseReferences<_$AppDatabase, $LedgerTable, LedgerData> {
  $$LedgerTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BusinessTable _businessIdTable(_$AppDatabase db) =>
      db.business.createAlias('ledger__business_id__business__id');

  $$BusinessTableProcessedTableManager get businessId {
    final $_column = $_itemColumn<String>('business_id')!;

    final manager = $$BusinessTableTableManager(
      $_db,
      $_db.business,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_businessIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CustomerTable _customerIdTable(_$AppDatabase db) =>
      db.customer.createAlias('ledger__customer_id__customer__id');

  $$CustomerTableProcessedTableManager get customerId {
    final $_column = $_itemColumn<String>('customer_id')!;

    final manager = $$CustomerTableTableManager(
      $_db,
      $_db.customer,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductTable _productIdTable(_$AppDatabase db) =>
      db.product.createAlias('ledger__product_id__product__id');

  $$ProductTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductTableTableManager(
      $_db,
      $_db.product,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LedgerTableFilterComposer
    extends Composer<_$AppDatabase, $LedgerTable> {
  $$LedgerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantitySold => $composableBuilder(
    column: $table.quantitySold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantityPaid => $composableBuilder(
    column: $table.quantityPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$BusinessTableFilterComposer get businessId {
    final $$BusinessTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableFilterComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CustomerTableFilterComposer get customerId {
    final $$CustomerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableFilterComposer(
            $db: $db,
            $table: $db.customer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductTableFilterComposer get productId {
    final $$ProductTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableFilterComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LedgerTableOrderingComposer
    extends Composer<_$AppDatabase, $LedgerTable> {
  $$LedgerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantitySold => $composableBuilder(
    column: $table.quantitySold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantityPaid => $composableBuilder(
    column: $table.quantityPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$BusinessTableOrderingComposer get businessId {
    final $$BusinessTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableOrderingComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CustomerTableOrderingComposer get customerId {
    final $$CustomerTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableOrderingComposer(
            $db: $db,
            $table: $db.customer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductTableOrderingComposer get productId {
    final $$ProductTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableOrderingComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LedgerTableAnnotationComposer
    extends Composer<_$AppDatabase, $LedgerTable> {
  $$LedgerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantitySold => $composableBuilder(
    column: $table.quantitySold,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantityPaid => $composableBuilder(
    column: $table.quantityPaid,
    builder: (column) => column,
  );

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$BusinessTableAnnotationComposer get businessId {
    final $$BusinessTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableAnnotationComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CustomerTableAnnotationComposer get customerId {
    final $$CustomerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customerId,
      referencedTable: $db.customer,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableAnnotationComposer(
            $db: $db,
            $table: $db.customer,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductTableAnnotationComposer get productId {
    final $$ProductTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableAnnotationComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LedgerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LedgerTable,
          LedgerData,
          $$LedgerTableFilterComposer,
          $$LedgerTableOrderingComposer,
          $$LedgerTableAnnotationComposer,
          $$LedgerTableCreateCompanionBuilder,
          $$LedgerTableUpdateCompanionBuilder,
          (LedgerData, $$LedgerTableReferences),
          LedgerData,
          PrefetchHooks Function({
            bool businessId,
            bool customerId,
            bool productId,
          })
        > {
  $$LedgerTableTableManager(_$AppDatabase db, $LedgerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LedgerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LedgerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LedgerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> businessId = const Value.absent(),
                Value<String> customerId = const Value.absent(),
                Value<String> productId = const Value.absent(),
                Value<int> quantitySold = const Value.absent(),
                Value<int> quantityPaid = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LedgerCompanion(
                id: id,
                businessId: businessId,
                customerId: customerId,
                productId: productId,
                quantitySold: quantitySold,
                quantityPaid: quantityPaid,
                amount: amount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String businessId,
                required String customerId,
                required String productId,
                required int quantitySold,
                required int quantityPaid,
                required int amount,
                Value<int> rowid = const Value.absent(),
              }) => LedgerCompanion.insert(
                id: id,
                businessId: businessId,
                customerId: customerId,
                productId: productId,
                quantitySold: quantitySold,
                quantityPaid: quantityPaid,
                amount: amount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LedgerTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({businessId = false, customerId = false, productId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (businessId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.businessId,
                                    referencedTable: $$LedgerTableReferences
                                        ._businessIdTable(db),
                                    referencedColumn: $$LedgerTableReferences
                                        ._businessIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (customerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.customerId,
                                    referencedTable: $$LedgerTableReferences
                                        ._customerIdTable(db),
                                    referencedColumn: $$LedgerTableReferences
                                        ._customerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (productId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.productId,
                                    referencedTable: $$LedgerTableReferences
                                        ._productIdTable(db),
                                    referencedColumn: $$LedgerTableReferences
                                        ._productIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$LedgerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LedgerTable,
      LedgerData,
      $$LedgerTableFilterComposer,
      $$LedgerTableOrderingComposer,
      $$LedgerTableAnnotationComposer,
      $$LedgerTableCreateCompanionBuilder,
      $$LedgerTableUpdateCompanionBuilder,
      (LedgerData, $$LedgerTableReferences),
      LedgerData,
      PrefetchHooks Function({bool businessId, bool customerId, bool productId})
    >;
typedef $$ExpenseTableCreateCompanionBuilder =
    ExpenseCompanion Function({
      Value<String> id,
      required String businessId,
      required String expenseName,
      required int expenseAmount,
      required DateTime date,
      Value<int> rowid,
    });
typedef $$ExpenseTableUpdateCompanionBuilder =
    ExpenseCompanion Function({
      Value<String> id,
      Value<String> businessId,
      Value<String> expenseName,
      Value<int> expenseAmount,
      Value<DateTime> date,
      Value<int> rowid,
    });

final class $$ExpenseTableReferences
    extends BaseReferences<_$AppDatabase, $ExpenseTable, ExpenseData> {
  $$ExpenseTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BusinessTable _businessIdTable(_$AppDatabase db) =>
      db.business.createAlias('expense__business_id__business__id');

  $$BusinessTableProcessedTableManager get businessId {
    final $_column = $_itemColumn<String>('business_id')!;

    final manager = $$BusinessTableTableManager(
      $_db,
      $_db.business,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_businessIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExpenseTableFilterComposer
    extends Composer<_$AppDatabase, $ExpenseTable> {
  $$ExpenseTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expenseName => $composableBuilder(
    column: $table.expenseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get expenseAmount => $composableBuilder(
    column: $table.expenseAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  $$BusinessTableFilterComposer get businessId {
    final $$BusinessTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableFilterComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpenseTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpenseTable> {
  $$ExpenseTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expenseName => $composableBuilder(
    column: $table.expenseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get expenseAmount => $composableBuilder(
    column: $table.expenseAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  $$BusinessTableOrderingComposer get businessId {
    final $$BusinessTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableOrderingComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpenseTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpenseTable> {
  $$ExpenseTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get expenseName => $composableBuilder(
    column: $table.expenseName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get expenseAmount => $composableBuilder(
    column: $table.expenseAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$BusinessTableAnnotationComposer get businessId {
    final $$BusinessTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.business,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessTableAnnotationComposer(
            $db: $db,
            $table: $db.business,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExpenseTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpenseTable,
          ExpenseData,
          $$ExpenseTableFilterComposer,
          $$ExpenseTableOrderingComposer,
          $$ExpenseTableAnnotationComposer,
          $$ExpenseTableCreateCompanionBuilder,
          $$ExpenseTableUpdateCompanionBuilder,
          (ExpenseData, $$ExpenseTableReferences),
          ExpenseData,
          PrefetchHooks Function({bool businessId})
        > {
  $$ExpenseTableTableManager(_$AppDatabase db, $ExpenseTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> businessId = const Value.absent(),
                Value<String> expenseName = const Value.absent(),
                Value<int> expenseAmount = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ExpenseCompanion(
                id: id,
                businessId: businessId,
                expenseName: expenseName,
                expenseAmount: expenseAmount,
                date: date,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                required String businessId,
                required String expenseName,
                required int expenseAmount,
                required DateTime date,
                Value<int> rowid = const Value.absent(),
              }) => ExpenseCompanion.insert(
                id: id,
                businessId: businessId,
                expenseName: expenseName,
                expenseAmount: expenseAmount,
                date: date,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExpenseTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({businessId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (businessId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.businessId,
                                referencedTable: $$ExpenseTableReferences
                                    ._businessIdTable(db),
                                referencedColumn: $$ExpenseTableReferences
                                    ._businessIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExpenseTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpenseTable,
      ExpenseData,
      $$ExpenseTableFilterComposer,
      $$ExpenseTableOrderingComposer,
      $$ExpenseTableAnnotationComposer,
      $$ExpenseTableCreateCompanionBuilder,
      $$ExpenseTableUpdateCompanionBuilder,
      (ExpenseData, $$ExpenseTableReferences),
      ExpenseData,
      PrefetchHooks Function({bool businessId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
  $$BusinessTableTableManager get business =>
      $$BusinessTableTableManager(_db, _db.business);
  $$CustomerTableTableManager get customer =>
      $$CustomerTableTableManager(_db, _db.customer);
  $$ProductTableTableManager get product =>
      $$ProductTableTableManager(_db, _db.product);
  $$LedgerTableTableManager get ledger =>
      $$LedgerTableTableManager(_db, _db.ledger);
  $$ExpenseTableTableManager get expense =>
      $$ExpenseTableTableManager(_db, _db.expense);
}
