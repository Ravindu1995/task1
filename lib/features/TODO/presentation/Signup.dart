import 'package:flutter/material.dart';
import 'HomePage.dart';


class SignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[50],


      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Column(
                children: [

                  SizedBox(width: 20.0,height: 30.0,),

                  Text("SignUP", 
                  style:TextStyle(
                    fontSize:40, color: Colors.blueAccent) ),
                ],
              ),

              Flexible(child: Image.asset("assets/background.png" , height: 100, width: 100)),

              SizedBox(width: 20.0,height: 30.0,),

              Container(
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                        const Radius.circular(40.0),
                        ),
                    ),
                  labelText: 'Full Name',
                  hintText: 'Enter Full Name ',
                  ),
                   
                 ),

                SizedBox(width: 20.0,height: 30.0,),
                    
                TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                        const Radius.circular(40.0),
                        ),
                    ),
                  labelText: 'Email',
                  hintText: 'Enter valid mail id ',
                  ),
                   
                 ),

                SizedBox(width: 20.0,height: 30.0,),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: const BorderRadius.all(
                        const Radius.circular(40.0),
                        ),
                    ),
                    labelStyle: TextStyle(),
                 labelText: 'Password',
                  hintText: 'Enter your secure password'
                  ),
               ),

                SizedBox(width: 20.0,height: 30.0,),

                RaisedButton(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
                  onPressed: () {},
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Join",
                    style: TextStyle(fontSize: 14)),
                  ),


                  SizedBox(width: 20.0,height: 50.0,),

                Text("By pressing 'Join' you agree to our" , style: TextStyle(fontSize: 18
                ,color: Colors.grey),
                ),

                TextButton(
                  child: Text("Terms & Condition",style: TextStyle(fontSize: 25),),
                  onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                            },
                ),
                SizedBox(width: 20.0,height: 50.0,),

                

                  ],
                ),
              ),
              
                  
            
                     


              
              
            ],
          ),

        ),
      ),
      
    );
  }
}