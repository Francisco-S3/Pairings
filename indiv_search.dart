import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pairings/views/food_product_info.dart';
import '../controllers/favorite_controller.dart';
import '../models/food.dart';
import '../models/recipe_result.dart';
import '../models/wine.dart';
import '../models/wine_recommendation_model.dart';
import '../widgets/search_widget.dart';
import '../services/food_api_services.dart';
import '../services/wine_api_servies.dart';
import '../config/globals.dart' as globals;
import 'signin.dart';

/// Individual Search Class
/// class used to perform a search of wine or food type
/// results of specific matches are returned
class IndivSearchPage extends StatefulWidget {
  @override
  const IndivSearchPage({Key? key}) : super(key: key);

  @override
  State<IndivSearchPage> createState() => _IndivSearchState();
}

class _IndivSearchState extends State<IndivSearchPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  late RecipeResult? foodRecommendationResult;
  List<Food>? foodRecommendations = [];
  Food? food;
  late WineRecommendationModel? wineRecommendationResult;
  List<Wine>? wineRecommendations = [];
  String wineQuery = '';
  String foodQuery = '';
  Timer? debouncer;

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
    final foodRecommendationResult =
        await FoodApiServices.searchRecipe(foodQuery);
    final foodRecommendations = foodRecommendationResult?.results;

    final wineRecommendationResult =
        await WineApiServices.getWineRecommendation(wineQuery);
    final wineRecommendations = wineRecommendationResult?.recommendedWines;

    setState(() {
      this.foodRecommendationResult = foodRecommendationResult;
      this.foodRecommendations = foodRecommendations;

      this.wineRecommendationResult = wineRecommendationResult;
      this.wineRecommendations = wineRecommendations;
    });
  }

  @override
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
              Tab(text: 'Wine'),
              Tab(text: 'Food'),
            ]),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        /// Wine Type tab listview builder
        // takes a wine input parameter and returns WINE product matches
        Column(
          children: <Widget>[
            buildWineRecommendationSearch(),
            Expanded(
              child: InkWell(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.white,
                        ),
                    itemCount: wineRecommendations == null
                        ? 0
                        : wineRecommendations!.length,
                    itemBuilder: (context, index) {
                      return buildWineRecommendationResults(
                          wineRecommendations![index]);
                    }),
                onTap: () {},
              ),
            ),
          ],
        ),

        /// Food Type tab listview builder
        // takes a food input parameter and returns FOOD product matches
        Column(
          children: <Widget>[
            buildFoodRecommendationSearch(),
            Expanded(
              child: InkWell(
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.white,
                        ),
                    itemCount: foodRecommendations == null
                        ? 0
                        : foodRecommendations!.length,
                    itemBuilder: (context, index) {
                      food = foodRecommendations![index];
                      return buildFoodRecommendationResults(
                          foodRecommendations![index]);
                    }),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             FoodProductPage(foodResult: food)));
                },
              ),
            ),
          ],
        ),
      ]),
    );
  }

  /// Methods for Wine Type Search
  Widget buildWineRecommendationSearch() => SearchWidget(
        text: wineQuery,
        hintText: 'ex. Merlot',
        onChanged: searchWineRecommendation,
      );

  Future searchWineRecommendation(String wineQuery) async => debounce(() async {
        final result = await WineApiServices.getWineRecommendation(wineQuery);
        final wineRecommendations = result?.recommendedWines;

        if (!mounted) return;

        setState(() {
          this.wineQuery = wineQuery;
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
          // TODO ******************************
          // TODO - TITLE DOESN'T WORK RIGHT NOW
          // TODO - USE ID AND CHANGE BACK LATER
          // TODO ******************************
          //recommend.title,
          recommend.title.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '${recommend.price}',
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.bookmark),
          color: Colors.white,
          onPressed: () async {
            !globals.isLoggedIn
                ? Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const SigninScreen()))
                : null;
            // pass to favoriteController for add to user favorites
            if (await FavoriteController.createFavorite(
                '0', recommend.id.toString())) {
              // alert user confirmation of addition to favorites
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Success!  Item added to favorites'),
                ),
              );
            } else {
              // alert user failed addition to favorites
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error!  Item not added, try again'),
                ),
              );
            }
            setState(() {});
          },
        ),
      );

  /// METHODS FOR INPUTTED FOOD TO WINE PAIRING SEARCH
  Widget buildFoodRecommendationSearch() => SearchWidget(
        text: foodQuery,
        hintText: 'ex. Chicken Alfredo',
        onChanged: searchFoodRecommendation,
      );

  Future searchFoodRecommendation(String foodQuery) async => debounce(() async {
        final foodRecommendationResult =
            await FoodApiServices.searchRecipe(foodQuery);
        final foodRecommendations = foodRecommendationResult?.results;

        if (!mounted) return;

        setState(() {
          this.foodQuery = foodQuery;
          this.foodRecommendationResult = foodRecommendationResult;
          this.foodRecommendations = foodRecommendations;
        });
      });

  Widget buildFoodRecommendationResults(Food recommend) => ListTile(
        leading: Image.network(
          recommend.image,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(
          recommend.title,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.bookmark),
          color: Colors.white,
          onPressed: () async {
            !globals.isLoggedIn
                ? Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const SigninScreen()))
                : null;
            // pass to favoriteController for add to user favorites
            if (await FavoriteController.createFavorite(
                recommend.id.toString(), '0')) {
              print(await FavoriteController.readFavorite(
                  globals.currentUser.id!));
              // alert user confirmation of addition to favorites
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Success!  Item added to favorites'),
                ),
              );
            } else {
              // alert user failed addition to favorites
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error!  Item not added, try again'),
                ),
              );
            }
            setState(() {});
          },
        ),
      );
}
