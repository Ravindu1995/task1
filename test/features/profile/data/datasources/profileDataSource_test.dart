import 'package:TODO/features/profile/data/datasources/profileDataSource.dart';
import 'package:TODO/features/profile/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockQueryDocSnapshot extends Mock implements QueryDocumentSnapshot {}

void main() {
  MockFirebaseAuth firebaseAuth;
  MockQuerySnapshot mockQuerySnapshot;
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollctionRef mockCollctionRef;
  MockQueryDocSnapshot mockQueryDocSnapshot;
  ProfileDataSourceImpl dataSourceImpl;
  MockDocumentRef mockDocumentRef;
  MockDocumentSnapshot mockDocumentSnapshot;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollctionRef = MockCollctionRef();
    mockQuerySnapshot = MockQuerySnapshot();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockQueryDocSnapshot = MockQueryDocSnapshot();
    mockDocumentRef = MockDocumentRef();
    dataSourceImpl = ProfileDataSourceImpl(
        firestore: mockFirebaseFirestore, firebaseAuth: firebaseAuth);
  });

  final user = UserModel(name: 'af', email: 'af');
  test('should return user ', () {
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

    when(mockCollctionRef.doc(firebaseAuth.currentUser.uid))
        .thenReturn(mockDocumentRef);

    when(mockDocumentRef.snapshots())
        .thenAnswer((_) => Stream.fromIterable([mockDocumentSnapshot]));

    //when(mockDocumentSnapshot.data).thenReturn([mockQueryDocSnapshot]);

    when(mockQueryDocSnapshot.data()).thenReturn(user.toMap());

    final result = dataSourceImpl.getUsers();

    expectLater( result,emitsInOrder([[user]]));
  });

  test('should return user enpty', () {
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

    when(mockCollctionRef.doc(firebaseAuth.currentUser.uid))
        .thenReturn(mockDocumentRef);

    when(mockDocumentRef.snapshots())
        .thenAnswer((_) => Stream.empty());

    final result = dataSourceImpl.getUsers();

    expectLater(result, emitsDone);
  });

  test('should return user  error', () {
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

     when(mockCollctionRef.doc(firebaseAuth.currentUser.uid))
        .thenReturn(mockDocumentRef);

    when(mockDocumentRef.snapshots()).thenAnswer((_) => Stream.error('error'));

    final result = dataSourceImpl.getUsers();

    expectLater(result, emitsError('error'));
  });
}
