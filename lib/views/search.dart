import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  @override
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _IndivSearchState();
  // State<Search> createState() => _pairingsSearchState();
}

class _IndivSearchState extends State<SearchPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
                text: 'Wine',
              ),
              Tab(
                text: 'Food',
              )
            ]),
      ),
      body: TabBarView(controller: _tabController, children: const <Widget>[
        Center(
          child: Text('Search for a wine'),
        ),
        Center(
          child: Text('Search for a food'),
        )
      ]),
    );
  }
}

// class _pairingsSearchState extends State<Search> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//         child: NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return <Widget>[
//           CupertinoSliverNavigationBar(
//             largeTitle: Text('Search'),
//           )
//         ];
//       },
//       body: Center(
//         child: Text('Search page'),
//       ),
//     ));
//   }
// }

// class DataSearch extends SearchDelegate<String> {
//   final results = [
//     "Stella Rosa Black",
//     "Robert Mendavi Cabernet Sauvingon",
//     "19 Crimes Cali Red",
//     "Barefoot Pinot Grigio"
//   ];
//   final suggestions = [
//     "Stella Rosa Black",
//     "Robert Mendavi Cabernet Sauvingon"
//   ];

  // @override
  // List<Widget>? buildActions(BuildContext context) {
  //   return [IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
  // }

  // @override
  // Widget? buildLeading(BuildContext context) {
  //   // leading icon on left of the app bar
  //   throw UnimplementedError();
  // }

  // @override
  // Widget buildResults(BuildContext context) {
  //   // Show results based on selection
  //   throw UnimplementedError();
  // }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   final suggestionList = query.isEmpty ? suggestions : results;

  //   return ListView.builder(
  //     itemBuilder: (context, index) => ListTile(
  //       leading: Icon(Icons.wine_bar),
  //       title: Text(suggestionList[index]),
  //     ),
  //     itemCount: suggestionList.length,
  //   );
  // }
//}
