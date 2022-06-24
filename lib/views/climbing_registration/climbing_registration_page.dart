import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountdaki_flutter/services/api_service.dart';

class ClimbingRegistrationPage extends StatefulWidget {
  const ClimbingRegistrationPage({Key? key}) : super(key: key);

  @override
  State<ClimbingRegistrationPage> createState() =>
      _ClimbingRegistrationPageState();
}

class _ClimbingRegistrationPageState extends State<ClimbingRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: ApiService.isLoggedIn(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Column(
                  children: [
                    Text(
                      'List Pendakian',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Silahkan masuk terlebih dahulu!'),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
