import 'package:TODO/features/login/presentation/pages/loginView.dart';
import 'package:TODO/features/root/presentation/pages/rootViewModel.dart';
import 'package:TODO/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RootPageView extends StatelessWidget {
  const RootPageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RootViewModel>.reactive(
      onModelReady: (model) => {}, //model.handleStartUpLogic(),
      builder: (context, model, widget) {
        if (model.user == null) {
          return LoginPage();
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Color(0xff19c7c1)),
                )
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => locator<RootViewModel>(),
    );
  }
}
