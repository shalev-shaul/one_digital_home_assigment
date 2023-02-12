import 'package:get/get.dart';
import 'package:one_digital_home_assigment/models/user/user.dart';
import 'package:one_digital_home_assigment/services/http_service.dart';

class UserService extends GetxController {
  final RxList<User> users = RxList<User>();

  Future<List<User>> fetchUsers() async {
    late List<User> users = [];
    try {
      await HttpService().get('https://random-data-api.com/api/v2/users?size=100').then((response) {
        users = (response as List<dynamic>).map((e) => User.fromJson(e)).toList();
        users.sort((a, b) {
          final DateTime aDate = a.date_of_birth;
          final DateTime bDate = b.date_of_birth;
          return aDate.compareTo(bDate);
        });
      });
    } catch (err) {
      print("Fetch users error.");
    }

    return users;
  }
}
