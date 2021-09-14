import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: SafeArea(child: StarterPage()),
      ),
    );
  }
}

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  _StarterPageState createState() => _StarterPageState();
}
//
// belive.dreams.bmby.com - Belive
// https://6days.dreams.bmby.com - 6Days
// https://cnaan.dreams.bmby.com - Cnaan
// https://savyonview.dreams.bmby.com - Africa, Savyon

class _StarterPageState extends State<StarterPage> {
  late List<MyData> mList = [];

  @override
  void initState() {
    mList.add(MyData("Belive", "https://belive.dreams.bmby.com"));
    mList.add(MyData("6Days", "https://6days.dreams.bmby.com"));
    mList.add(MyData("Cnaan", "https://cnaan.dreams.bmby.com"));
    mList.add(MyData("Africa, Savyon", "https://savyonview.dreams.bmby.com"));
    mList.add(MyData("Dev", "https://dreamsv3dev.bmby.com/"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: mList.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < mList.length) {
              return MaterialButton(
                  color: Colors.amber,
                  colorBrightness: Brightness.light,
                  child: Text(mList[index].name),
                  onPressed: () {
                    String link = mList[index].link;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(link)),
                    );
                  });
            } else
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Custom url with https://',
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  ),
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(value)),
                    );
                  },
                ),
              );
          }),
    );
  }
}

class MyData {
  final String _name;
  final String _link;

  MyData(this._name, this._link);

  String get name => _name;

  String get link => _link;
}
