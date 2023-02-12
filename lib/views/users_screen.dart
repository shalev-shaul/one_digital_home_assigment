import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:one_digital_home_assigment/bloc/favorites/favorites_bloc.dart';
import 'package:one_digital_home_assigment/bloc/user/user_bloc.dart';
import 'package:one_digital_home_assigment/models/user/user.dart';
import 'package:one_digital_home_assigment/services/favorite_service.dart';

class UsersScreen extends StatelessWidget {
  final favoriteService = Get.put(FavoriteService());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserInitial) {
            return CircularProgressIndicator();
          }
          if (state is UserLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total users: ${state.users.length}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: ((context, index) => Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.users[index].email),
                              Container(
                                child: Row(
                                  children: [
                                    favoriteIconWidget(context, state.users[index]),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () => context.read<UserBloc>().add(RemoveUser(state.users[index])),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            );
          }

          return Text('Something went worng');
        }),
      ),
    );
  }

  Widget favoriteIconWidget(BuildContext context, User user) {
    final bool isFavorite = favoriteService.checkIfUserIsFavorite(user);
    return IconButton(
      icon: Icon((isFavorite) ? Icons.favorite : Icons.favorite_border),
      onPressed: () => context.read<UserBloc>().add(ToggleUserToFavorite(user, isFavorite)),
    );
  }
}
