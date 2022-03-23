import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class FirestoreStore {
  FirebaseAuth? get userAuth => FirebaseAuth.instance;
  FirebaseStorage storage =
  FirebaseStorage.instance;
  var myCollection;

  addTodo(var collectionName, var subCollectionName,
      Map<String, dynamic> map) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(userAuth!.currentUser!.uid)
        .collection(subCollectionName)
        .doc()
        .set(map);
  }

  Future todoStream(var collectionName, var subCollectionName) async {
    var myCollection = await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(userAuth!.currentUser!.uid)
        .collection(subCollectionName)
        .get();   
     
    return myCollection.docs;
  }

  searchStream(var collectionName, var value, var subCollectionName,
      var queryName) async {
    var collectionRef = await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(userAuth!.currentUser!.uid)
        .collection(subCollectionName)
        .where(queryName, isEqualTo: value)
        .get();

    return collectionRef.docs;
  }

  updateStatus(var collectionName, Map<String, dynamic> map,var id,var subCollection) {
    FirebaseFirestore.instance
        .collection(collectionName)
        .doc(userAuth!.currentUser!.uid)
        .collection(subCollection)
        .doc(id)
        .update(map);
  }

  deleteTodo(String documentId, var collectionName, var subCollectionName) {
    FirebaseFirestore.instance
        .collection(collectionName)
        .doc(userAuth!.currentUser!.uid)
        .delete();
  }

  uploadImage(String? image, String id) async{
    print(id.toString());
    TaskSnapshot snapshot = await storage
        .ref()
        .child("images/$id")
        .putFile(File(image!));
    final String downloadUrl =
    await snapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection("Product")
        .doc(userAuth!.currentUser!.uid)
        .collection("Add_Product")
        .doc(id.toString())
        .update({
      "image": downloadUrl
    });
  }
}
