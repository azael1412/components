import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valueSlider = 100.0;
  bool _disabledCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _checkBox(),
            _createSwitch(),
            Expanded(
              child: _createImage()
            ),
          ],
        ),
      ),
    );
  }


  Widget _createSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: ( _disabledCheck ) ? null : ( value ){

        setState(() {
          _valueSlider = value;
        });

      },
    );

  }

  Widget _checkBox() {

    // return Checkbox(
    //   value: _disabledCheck,
    //   onChanged: (valor){ 
    //     setState(() {
    //       _disabledCheck = valor;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _disabledCheck,
      onChanged: (value){ 
        setState(() {
          _disabledCheck = value;
        });
      },

    );


  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _disabledCheck,
      onChanged: (value){ 
        setState(() {
          _disabledCheck = value;
        });
      },

    );
  }


  Widget _createImage() {

    return Image(
      image: NetworkImage('http://pngimg.com/uploads/batman/batman_PNG111.png'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );

  }

}