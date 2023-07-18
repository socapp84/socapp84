import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socapp/HomeScreen.dart';
import 'package:socapp/bacak_odas%C4%B1.dart';
import 'package:socapp/kardiyo.dart';
import 'package:socapp/karin.dart';
import 'package:socapp/kol_odas%C4%B1.dart';
import 'package:socapp/program_%C3%B6ner.dart';
import 'yorum_ana.dart';
import 'package:socapp/yorum_ana.dart';
import 'package:socapp/firebase_services.dart';
import 'package:socapp/profile.dart';
// YorumAna widget'ının bulunduğu dosyayı import edin
import 'package:socapp/arama.dart';
import 'package:socapp/sirt.dart';
import 'package:socapp/spor_profil.dart';

class Anti_gir extends StatelessWidget {
  const Anti_gir({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final containerWidth = screenSize.width; // Örnek: Ekran genişliğinin %80'i
    final containerHeight = screenSize.height;

    double systemNavigationBarHeight(BuildContext context) {
      return MediaQuery.of(context).padding.bottom;
    }

    // Örnek: Ekran yüksekliğinin %50'si

    return Container(
      width: containerWidth,
      height: containerHeight,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFFDF6E3),
        shape: RoundedRectangleBorder(side: BorderSide(width: 0.50)),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: containerWidth,
              height: containerHeight,
              decoration: BoxDecoration(color: Color(0xFFC3B1F4)),
            ),
          ),
          Positioned(
            left: 0,
            top: containerHeight - containerHeight * 0.06753554502,
            child: Container(
              width: containerWidth,
              height: containerHeight * 0.06753554502,
              decoration: BoxDecoration(color: Color(0xFFFDF6E3)),
            ),
          ),
          Positioned(
            left: containerWidth * 0.32,
            top: containerHeight * 0.26,
            child: GestureDetector(
              onTap: () {
                Get.to(() => kardiyo());
              },
              child: Container(
                width: 164 * 0.75592417061,
                height: 161 * 0.75592417061,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Ekran Görüntüsü (125).png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      width: 0.50,
                      color: Color(0xFF0B0202),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 113,
            top: containerHeight * 0.94194312796,
            child: GestureDetector(
              onTap: () {
                Get.to(() => prog_oner());
              },
              child: Icon(
                Icons.help_outline,
                size: 46 * 0.75592417061,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.60,
            top: containerHeight * 0.666,
            child: GestureDetector(
              onTap: () {
                Get.to(() => sirt());
              },
              child: Container(
                width: 164 * 0.75592417061,
                height: 161 * 0.75592417061,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/1.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      width: 0.50,
                      color: Color(0xFF0B0202),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: containerWidth * 0.04,
              top: containerHeight * 0.46,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => karin());
                },
                child: Container(
                  width: 164 * 0.75592417061,
                  height: 161 * 0.75592417061,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/Ekran Görüntüsü (1258).png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        width: 0.50,
                        color: Color(0xFF0B0202),
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
            left: containerWidth * 0.04,
            top: containerHeight * 0.666,
            child: GestureDetector(
              onTap: () {
                Get.to(() => bacak());
              },
              child: Container(
                width: 164 * 0.75592417061,
                height: 161 * 0.75592417061,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Ekran Görüntüsü (1259).png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      width: 0.50,
                      color: Color(0xFF0B0202),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.60,
            top: containerHeight * 0.46,
            child: GestureDetector(
              onTap: () {
                Get.to(() => kol());
              },
              child: Container(
                width: 164 * 0.75592417061,
                height: 161 * 0.75592417061,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Ekran Görüntüsü (12560).png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      width: 0.50,
                      color: Color(0xFF0B0202),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.83589743589,
            top: containerHeight * 0.94194312796,
            child: GestureDetector(
              onTap: () {
                Get.to(() => S_Profile());
              },
              child: Container(
                width: 46 * 0.75592417061,
                height: 37 * 0.75592417061,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Ekran Görüntüsü (12698).png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 23,
            top: containerHeight * 0.94194312796,
            child: GestureDetector(
              onTap: () {
                Get.to(() => HomeScreen());
              },
              child: Icon(
                Icons.message,
                size: 46 * 0.75592417061,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.26,
            top: containerHeight * 0.16,
            child: Container(
              width: 208 * 0.99592417061,
              height: 33 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFFDF6E3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
              ),
            ),
          ),
          Positioned(
              left: containerWidth * 0.32,
              top: containerHeight * 0.17,
              child: SizedBox(
                width: containerWidth * 0.60256410256,
                height: containerHeight * 0.01895734597,
                child: Text(
                  'BUGÜN NE YAPACAKSIN ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Barlow Semi Condensed',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
