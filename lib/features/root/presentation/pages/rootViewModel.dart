import 'package:TODO/core/usecases/usecase.dart';
import 'package:TODO/features/root/domain/usecases/rootUsecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

const String _UserLogged = 'user_logged';

class RootViewModel extends MultipleStreamViewModel {
  final RootUsecase rootUsecase;

  //final NavigationService navigationService;

  RootViewModel({@required this.rootUsecase})
      : assert(rootUsecase != null, 'root usecase cannot be null');

  User get user => dataMap[_UserLogged];
  @override
  // TODO: implement streamsMap
  Map<String, StreamData> get streamsMap => {
        _UserLogged: StreamData<User>(
          rootUsecase(NoParams()),
        ),
      };

  // Future handleStartUpLogic() async {
  //   var hasLoggedInUser = await rootUsecase.isUserLoggedIn();

  //   if (hasLoggedInUser) {
  //     navigationService.navigateTo(HomePage);
  //   } else {
  //     navigationService.navigateTo(LoginPage);
  //   }
  // }
}
