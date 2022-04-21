import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pairings/models/wine.dart';
import 'package:pairings/models/wine_pairing_model.dart';
import '../models/food_search_model.dart';
import '../models/food_result_data.dart';
import '../widgets/search_widget.dart';
import '../services/food_api_services.dart';
import '../models/dish_pairing_model.dart';
import '../services/wine_api_servies.dart';

class PairingsSearchPage extends StatefulWidget {
  @override
  const PairingsSearchPage({Key? key}) : super(key: key);

  @override
  State<PairingsSearchPage> createState() => _PairingsSearchState();
}

class _PairingsSearchState extends State<PairingsSearchPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  late DishPairingModel? result;
  List<String>? dishPairings = [];
  late WinePairingModel? winePairingResult;
  List<String>? winePairings = [];
  String query = '';
  Timer? debouncer;
  late FoodResult foodResults;

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
    final result = await FoodApiServices.getDishPairing(query);
    final dishPairings = result?.pairings;

    final winePairingResult = await WineApiServices.getWinePairing(query);
    final winePairings = winePairingResult?.pairedWines;

    setState(() {
      this.dishPairings = dishPairings;
      this.result = result;

      this.winePairings = winePairings;
      this.winePairingResult = winePairingResult;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Pairings Search',
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
         * INPUT WINE SEARCH TAB
         */
        Column(
          children: <Widget>[
            buildWinePairingSearch(),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.white,
                      ),
                  itemCount: dishPairings == null ? 0 : dishPairings!.length,
                  itemBuilder: (context, index) {
                    return buildWinePairingResults(dishPairings![index]);
                  }),
            ),
          ],
        ),
        /**
         * INPUT FOOD SEARCH TAB
         */
        Column(
          children: <Widget>[
            buildDishPairingSearch(),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.white,
                      ),
                  itemCount: winePairings == null ? 0 : winePairings!.length,
                  itemBuilder: (context, index) {
                    return buildWinePairingResults(winePairings![index]);
                  }),
            ),
          ],
        ),
      ]),
    );
  }

  /**
   * METHODS FOR INPUTTED WINE TO DISH PAIRING SEARCH
   */
  Widget buildWinePairingSearch() => SearchWidget(
        text: query,
        hintText: 'ex. Cabernet Sauvingon',
        onChanged: searchWinePairing,
      );

  Widget buildWinePairingResults(String pairing) => ListTile(
        title: Text(
          pairing,
          style: TextStyle(color: Colors.white),
        ),
        //trailing: IconButton(onPressed: (), icon: Icons.bookmark),
      );

  Future searchWinePairing(String query) async => debounce(() async {
        final result = await FoodApiServices.getDishPairing(query);
        final dishPairings = result?.pairings;

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.dishPairings = dishPairings;
        });
      });

/**
 * METHODS FOR INPUTTED FOOD TO WINE PAIRING SEARCH
 */
  Widget buildDishPairingSearch() => SearchWidget(
        text: query,
        hintText: 'ex. Chicken Alfredo',
        onChanged: searchDishPairing,
      );
  Widget buildDishPairingResults(String pairing) => ListTile(
        title: Text(
          pairing,
          style: TextStyle(color: Colors.white),
        ),
        //trailing: IconButton(onPressed: (), icon: Icons.bookmark),
      );

  Future searchDishPairing(String query) async => debounce(() async {
        final winePairingResult = await WineApiServices.getWinePairing(query);
        final winePairings = winePairingResult?.pairedWines;

        if (!mounted) return;

        setState(() {
          this.winePairings = winePairings;
          this.winePairingResult = winePairingResult;
        });
      });
}
