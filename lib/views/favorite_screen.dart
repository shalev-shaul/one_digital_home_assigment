import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:one_digital_home_assigment/bloc/favorites/favorites_bloc.dart';
import 'package:one_digital_home_assigment/services/favorite_service.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<FavoritesBloc>().add(LoadFavorites());
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: BlocBuilder<FavoritesBloc, FavoritesState>(builder: (context, state) {
          if (state is FavoritesInitial) {
            return CircularProgressIndicator();
          }
          if (state is FavoritesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total users: ${state.favoriteUsers.length}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.favoriteUsers.length,
                    itemBuilder: ((context, index) => Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(state.favoriteUsers[index].email),
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () => context
                                          .read<FavoritesBloc>()
                                          .add(RemoveFavoriteUser(state.favoriteUsers[index])),
                                    )
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
}
