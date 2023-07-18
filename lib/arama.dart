import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:socapp/top_part.dart';
import 'package:socapp/yorum_ana.dart';

void main() {
  runApp(Arama());
}

class Arama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Firestore Verilerini Görüntüle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();

  List<String> items = [];
  List<String> dummySearchList = [];

  @override
  void initState() {
    super.initState();
    getNamesFromFirestore();
  }

  void getNamesFromFirestore() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('comments').get();

    List<String> fetchedNames = [];
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (doc.exists && data != null && data.containsKey('name')) {
        fetchedNames.add(data['name'].toString());
      }
    });

    setState(() {
      items = fetchedNames;
      dummySearchList = fetchedNames;
    });
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      items.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items = dummyListData;
      });
    } else {
      setState(() {
        items = dummySearchList;
      });
    }
  }

  void onItemClick(String item) {
    // Burada tıklanan öğeyle ilgili işlemler yapabilirsiniz
    print('Tıklanan öğe: $item');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9C84FF),
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => Anasayfa());
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: editingController,
              decoration: InputDecoration(
                labelText: "Kitap ara",
                hintText: "",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return InkWell(
                    onTap: () {
                      onItemClick(item);
                      Get.to(() => Yorum_ana());
                    },
                    child: ListTile(
                      title: Text(item),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
