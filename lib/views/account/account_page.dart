import 'package:flutter/material.dart';
import 'package:mountdaki_flutter/views/account/login_page.dart';

class AccountPage extends StatelessWidget {
  // const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
          child: Text('Masuk'),
        ),
      ),
    );
  }
}
