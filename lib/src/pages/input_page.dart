import 'package:flutter/material.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name  = '';
  String _email = '';
  String _password = '';
  String _date = '';
  List<String> _powers = ['volar','rayos x', 'fuerza'];
  String _selected = 'fuerza';
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInputs(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPeople(),
        ],
      ),
    );
  }
  Widget _createInputs(){
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text("Letras ${_name.length}"),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value){
        setState(() {
          _name = value;
          print("nombre: "+_name);
        });
      },
    );
  }
  Widget _createEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Correo',
        labelText: 'Correo',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value){
        setState(() {
          _email = value;
          print("correo: "+_email);
        });
      },
    );
  }
   Widget _createPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (value){
        setState(() {
          _password = value;
          print("contraseña: "+_password);
        });
      },
    );
  }
  Widget _createDate(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.date_range),
        icon: Icon(Icons.date_range),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }
  void _selectDate(BuildContext context) async{
    DateTime dateTime = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2010),
      lastDate: new DateTime(2029),
      locale: Locale('es','ES'),
    );
    if( dateTime != null){
      setState(() {
        _date = dateTime.toString();
        _textEditingController.text = _date;
      });
    }
  }
  List<DropdownMenuItem <String>> getOptionsDropdown(){
     List<DropdownMenuItem <String>> list = new List();
     _powers.forEach((power){
       list.add(DropdownMenuItem(
         child: Text(power),
         value: power,

       ));
     });
     return list;
  }
  Widget _createDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(child: DropdownButton(
        value: _selected,
        items: getOptionsDropdown(), 
        onChanged: (opt){
          setState(() {
            _selected = opt;
          });
        }
      )
      )
      ],
    );
  }
    Widget _createPeople(){
    return ListTile(
      title: Text("Nombre es: $_name"),
      subtitle: Text("Correo: $_email"),
      trailing: Text(_selected),
    );
  }
}