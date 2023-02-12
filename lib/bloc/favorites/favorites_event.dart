part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavorites extends FavoritesEvent {}

class AddFavoriteUser extends FavoritesEvent {
  final User user;

  const AddFavoriteUser(this.user);

  @override
  List<Object?> get props => [];
}

class RemoveFavoriteUser extends FavoritesEvent {
  final User user;

  const RemoveFavoriteUser(this.user);

  @override
  List<Object?> get props => [];
}
