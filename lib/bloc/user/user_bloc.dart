import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:one_digital_home_assigment/models/user/user.dart';
import 'package:one_digital_home_assigment/services/favorite_service.dart';
import 'package:one_digital_home_assigment/services/http_service.dart';
import 'package:one_digital_home_assigment/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      final userService = Get.put(UserService());
      final favoriteService = Get.put(FavoriteService());
      final List<User> users = await UserService().fetchUsers();
      userService.users.value = users;
      await favoriteService.initialFavoriteUsers();
      emit(UserLoaded(users: users));
    });
    on<RemoveUser>((event, emit) {
      if (state is UserLoaded) {
        final userService = Get.put(UserService());
        final state = this.state as UserLoaded;
        final List<User> newUsers = List.from(state.users)..remove(event.user);
        userService.users.value = newUsers;
        emit(UserLoaded(users: newUsers));
      }
    });
    on<ToggleUserToFavorite>((event, emit) async {
      if (state is UserLoaded) {
        emit(UserInitial());
        final favoriteService = Get.put(FavoriteService());
        final userService = Get.put(UserService());
        if (event.isFavorite) {
          await favoriteService.removeFavoriteUser(event.user);
        } else {
          await favoriteService.addFavoriteUser(event.user);
        }
        emit(UserLoaded(users: userService.users.value));
      }
    });
  }
}
