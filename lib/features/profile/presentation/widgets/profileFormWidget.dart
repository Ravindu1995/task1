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
        builder: ( _ , model, widget) {
    return Container(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
        children: [

          Column(
            children: [
              Text(model.users.name),

              Text(model.users.email),
         
              
              SizedBox(
                height: 15,
              ),
              
              TextFormField(
                controller: model.nameController ,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(40.0),
                    ),
                  ),
                  labelText: 'Name',
                  
                ),
              ),
              RaisedButton(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () async {
                            model.updateUser();
                          },
                          
                          color: Theme.of(context).primaryColor,
                        ),
            ],
          ),
          
        ],
      ),
    );
        },
        viewModelBuilder: () => locator<ProfileModel>());

    
    
  }
}
