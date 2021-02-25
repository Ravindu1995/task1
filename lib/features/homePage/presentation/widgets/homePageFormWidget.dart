import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../main.dart';

class HomePageFormWidget extends StatelessWidget {
 
  

SingingCharacter _character = SingingCharacter.lafayette;


  

  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
      RadioListTile<SingingCharacter>(
        title: const Text('Lafayette'),
        value: SingingCharacter.lafayette,
        groupValue: _character,
        onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
      ),
      RadioListTile<SingingCharacter>(
        title: const Text('Thomas Jefferson'),
        value: SingingCharacter.jefferson,
        groupValue: _character,
        onChanged: (SingingCharacter value) { setState(() { _character = value; }); },
      ),
    ],
  );
}
  }



