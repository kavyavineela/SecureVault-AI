import 'package:hive/hive.dart';

part 'password_model.g.dart';

@HiveType(typeId: 0)
class PasswordModel extends HiveObject {
  @HiveField(0)
  String website;

  @HiveField(1)
  String username;

  @HiveField(2)
  String password;

  PasswordModel({
    required this.website,
    required this.username,
    required this.password,
  });
}