import 'package:flutter/material.dart';
import 'package:mountdaki_flutter/models/mountain/mountain.dart';

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
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Daftar Pendakian'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
