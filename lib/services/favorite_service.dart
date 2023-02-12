import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:one_digital_home_assigment/models/user/user.dart';
import 'package:one_digital_home_assigment/services/http_service.dart';
import 'package:one_digital_home_assigment/services/user_service.dart';
import 'package:one_digital_home_assigment/utils/hive_keys.dart';

class FavoriteService extends GetxController {
  final RxList<User> favoriteUsers = RxList<User>();

  Future<void> initialFavoriteUsers() async {
    var favoriteUsersBox = await Hive.openBox(HiveKeys.favoriteUsersBox);
    if (favoriteUsersBox.get(HiveKeys.favoriteUsers) == null) {
      final userService = Get.put(UserService());
      favoriteUsers.value = userService.users.getRange(0, 9).toList();
      favoriteUsersBox.put(HiveKeys.favoriteUsers, jsonEncode(favoriteUsers));
    } else {
      favoriteUsers.value = (jsonDecode(favoriteUsersBox.get(HiveKeys.favoriteUsers)) as List<dynamic>)
          .map((e) => User.fromJson(e))
          .toList();
    }
  }

  Future<List<User>> addFavoriteUser(User user) async {
    favoriteUsers.value.add(user);
    await updateFavoriteUsersStorage();
    return favoriteUsers.value;
  }

  Future<List<User>> removeFavoriteUser(User user) async {
    if (favoriteUsers.remove(user)) {
      await updateFavoriteUsersStorage();
    }
    return favoriteUsers.value;
  }

  Future<void> updateFavoriteUsersStorage() async {
    var favoriteUsersBox = await Hive.openBox(HiveKeys.favoriteUsersBox);
    favoriteUsersBox.put(HiveKeys.favoriteUsers, jsonEncode(favoriteUsers.value));
  }

  bool checkIfUserIsFavorite(User user) {
    if (favoriteUsers.value.isNotEmpty) {
      final List<User> findUser = favoriteUsers.value.where((e) => e.id == user.id).toList();

      if (findUser.isNotEmpty) return true;
    }

    return false;
  }
}
