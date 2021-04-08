import 'package:TODO/features/profile/data/datasources/profileDataSource.dart';
import 'package:TODO/features/profile/data/models/user_model.dart';
import 'package:TODO/features/profile/data/respositories/profileRepositoryImpl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProfileDataSources extends Mock implements ProfileDataSource {}

void main() {
    final user = [UserModel( name: 'af', email: 'af')];

  MockProfileDataSources dataSources;
  ProfileRepositoryImpl sourceImpl;

  setUp(() {
    dataSources = MockProfileDataSources();
    sourceImpl = ProfileRepositoryImpl(profileDataSource : dataSources);
  });

   test('should emit  list ', () {
      when(dataSources.getUsers())
          .thenAnswer((realInvocation)  => Stream.fromIterable([user]));
      expect( sourceImpl.getUsers(), emitsInOrder([user]) );
    });

    test('should return  empty ', () {
      when(dataSources.getUsers())
          .thenAnswer((realInvocation)  => Stream.empty());
      expect( sourceImpl.getUsers(), emitsDone );
    });

    test('should return Error ', () {
      when(dataSources.getUsers())
          .thenAnswer((realInvocation)  => Stream.error('ERR'));
      expect( sourceImpl.getUsers(), emitsError('ERR') );
    });
}
