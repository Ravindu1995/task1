import 'dart:ffi';

import 'package:TODO/features/signUp/data/datasources/signUpDataSource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  MockUseCredential mockUseCredential;
  MockUser mockUser;
  SignUpDataSourceImpl signUpDataSourceImpl;
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollctionRef mockCollctionRef;
  MockDocumentRef mockDocumentRef;

  setUp(() {
    mockUser = MockUser();
    mockUseCredential = MockUseCredential();
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollctionRef = MockCollctionRef();
    mockDocumentRef = MockDocumentRef();
    signUpDataSourceImpl = SignUpDataSourceImpl(
        firebaseAuth: mockFirebaseAuth,
        firebaseFirestore: mockFirebaseFirestore);
  });

  test('should return string when successfully authenticated and registered',
      () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => mockUseCredential);
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);
    when(mockCollctionRef.doc(any)).thenReturn(mockDocumentRef);
    when(mockDocumentRef.set({
      'email': 'afs',
      'name': 'afs',
    })).thenAnswer((realInvocation) async => Void);
    when(mockUseCredential.user).thenReturn(mockUser);

    expect(await signUpDataSourceImpl.signUp('afs', 'afs', 'afs'),
        'signed up Successfully');
  });

  test('should return string when successfully authenticated and registered',
      () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => mockUseCredential);
    when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);
    when(mockCollctionRef.doc(any)).thenReturn(mockDocumentRef);
    when(mockDocumentRef.set({
      'email': 'afs',
      'name': 'afs',
    })).thenAnswer((realInvocation) async => throw Exception('Error'));
    final call = signUpDataSourceImpl.signUp;

    expect(() => call('afs', 'afs', 'afs'), throwsException);
  });

  test('should thrown an exception when user is  null ', () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => mockUseCredential);

    final call = signUpDataSourceImpl.signUp;

    expect(() => call('afs', 'afs', 'afs'), throwsException);
  });

  test('should thrown an exception when trying  to create account ', () async {
    when(mockFirebaseAuth.createUserWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => throw Exception('Error'));

    final call = signUpDataSourceImpl.signUp;

    expect(() => call('afs', 'afs', 'afs'), throwsException);
  });
}
