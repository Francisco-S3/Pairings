import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pairings/models/wine.dart';
import 'package:pairings/services/wine_api_servies.dart';
import '../controllers/search_controller.dart';
import '../models/food_search_model.dart';
import '../widgets/search_widget.dart';
import '../services/food_api_services.dart';
import '../models/wine_recommendation_model.dart';

class IndivSearchPage extends StatefulWidget {
  @override
  const IndivSearchPage({Key? key}) : super(key: key);

  @override
  State<IndivSearchPage> createState() => _IndivSearchState();
}

class _IndivSearchState extends State<IndivSearchPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // List<FoodResult> foodResults = [];
  // List<Wine>? wineResults = [];
  // late FoodSearchModel foodModelResults;
  // late WineRecommendationModel wineModelResults;
  // List<FoodSearchResult>? foodSearchResults = [];
  // String query = '';
  // Timer? debouncer;

  List<FoodSearchModel>? foodModelResults = [];
  List<FoodSearchResult>? foodSearchResults = [];
  List<FoodResult>? foodResults = [];
  late String? foodResultsOne;
  FoodSearchResult? food;
  FoodResult? foo;

  List<Wine>? wineResults = [];
  late WineRecommendationModel wineModelResults;
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final foodModelResults = await FoodApiServices.searchFood(query);
    final wineModelResults = await WineApiServices.getWineRecommendation(query);

    foodSearchResults = foodModelResults?.searchResults;
    wineResults = wineModelResults?.recommendedWines;
    setState(() {
      this.wineResults = wineResults;
    });

    setState(() {
      this.foodSearchResults = foodSearchResults;
    });
  }

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
                text: 'Wine',
              ),
              Tab(
                text: 'Food',
              )
            ]),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        /**
         * INDIVIDUAL WINE SEARCH TAB
         */
        Column(
          children: <Widget>[
            buildWineSearch(),
            Expanded(
              child: ListView.builder(
                  itemCount: wineResults!.length,
                  itemBuilder: (context, index) {
                    final wineResult = wineResults![index];

                    return buildWineResults(wineResult);
                  }),
            ),
          ],
        ),
        /**
         * INDIVIDUAL FOOD SEARCH TAB
         */
        Column(
          children: <Widget>[
            buildFoodSearch(),
            Expanded(
              child: ListView.builder(
                  itemCount: foodResults!.length,
                  itemBuilder: (context, index) {
                    final foodResult =
                        foodSearchResults![index].results![index];

                    return buildFoodResults(foodResult);
                  }),
            ),
          ],
        ),
      ]),
    );
  }

  /**
   * METHODS FOR WINE SEARCH
   */
  Widget buildWineSearch() => SearchWidget(
        text: query,
        hintText: 'ex. Cabernet Sauvingon',
        onChanged: searchWine,
      );

  Widget buildWineResults(Wine? wineResult) => ListTile(
        // leading: Image.asset(
        //   "lib/assets/images/BackgroundImage2.jpg",
        leading: Image.network(
          wineResult!.imageUrl!,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(
          wineResult.title!,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          "Type",
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Icon(Icons.bookmark, color: Colors.grey),
      );

  Future searchWine(String query) async {
    final wineModelResults = await WineApiServices.getWineRecommendation(query);

    if (!mounted) return;

    wineResults = wineModelResults!.recommendedWines;

    setState(() {
      this.query = query;
      this.wineResults = wineResults;
    });
  }

/**
 * METHODS FOR FOOD SEARCH
 */
  Widget buildFoodSearch() => SearchWidget(
        text: query,
        hintText: 'ex. Chicken Alfredo',
        onChanged: searchFood,
      );
  Widget buildFoodResults(FoodResult foodResult) => ListTile(
        leading: Image.network(
          foodResult.image!,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(
          foodResult.name!,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          "Type",
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Icon(Icons.bookmark, color: Colors.grey),
      );

  void searchFood(String query) async {
    final foodModelResults = await FoodApiServices.searchFood(query);
    foodSearchResults = foodModelResults?.searchResults;

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.foodSearchResults = foodSearchResults;
    });
  }
}
