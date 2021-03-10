import 'package:TODO/features/homePage/data/datasources/toDoDataSource.dart';
import 'package:TODO/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../mocks/firebaseMocks.dart';


void main() {

  final Map<String, dynamic> tData = {
    'docId':'',
    'title': "Todox",
    'task': "dinner",
    
  };


  MockFirebaseFirestore mockFirebaseFirestore;
  MockCollctionRef mockCollctionRef;
  MockDocumentRef mockDocumentRef;
  MockDocumentSnapshot mockDocumentSnapshot;
  ToDoDataSourceImpl toDoDataSourceImpl;
  MockQuerySnapshot mockQuerySnapshot;
  

  setUp(() {
    mockQuerySnapshot = MockQuerySnapshot();
    mockFirebaseFirestore = MockFirebaseFirestore();
    toDoDataSourceImpl = ToDoDataSourceImpl(firestore: mockFirebaseFirestore);
    mockCollctionRef = MockCollctionRef();
    mockDocumentSnapshot = MockDocumentSnapshot();
  });


  // test('should return todo model list', () async {
  //   when(mockFirebaseFirestore.collection(any)).thenReturn(mockCollctionRef);

  //   when(mockCollctionRef.doc(any)).thenReturn(mockDocumentRef);

  //   when(mockDocumentRef.get()).thenAnswer((_) async => mockDocumentSnapshot);

  //   when(mockDocumentSnapshot.data()).thenAnswer();

  //   final result = await toDoDataSourceImpl.getTodoList('docID');

  //   expect(result, todolist); 
  // });

  // test('should thrown an exception when trying  to create account ', () async {
  //   when(mockFirebaseFirestore.collection(any))
  //       .thenAnswer((realInvocation) async => throw Exception('Error'));

  //   final call = toDoDataSourceImpl.getTodoList;

  //   expect(() => call('afs'), throwsException);
  // });

  

  
}
