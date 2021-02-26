import 'package:flutter/material.dart';
import 'package:learn_app_state_with_provider/models/photo_model.dart';
import 'package:provider/provider.dart';
import 'package:learn_app_state_with_provider/models/bottom_navigation_model.dart';

class TitleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Provider.of<BottomNavigationData>(context).colorData[0],
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: Provider.of<List<Photo>>(context).length,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                'Index $index : ${Provider.of<List<Photo>>(context)[index].title}',
              ),
            );
          },
        ));
  }
}
