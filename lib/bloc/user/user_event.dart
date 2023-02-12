part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class LoadUser extends UserEvent {}

class ToggleUserToFavorite extends UserEvent {
  final User user;
  final bool isFavorite;

  const ToggleUserToFavorite(this.user, this.isFavorite);

  @override
  List<Object?> get props => [];
}

class RemoveUser extends UserEvent {
  final User user;

  const RemoveUser(this.user);

  @override
  List<Object?> get props => [];
}
