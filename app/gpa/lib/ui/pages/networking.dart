import 'package:cloud_firestore/cloud_firestore.dart';

class Networking {
  Future<void> upload(String uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await FirebaseFirestore.instance
        .collection('Puppy')
        .doc('Pavan')
        .set({'Age': 20, 'weight': 2000});
  }

  Future<void> retrieve() async {
    FirebaseFirestore.instance
        .collection('courses')
        .doc("Semester1")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
