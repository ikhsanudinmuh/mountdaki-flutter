import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mountdaki_flutter/models/climbing_registration/climbing_registration_response_model.dart';
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
        child: FutureBuilder<List<ClimbingRegistrationResponseModel>>(
          future: ApiService.getClimbingRegistration(),
          builder: (context, snapshot) {
            print(snapshot.hasData);
            if (snapshot.hasData) {
              List<ClimbingRegistrationResponseModel> model =
                  snapshot.requireData;
              return ListView(
                children: model
                    .map(
                      (ClimbingRegistrationResponseModel
                              climbingRegistration) =>
                          Card(
                        margin: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                climbingRegistration.mountainName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(climbingRegistration.schedule),
                              Text(climbingRegistration.status),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return Text('');
            }
          },
        ),
      ),
    );
  }
}
