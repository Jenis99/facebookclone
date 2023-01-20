import 'package:facebookclone/Screen/ThirdScreen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200.0,),
            Text("This Is Second Screen"),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>ThirdScreen())
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
