import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourthScreen extends StatefulWidget {

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}
class _FourthScreenState extends State<FourthScreen> {
  var Email="";
  var Password="";
  onload()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Email=prefs.getString("email").toString();
      Password=prefs.getString("password").toString();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onload();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200.0,),
            ElevatedButton(
              onPressed: ()async{

              },
              child: Text("Show"),
            ),
            SizedBox(height: 10.0,),
            Text("Email :"+Email),
            Text("Password :"+Password),
          ],
        ),
      ),
    );
  }
}
