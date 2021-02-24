import 'package:flutter/material.dart';

class HomePageFormWidget extends StatelessWidget {
  const HomePageFormWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Today",
            style: TextStyle(fontSize: 30),
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                subtitle: Text('saddoigooisoijoroijrf'),
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {},
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: CircleAvatar(),
                  ),
                ),
                title: Text('title'),
                dense: false,
              );
            },
          )
          /*ListTile(
            leading: CircularCheckBox(
                value: this.selected,
                checkColor: Colors.white,
                activeColor: Colors.green,
                inactiveColor: Colors.redAccent,
                disabledColor: Colors.grey,
                onChanged: (val) => this.setState(() {
                      this.selected = !this.selected;
                    })),
            title: Text("Click me"),
            onTap: () => this.setState(() {
              this.selected = !this.selected;
            }),
          ),*/
        ],
      ),
    );
  }
}