class UserModel {
  //Model für Datenbank mit den Werten email und uid
  String? uid;
  String? email;

  UserModel({this.uid, this.email});

  factory UserModel.fromMap(map) {
    //daten die vom server erhalten werden
    return UserModel(
      uid: map['uid'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    //daten die an den server geschickt werden
    return {
      'uid': uid,
      'email': email,
    };
  }
}
