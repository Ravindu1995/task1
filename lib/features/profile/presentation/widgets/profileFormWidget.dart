import 'package:TODO/features/TODO/presentation/homeView.dart';
import 'package:TODO/features/profile/presentation/pages/profileModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../serviceLocator.dart';

class ProfileFormWidget extends StatelessWidget {
  const ProfileFormWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileModel>.reactive(
        onModelReady: (model) {},
        builder: (_, model, widget) {
    return Container(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
                    child: Card(
                  color: Colors.green[100],
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    //itemExtent: 100.0,
                    shrinkWrap: true,
                    itemCount: model.users != null ? model.users.length : 0,
                    itemBuilder: (context, index) {
                      return  ListTile(
                        focusColor: Colors.blue,
                        title: Text(
                          model.users[index].name,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          model.users[index].email,
                          style: TextStyle(fontSize: 15),
                        ),
                        // onTap: () async {
                        //   showDialog(context: Get.context, child: Popup(toDoViewModel: model,),  );
                        // },
                        // onLongPress: () async {
                        //   await model.deleteTask(index);
                        // },
                      );
                    },
                    scrollDirection: Axis.vertical,
                  ),
                )),
        ],
      ),
    );
        },
        viewModelBuilder: () => locator<ProfileModel>());

    
    
  }
}
