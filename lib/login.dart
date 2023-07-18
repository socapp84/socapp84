import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socapp/auth.service.dart';
import 'package:socapp/register.dart';
import 'package:socapp/top_part.dart';
import 'package:socapp/top_part1.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFDF6E3),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: size.height * .6,
            width: size.width * .85,
            decoration: BoxDecoration(
              color: Color(0xFF9C84FF),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF9C84FF),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        hintText: 'E-Mail',
                        prefixText: ' ',
                        hintStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.white,
                        ),
                        hintText: 'Parola',
                        prefixText: ' ',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        focusColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    InkWell(
                      onTap: () {
                        _authService
                            .signIn(
                          _emailController.text!,
                          _passwordController.text!,
                        )
                            .then((value) {
                          if (value != null && value) {
                            Get.offAll(Anasayfa());
                          } else {
                            // Handle login error
                          }
                        });
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Giriş yap",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            InkWell(
                              onTap: () {
                                _signInAsGuest();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Misafir Giriş yap",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            InkWell(
                              onTap: () {
                                _signInWithGoogle();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Google ile Giriş yap",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(RegisterPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 1,
                            width: 75,
                            color: Colors.white,
                          ),
                          Text(
                            "Kayıt ol",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            height: 1,
                            width: 75,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Google ile giriş yapma işlemini burada gerçekleştirin

      Get.offAll(Anasayfa()); // Giriş başarılıysa Anasayfa'ya geç
    } catch (e) {
      print('Google ile giriş yaparken hata oluştu: $e');
    }
  }

  void _signInAsGuest() {
    // Misafir olarak giriş yapma işlemini burada gerçekleştirin

    Get.offAll(
        Anasayfa_guest()); // Misafir girişi başarılıysa Anasayfa_guest'e geç
  }
}
