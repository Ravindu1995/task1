import 'package:TODO/features/login/data/datasources/loginDataSource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUseCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  MockUseCredential mockUseCredential;
  MockUser mockUser;
  LoginDataSourceImpl loginDataSourceImpl;
  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUser = MockUser();
    mockUseCredential = MockUseCredential();
    loginDataSourceImpl = LoginDataSourceImpl(firebaseAuth: mockFirebaseAuth);
  });

  test('should return stirng when authentiction was successfull', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => mockUseCredential);
    when(mockUseCredential.user).thenReturn(mockUser);

    expect(await loginDataSourceImpl.login('afs', 'afs'),
        'Logged in Successfully');
  });

  test('should throw exception when user is null', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => mockUseCredential);
    final call = loginDataSourceImpl.login;
    expect(()=> call('afs', 'afs'),
       throwsException);
  });
test('should throw exception when user is null', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: 'afs', password: 'afs'))
        .thenAnswer((realInvocation) async => throw Exception('error'));
    final call = loginDataSourceImpl.login;
    expect(()=> call('afs', 'afs'),
       throwsException);
  });

}
