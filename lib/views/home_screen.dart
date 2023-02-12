import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_digital_home_assigment/bloc/user/user_bloc.dart';
import 'package:one_digital_home_assigment/views/favorite_screen.dart';
import 'package:one_digital_home_assigment/views/users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    UsersScreen(),
    FavoriteScreen(),
  ];

  void _onChangeScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedScreenIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onChangeScreen,
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedScreenIndex),
      ),
    );
  }
}
