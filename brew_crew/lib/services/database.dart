import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
// collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

//get brews stream
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}

// List <Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
//      return snapshot.docs.map((doc){
//        return Brew(
//          name: doc.get('name') ?? '',
//          sugars: doc.get('sugars') ?? '0',
//          strength: doc.get('strength') ?? 0
//        );
//      }).toList();
//   }