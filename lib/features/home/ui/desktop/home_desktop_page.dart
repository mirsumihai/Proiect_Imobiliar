import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../models/house_model.dart';
import '../../../../utils/common/color_constants.dart';
import '../../../../utils/widgets/custom_button.dart';
import 'house_ad_widget.dart';
import 'favorites_page.dart';

class HomeDesktopPage extends StatefulWidget {
  @override
  State<HomeDesktopPage> createState() => _HomeDesktopPageState();
}
class _HomeDesktopPageState extends State<HomeDesktopPage> {
  final List<String> roomCountValues = ['Any', '1', '2', '3', '4', '5+'];
  final List<String> bathCountValues = ['Any', '1', '2', '3', '4', '5+'];
  final TextEditingController _searchController = TextEditingController();
  String activeFilter = '';
  String selectedRoomCountValue = 'Any';
  String selectedBathCount = 'Any';
  List<House> sortedHouseList = [];
  double minPrice=0;
  double maxPrice=1000000;


  @override
  void initState() {
    sortedHouseList = List.from(Constants.houseList); // Copy the original house list
    super.initState();
  }
  void dropdownCallback_rooms(String? i){
    if(i is String){
      setState(() {
        selectedRoomCountValue=i;
      });
    }
  }
  void dropdownCallback_baths(String? i){
    if(i is String){
      setState(() {
        selectedBathCount=i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/backround.PNG'),

                  fit: BoxFit.cover,
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Imobiliare',
                          style: GoogleFonts.manrope(
                            fontSize: 36,
                            color: ColorConstant.kBlackColor,
                          ),
                        ),
                        Spacer(),
                        ButtonWidget(
                          icon: Icons.favorite,
                          onBtnTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesPage()));
                          },
                          iconColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        ButtonWidget(
                          icon: Icons.refresh,
                          onBtnTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeDesktopPage()));
                          },
                          iconColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'City',
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            color: ColorConstant.kGreyColor,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      activeFilter.isEmpty ? 'Toata Romania' : activeFilter,
                      style: GoogleFonts.manrope(
                        fontSize: 30,
                        color: ColorConstant.kBlackColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search for a city',
                            border: InputBorder.none,
                            filled: false,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(16),
                            prefixIcon: Icon(Icons.search),
                          ),
                          onChanged: (searchText) {
                            if (searchText.isNotEmpty) {
                              setState(() {
                                activeFilter = searchText;
                              });
                            } else {
                              setState(() {
                                // Reset the active filter when the search text is empty
                                activeFilter = '';
                              });
                            }
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            // Reset the city name when the search is cleared
                            activeFilter = '';
                          });
                        },
                      ),
                    ],
                  ),
                  const Divider(color: ColorConstant.kGreyColor, thickness: 0.2),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('Număr camere'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            DropdownButton<String>(
                              items: roomCountValues.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              value: selectedRoomCountValue,
                              onChanged: dropdownCallback_rooms,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Număr bai'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            DropdownButton<String>(
                              items: bathCountValues.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              value: selectedBathCount,
                              onChanged: dropdownCallback_baths,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(width: 16),
                      Expanded(
                        child: RangeSlider(
                          min: 0,
                          max: 1000000,
                          values: RangeValues(minPrice, maxPrice),
                          divisions: 100,
                          labels: RangeLabels(
                            minPrice.toStringAsFixed(0),
                            maxPrice.toStringAsFixed(0),
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              minPrice = values.start.toDouble();
                              maxPrice = values.end.toDouble();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 1,
                  mainAxisSpacing: 0.1,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: sortedHouseList.length,
                itemBuilder: (context, index) {
                  House house = sortedHouseList[index];
                  if (isFiltered(house, house.price, selectedRoomCountValue, selectedBathCount, activeFilter)) {
                    return HouseAdWidget(
                      house: house,
                      imgPathIndex: index,
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isMatchingSearchText(House house, String searchText) {
    if (searchText.isEmpty) return true;
    return house.country.toLowerCase().contains(searchText.toLowerCase())
        || house.city.toLowerCase().contains(searchText.toLowerCase())
        || house.address.toLowerCase().contains(searchText.toLowerCase());
  }

  bool isMatchingRoomCount(House house, String selectedRoomCount) {
    if (selectedRoomCount == 'Any') return true;
    if(selectedRoomCount=='5+')return house.bedrooms>5;
    return house.bedrooms.toString() == selectedRoomCount;
  }

  bool isMatchingBathCount(House house, String selectedBathCount) {
    if (selectedBathCount == 'Any') return true;
    if(selectedBathCount=='5+')return house.bathrooms>5;
    return house.bathrooms.toString() == selectedBathCount;
  }

  bool isFiltered(House house, price, bedrooms, bathrooms, String searchText) {
    if (isMatchingSearchText(house, searchText) &&
        isMatchingRoomCount(house, bedrooms) &&
        isMatchingBathCount(house, bathrooms) &&
        house.price >= minPrice && house.price <= maxPrice) {
      return true;
    }
    return false;
  }


}