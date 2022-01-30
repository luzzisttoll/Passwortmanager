class userModel {
  String? uid;
  String? email;

  userModel({this.uid, this.email});

  factory userModel.fromMap(map) {
    return userModel(
      uid: map['uid'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }
}
