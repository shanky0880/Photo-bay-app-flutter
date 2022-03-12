import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_app/pages/firstpage.dart';
import 'package:path_provider/path_provider.dart';
import 'src.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main(){
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Awesome App",
    home: firstpage(),
  ),
  );

}


class Secondpage extends StatefulWidget {
  String category;
  Secondpage({this.category});

  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Photo bay',
        style: TextStyle(color: Colors.white),),
        centerTitle: true,

      ),
      body: FutureBuilder(
        future: getPics(widget.category),
        builder: (context, snapShot) {
          Map data = snapShot.data;
          if (snapShot.hasError) {
            print(snapShot.error);
            return Text('failed to get respones from the server',
              style: TextStyle(color: Colors.red,
                  fontSize: 22.0),);
          } else if (snapShot.hasData)
            return Center(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(padding: const EdgeInsets.all(5.0)),
                        Container(
                          child: InkWell(
                            onTap: () {},
                            child: Image.network(
                                '${data['hits'][index]['largeImageURL']}'
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            );
          else if (!snapShot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          }
        }),
    );
  }
}


Future<Map> getPics(String category) async{
  String url = 'https://pixabay.com/api/?key=$apikey&q=$category&image_type=photo&pretty=true';
  http.Response response = await http.get(url);
  return json.decode(response.body);

}
