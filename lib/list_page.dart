import 'package:flutter/material.dart';
import 'model/mountain_model.dart';
import 'detail.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

List<Mountain> _mountainList = <Mountain>[];

// for loading json file which has hyakumeizans' data
Future<void> loadJsons() async {
  HyakumeizanList list = new HyakumeizanList();
  String raw = await rootBundle.loadString('json/hyakumeizan_list.json');
  List jsonData = json.decode(raw);
  list = new HyakumeizanList.fromJson(jsonData);
  _mountainList = list.hyakumeizans;
}

class ListPage extends StatefulWidget {
  @override
  _HyakumeizanListPage createState() => _HyakumeizanListPage();
}


class _HyakumeizanListPage extends State<ListPage> {

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildList() {
    loadJsons();

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _mountainList.length,
      itemBuilder: (context, int index) {
        return _buildRow(_mountainList[index]);
      });
  }

  Widget _buildRow(Mountain mountain) {
    return ListTile(
      title: Text(
        mountain.name,
        style: _biggerFont,
      ),
      trailing: FlatButton(
        onPressed: (){
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HyakumeizansDetail(mountain:mountain)),
        );},
        color: Colors.blue,
        child: Text(
          '詳細',
          style: TextStyle(
            color:Colors.white,
            fontSize: 16.0
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百名山一覧'),
      ),
      body: _buildList(),
    );
  }
}