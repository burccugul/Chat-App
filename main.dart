import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat App",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mini Chat App"),
        backgroundColor: Colors.redAccent,
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Baloon> messageList = [];

  TextEditingController t = TextEditingController();

  add(String sendingMessage) {

    setState(() {
      Baloon messageb = Baloon(message: sendingMessage);
      messageList.insert(0, messageb);
      t.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: t,
              onSubmitted: add,
            ),
          ),
          IconButton(onPressed: () => add(t.text), icon: Icon(Icons.send)),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
                itemCount: messageList.length,
                itemBuilder: (context, index) => messageList[index]),
          ),
          Divider(thickness: 1.0,),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String name = "User";

class Baloon extends StatelessWidget {

  late String message;

  Baloon({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(child: Text(name[0]),backgroundColor: Colors.redAccent,),
          SizedBox(width: 9.0,),
          Column(
            children: [
              Text(name),
              SizedBox(height: 4.0),
              Text(message),
            ],
          ),
        ],
      ),
    );
  }
}
