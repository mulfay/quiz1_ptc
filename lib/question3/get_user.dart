import 'package:faker/src/faker.dart';

class UsersInfo {
  Map<int, Map<String, dynamic>> users = {};
  UsersInfo._privateConstructor();

  static UsersInfo? _instance;

  factory UsersInfo.getInstance() {
    _instance ??= UsersInfo._privateConstructor();
    return _instance!;
  }
  getUserIfno(int? id) {
    if (id == null || id < 0) return null;
    if (!users.containsKey(id)) users[id] = _getUserById(id);
    return users[id];
  }

  _getUserById(int? id) {
    if (id == null || id < 0) return null;
    Map<String, dynamic> user = {};
    user = {
      "id": id,
      "first_name": faker.person.firstName(),
      "last_name": faker.person.lastName(),
      "about": faker.lorem.words(3).join(' '),
      "image": faker.image.image(),
    };
    return user;
  }
}
