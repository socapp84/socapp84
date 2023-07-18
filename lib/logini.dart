import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:socapp/top_part.dart';

class SplashPage extends StatelessWidget {
  final MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      init: myController,
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: controller.isFirebaseInitialized
                ? MyCustomForm()
                : CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key});

  @override
  Widget build(BuildContext context) {
    final MyController myController = Get.find<MyController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Custom Form'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to My Custom Form!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                myController.signInWithGoogle(); // Google ile giriş yap
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                myController.signOut(); // Google hesabından çıkış yap
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isFirebaseInitialized = false;
  bool isGoogleSignedIn = false;

  @override
  void onInit() {
    super.onInit();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();

    isFirebaseInitialized = true;
    update();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);
        print("Google ile giriş başarılı");

        // Google ile giriş başarılıysa Anasayfa'ya geçiş yap
        Get.offAll(Anasayfa());
      } else {
        print("Google ile giriş yapılamad ");
      }
    } catch (e) {
      // Hata oluştu
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut(); // Firebase oturumunu kapat

      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut(); // Google oturumunu kapat
      }

      print("Oturumdan çıkış yapıldı");
    } catch (e) {
      // Hata oluştu
    }
  }
}
