import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefrences/Home.dart';
import 'package:shared_prefrences/Student.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController userTypeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(hintText: 'Age'),
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: userTypeController,
                decoration: InputDecoration(hintText: 'Teacher or Student'),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('age', ageController.text.toString());
                  sp.setString('userType',userTypeController.text.toString());
                  sp.setBool('isLogin', true);
                  
                  if(sp.getString('userType')== 'student'){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));

                  }else if(sp.getString('userType')== 'teacher'){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

                  }else(
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid User Type')))

                  );
                  },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  color: Colors.green,
                  child: Text('Login'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
