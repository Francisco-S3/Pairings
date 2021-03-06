import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SavedPage extends StatefulWidget {
  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> with TickerProviderStateMixin {
  bool lockInBackground = false;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
        ],
        bottom: TabBar(
            indicatorColor: Color.fromARGB(255, 78, 40, 69),
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: 'Individual',
              ),
              Tab(
                text: 'Pairings',
              )
            ]),
      ),
      body: TabBarView(controller: _tabController, children: const <Widget>[
        Center(
          child: Text('See saved individual items'),
        ),
        Center(
          child: Text('See saved pairings'),
        )
      ]),
    );
  }
}
