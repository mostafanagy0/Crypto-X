class UserModel {
  final String uid;
  final String email;

  UserModel({required this.uid, required this.email});

  factory UserModel.fromFirebase({required String uid, required String email}) {
    return UserModel(uid: uid, email: email);
  }
}
