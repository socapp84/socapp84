import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socapp/anti_gir.dart';
import 'package:socapp/top_part.dart';

class Secim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => Anasayfa());
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        //değişen kısım
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topCenter,
              colors: [
                Color(0xFFC3B1F4),
                Color(0xFFFDF6E3),
              ]),
        ),
        //buraya kadar
        child: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width * 0.53,
              top: MediaQuery.of(context).size.height * 0.4,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => Anti_gir());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: MediaQuery.of(context).size.height * 0.19,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Ekran Görüntüsü (1178).png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xFF000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.04,
              top: MediaQuery.of(context).size.height * 0.4,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.42,
                height: MediaQuery.of(context).size.height * 0.19,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Ekran Görüntüsü (1198).png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xFF000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
