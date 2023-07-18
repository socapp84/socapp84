import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference _icerik =
      FirebaseFirestore.instance.collection("kitap_icerigi");
  final CollectionReference _icerik1 =
      FirebaseFirestore.instance.collection("kitap_icerigi_1");
  late String title;

  Future<String> get_icerik() async {
    var snapshot = await _icerik.orderBy("order").get();
    var titles = snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      var title = data["comment"];
      return title ?? ""; // Boş string döndürmek için null kontrolü
    }).toList();
    // Başlıkları birleştirip bir string olarak döndür
    return titles.join("\n"); // Future olarak döndür
  }

  Future<String> get_icerik_1() async {
    var snapshot = await _icerik1.orderBy("order").get();
    var titles = snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      var title = data["comment"];
      return title ?? ""; // Boş string döndürmek için null kontrolü
    }).toList();
    print(titles.join("\n")); // Başlıkları birleştirip bir string olarak döndür
    return titles.join("\n"); // Future olarak döndür
  }
}
