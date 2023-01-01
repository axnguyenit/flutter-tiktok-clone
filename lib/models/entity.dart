abstract class Entity {
  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }
}
