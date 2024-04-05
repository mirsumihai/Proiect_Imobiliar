import 'package:flav/features/home/ui/mobile/house_ad_widget.dart';
import 'package:flav/utils/common/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../models/house_model.dart';
import '../../../../utils/widgets/custom_button.dart';
import '../desktop/favorites_page.dart';
import 'filter_widget.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  final filterList = ['<\$100.000', '2 bedrooms', '1 bedroom', '2bathrooms'];

  String activeFilter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          //o singura coloana cu mai multe randuri
          children: [

            Row(
              children: [
                ButtonWidget(
                  icon: Icons.menu,
                  onBtnTap: () {
                    print('Am apasat meniu');
                  },
                  iconColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                Text(
                  'Imobiliare',
                  style: GoogleFonts.manrope(
                    fontSize: 36,
                    color: ColorConstant.kBlackColor,
                  ),
                ),
                ButtonWidget(
                  icon: Icons.refresh,
                  onBtnTap: () {
                    print('Am apasat refresh');
                  },
                  iconColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                ButtonWidget(
                  icon: Icons.favorite,
                  onBtnTap: () {
                    // Navigate to the favorites page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesPage()));

                  },
                  iconColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'City',
              style: GoogleFonts.manrope(
                fontSize: 12,
                color: ColorConstant.kGreyColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Cluj-Napoca',
              style: GoogleFonts.manrope(
                fontSize: 30,
                color: ColorConstant.kBlackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Divider(color: ColorConstant.kGreyColor, thickness: 0.2),
            SizedBox(
              height: 50,
              child: ListView.builder(scrollDirection:Axis.horizontal,
                itemCount: filterList.length,
                itemBuilder: (context, index) {
                  return FilterWidget(
                      filterTxt: filterList[index],
                      isActive: activeFilter == filterList[index] ? true : false,
                    onBtnTap:(){
                        setState(() {
                          if(activeFilter==filterList[index]){
                            activeFilter='';
                          }else{
                            activeFilter=filterList[index];
                          }
                        });
                    }

                  );
                },

              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: List.generate(Constants.houseList.length, (index) {
                House house= Constants.houseList[index];
                if (isFiltered(house.price,house.bedrooms,house.bathrooms)) {
                  return Padding(padding: const EdgeInsets.only(top:16),
                    child: HouseAdWidget(
                      house:house,
                      imgPathIndex:index,
                    ),);
                } else {
                  return const SizedBox(height: 23,);
                }}),
            )

          ],
        ),
      ),
    );
  }

  bool isFiltered(price, bedrooms, bathrooms) {
    if(activeFilter.isEmpty) return true;
    if (activeFilter.contains('bedroom')) {
      if (activeFilter[0] == '1' && bedrooms == 1) {
        return true;
      } else if (activeFilter[0] == '2' && bedrooms == 2) {
        return true;
      }
    }
    if (activeFilter.contains('bath')) {
      if (activeFilter[0] == '1' && bathrooms == 1) {
        return true;
      } else if (activeFilter[0] == '2' && bathrooms == 2) {
        return true;
      }
    }
    if (activeFilter.contains('\$')) {
      if (price < 100000) {
        return true;
      }
    }
    return false;
  }

}
