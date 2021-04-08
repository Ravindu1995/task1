
import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/profile/domain/entities/users.dart';
import 'package:TODO/features/profile/domain/repositories/profileRepository.dart';
import 'package:TODO/features/profile/domain/usecases/profileUsecase.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  final List<User> users = [
    User( "user1", "user@gmail.com"),
    
  ];

  MockProfileRepository mockprofileRepository;
  ProfileUsecase profileUsecase;


  setUp(() {
    mockprofileRepository = MockProfileRepository();
    profileUsecase = ProfileUsecase(profileRepository :  mockprofileRepository);
  });
  
    test('should return User Profile', () async {
    when(mockprofileRepository.getUsers())
        .thenAnswer((realInvocation)  => Stream.fromIterable([users]));
    
    expect( profileUsecase( NoParams()), emitsInOrder([users]));
  });

    test('should return User Profile Empty', () async {
    when(mockprofileRepository.getUsers())
        .thenAnswer((realInvocation)  => Stream.empty());
    
    expect( profileUsecase( NoParams()), emitsDone);
  });

    test('should return User Profile Error', () async {
    when(mockprofileRepository.getUsers())
        .thenAnswer((realInvocation)  => Stream.error('Error'));
    
    expect( profileUsecase( NoParams()), emitsError('Error'));
  });

  

}
