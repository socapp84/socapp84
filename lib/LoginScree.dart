import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socapp/CreateAccount.dart';
import 'package:socapp/secim.dart';
import 'package:socapp/top_part.dart';
import 'package:socapp/top_part1.dart';
import 'package:socapp/Methods.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return isLoading
        ? Center(
            child: Container(
              height: size.height / 20,
              width: size.height / 20,
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffC3B1F4), Color(0xffFDF6E3)],
                  begin: Alignment.topRight,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: size.height / 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: size.width / 0.5,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(height: size.height / 50),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Sign In to Continue!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height / 10),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: field(size, "email", Icons.account_box, _email),
                      ),
                      Positioned(
                        top: size.height * 0.08,
                        right: 10,
                        child: Image.asset(
                          "images/user2.jpg",
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "password", Icons.lock, _password),
                    ),
                  ),
                  SizedBox(height: size.height / 10),
                  customButton(size),
                  SizedBox(height: size.height / 40),
                  GestureDetector(
                    onTap: () => Get.off(CreateAccount()),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _performGuestLogin,
                        child: Text("Guest Login"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: _signInWithGoogle,
                        icon: Image.asset(
                          "images/7611770.png",
                          width: 24,
                          height: 24,
                        ),
                        label: Text("Sign in with Google"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  Widget customButton(Size size) {
    return Column(
      children: [
        GestureDetector(
          onTap: _performLogin,
          child: Container(
            height: size.height / 14,
            width: size.width / 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black,
            ),
            alignment: Alignment.center,
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black87),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  void _performGuestLogin() {
    print("Guest Login");
    Get.off(() => Anasayfa_guest());
  }

  void _performLogin() {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      logIn(_email.text, _password.text).then((user) {
        if (user != null) {
          print("Login Successful");
          setState(() {
            isLoading = false;
          });
          _showConfirmationDialog();
        } else {
          print("Login Failed");
          setState(() {
            isLoading = false;
          });
        }
      });
    } else {
      print("Please fill the form correctly");
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Login Successful"),
        content: Text("KVKK'yı onaylıyor musunu?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Get.off(() => Secim());
            },
            child: Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No"),
          ),
        ],
      ),
    );
  }

  void _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        print("Google Sign-In Successful");
        Get.off(() => Secim());
      } else {
        print("Google Sign-In Failed");
      }
    } catch (e) {
      print("Google Sign-In Error: $e");
    }
  }
}
