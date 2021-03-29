// abstract class Stream<List> {
//   Stream();

//      Future<void> getToDoList(Stream<List> data) async {
//      await  
        
      
//     };

//     factory Stream.fromFuture(Future<List> future) {
//     _StreamController<List> controller =
//         new _SyncStreamController<T>(null, null, null, null);
//     future.then((value) {
//       controller._add(value);
//       controller._closeUnchecked();
//     }, onError: (error, stackTrace) {
//       controller._addError(error, stackTrace);
//       controller._closeUnchecked();
//     });
//     return controller.stream;
//   }
// }
