import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mountdaki_flutter/services/api_service.dart';
import 'package:mountdaki_flutter/services/shared_service.dart';
import 'package:mountdaki_flutter/views/account/account_page.dart';
import 'package:mountdaki_flutter/views/account/login_page.dart';
import 'package:mountdaki_flutter/views/climbing_registration/climbing_registration_page.dart';
import 'package:mountdaki_flutter/views/mountain/mountain_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

int currentIndex = 0;
var screens = [
  Home(),
  ClimbingRegistrationPage(),
  AccountPage(),
];

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(
          () {
            currentIndex = index;
          },
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List Pendakian',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
