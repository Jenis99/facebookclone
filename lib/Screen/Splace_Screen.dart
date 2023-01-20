import 'package:facebookclone/Screen/Home.dart';
import 'package:facebookclone/Screen/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splace_Screen extends StatefulWidget {
  @override
  State<Splace_Screen> createState() => _Splace_ScreenState();
}

class _Splace_ScreenState extends State<Splace_Screen> {
  checklogin() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin")){
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>Home())
      );
    }
    else{
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>Login_Page())
      );
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is Splace Screen"),
      ),
    );
  }
}
