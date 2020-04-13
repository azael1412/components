import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> items = ['uno', 'dos', 'tres', 'cuatro'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Componentes"),
      ),
      body: ListView(
        children: _createSmallItem()
      ),
      );
  }
  List<Widget> _createItems(){
    List<Widget> list = new List<Widget>();
    for (var item in items) {
      final tempWidget = ListTile(
        title: Text(item),
      );
      list..add(tempWidget)
      ..add(Divider());
    }
    return list;
  }
  List<Widget> _createSmallItem(){
    return items.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item+ '!!'),
            subtitle: Text("Cualquier cosa"),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider()
        ],
      );
    }).toList();
   // return widgets;
  }
}