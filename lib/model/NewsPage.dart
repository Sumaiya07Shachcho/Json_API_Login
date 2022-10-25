import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_api_practise/model/newsmodel.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var _style = TextStyle(
      fontSize: 15, color: Colors.white
  );
  List<Articles> dataList = [];

  @override
  void initState() {
    getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("News Api Demo"),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height-100,

            child: ListView.builder(
                itemCount: dataList.length,

                itemBuilder: (context,index){
                  return Container(
                    height: MediaQuery.of(context).size.height*.3,
                    width:  MediaQuery.of(context).size.width*.3,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all( 8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),


                    child: Stack(
                      children: [
                        Image.network(dataList[index].urlToImage,
                          height: MediaQuery.of(context).size.height*.3,

                          fit: BoxFit.cover,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(dataList[index].author, style: _style),
                                Text(dataList[index].publisedAt,style: _style),
                              ],
                            ),
                            //Text(dataList[index].title,style: _style),
                            //Text(dataList[index].content,style: _style),
                            Container(
                                decoration: BoxDecoration(color: Colors.black.withOpacity(.4)),
                                alignment: Alignment.bottomCenter,
                                child: Text(dataList[index].description,style: _style, maxLines: 3,))
                          ],
                        )
                      ],
                    ),

                  );

                }
            )


        ));

  }
  getDataFromApi() async{
    String apiUrl = "https://newsapi.org/v2/everything?q=tesla&from=2022-06-25&sortBy=publishedAt&apiKey=a186da25c2db41079e3a61a3ef78b3ee";
    var result =await http.get(Uri.parse(apiUrl));
    print(result);

    var jsonData = jsonDecode(result.body);
    print(jsonData);
    jsonData['articles'].forEach((item){
      Articles articles = Articles(
        item['author']??"",
        item['title']??"",
        item['description']??"",
        item['url']??"",
        item['urlToImage']??"",
        item['content']??"",
        item['publishedAt']??"",
      );
      dataList.add(articles);
    });
    setState((){

    });

  }
}
