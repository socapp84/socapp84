import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'yorum_ana.dart';
import 'package:socapp/yorum_ana.dart';
import 'package:socapp/firebase_services.dart';
import 'package:socapp/arama.dart';
import 'package:socapp/okur_odası_ana.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxString userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      DocumentSnapshot snapshot = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        userName.value = snapshot.get('name');
      }
    } catch (e) {
      print(e);
    }
  }
}

class S_Profile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  S_Profile({Key? key}) : super(key: key);

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

    return Obx(
      () => Container(
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
            ),
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
              left: containerWidth * 0.6,
              top: containerHeight * 0.10,
              child: Icon(
                Icons.person,
                size: containerHeight * 0.2, // Adjust size as needed
                color: Colors.black,
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
              left: containerWidth * 0.065,
              top: containerHeight * 0.375,
              child: Container(
                width: 68 * 0.75592417061,
                height: 99 * 0.75592417061,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Ekran Görüntüsü (1259).png"),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
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
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: containerWidth * 0.28,
              top: containerHeight * 0.375,
              child: Container(
                width: 69 * 0.75592417061,
                height: 99 * 0.75592417061,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Ekran Görüntüsü (1258).png"),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
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
                    ),
                  ],
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
                    ),
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
              left: containerWidth * 0.06,
              top: containerHeight * 0.062,
              child: Container(
                width: 208 * 0.75592417061,
                height: 33 * 0.75592417061,
                decoration: ShapeDecoration(
                  color: Color(0xFFFDF6E3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
            ),
            Positioned(
              left: containerWidth * 0.06,
              top: containerHeight * 0.29,
              child: Container(
                width: 208 * 0.75592417061,
                height: 33 * 0.75592417061,
                decoration: ShapeDecoration(
                  color: Color(0xFFFDF6E3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
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
                  controller.userName.value,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Barlow Semi Condensed',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              left: containerWidth * 0.08,
              top: containerHeight * 0.30,
              child: SizedBox(
                width: containerWidth * 0.60256410256,
                height: containerHeight * 0.01895734597,
                child: Text(
                  'PROGRAMIM',
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
      ),
    );
  }
}
