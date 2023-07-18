import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socapp/profile.dart';

class Yorum_ana extends StatefulWidget {
  Yorum_ana({Key? key}) : super(key: key);

  @override
  State<Yorum_ana> createState() => _Yorum_anaState();
}

class _Yorum_anaState extends State<Yorum_ana> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController commentler = TextEditingController();

  void _gonderButonuOnPressed() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Kitabı Kütüphaneye Eklemek"),
          content:
              Text("Bu kitabı kütüphaneye eklemek istediğinize emin misiniz?"),
          actions: [
            TextButton(
              child: Text("Vazgeç"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            ElevatedButton(
              child: Text("Ekle"),
              onPressed: () async {
                Get.off(() => Profile());
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference comments = _firestore.collection("comments");
    final screenSize = MediaQuery.of(context).size;
    final containerWidth = screenSize.width; // Örnek: Ekran genişliğinin %80'i
    final containerHeight = screenSize.height;

    double systemNavigationBarHeight(BuildContext context) {
      return MediaQuery.of(context).padding.bottom;
    }

    return Scaffold(
      backgroundColor: Color(0xFFFDF6E3),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                width: containerWidth,
                height: containerHeight * 0.3,
                decoration: BoxDecoration(color: Color(0xFFC3B1F4)),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 0.50),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            '“Rusya’da işçi sınıfının zorluklarını ve hayatta kalma mücadelesini gözler önüne seren etkileyici bir eser. İşçi sınıfının yaşadığı acıları, umutları ve dayanıklıkları üzerine odaklanır.”',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: containerWidth * 0.2,
                        height: containerHeight * 0.2,
                        child: Image.asset(
                          'images/Ekran Görüntüsü (146).png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: comments.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    var documents = asyncSnapshot.data!.docs;
                    var dataList = documents
                        .map((doc) => doc.data() as Map<String, dynamic>?)
                        .toList();
                    return Flexible(
                      child: ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) {
                          var data = dataList[index];
                          if (data != null && data.containsKey("yorum_ana")) {
                            var yorum = data["yorum_ana"] as String;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, // Yatay yönde padding
                                  ),
                                  leading: Image.asset(
                                    'images/user2.jpg',
                                  ),
                                  title: Text(
                                    yorum,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    );
                  } else if (asyncSnapshot.hasError) {
                    return Text('Hata: ${asyncSnapshot.error}');
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: commentler,
                        decoration:
                            InputDecoration(hintText: "Yorumunuzu giriniz"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _gonderButonuOnPressed,
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: Color(0xFFC3B1F4), // Mor renk
                ),
                child: Text(
                  'Ekle',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Gönder"),
        backgroundColor: Color(0xFFC3B1F4),
        onPressed: () async {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Kitaba Yorum Eklemek"),
                content: Text("Bu Yorumu eklemek istediğinize emin misiniz?"),
                actions: [
                  TextButton(
                    child: Text("Vazgeç"),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                  ElevatedButton(
                    child: Text("Evet"),
                    onPressed: () async {
                      print(commentler.text);
                      Map<String, dynamic> commentData = {
                        "yorum_ana": commentler.text,
                      };
                      await comments.add(commentData);
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
