import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listnumbers = new List();
  int _last = 0;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _addTen();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
         print("scroll");
         _fetchData();
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
        body: Stack(
          children: <Widget>[
             _createList(),
             _createLoading(),
          ],
        ) 
    );
  }
  Widget _createList(){
    return RefreshIndicator(
      onRefresh: _getPageOne,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listnumbers.length,
        itemBuilder: (BuildContext context,int index){
          final image = _listnumbers[index];
          return FadeInImage(
            placeholder: AssetImage('assets/loading.gif')
          , image: NetworkImage(
            'https://picsum.photos/500/300/?image=$image'
            ));
        }
        ),
    );
  }
  void _addTen(){
    for (var i = 1; i < 10; i++) {
      _last++;
      _listnumbers.add(_last);
    }
    setState(() {
      
    });
  }
  Future<Null> _fetchData() async{
    _isLoading = true;
    setState(() {
      
    });
    final duration = new Duration( seconds: 2);
    return new Timer(duration, responseHttp);
  }
  void responseHttp(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: new Duration( milliseconds: 250),
      curve: Curves.fastOutSlowIn);
    _addTen();
  }
  _createLoading(){
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
        
    }else{
      return Container();
    }
  }
  Future<Null> _getPageOne() async{
    final duration = new Duration( seconds: 2);
    new Timer(duration, (){
      _listnumbers.clear();
      _last++;
      _addTen();
    });
    return Future.delayed(duration);
  }
}