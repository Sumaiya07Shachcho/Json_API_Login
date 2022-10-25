import 'package:flutter/material.dart';
import 'package:json_api_practise/login.dart';

class RegestrationPage extends StatefulWidget {
  const RegestrationPage({Key? key}) : super(key: key);

  @override
  State<RegestrationPage> createState() => _RegestrationPageState();
}

class _RegestrationPageState extends State<RegestrationPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NewsPage"),),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your name"
            ),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your email"
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your password"
            ),
          ),
          ElevatedButton(onPressed: (){
            registration();
          },
              child: Text("Sign up")),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
          }, child: Text("Already have an account"))
        ],
      ),
    );
  }
  registration(){
    String name = nameController.text.toString();
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString();


    var data = {
      "name" : name,
      "email" : email,
      "password" : password,

    };
  }

}
