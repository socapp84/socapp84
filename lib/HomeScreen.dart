import 'package:socapp/Methods.dart';
import 'package:socapp/ChatRoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    setStatus("Online");
  }

  void setStatus(String status) async {
    await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
      "status": status,
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // online
      setStatus("Online");
    } else {
      // offline
      setStatus("Offline");
    }
  }

  void onSearch() async {
    setState(() {
      isLoading = true;
    });

    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      setState(() {
        userMap = querySnapshot.docs[0].data() as Map<String, dynamic>?;
        isLoading = false;
      });
      print(userMap);
    } else {
      setState(() {
        userMap = null;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFFDF6E3),
      appBar: AppBar(
        title: Text("Buddy bulma Ekranı"),
        backgroundColor: Color(0xFFC3B1F4),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => logOut(context),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.15,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "Search",
                        fillColor: Color(0xFFFDF6E3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                ElevatedButton(
                  onPressed: onSearch,
                  child: Text("Search"),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                if (userMap != null)
                  ListTile(
                    onTap: () {
                      String roomID = chatRoomId(
                          _auth.currentUser!.displayName!, userMap!['name']);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ChatRoom(
                          chatRoomId: roomID,
                          userMap: userMap!,
                        ),
                      ));
                    },
                    leading: Image.asset("images/user2.jpg"),
                    title: Text(
                      userMap!["name"] ?? "",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(userMap!["email"] ?? ""),
                  ),
              ],
            ),
    );
  }
}
