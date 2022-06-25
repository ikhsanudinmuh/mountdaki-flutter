import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mountdaki_flutter/config.dart';
import 'package:mountdaki_flutter/models/climbing_registration/add_climbing_registration_request_model.dart';
import 'package:mountdaki_flutter/models/mountain/mountain.dart';
import 'package:mountdaki_flutter/services/api_service.dart';
import 'package:mountdaki_flutter/services/shared_service.dart';
import 'package:mountdaki_flutter/views/main_page.dart';
import 'package:http/http.dart' as http;

class AddClimbingRegistrationPage extends StatefulWidget {
  // const AddClimbingRegistrationPage({Key? key}) : super(key: key);
  final Mountain mountain;
  AddClimbingRegistrationPage({required this.mountain});

  @override
  State<AddClimbingRegistrationPage> createState() =>
      _AddClimbingRegistrationPage();
}

class _AddClimbingRegistrationPage extends State<AddClimbingRegistrationPage> {
  final _schedule = TextEditingController();
  bool _validate = false;
  int? mountainId;
  String? schedule;

  @override
  Widget build(BuildContext context) {
    mountainId = widget.mountain.id;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendakian ${widget.mountain.name}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _schedule,
              decoration: InputDecoration(
                  labelText: 'Jadwal(YYYY-MM-DD)',
                  errorText: _validate ? 'Jadwal harus diisi!' : null),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () async {
                setState(() {
                  _schedule.text.isEmpty ? _validate = true : _validate = false;
                });

                schedule = _schedule.text;

                AddClimbingRegistrationRequestModel model =
                    AddClimbingRegistrationRequestModel(
                        mountainId: mountainId!, schedule: schedule!);

                ApiService.addClimbingRegistration(model).then(
                  (response) => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(Config.appName),
                      content: Text(response.message),
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
                );
              },
              child: const Text('Kirim'),
            ),
          )
        ],
      ),
    );
  }
}
