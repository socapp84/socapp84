import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socapp/HomeScreen.dart';
import 'package:socapp/anti_gir.dart';
import 'package:socapp/antrenman_giris.dart';
import 'package:socapp/arama.dart';
import 'package:socapp/firebase_options.dart';
import 'package:socapp/firebase_services.dart';
import 'package:socapp/kitap_%C3%B6ner.dart';
import 'package:socapp/okur_odas%C4%B1_ana.dart';
import 'package:socapp/profile.dart';
import 'package:socapp/program_%C3%B6ner.dart';
import 'package:socapp/secim.dart';
import 'package:socapp/spor_profil.dart';
import 'package:socapp/top_part.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:socapp/google_sign_in.dart';
import 'package:socapp/yorum.dart';
import 'package:socapp/yorum_ana.dart';
import 'package:socapp/yorum_dirilis.dart';
import 'package:socapp/spor_profil.dart';
import 'package:socapp/splashandonboarding.dart';
import 'LoginScree.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseService().get_icerik_1();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash App',
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
      ],
    );
  }
}
