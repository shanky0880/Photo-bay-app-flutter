import 'package:flutter/material.dart';
import 'package:new_flutter_app/main.dart';


class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: [
              Padding(padding: const EdgeInsets.all(45.0),),
              Image.asset("assets/photobay2.jpg", width: 200,height: 200,),
              ListTile(
                title: TextFormField(
                  controller: myController,
                  decoration: InputDecoration(
                    labelText: 'Enter a Category',
                      hintText: 'eg: dog, bikes, cats ...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 15.0)
                  ),

                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Material(
                    color: Colors.lightBlue,
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(25.0),
                    child: MaterialButton(
                      height:45.0, onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return Secondpage(category: myController.text);})
                        );
                    },
                      child: Text('Search', style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),),

                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
