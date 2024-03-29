import 'package:example_html_read_more/read_more.dart';
import 'package:flutter/material.dart';
import 'package:smart_text/smart_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          color: Colors.yellow,
          child: Column(
            // Column is also layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//            SmartText('You have pushew dwkhahahaahahahahahaha j djw djw djw djw djw jw djw djw jw djw djw d brokfopekfopeskfpkespokfopsekfks jdjdhdh hdhdhd hdhdh hd dh d dhdhd dhd dh ',
//            maxLines: 2, readMoreText: 'yuk',readLessText: 'kecil',)
              ReadMore(
                widgetItem: Text(
                  'You have pushew dwkhahahaahahahahahaha j djw djw djw djw djw jw djw djw jw djw djw d brokfopekfopeskfpkespokfopsekfks jdjdhdh hdhdhd hdhdh hd dh d dhd You have pushed the button this many times: jancuk sekali j djw djw jw djw djw dwj hdkwkdwndkwdbkw kwndkwjdkwd knhkwjd jw djw  jw dwk w dwk dkw d kw dkw diw dkw wi diw diw diw diw iw diw kalian yah hahahahahahahaahahahahahaahahahahahaha j djw djw djw djw djw jw djw djw jw djw djw d brokfopekfopeskfpkespokfopsekfks jdjdhdh hdhdhd hdhdh hd dh d dhdhd dhd dh ',
                ),
                boundHeight: 150,
              ),
//              ReadMore(
//                widgetItem: Text('You have pushew dwkhahahaahahahahahaha j djw djw djw djw djw jw djw djw jw djw djw d brokfopekfopeskfpkespokfopsekfks jdjdhdh hdhdhd hdhdh hd dh d dhd'),
//              )
            ],
          ),
        ),
      ),
    );
  }
}
