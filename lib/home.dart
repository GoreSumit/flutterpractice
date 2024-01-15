import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/app_drawer.dart';
import 'package:flutterpractice/locations.dart';
import 'package:flutterpractice/screens.dart';

class HomeScreen extends StatelessWidget {
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: AppDrawer(beamerKey: _beamerKey,),
      body: Row(
        children: [
          Container(
            color: Colors.blue[300],
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/books',
                  child: Text('Books'),
                ),
                SizedBox(height: 16.0),
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/articles',
                  child: Text('Articles'),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Colors.blue),
          if ((context.currentBeamLocation.state as BeamState).uri.path.isEmpty)
            Expanded(
              child: Container(
                child: Center(
                  child: Text('Home'),
                ),
              ),
            )
          else
            Expanded(
              child: ClipRRect(
                child: Beamer(
                  key: _beamerKey,
                  routerDelegate: BeamerDelegate(
                    transitionDelegate: const NoAnimationTransitionDelegate(),
                    locationBuilder: (routeInformation, _) =>
                        routeInformation.location!.contains('articles')
                            ? ArticlesLocation(routeInformation)
                            : BooksLocation(routeInformation),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

