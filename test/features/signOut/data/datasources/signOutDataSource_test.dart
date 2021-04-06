import 'dart:ffi';

import 'package:TODO/features/signOut/data/datasources/signOutDataSource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';

void main() {
  MockFirebaseAuth mockFirebaseAuth;
  SignOutDataSourceImpl signOutDataSourceImpl;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    signOutDataSourceImpl = SignOutDataSourceImpl(firebaseAuth : mockFirebaseAuth);
  });

  test('should successfully signout',
      () async {
    when(mockFirebaseAuth.signOut())
        .thenAnswer((realInvocation) async => Void);
    
    expect(signOutDataSourceImpl.signOut() , isA<Future<void>>()
        );
  });

  test('should NOT successfully signout',
      () async {
    when(mockFirebaseAuth.signOut())
        .thenAnswer((realInvocation) async => throw Exception('Error'));

    final call = signOutDataSourceImpl.signOut;
    
    expect(() =>call(), throwsException);
  });
}
