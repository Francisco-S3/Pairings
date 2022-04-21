import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pairings/models/wine.dart';
import 'package:pairings/models/wine_recommendation_model.dart';
import '../models/food_search_model.dart';
import '../widgets/search_widget.dart';
import '../services/food_api_services.dart';
import '../models/dish_pairing_model.dart';
import '../services/wine_api_servies.dart';

class IndivSearchPage extends StatefulWidget {
  @override
  const IndivSearchPage({Key? key}) : super(key: key);

  @override
  State<IndivSearchPage> createState() => _IndivSearchState();
}

class _IndivSearchState extends State<IndivSearchPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  late DishPairingModel? result;
  List<String>? dishPairings = [];
  late WineRecommendationModel? wineRecommendationResult;
  List<Wine>? wineRecommendations = [];
  String query = '';
  Timer? debouncer;
  late FoodResult foodResults;

  @override
  void initState() {
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
    final result = await FoodApiServices.getDishPairing(query);
    final dishPairings = result?.pairings;

    final wineRecommendationResult = await WineApiServices.getWineRecommendation(query);
    final wineRecommendations = wineRecommendationResult?.recommendedWines;

    setState(() {
      this.dishPairings = dishPairings;
      this.result = result;

      this.wineRecommendationResult = wineRecommendationResult;
      this.wineRecommendations = wineRecommendations;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Individual Search',
          style: TextStyle(fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
        bottom: TabBar(
            indicatorColor: const Color.fromARGB(255, 78, 40, 69),
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: 'Wine Type',
              ),
              Tab(
                text: 'Food Type',
              )
            ]),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[

        /** INPUT WINE SEARCH TAB */
        // takes a wine input parameter and returns WINE product matches
        Column(
          children: <Widget>[
            buildWineRecommendationSearch(),
            Expanded(
              child: ListView.builder(
                  itemCount: wineRecommendations == null ? 0 : wineRecommendations?.length,
                  itemBuilder: (context, index) {
                    return buildWineRecommendationResults(wineRecommendations![index]);
                  }),
            ),
          ],
        ),


        /**
         * INPUT FOOD SEARCH TAB
         */
        // takes a food input parameter and returns FOOD product matches
        Column(
          children: <Widget>[
            buildDishPairingSearch(),
            Expanded(
              child: ListView.builder(
                  itemCount: wineRecommendations == null ? 0 : wineRecommendations?.length,
                  itemBuilder: (context, index) {
                    return buildWineRecommendationResults(wineRecommendations![index]);
                  }),
            ),
          ],
        ),
      ]),
    );
  }


  /// METHODS FOR INPUTTED WINE SEARCH
  Widget buildWineRecommendationSearch() => SearchWidget(
        text: query,
        hintText: 'ex. Merlot',
        onChanged: searchWineRecommendation,
      );

  Future searchWineRecommendation(String query) async => debounce(() async {
    final result = await WineApiServices.getWineRecommendation(query);
    final wineRecommendations = result?.recommendedWines;

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.wineRecommendations = wineRecommendations;
    });
  });

  Widget buildWineRecommendationResults(Wine recommend) => ListTile(
      leading: Image.network(
        recommend.imageUrl,
        fit: BoxFit.cover,
        width: 50,
        height: 50,
      ),
      title: Text(
        recommend.title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        'Description: ${recommend.description}',
        style: const TextStyle(color: Colors.grey),
      ),
      );


  /// METHODS FOR INPUTTED FOOD TO WINE PAIRING SEARCH
  Widget buildDishPairingSearch() => SearchWidget(
        text: query,
        hintText: 'ex. Chicken Alfredo',
        onChanged: searchDishRecommendation,
      );

  Future searchDishRecommendation(String query) async => debounce(() async {
    final wineRecommendationResult = await WineApiServices.getWineRecommendation(query);
    final wineRecommendations = wineRecommendationResult?.recommendedWines;

    if (!mounted) return;

    setState(() {
      this.wineRecommendationResult = wineRecommendationResult;
      this.wineRecommendations = wineRecommendations;
    });
  });

  Widget buildDishRecommendationResults(String pairing) => ListTile(
        title: Text(
          pairing,
          style: const TextStyle(color: Colors.white),
        ),
        //trailing: IconButton(onPressed: (), icon: Icons.bookmark),
      );
}
