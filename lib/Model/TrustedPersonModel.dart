class TrustedPersonModel {
  String? username;
  String? email;
  String? uid;
  String? picUrl;
  String? phone;
  int? ownerPin;
  int? specialpersonPin;
  List? messages;
  List? questions;
  String? Type;

  final DateTime? createdAt;
  TrustedPersonModel(
      {required this.uid,
      required this.email,
      required this.phone,
      required this.specialpersonPin,
      required this.messages,
      required this.Type,
      required this.createdAt,
      required this.questions,
      required this.ownerPin,
      required this.picUrl,
      required this.username});

  factory TrustedPersonModel.fromMap(Map<String, dynamic> data) {
    final String uid = data['uid'];
    final String email = data['email'];
       final String Type = data['Type'];
    final String username = data['username'];
    final List questions = data['questions'];
    final String picUrl = data['picUrl'];
    final String phone = data['phone'];
    final int ownerPin = data['ownerPin'];
    final int specialpersonPin = data['specialpersonPin'];
    final List messages = data['messages'];
    final DateTime createdAt = data['createdAt'].toDate();

    return TrustedPersonModel(
        uid: uid,
        email: email,
        Type:Type,
        questions: questions,
        phone: phone,
        username: username,
        ownerPin: ownerPin,
        specialpersonPin: specialpersonPin,
        messages: messages,
        picUrl: picUrl,
        createdAt: createdAt);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      "Type":Type,
      'questions': questions,
      "phone": phone,
      'username': username,
      "ownerPin": ownerPin,
      "specialpersonPin": specialpersonPin,
      "messages": messages,
      "picUrl": picUrl,
      "createdAt": createdAt
    };
  }
}
