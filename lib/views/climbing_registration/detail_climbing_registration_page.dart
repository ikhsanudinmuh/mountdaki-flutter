import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountdaki_flutter/config.dart';
import 'package:mountdaki_flutter/models/climbing_registration/climbing_registration_response_model.dart';
import 'package:mountdaki_flutter/services/api_service.dart';
import 'package:mountdaki_flutter/views/main_page.dart';

class DetailClimbingRegistration extends StatelessWidget {
  // const DetailClimbingRegistration({Key? key}) : super(key: key);
  final ClimbingRegistrationResponseModel climbingRegistration;
  DetailClimbingRegistration({required this.climbingRegistration});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pendakian'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Gunung'),
                  subtitle: Text(climbingRegistration.mountainName),
                ),
                ListTile(
                  title: Text('Nama'),
                  subtitle: Text(climbingRegistration.userName),
                ),
                ListTile(
                  title: Text('Jadwal'),
                  subtitle: Text(climbingRegistration.schedule),
                ),
                ListTile(
                  title: Text('Status'),
                  subtitle: Text(climbingRegistration.status),
                ),
                Center(
                  child: _button(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    if (climbingRegistration.status == 'approved') {
      return ElevatedButton(
        onPressed: () {
          int id = climbingRegistration.id;

          ApiService.climb(id).then(
            (response) => {
              if (response)
                {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(Config.appName),
                      content: Text('status pendakian berhasil diubah'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage(index: 1)),
                            );
                          },
                          child: Text('OK'),
                        )
                      ],
                    ),
                  ),
                }
              else
                {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(Config.appName),
                      content: Text('status pendakian gagal diubah'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage(index: 1)),
                            );
                          },
                          child: Text('OK'),
                        )
                      ],
                    ),
                  ),
                }
            },
          );
        },
        child: Text('Mulai Mendaki'),
      );
    } else if (climbingRegistration.status == 'climbing') {
      return ElevatedButton(
        onPressed: () {
          int id = climbingRegistration.id;

          ApiService.done(id).then(
            (response) => {
              if (response)
                {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(Config.appName),
                      content: Text('status pendakian berhasil diubah'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage(index: 1)),
                            );
                          },
                          child: Text('OK'),
                        )
                      ],
                    ),
                  ),
                }
              else
                {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(Config.appName),
                      content: Text('status pendakian gagal diubah'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage(index: 1)),
                            );
                          },
                          child: Text('OK'),
                        )
                      ],
                    ),
                  ),
                }
            },
          );
        },
        child: Text('Selesai Mendaki'),
      );
    } else {
      return Text('');
    }
  }
}
