import 'package:chat_app/models/myUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseUtills{

    static CollectionReference<MyUser> getCollectionUser(){
    return FirebaseFirestore.instance.collection(MyUser.collectionName).   // .collection بيعمل collection at database
     withConverter<MyUser>(fromFirestore: (snapshot, _) => MyUser.fromJson(snapshot.data()!)
         , toFirestore: (model, _) => model.toJson());
   }

  static Future<void> addUserToFireStore( MyUser myUser){            //method هتضيف user في MyUser collection وهتخلي id بتاعه تاخده من object
    return getCollectionUser().doc(myUser.id).set(myUser);
  }
  static Future<MyUser?> readUserFromFireStore(String id) async {    //return the user by id from fire store
    DocumentSnapshot<MyUser> userRefr=await getCollectionUser().doc(id).get();
    return userRefr.data();
  }
}