import 'package:uuid/uuid.dart';

final uuid = Uuid();

String generateUuid() {
  return uuid.v4();
}