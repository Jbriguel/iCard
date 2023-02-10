import 'package:flutter/material.dart';
import 'package:icard/src/models/info.dart';
import 'package:icard/src/widgets/card.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: Text(
              'Example iCard',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
            child: iCard(
          title: "Example Card",
          titleColor: Colors.black,
          mainData: [
            info(
                title: "Lorem ipsum dolor",
                content:
                    "Aenean erat ligula, placerat eget ultricies ut, ornare vitae nisl."),
            info(
                title: "Lorem ipsum",
                content:
                    "Aenean erat ligula, placerat eget ultricies ut, ornare vitae nisl."),
            info(
                title: "Lorem ipsum",
                content:
                    "Aenean erat ligula, placerat eget ultricies ut, ornare vitae nisl."),
            info(
                title: "Lorem ipsum",
                content:
                    "Aenean erat ligula, placerat eget ultricies ut, ornare vitae nisl.")
          ],
          press: null,
          backgroundImage: 'images/backgroundImage.png',
        )),
      ),
    );
  }
}
