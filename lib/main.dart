import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:json_api_practise/login.dart';
import 'package:json_api_practise/model/newsmodel.dart';
import 'package:json_api_practise/regestration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  var _style = TextStyle(
      fontSize: 15, color: Colors.white
  );
  List<Articles> dataList = [];

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegestrationPage()));
        },
            child: Text("Go to login")),
      ),
    );


    // return Scaffold(
    //   appBar: AppBar(title: Text("News Api Demo"),
    //   ),
    //   body: Container(
    //       height: MediaQuery.of(context).size.height-100,
    //
    //       child: ListView.builder(
    //         itemCount: dataList.length,
    //
    //           itemBuilder: (context,index){
    //         return Container(
    //         height: MediaQuery.of(context).size.height*.3,
    //           width:  MediaQuery.of(context).size.width*.3,
    //           padding: EdgeInsets.all(5),
    //             margin: EdgeInsets.all( 8),
    //             decoration: BoxDecoration(
    //               border: Border.all(color: Colors.black)
    //             ),
    //
    //
    //             child: Stack(
    //         children: [
    //         Image.network(dataList[index].urlToImage,
    //           height: MediaQuery.of(context).size.height*.3,
    //
    //         fit: BoxFit.cover,),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //
    //         children: [
    //         Text(dataList[index].author, style: _style),
    //         Text(dataList[index].publisedAt,style: _style),
    //         ],
    //         ),
    //         //Text(dataList[index].title,style: _style),
    //         //Text(dataList[index].content,style: _style),
    //         Container(
    //           decoration: BoxDecoration(color: Colors.black.withOpacity(.4)),
    //             alignment: Alignment.bottomCenter,
    //             child: Text(dataList[index].description,style: _style, maxLines: 3,))
    //         ],
    //         )
    //         ],
    //         ),
    //
    //         );
    //
    //   }
    //   )
    //
    //
    //   ));

  }


}

