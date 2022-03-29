import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _IndivSearchState();
  // State<Search> createState() => _PairingsSearchState();
}

class _IndivSearchState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Search'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list), onPressed: () {})
        ],
      ),
    );
  }
}

// class _PairingsSearchState extends State<Search> {
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

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Actions for app bar
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on left of the app bar
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show results based on selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    throw UnimplementedError();
  }
}
