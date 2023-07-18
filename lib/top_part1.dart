import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:socapp/firebase_services.dart';
import 'package:get/get.dart';
import 'package:socapp/LoginScree.dart';

class Anasayfa_guest extends StatelessWidget {
  const Anasayfa_guest({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final containerWidth = screenSize.width; // Örnek: Ekran genişliğinin %80'i
    final containerHeight = screenSize.height;

    double systemNavigationBarHeight(BuildContext context) {
      return MediaQuery.of(context).padding.bottom;
    }

    print(containerHeight);
    print(systemNavigationBarHeight(
        context)); // Örnek: Ekran yüksekliğinin %50'si

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
              height: containerHeight * 0.34478672985,
              decoration: BoxDecoration(color: Color(0xFFC3B1F4)),
            ),
          ),
          Positioned(
            left: 0,
            top: containerHeight - containerHeight * 0.06753554502,
            child: Container(
              width: containerWidth,
              height: containerHeight * 0.06753554502,
              decoration: BoxDecoration(color: Color(0xFFC3B1F4)),
            ),
          ),
          Positioned(
            left: containerWidth * 0.07,
            top: containerHeight * 0.12,
            child: Container(
              width: 64 * 0.75592417061,
              height: 61 * 0.75592417061,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("images/tolstoy.png"),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFF0B0202),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.52,
            top: containerHeight * 0.12,
            child: Container(
              width: 58 * 0.75592417061,
              height: 59 * 0.75592417061,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (116).png"),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(side: BorderSide(width: 0.50)),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.29,
            top: containerHeight * 0.12,
            child: Container(
              width: 58 * 0.75592417061,
              height: 59 * 0.75592417061,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (166).png"),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(side: BorderSide(width: 0.50)),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.73,
            top: containerHeight * 0.12,
            child: Container(
              width: 58 * 0.75592417061,
              height: 59 * 0.75592417061,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (117).png"),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(
                  side: BorderSide(width: 0.50, color: Color(0xFF0B0202)),
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.065,
            top: containerHeight * 0.205,
            child: Container(
              width: 68 * 0.75592417061,
              height: 99 * 0.75592417061,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (119).png"),
                  fit: BoxFit.fill,
                ),
                border: Border(
                  left: BorderSide(width: 0.50),
                  top: BorderSide(width: 0.50),
                  right: BorderSide(width: 0.50),
                  bottom: BorderSide(width: 0.50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.28,
            top: containerHeight * 0.205,
            child: Container(
              width: 69 * 0.75592417061,
              height: 99 * 0.75592417061,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (120).png"),
                  fit: BoxFit.fill,
                ),
                border: Border(
                  left: BorderSide(width: 0.50),
                  top: BorderSide(width: 0.50),
                  right: BorderSide(width: 0.50),
                  bottom: BorderSide(width: 0.50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.51,
            top: containerHeight * 0.205,
            child: Container(
              width: 68 * 0.75592417061,
              height: 99 * 0.75592417061,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (121).png"),
                  fit: BoxFit.fill,
                ),
                border: Border(
                  left: BorderSide(width: 0.50),
                  top: BorderSide(width: 0.50),
                  right: BorderSide(width: 0.50),
                  bottom: BorderSide(width: 0.50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.72,
            top: containerHeight * 0.205,
            child: Container(
              width: 68 * 0.75592417061,
              height: 99 * 0.75592417061,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (126).png"),
                  fit: BoxFit.fill,
                ),
                border: Border(
                  left: BorderSide(width: 0.50),
                  top: BorderSide(width: 0.50),
                  right: BorderSide(width: 0.50),
                  bottom: BorderSide(width: 0.50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.08,
            top: containerHeight * 0.40,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Devam etmek için kaydolun"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Get.to(() => LoginScreen());
                        },
                        child: Text("Evet"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Hayır"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                width: 110 * 0.75592417061,
                height: 158 * 0.75592417061,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Ekran Görüntüsü (146).png"),
                    fit: BoxFit.fill,
                  ),
                  border: Border(
                    left: BorderSide(width: 0.50),
                    top: BorderSide(width: 0.50),
                    right: BorderSide(width: 0.50),
                    bottom: BorderSide(width: 0.50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: containerHeight * 0.34478672985,
            child: Container(
              width: containerWidth,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.08,
            top: containerHeight * 0.65,
            child: Container(
              width: 110 * 0.75592417061,
              height: 158 * 0.75592417061,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (156).png"),
                  fit: BoxFit.fill,
                ),
                border: Border(
                  left: BorderSide(width: 0.50),
                  top: BorderSide(width: 0.50),
                  right: BorderSide(width: 0.50),
                  bottom: BorderSide(width: 0.50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 23,
            top: containerHeight * 0.94194312796,
            child: Container(
              width: 47 * 0.75592417061,
              height: 40 * 0.75592417061,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (196).png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: containerHeight * 0.93246445497,
            child: Container(
              width: containerWidth,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.83589743589,
            top: containerHeight * 0.94194312796,
            child: Container(
              width: 46 * 0.75592417061,
              height: 37 * 0.75592417061,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (186).png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.42,
            top: containerHeight * 0.40,
            child: Container(
              width: 202 * 0.75592417061,
              height: 158 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.42,
            top: containerHeight * 0.65,
            child: Container(
              width: 202 * 0.75592417061,
              height: 158 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.42,
            top: containerHeight * 0.40,
            child: Container(
              width: 18 * 0.75592417061,
              height: 17 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFE2C112),
                shape: StarBorder(
                  points: 5,
                  innerRadiusRatio: 0.38,
                  pointRounding: 0,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.45,
            top: containerHeight * 0.40,
            child: Container(
              width: 18 * 0.75592417061,
              height: 17 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFE2C112),
                shape: StarBorder(
                  points: 5,
                  innerRadiusRatio: 0.38,
                  pointRounding: 0,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.48,
            top: containerHeight * 0.40,
            child: Container(
              width: 18 * 0.75592417061,
              height: 17 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFE2C112),
                shape: StarBorder(
                  points: 5,
                  innerRadiusRatio: 0.38,
                  pointRounding: 0,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.51,
            top: containerHeight * 0.40,
            child: Container(
              width: 18 * 0.75592417061,
              height: 17 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFE2C112),
                shape: StarBorder(
                  points: 5,
                  innerRadiusRatio: 0.38,
                  pointRounding: 0,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.54,
            top: containerHeight * 0.40,
            child: Container(
              width: 18 * 0.75592417061,
              height: 17 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0x00E2C112),
                shape: StarBorder(
                  side: BorderSide(width: 0.50, color: Color(0xFFE2C112)),
                  points: 5,
                  innerRadiusRatio: 0.38,
                  pointRounding: 0,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
          ),
          FutureBuilder<String>(
            future: FirebaseService().get_icerik(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Yükleniyor göstergesi veya başka bir görsel gösterilebilir
              } else if (snapshot.hasError) {
                return Text(
                    'Veri alınamadı'); // Hata durumunda gösterilecek bir metin veya hata mesajı
              } else {
                String icerik = snapshot.data ??
                    ""; // Future'ın tamamlanmış değerine erişiyoruz veya varsayılan bir değer kullanıyoruz

                return Positioned(
                  left: containerWidth * 0.42,
                  top: containerHeight * 0.43,
                  child: SizedBox(
                    width: 174 * 0.75592417061,
                    height: 109 * 0.75592417061,
                    child: Text(
                      icerik,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          Positioned(
            left: containerWidth * 0.42,
            top: containerHeight * 0.65,
            child: Container(
              width: 18 * 0.75592417061,
              height: 17 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFE2C112),
                shape: StarBorder(
                  points: 5,
                  innerRadiusRatio: 0.38,
                  pointRounding: 0,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.45,
            top: containerHeight * 0.65,
            child: Container(
              width: 18 * 0.75592417061,
              height: 17 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFE2C112),
                shape: StarBorder(
                  points: 5,
                  innerRadiusRatio: 0.38,
                  pointRounding: 0,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.48,
            top: containerHeight * 0.65,
            child: Container(
              width: 18 * 0.75592417061,
              height: 17 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFE2C112),
                shape: StarBorder(
                  points: 5,
                  innerRadiusRatio: 0.38,
                  pointRounding: 0,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.51,
            top: containerHeight * 0.65,
            child: Container(
              width: 18 * 0.75592417061,
              height: 17 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFE2C112),
                shape: StarBorder(
                  points: 5,
                  innerRadiusRatio: 0.38,
                  pointRounding: 0,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.54,
            top: containerHeight * 0.65,
            child: Container(
              width: 18 * 0.75592417061,
              height: 17 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFE2C112),
                shape: StarBorder(
                  points: 5,
                  innerRadiusRatio: 0.38,
                  pointRounding: 0,
                  valleyRounding: 0,
                  rotation: 0,
                  squash: 0,
                ),
              ),
            ),
          ),
          FutureBuilder<String>(
              future: FirebaseService().get_icerik_1(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Veri alınamadı');
                } else {
                  String icerik1 =
                      snapshot.data ?? ""; // Assign the value to icerik1
                  // Return an empty container as a placeholder

                  return Positioned(
                      left: containerWidth * 0.42,
                      top: containerHeight * 0.68,
                      child: SizedBox(
                        width: 169 * 0.75592417061,
                        height: 109 * 0.75592417061,
                        child: Text(
                          icerik1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ));
                }
              }),
          Positioned(
            left: containerWidth * 0.64,
            top: containerHeight * 0.4,
            child: Container(
              width: 21 * 0.75592417061,
              height: 14 * 0.75592417061,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (206).png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.6,
            top: containerHeight * 0.4,
            child: SizedBox(
              width: 23 * 0.75592417061,
              height: 13 * 0.75592417061,
              child: Text(
                '7k\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.64,
            top: containerHeight * 0.65,
            child: Container(
              width: 21 * 0.75592417061,
              height: 14 * 0.75592417061,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Ekran Görüntüsü (206).png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.6,
            top: containerHeight * 0.65,
            child: SizedBox(
              width: 20 * 0.75592417061,
              height: 14 * 0.75592417061,
              child: Text(
                '6k\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 9,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.06,
            top: containerHeight * 0.062,
            child: Container(
              width: 208 * 0.75592417061,
              height: 33 * 0.75592417061,
              decoration: ShapeDecoration(
                color: Color(0xFFFDF6E3),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
              ),
            ),
          ),
          Positioned(
            left: containerWidth * 0.08,
            top: containerHeight * 0.07,
            child: SizedBox(
              width: containerWidth * 0.60256410256,
              height: containerHeight * 0.01895734597,
              child: Text(
                'AYIN ENLERİ ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Barlow Semi Condensed',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
