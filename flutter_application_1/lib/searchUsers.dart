import 'package:flutter/material.dart';
import '_allUsers.dart';

class SearchUsers extends StatefulWidget {
  const SearchUsers({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchUsers();
}

class _SearchUsers extends State<SearchUsers> {
  TextEditingController searchController = TextEditingController();
  List persons = UtilsPersons.getMockPersons();
  late List items = [];

  @override
  void initState() {
    items = persons;
    super.initState();
  }

  void filterSearchResults(String str) {
    if (str.isNotEmpty) {
      List dummyListData = [];
      for (var element in persons) {
        if (element.name.toLowerCase().contains(str.toLowerCase())) {
          dummyListData.add(element);
        }
      }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
    } else {
      setState(() {
        items.clear();
        items.addAll(persons);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search for friend:'),
        ),
        backgroundColor: Colors.blue[200],
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Tap to search',
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(25.0)),
                ),
                onChanged: (value) {
                  filterSearchResults(value);
                },
                onFieldSubmitted: (value) {
                  filterSearchResults(value);
                },
              ),
            ),
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
                                  bottom: 10,
                                  child: Text(persons[index].aboutMe))
                            ],
                          ),
                        )
                      ],
                    ));
              },
            ))
          ],
        ));
  }
}
