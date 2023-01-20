import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefConcept extends StatefulWidget {

  @override
  State<SharedPrefConcept> createState() => _SharedPrefConceptState();
}

class _SharedPrefConceptState extends State<SharedPrefConcept> {
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPref"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Name"),
            TextField(
              controller: _name,
            ),
            ElevatedButton(onPressed: () async {

              var nm = _name.text.toString();
              SharedPreferences prefs = await SharedPreferences.getInstance();
              //store
              prefs.setString("firstname", nm);
              Fluttertoast.showToast(
                msg: "Value Stored",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              // localstorage.setItem("firstname",nm);





            }, child: Text("Add")),
            ElevatedButton(onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              //check
              if(prefs.containsKey("firstname"))
                {
                  //read
                  var nm = prefs.getString("firstname");
                  Fluttertoast.showToast(
                    msg: "Value : "+nm.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              else
                {
                  Fluttertoast.showToast(
                    msg: "Value not available",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
            }, child: Text("Read")),
            ElevatedButton(onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              //check
              if(prefs.containsKey("firstname"))
              {
               // prefs.remove("firstname");
                prefs.clear();

                Fluttertoast.showToast(
                  msg: "Value Deleted",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
              else
              {
                Fluttertoast.showToast(
                  msg: "Value not available",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            }, child: Text("Remove"))
          ],
        ),
      ),
    );
  }
}
