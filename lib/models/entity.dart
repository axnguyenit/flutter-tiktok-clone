import 'package:equatable/equatable.dart';

abstract class Entity extends Equatable {
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }
}
