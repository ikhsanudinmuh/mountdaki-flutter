import 'package:flutter/material.dart';
import 'package:mountdaki_flutter/models/mountain/mountain.dart';
import 'package:mountdaki_flutter/services/api_service.dart';
import 'package:mountdaki_flutter/views/mountain/detail_mountain_page.dart';

class Home extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mountdaki'),
      ),
      body: FutureBuilder(
        future: apiService.getMountains(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Mountain>> snapshot,
        ) {
          if (snapshot.hasData) {
            List<Mountain> mountains = snapshot.requireData;
            return ListView(
              children: mountains
                  .map(
                    (Mountain mountain) => Card(
                      margin: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailMountain(
                                mountain: mountain,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/${mountain.image}',
                              fit: BoxFit.fitWidth,
                            ),
                            Text(
                              mountain.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(mountain.location),
                            Text('${mountain.height} mdpl'),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
