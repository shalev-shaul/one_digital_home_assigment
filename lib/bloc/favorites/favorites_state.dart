part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<User> favoriteUsers;

  const FavoritesLoaded({required this.favoriteUsers});

  @override
  List<Object?> get props => [favoriteUsers];
}
