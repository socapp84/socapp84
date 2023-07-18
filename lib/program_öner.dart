import 'package:flutter/material.dart';

class prog_oner extends StatefulWidget {
  prog_oner({Key? key}) : super(key: key);

  @override
  State<prog_oner> createState() => _prog_onerState();
}

class _prog_onerState extends State<prog_oner> {
  TextEditingController commentler = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Yapmış olduğunuz son 3 antrenman türünün başharfini yorum kısmına ekleyip ekle tuşuna basınız örneğin son 3 antrenmanınız kol,sırt,bacak şekilndeyse ksb şeklinde yorum satırını yazıp ekle tuşuna basınız ardından gelecek olan pencerede kitap türü öneriniz gelecek ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: TextFormField(
                  controller: commentler,
                  decoration: InputDecoration(hintText: "Yorumunuzu giriniz"),
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
          int count = commentler.text.split('k').length - 1;
          if (count == 3) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Kol antrenmanı yapmanız daha uygun"),
                  actions: [
                    ElevatedButton(
                      child: Text("Kapat"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
          count = commentler.text.split('k').length - 1;
          if (count == 2) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Bacak antrenmanı yapmanız daha uygun"),
                  actions: [
                    ElevatedButton(
                      child: Text("Kapat"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
          count = commentler.text.split('k').length - 1;
          if (count == 1) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Sırt antrenmanı yapmanız daha uygun"),
                  actions: [
                    ElevatedButton(
                      child: Text("Kapat"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
          count = commentler.text.split('k').length - 1;
          if (count == 0) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Kardiyo antrenmanı yapmanız daha uygun"),
                  actions: [
                    ElevatedButton(
                      child: Text("Kapat"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
