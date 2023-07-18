import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Yorum_dirilis extends StatefulWidget {
  Yorum_dirilis({Key? key}) : super(key: key);

  @override
  State<Yorum_dirilis> createState() => _Yorum_dirilisState();
}

class _Yorum_dirilisState extends State<Yorum_dirilis> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController commentler = TextEditingController();

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
                            '“Varllıklı bir soylunun analmsızlığa sürüklenen yaşamını sorgulayarak, insanın manevi arayışı için yapılan bir yolculuğu ele alan bir kitap.”',
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
                          'images/Ekran Görüntüsü (156).png',
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
                          if (data != null &&
                              data.containsKey("yorum_dirilis")) {
                            var yorum = data["yorum_dirilis"] as String;
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Ekle"),
        backgroundColor: Color(0xFFC3B1F4),
        onPressed: () async {
          print(commentler.text);
          Map<String, dynamic> commentdata = {"yorum_dirilis": commentler.text};
          await comments.doc(commentler.text).set(commentdata);
        },
      ),
    );
  }
}
