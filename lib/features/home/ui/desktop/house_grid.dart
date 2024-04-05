import 'package:flutter/cupertino.dart';

import '../../../../models/house_model.dart';
import '../mobile/house_ad_widget.dart';

class HouseGridWidget extends StatelessWidget {
  final List<House> houses;

  HouseGridWidget({super.key, required this.houses});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        childAspectRatio: 1,
        mainAxisSpacing: 0.1,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: houses.length,
      itemBuilder: (context, index) {
        House house = houses[index];
        return HouseAdWidget(
          house: house,
          imgPathIndex: index,
        );
      },
    );
  }
}