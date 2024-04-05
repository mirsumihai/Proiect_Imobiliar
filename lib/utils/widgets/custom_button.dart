import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function()? onBtnTap; //? se asigura ca nu are null object!
  final Color iconColor, backgroundColor;
  const ButtonWidget({Key? key, required this.icon, this.onBtnTap, required this.iconColor, required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //! inseamna ca nu are o valoare NULL
        onBtnTap!();
      },
      child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                  color: Colors.white
              ),
              borderRadius: BorderRadius.circular(
                  36.0)), //borders, culoare de background, etc
          child: Icon(icon, color: iconColor)),
    );
  }
}
