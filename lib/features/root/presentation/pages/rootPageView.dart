import 'package:TODO/features/root/presentation/pages/rootViewModel.dart';
import 'package:TODO/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RootPageView extends StatelessWidget {

  const RootPageView({
      Key key
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RootViewModel>.reactive(
      onModelReady: (model) {},
      builder: (context, model, widget) {
        return Scaffold(



        );
      },
      viewModelBuilder: () => locator< RootViewModel>(),
    );
  }
}
