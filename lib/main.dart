import 'package:flutter/material.dart';
import 'package:mountdaki_flutter/services/shared_service.dart';
import 'package:mountdaki_flutter/views/account/account_page.dart';
import 'package:mountdaki_flutter/views/account/login_page.dart';
import 'package:mountdaki_flutter/views/account/register_page.dart';
import 'package:mountdaki_flutter/views/climbing_registration/climbing_registration_page.dart';
import 'package:mountdaki_flutter/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mountdaki',
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/climbing_registration': (context) => ClimbingRegistrationPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/account': (context) => AccountPage(),
      },
    );
  }
}
