import 'package:flutter/material.dart';
import 'package:flutter_animation/transform_rotate.dart';

import 'new_page.dart';

void main() {
  runApp(const MyApp());
}

///ticker --> 1 saniyede 60 kare olarak çalışır.
///Animation -->
///AniationController -->
/// Tween between (başlagıç-bitiş)
/// curve eğiri büğrü çizgi

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ///SingleTickerProviderStateMixin

  int _counter = 0;
  late AnimationController controller;
  late Animation animation;
  late Animation animation2;
  late Animation animation3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    controller.addListener(() {
      setState(() {
        //debugPrint(controller.value.toString());
        //debugPrint(animation.value.toString());
      });
    });

    animation =
        ColorTween(begin: Colors.red, end: Colors.yellow).animate(controller);

    animation3 = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    animation2 = AlignmentTween(begin: Alignment(-1, 1), end: Alignment(1, -1))
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceIn));

    //controller.reverse(from: 100);
    controller.forward();
    controller.addStatusListener((durum) {
      if (durum == AnimationStatus.completed) {
        controller.reverse().orCancel;
      } else if (durum == AnimationStatus.dismissed) {
        controller.forward().orCancel;
      }

      debugPrint("Durum : " + durum.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: animation3.value * 18),
            ),
            Container(
              height: 100,
              alignment: animation2.value,
              child: Text(
                '$_counter', //+ '    %${controller.value.round()}',
                style: TextStyle(fontSize: controller.value + 20),
              ),
            ),
            const Hero(
              tag: 'tag',
              child: FlutterLogo(
                size: 64,
              ),
            ),
            RaisedButton(
              child: Text(
                  "AnitionContainer - AnimationCrossFade - Animated Opacity"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NewPage()));
              },
            ),
            RaisedButton(
              child: Text("Transform - Rotate - Translate"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TransformWidget()));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
