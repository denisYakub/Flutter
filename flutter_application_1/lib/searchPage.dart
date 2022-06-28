import 'package:flutter/material.dart';
import '_allUsers.dart';
import 'searchUsers.dart';
import '_currentUser.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Search();
}

List peopleNearby(List a) {
  List b = [];
  var userLocation = UtilCurUser.getuser().city;
  for (var element in a) {
    if (element.city == userLocation) {
      b.add(element);
    }
  }
  if (b.isEmpty) {
    userLocation = UtilCurUser.getuser().country;
    for (var element in a) {
      if (element.country == userLocation) {
        b.add(element);
      }
    }
  }
  return b;
}

class _Search extends State<Search> {
  List persons = peopleNearby(UtilsPersons.getMockPersons());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Search')),
      backgroundColor: Colors.blue[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'People nearby:',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )),
          Expanded(
              child: ListView.builder(
            itemCount: persons.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Container(
                  margin: const EdgeInsets.all(20),
                  height: 50,
                  child: Row(
                    children: [
                      ClipOval(
                          child: Image.asset(
                              'assets/${persons[index].image}.jpg')),
                      Container(
                        margin: const EdgeInsets.all(2),
                        height: 50,
                        width: 150,
                        child: Stack(
                          children: [
                            Positioned(
                                child: Text(
                              persons[index].name,
                              style: const TextStyle(
                                  color: Colors.black87, fontSize: 16),
                            )),
                            Positioned(
                                bottom: 10, child: Text(persons[index].aboutMe))
                          ],
                        ),
                      )
                    ],
                  ));
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tap to find new friends!',
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var tween = Tween(begin: 0.0, end: 1.0).animate(animation);

              return FadeTransition(
                opacity: tween,
                child: child,
              );
            }, pageBuilder: (context, animation, animationTime) {
              return SearchUsers();
            }),
          );
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
