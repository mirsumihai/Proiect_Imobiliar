import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/common/color_constants.dart';
import 'house_grid.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: HouseGridWidget(
        houses: Constants.houseList.where((house) => house.isFavorite).toList(),
      ),
    );
  }
}