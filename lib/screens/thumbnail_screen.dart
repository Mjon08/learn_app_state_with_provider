import 'package:flutter/material.dart';
import 'package:learn_app_state_with_provider/models/bottom_navigation_model.dart';
import 'package:learn_app_state_with_provider/models/photo_model.dart';
import 'package:provider/provider.dart';

class ThumbnailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Provider.of<BottomNavigationData>(context).colorData[1],
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: Provider.of<List<Photo>>(context).length,
          itemBuilder: (context, index) {
            return Image.network(
                Provider.of<List<Photo>>(context)[index].thumbnailUrl);
          },
        ));
  }
}
