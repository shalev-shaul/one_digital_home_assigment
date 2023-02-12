import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:one_digital_home_assigment/bloc/user/user_bloc.dart';
import 'package:one_digital_home_assigment/models/user/user.dart';
import 'package:one_digital_home_assigment/services/favorite_service.dart';
import 'package:one_digital_home_assigment/services/user_service.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<LoadFavorites>((event, emit) async {
      final favoriteService = Get.put(FavoriteService());
      await favoriteService.initialFavoriteUsers();
      emit(FavoritesLoaded(favoriteUsers: favoriteService.favoriteUsers.value));
    });
    on<RemoveFavoriteUser>((event, emit) async {
      if (state is FavoritesLoaded) {
        emit(FavoritesInitial());
        final favoriteService = Get.put(FavoriteService());
        await favoriteService.removeFavoriteUser(event.user);
        emit(FavoritesLoaded(favoriteUsers: favoriteService.favoriteUsers.value));
      }
    });
  }
}
