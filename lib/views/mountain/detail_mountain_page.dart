import 'package:flutter/material.dart';
import 'package:mountdaki_flutter/models/mountain/mountain.dart';
import 'package:mountdaki_flutter/services/api_service.dart';
import 'package:mountdaki_flutter/services/shared_service.dart';
import 'package:mountdaki_flutter/views/climbing_registration/add_climbing_registration_page.dart';

class DetailMountain extends StatelessWidget {
  final Mountain mountain;

  DetailMountain({required this.mountain});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mountain.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/${mountain.image}',
                  fit: BoxFit.fitWidth,
                ),
                ListTile(
                  title: Text(mountain.name),
                ),
                ListTile(
                  subtitle: Text(mountain.description),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(mountain.location),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.height),
                      Text('${mountain.height.toString()} mdpl'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.navigation),
                      Text('${mountain.basecamp.toString()} basecamp'),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: ApiService.isLoggedIn(),
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.data == true) {
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    AddClimbingRegistrationPage(
                                  mountain: mountain,
                                ),
                              ),
                            );
                          },
                          child: Text('Daftar Pendakian'),
                        ),
                      );
                    }
                    return const Text('');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
