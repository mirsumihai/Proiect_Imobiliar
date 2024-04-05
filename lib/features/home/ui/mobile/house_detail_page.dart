import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flav/features/home/ui/mobile/home_mobile_page.dart';
import 'package:flav/utils/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../models/house_model.dart';
import '../../../../utils/common/color_constants.dart';
import '../desktop/home_desktop_page.dart';
import 'house_property_widget.dart';

class ItemDetailScreen extends StatefulWidget {
  final House house;
  final int imgPathIndex;

  const ItemDetailScreen({Key? key, required this.house, required this.imgPathIndex}) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  late var propertiesMap = {};
  late var keys = [];

  @override
  void initState() {
    propertiesMap = {
      "Square meters": widget.house.squareMeters,
      "Bedroom": widget.house.bedrooms,
      "Bathroom": widget.house.bathrooms,
      "Garage": widget.house.garages,
      "Kitchen": widget.house.kitchens,
    };
    keys = propertiesMap.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    final oCcy = NumberFormat("##,###,###", "en_INR");
    return Scaffold(
      backgroundColor: ColorConstant.kWhiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 25, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(),
                    items: Constants.imageList.map((item) => Center(child: Image.asset(item, fit: BoxFit.cover, width: screenWidth))).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      right: 16,
                      left: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ButtonWidget(
                          icon: Icons.arrow_back,
                          onBtnTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeMobilePage()));
                          },
                          iconColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        ButtonWidget(
                          icon: widget.house.isFavorite ? Icons.favorite : Icons.favorite_border,
                          iconColor: widget.house.isFavorite ? Colors.redAccent : Colors.white,
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${oCcy.format(widget.house.price)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            widget.house.address,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Colors.white24,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "${Random().nextInt(24)} hours ago",
                            style: Theme.of(context).textTheme.caption?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  left: 16,
                ),
                child: Text(
                  "House Information",
                  style: GoogleFonts.notoSans(
                    fontSize: 20,
                    color: ColorConstant.kBlackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                  children: List.generate(
                    keys.length,
                        (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: HousePropertyWidget(
                          type: keys[index],
                          value: propertiesMap[keys[index]].toString(),
                        ),
                      );
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  "Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    color: ColorConstant.kGreyColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

