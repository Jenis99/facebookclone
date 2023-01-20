import 'package:facebookclone/Screen/AfterLogin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class Login_Page extends StatefulWidget {
  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();
  bool selected=false;

  Remember() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("ch1")){
      if(prefs.getString("ch1")=="true")
        {
          _email.text = prefs.getString("email").toString();
          _password.text = prefs.getString("password").toString();
          setState(() {
            selected=true;
          });
        }
      else
        {
          setState(() {
            selected=false;
          });
          _email.text="";
          _password.text="";
        }

    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Remember();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff28589c),
        title: Text('Log in '),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 20.0,),

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
            Row(
              children: [
                Checkbox(
                  value: selected,
                  onChanged: (val)
                  {
                    setState(() {
                      selected = val!;
                    });
                  },
                ),
                Text("Remember Me"),
              ],
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
                    prefs.setString("islogin", "yes");
                    prefs.setString("ch1",selected.toString());
                    // 2 shared
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>Home())
                    );
                  }
                else{
                  Fluttertoast.showToast(
                      msg: "Please Enter valid Email or Password",
                      toastLength: Toast.LENGTH_SHORT,
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
