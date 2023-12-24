import 'package:httppssss/model/user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final UserName name;

  User(
      {required this.email,
      required this.phone,
      required this.cell,
      required this.gender,
      required this.name});
}
