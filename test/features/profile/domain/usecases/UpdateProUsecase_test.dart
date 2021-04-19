import 'dart:ffi';

import 'package:TODO/core/error/failures.dart';
import 'package:TODO/features/profile/domain/repositories/profileRepository.dart';
import 'package:TODO/features/profile/domain/usecases/UpdateProUsecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProUpdate extends Mock implements ProfileRepository {}

void main() {
  MockProUpdate proUpdate;
  UpdateProUsecase proUsecase;

  setUp(() {
    proUpdate = MockProUpdate();
    proUsecase = UpdateProUsecase(repository: proUpdate);
  });

  test('should update a task succesfully', () async {
    when(proUpdate.updateUser('abc'))
        .thenAnswer((realInvocation) async => Right(Void));
    expect(await proUsecase(Params(name: 'abc')), Right(Void));
  });

  test('should fail while updating', () async {
    when(proUpdate.updateUser('abc'))
        .thenAnswer((realInvocation) async => Left(ServerFailure('Error')));
    expect(await proUsecase(Params(name: 'abc')), Left(ServerFailure('Error')));
  });
}
