import 'package:facebookclone/Screen/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("This is Home Screen"),
          ElevatedButton(onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            if(prefs.containsKey("ch1")=="true")
            {
              prefs.remove("islogin");
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>Login_Page())
              );
            }
            else{
              prefs.clear();
            }

            //check
          }, child: Text("Log Out")),

          ],
        ),
      ),
    );
  }
}
