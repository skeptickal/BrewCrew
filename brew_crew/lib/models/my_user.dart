class MyUser {
  final String? uid;

  MyUser({this.uid});
}

class MyUserData {
  final String? uid;
  final String name;
  final int strength;
  final String sugars;

  MyUserData({
    required this.uid,
    required this.name,
    required this.strength,
    required this.sugars,
  });
}
