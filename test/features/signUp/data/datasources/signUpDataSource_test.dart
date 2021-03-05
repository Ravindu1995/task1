import 'package:TODO/features/signUp/data/datasources/signUpDataSource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUseCredential extends Mock implements UserCredential {}

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  MockUseCredential mockUseCredential;
  MockUser mockUser;
  SignUpDataSourceImpl signUpDataSourceImpl;

  setUp(() {
    mockUser = MockUser();
    mockUseCredential = MockUseCredential();
    mockFirebaseAuth = MockFirebaseAuth();
    signUpDataSourceImpl = SignUpDataSourceImpl(firebaseAuth: mockFirebaseAuth);
  });
  

   
}
