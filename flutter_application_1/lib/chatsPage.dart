import '_lastMessages.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Chats();
}

class _Chats extends State<Chats> {
  List data = UtilsLastMessage.getMockLastMessage();

  @override
  void initState() {
    super.initState();
    loadListOfMessages();
  }

  Future loadListOfMessages() async {
    await Future.delayed(Duration(milliseconds: 300));
    List curr = UtilsLastMessage.getMockLastMessage();
    if (curr.length != data.length) {
      setState(() {
        this.data.clear();
        this.data.add(curr);
      });
    }
  }

  Widget readStatus(int index) {
    if (!data[index].readStat) {
      return Text(
        data[index].message,
        style: const TextStyle(color: Colors.black87, fontSize: 16),
      );
    }
    return Text(
      data[index].message,
      style: const TextStyle(color: Colors.black45, fontSize: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: data.isEmpty
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Center(
                          child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              height: 40,
                              child: InkWell(
                                child: Row(
                                  children: [
                                    ClipOval(
                                        child: Image.asset(
                                            'assets/${data[index].user.image}.jpg')),
                                    Container(
                                        width: 200,
                                        child: Column(
                                          children: [
                                            Text(
                                              data[index].user.name,
                                              style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 16),
                                            ),
                                            readStatus(index)
                                          ],
                                        )),
                                  ],
                                ),
                                onTap: () {},
                                splashColor: Colors.blue,
                              ))),
                    );
                  }),
                  padding: EdgeInsets.all(16),
                  itemCount: data.length,
                ),
                onRefresh: loadListOfMessages));
  }
}
