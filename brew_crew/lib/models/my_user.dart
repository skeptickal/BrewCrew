class MyUser {
  final String? uid;

  MyUser({this.uid});
}

class MyUserData {
  final String? uid;
  final String? name;
  final String? sugars;
  final int? strength;

  MyUserData(
      {required this.uid,
      required this.name,
      required this.sugars,
      required this.strength});
}
