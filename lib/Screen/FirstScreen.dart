import 'package:facebookclone/Screen/SecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 100.0,),

            Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email"),
                    SizedBox(height: 10.0,),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Ex.abc@email.com',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xff28589c),),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Color(0xffF4F4F4)),
                          borderRadius: BorderRadius.circular(10.0),

                        ),
                      ),
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                )
            ),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password"),
                  SizedBox(height: 10.0,),
                  TextField(

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Ex.123',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff28589c),),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Color(0xffF4F4F4)),
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                    ),
                    controller: _password,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              // padding: EdgeInsets.only(left: 210.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Forgotten Password?",style: TextStyle(
                    color:  Color(0xff28589c),
                  ),),
                ],
              ),
            ),
            SizedBox(height: 20.0,),

            // ElevatedButton(
            //   child: const Text('Login',style: TextStyle(
            //       fontSize: 20.0,
            //       fontFamily: "SourceSansPro Bold"
            //   ),),
            //   onPressed: () {

            //   },
            //   style: ElevatedButton.styleFrom(
            //     padding: const EdgeInsets.fromLTRB(37, 15, 37, 15),
            //     primary: Color(0xff28589c),
            //   ),
            // ),
            ElevatedButton(
              child: const Text('Login',style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "SourceSansPro Bold"
              ),),
              onPressed: () async{
                var em = _email.text.toString();
                var pas=_password.text.toString();

                if (em=="test@gmail.com" && pas=="123" )
                {
                  SharedPreferences prefs=await SharedPreferences.getInstance();
                  prefs.setString("email", em);
                  prefs.setString("password", pas);

                  // 2 shared
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>SecondScreen())
                  );
                }
                else{
                  Fluttertoast.showToast(
                    msg: "Please Enter valid Email or Password",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
            )


          ],
        ),
      ),
    );
  }
}
