import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/login/domain/repositories/firebase_repository.dart';
import 'package:TODO/features/login/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  MockLoginRepository mockLoginRepository;
  LoginUseCase loginUseCase;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    loginUseCase = LoginUseCase(repository: mockLoginRepository);
  });
  test('should return success string from repository', () async {
    when(mockLoginRepository.login('afs', 'afs'))
        .thenAnswer((realInvocation) async => Right('Logged in'));
    expect(await loginUseCase(Params(email: 'afs', password: 'afs')),
        Right('Logged in'));
  });

  test('should return auth failure from repo', () async {
    when(mockLoginRepository.login('afs', 'afs'))
        .thenAnswer((realInvocation) async => Left(AuthFailure('Error')));
    expect(await loginUseCase(Params(email: 'afs', password: 'afs')),
        Left(AuthFailure('Error')));
  });
}
