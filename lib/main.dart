import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'model/mountain_model.dart';
// import 'mountain_provider.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '百名山一覧',
      home: Hyakumeizans(),
    );
  }
}

// This will be changed appropriate name
class Hyakumeizans extends StatefulWidget {
  @override
  HyakumeizansState createState() => HyakumeizansState();
}


// This will be changed to the Name & Prefecture of Hyakumeizan
class HyakumeizansState extends State<Hyakumeizans> {
  List<Mountain> _mountainList = <Mountain>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);


  // for loading json file which has hyakumeizans' data
  Future<void> loadJsons() async {
    HyakumeizanList list = new HyakumeizanList();
    String raw = await rootBundle.loadString('json/hyakumeizan_list.json');
    List jsonData = json.decode(raw);
    list = new HyakumeizanList.fromJson(jsonData);
    _mountainList = list.hyakumeizans;
  }

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
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百名山一覧'),
      ),
      body: _buildList(),
    );
  }
}

