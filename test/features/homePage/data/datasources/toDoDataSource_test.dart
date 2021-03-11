import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../mocks/firebaseMocks.dart';

void main() {
  //final tData = {''};

  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollctionRef mockCollctionRef;
  MockDocumentRef mockDocumentRef;
  MockDocumentSnapshot mockDocumentSnapshot;
  ToDoDataSourceImpl toDoDataSourceImpl;
  MockToDoList mockToDoList;

  setUp(() {
    mockFirebaseFirestore = MockFirebaseFirestore();
    toDoDataSourceImpl = ToDoDataSourceImpl(firestore: mockFirebaseFirestore);
    mockCollctionRef = MockCollctionRef();
    mockDocumentSnapshot = MockDocumentSnapshot();
    mockToDoList = MockToDoList();
  });

  // test('should return todo model list', () async {
  //   when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

  //   when(mockCollctionRef.doc(any)).thenReturn(mockDocumentRef);

  //   when(mockDocumentRef.get()).thenAnswer((_) async => mockDocumentSnapshot);

  //   when(mockDocumentSnapshot.data()).thenReturn(any);

  //   final result = await toDoDataSourceImpl.getTodoList('', '');

  //   expect(result, 'Loaded');
  // });

  // test('should thrown an exception when trying  to create account ', () async {
  //   when(mockFirebaseFirestore.collection(any))
  //       .thenAnswer((realInvocation) async => throw Exception('Error'));

  //   final call = toDoDataSourceImpl.getTodoList;

  //   expect(() => call('afs'), throwsException);
  // });

  // test('should thrown an exception loading ', () async {
  //   when(mockFirebaseFirestore.collection(any))
  //       .thenReturn((realInvocation) async => mockDocumentSnapshot);

  //   final call = toDoDataSourceImpl.getTodoList;

  //   expect(() => call('afs', 'afs'), throwsException);
  // });
}
