import 'package:equatable/equatable.dart';

class UserEntiy extends Equatable {
  final String name;
  final String email;
  final String password;
  final String uID;

  const UserEntiy({required this.name,required this.uID,  required this.email, required this.password});

  @override
  List<Object?> get props => [name, email, password,uID];
}
