
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUseCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {
  
}
class MockCollctionRef extends Mock implements CollectionReference {
  
}

class MockDocumentRef extends Mock implements DocumentReference {
  
}
//class MockToDoList extends Mock implements ToDoList{}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}




