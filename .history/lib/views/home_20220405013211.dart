import 'package:flutter/material.dart';
import 'package:pairings/views/signin.dart';
import './settings.dart';
import './saved.dart';
import './search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          'pairings',
          style: TextStyle(fontFamily: 'Azonix', fontSize: 25),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(
                "John Doe",
                style: TextStyle(fontSize: 30),
              ),
              accountEmail: null,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          "http://thecardinalscellar.com/media/wysiwyg/the-ten-golden-rules-for-perfect-wine-pairing.jpg"),
                      opacity: 90)),
            ),
            new ListTile(
              title: new Text("Sign In"),
              trailing: new Icon(Icons.person, color: Colors.white),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => new SigninScreen()));
              },
            ),
            new ListTile(
                title: Text("Saved"),
                trailing: new Icon(Icons.bookmark, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => new SavedPage()));
                }),
            new ListTile(
                title: Text("Settings"),
                trailing: new Icon(Icons.settings, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => new SettingsPage()));
                }),
            new ListTile(
              title: Text("Help"),
              trailing: new Icon(Icons.help_outlined, color: Colors.white),
            ),
            new Divider(color: Colors.white),
            new ListTile(
              title: Text("Close"),
              trailing: new Icon(Icons.cancel, color: Colors.white),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Container(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Text(
                    'Search',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new SearchPage()));
                      },
                      child: const Text(
                        'Individual',
                        style: TextStyle(fontSize: 25),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          side: BorderSide(
                            width: 2.0,
                            color: Colors.white,
                          ),
                          fixedSize: Size(240, 80),
                          padding: EdgeInsets.all(0)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Pairings',
                        style: TextStyle(fontSize: 25),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        side: BorderSide(
                          width: 2.0,
                          color: Colors.white,
                        ),
                        fixedSize: Size(240, 80),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              Text('Featured',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 25,
              ),
              Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                "./lib/assets/images/BackgroundImage2.jpg"))),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "Silver Oak Cabernet Sauvingon",
                  style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
        ],
      ),
    );
  }
}
