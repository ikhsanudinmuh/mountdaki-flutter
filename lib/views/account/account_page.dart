import 'package:flutter/material.dart';
import 'package:mountdaki_flutter/models/account/user_response_model.dart';
import 'package:mountdaki_flutter/services/api_service.dart';
import 'package:mountdaki_flutter/services/shared_service.dart';
import 'package:mountdaki_flutter/views/account/login_page.dart';
import 'package:mountdaki_flutter/views/main_page.dart';

class AccountPage extends StatelessWidget {
  // const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun'),
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: ApiService.getUserProfile(),
            builder:
                (BuildContext context, AsyncSnapshot<UserResponseModel> model) {
              if (model.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hi, ${model.data!.data.name}'),
                      ElevatedButton(
                        onPressed: () {
                          SharedService.logout(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ),
                          );
                        },
                        child: Text('Keluar'),
                      ),
                    ],
                  ),
                );
              } else {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text('Masuk'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
