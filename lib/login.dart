import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          ElevatedButton(onPressed: (){},
              child: Text("Sign in")),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
          }, child: Text("Create an account"))
        ],
      ),
    );
  }
}
