import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntiy {
  const UserModel(
      {required super.name, required super.email, required super.password, required super.uID});
  // factory UserModel.fromJsom({required Map<String,dynamic> json}) {
  //   return UserModel(name: json[''], email: email, password: password)
  // }
}
