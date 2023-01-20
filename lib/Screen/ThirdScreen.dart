import 'package:facebookclone/Screen/FourthScreen.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200.0,),
            Text("This is Third Screen"),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>FourthScreen())
                );
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
