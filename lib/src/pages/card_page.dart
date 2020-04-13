import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo(),
          SizedBox(height: 30.0),
          _cardTypeOne(),
          SizedBox(height: 30.0),
          _cardTypeTwo()
        ],
      ),
    );
  }
  Widget _cardTypeOne(){
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Lorem Ipsum'),
            subtitle: Text('There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                onPressed: (){},
                child: Text("Cancelar")
              ),
              FlatButton(
                onPressed: (){},
                child: Text("Ok")
              )
            ],
          )
        ],
      ),
    );
  }
  Widget _cardTypeTwo(){
      final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://cdn.pixabay.com/photo/2016/10/26/06/37/uncle-hos-lake-1770734_960_720.jpg'),
            placeholder: AssetImage('assets/loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            fit: BoxFit.cover,
          ),

          // Image(
          //   image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No tengo idea de que poner')
          )
        ],
      ),
    );


    return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}