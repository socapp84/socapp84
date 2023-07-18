import 'package:flutter/material.dart';

class kit_oner extends StatefulWidget {
  kit_oner({Key? key}) : super(key: key);

  @override
  State<kit_oner> createState() => _kit_onerState();
}

class _kit_onerState extends State<kit_oner> {
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
                            'Okuduğunuz son 3 kitap türünün başharfini yorum kısmına ekleyip ekle tuşuna basınız örneğin son 3 kitabınız savaş,komedi,dram şekilndeyse skd şeklinde yorum satırını yazıp ekle tuşuna basınız ardından gelecek olan pencerede kitap türü öneriniz gelecek ',
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
          int count = commentler.text.split('s').length - 1;
          if (count == 3) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("dram"),
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
          count = commentler.text.split('s').length - 1;
          if (count == 2) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("komedi"),
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
          count = commentler.text.split('s').length - 1;
          if (count == 1) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("strateji"),
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
          count = commentler.text.split('s').length - 1;
          if (count == 0) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Aşk"),
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
