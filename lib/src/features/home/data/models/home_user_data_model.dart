import '../../domain/entities/home_user_entity.dart';

class HomeUserDataModel extends HomeUserEntity {
  HomeUserDataModel(
      {required super.name, required super.uID, required super.coursesIDs});
  factory HomeUserDataModel.fromJson(Map<String, dynamic> json) {
    return HomeUserDataModel(
      name: json['name'],
      uID: json['uID'],
      coursesIDs: [],
      // Initialize other fields as needed.
    );
  }
}
