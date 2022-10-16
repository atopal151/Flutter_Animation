import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  var _color = Colors.pink;
  var _width = 200.0;
  var _height = 200.0;
  var _opacity = 1.0;
  var _ilkCocukAktif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimationContainer Page"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              height: _height,
              width: _width,
              duration: Duration(seconds: 2),
              color: _color,
            ),
            RaisedButton(
              onPressed: () {
                _animationContainerAnimation();
              },
              color: Colors.blue,
              child: Text('Animated Container'),
            ),
            AnimatedCrossFade(
                firstChild: Image.network(
                    'https://oyunmakineleri.net/wp-content/uploads/Lightning_mcqueen_cars_2.png'),
                secondChild: Image.network(
                    'https://w7.pngwing.com/pngs/156/393/png-transparent-cars-3-cruz-ramirez-art-lightning-mcqueen-mater-cruz-ramirez-cars-cars-compact-car-computer-wallpaper-car.png'),
                crossFadeState: _ilkCocukAktif
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 3)),
            RaisedButton(
              onPressed: () {
                _crossFadeanimation();
              },
              color: Colors.blue,
              child: Text('Animated CrossFade'),
            ),
            AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(milliseconds: 2000),
                child: FlutterLogo(
                  size: 100,
                )),
            RaisedButton(
              onPressed: () {
                _opacityanimation();
              },
              color: Colors.blue,
              child: Text('Animated Opacity'),
            ),
          ],
        ),
      )),
    );
  }

// https://www.tailorbrands.com/wp-content/uploads/2020/07/amazon-logo.jpg
  //https://www.tailorbrands.com/wp-content/uploads/2020/07/twitter-logo.jpg
  void _animationContainerAnimation() {
    setState(() {
      _color = _color == Colors.pink ? Colors.yellow : Colors.pink;
      _width = _width == 200.0 ? 300 : 200;
      _height = _height == 200 ? 300 : 200;
    });
  }

  void _crossFadeanimation() {
    setState(() {
      _ilkCocukAktif = !_ilkCocukAktif;
    });
  }

  void _opacityanimation() {
    setState((){
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });

  }
}

///staggered animation
///animasyonları sırası ile çalıştırırlır.
