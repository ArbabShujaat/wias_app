import 'package:wias/Core/Constants/Assets.dart';

class PersonDataModel {
  final String name;
  final String email;
  final String image;
  final List<String> messages;

  PersonDataModel({
    required this.name,
    required this.email,
    required this.image,
    required this.messages,
  });
}

List<PersonDataModel> personDataList = [
  PersonDataModel(
    name: 'Lolla Smith',
    email: 'lolla_smith@example.com',
    image: lollaSmithImage,
    messages: [
      'I have added that you take fido, i now you have always liked him. i think your are an amazing friend and if i never get a chance to tell you',
      'Lorem Ipsum is dummy text of the printing and typesetting industry, derived from a Latin passage by CiceroLorem Ipsum is dummy text of the printing and typesetting industry, derived from a Latin passage by Cicero',
    ],
  ),
  PersonDataModel(
    name: 'John Doe',
    email: 'John_Doe@example.com',
    image: personImage,
    messages: [
      'I have added that you take fido, i now you have always liked him. i think your are an amazing friend and if i never get a chance to tell you',
      'Lorem Ipsum is dummy text of the printing and typesetting industry, derived from a Latin passage by CiceroLorem Ipsum is dummy text of the printing and typesetting industry, derived from a Latin passage by Cicero',
    ],
  ),
];
