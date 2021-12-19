import 'dart:async';

import 'package:flutter/material.dart';

void main()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Widget app',
      theme : ThemeData(
        primarySwatch: Colors.blue
      ),
      home : Scaffold(
        appBar : AppBar(
          title : Text("Demo")
        ),
        body : Container(
        child : FutureWidget()
        ),

      )
    );
  }
}

class FutureWidget extends StatefulWidget {
  const FutureWidget({Key? key}) : super(key: key);

  @override
  _FutureWidgetState createState() => _FutureWidgetState();
}

class _FutureWidgetState extends State<FutureWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child : Column(
          children: [
            FutureBuilder(
              future: delayNumberError(),
                builder:(contextt, snapshot){
                if (snapshot.hasError)
                {
                  return Text(
                    snapshot.error.toString()
                  );
                }
                if(snapshot.hasData) {
                  return Text(snapshot.data.toString());
                }
                return Text("Waiting for reload");
                } ),
            TextButton(
                onPressed: (){
             print("Demofurture");
            }
            , child: Text("Demo future"))
          ],
        )
      )
    );
  }
}


Future<void> asyncMethods(){
  return Future.delayed(Duration(seconds: 2), ()=> print("asyncMethod"));
}

Future<int> asyncNumber(){
  return Future.delayed(Duration(seconds: 2), ()=>200);
}
Future<int> asyncMethos(){
  final c = Completer<int>();
  Future.delayed(Duration(seconds: 2), ()=>c.complete(200));
  return c.future;
}

Future<int> delayNumberError(){
  return Future.delayed(Duration(seconds: 2), ()=> throw Exception("Co loi xay ra"));
}
