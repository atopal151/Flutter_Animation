import 'package:flutter/material.dart';

class TransformWidget extends StatefulWidget {
  const TransformWidget({Key? key}) : super(key: key);

  @override
  State<TransformWidget> createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {
  var _sliderDegeri = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transform'),
        ),
        body: Column(
          children: [
            getSlider(),
            SizedBox(
              height: 20,
            ),
            getRotate(),
            SizedBox(
              height: 100,
            ),
            getScale(),
            SizedBox(
              height: 100,
            ),
            getTranslate(),
          ],
        ));
  }

  getSlider() {
    return Slider(
      value: _sliderDegeri,
      min: 0.0,
      max: 100,
      onChanged: (yeniDeger) {
        setState(() {
          _sliderDegeri = yeniDeger;
        });
      },
    );
  }

  Container getRotate() {
    return Container(
      child: Transform.rotate(
        angle: _sliderDegeri,
        origin: Offset(50, 0.0),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        ),
      ),
    );
  }

  Container getScale() {
    return Container(
      child: Transform.scale(
        scale: _sliderDegeri == 0 ? 1 : _sliderDegeri / 50,
        child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
      ),
    );
  }

  Container getTranslate() {
    return Container(
      child: Transform.translate(
        offset: Offset(_sliderDegeri,0.0),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.pink,
        ),
      ),
    );
  }
}
