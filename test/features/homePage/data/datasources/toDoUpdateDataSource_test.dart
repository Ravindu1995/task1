import 'package:TODO/features/homePage/data/datasources/toDoUpdateDataSource.dart';
import 'package:TODO/features/homePage/domain/entities/toDoList.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/firebaseMocks.dart';

void main() {

  final todo = ToDoList(
   '','abc','cde'
    
  );


  ToDoUpdateDataSourceImpl toDoUpdateDataSourceImpl;
  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollctionRef mockCollctionRef;
  MockDocumentRef mockDocumentRef;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    mockCollctionRef = MockCollctionRef();
    mockDocumentRef = MockDocumentRef();
    toDoUpdateDataSourceImpl = ToDoUpdateDataSourceImpl(firebaseFirestore: mockFirebaseFirestore);
  });
   test('should return string when successfully Updated',
      () async {
    when(mockFirebaseFirestore.collection('toDoList'))
        .thenReturn(mockCollctionRef);
    
    when(mockCollctionRef.doc('')).thenAnswer((_) => mockDocumentRef);
    when(mockDocumentRef.update({
      'title': 'abc',
      'task': 'abc',
    })).thenAnswer((realInvocation) async => Future.value(String));
    

    expect(await toDoUpdateDataSourceImpl.updateTask(todo),
        'Updated');
  });
}
