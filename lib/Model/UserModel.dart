class UserModel {
  String? username;
  String? email;
  String? uid;
  String? picUrl;
  String? password;
  String? phone;
  String? subscription;
  int? ownerpin;
  final DateTime? createdAt;
  UserModel(
      {required this.uid,
      required this.email,
      required this.phone,
      required this.subscription,
      required this.createdAt,
      required this.ownerpin,
      required this.password,
      required this.picUrl,
      required this.username});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    final String uid = data['uid'];
    final int ownerpin = data['ownerpin'];
    final String email = data['email'];
    final String username = data['username'];
    final String picUrl = data['picUrl'];
    final String password = data['password'];
    final String phone = data['phone'];
    final String subscription = data['subscription'];
    final DateTime createdAt = data['createdAt'].toDate();

    return UserModel(
        uid: uid,
        ownerpin: ownerpin,
        email: email,
        phone: phone,
        username: username,
        password: password,
        picUrl: picUrl,
        subscription: subscription,
        createdAt: createdAt);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'ownerpin': ownerpin ,
      'email': email,
      "phone": phone,
      'username': username,
      "picUrl": picUrl,
      "password": password,
      "subscription": subscription,
      "createdAt": createdAt
    };
  }
}
