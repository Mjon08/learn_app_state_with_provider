import 'package:flutter/material.dart';
import 'package:learn_app_state_with_provider/models/photo_model.dart';
import 'package:provider/provider.dart';
import 'package:learn_app_state_with_provider/models/bottom_navigation_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<BottomNavigationData>(
        create: (_) => BottomNavigationData(),
      ),
      FutureProvider<List<Photo>>(
        create: (_) async => Photo().fetchPhotos(http.Client()),
        initialData: [
          Photo(
              url: '',
              title: 'Tidak ATestda',
              thumbnailUrl: '',
              id: 0,
              albumId: 0)
        ],
      )
    ],
    child: BottomNavigationWidget(),
  ));
}

class BottomNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var botNav = Provider.of<BottomNavigationData>(context);
    return MaterialApp(
      home: Scaffold(
        body: Center(child: botNav.widgetOptions()),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            barItem(Icons.home, 'Home'),
            barItem(Icons.business, 'Business'),
            barItem(Icons.school, 'School'),
          ],
          currentIndex:
              Provider.of<BottomNavigationData>(context).selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: Provider.of<BottomNavigationData>(context, listen: false)
              .setSelectedIndex,
        ),
      ),
    );
  }

  BottomNavigationBarItem barItem(IconData iconData, String label) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
    );
  }
}
