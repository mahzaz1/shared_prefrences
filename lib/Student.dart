import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String email = '', age = '',type = '';

  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData() async{
    SharedPreferences sp =await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    type = sp.getString('userType') ?? '';
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student View'),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email'),
                  Text(email.toString()),
                ],
              ),
              SizedBox(
                height: 10,
              )
              ,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('Age'),
                  Text(age.toString() ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('Type'),
                  Text(type.toString() ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
