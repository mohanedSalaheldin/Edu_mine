import 'package:e_learning/src/features/home/domain/entities/monitors_entity.dart';

class MonitorModel extends MonitorEntity {
  MonitorModel(
      {required super.name, required super.rate, required super.reviews});

  factory MonitorModel.fromJosn(Map<String, dynamic> json) {
    print('fromJSOM');
    return MonitorModel(
      name: json['name'],
      rate: json['rate'],
      reviews: json['reviews'],
    );
  }
}
