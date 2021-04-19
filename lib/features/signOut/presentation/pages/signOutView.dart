import 'package:TODO/features/signOut/presentation/pages/signOutModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../serviceLocator.dart';

class SignOutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignOutModel>.reactive(
        onModelReady: (model) => {},
        builder: (context, model, widget) {
          return Scaffold(
              backgroundColor: Colors.grey[50],
              body: SafeArea(
        child: Container(
                width: double.infinity,
                child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.green[300],
                child: Text(
                            'SignOut',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                onPressed: () async { 
                  model.signOut(); }
              ),
            ],
          
                        ),
                        ),
                       
           ), );
          
        }, viewModelBuilder: () => locator<SignOutModel>(),
        );
  }
}
