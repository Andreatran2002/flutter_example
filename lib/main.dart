import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

//Demo 1 : Sử dụng Inherited Widget chia sẻ data
//Demo 2 : Inherited Widget bên trong một stateful widget

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
        child :  MyContainer(child:const Counter() )),

      )
    );
  }
}





class DemoInheritedWidget extends InheritedWidget {
  // int count =1000;

  Widget child;
  _MyContainerState? state ;
  DemoInheritedWidget({ required this.child  ,  this.state, Key? key}) : super(key : key, child : child)  ;

  @override
  bool updateShouldNotify(DemoInheritedWidget old) {
    return true;
  }
}

class MyContainer extends StatefulWidget {
  Widget child ;
  MyContainer({required this.child, Key? key}) : super(key: key);

  @override
  _MyContainerState createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  int data = 0 ;
   increment(){
    // data++;
    setState(() {

    data++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DemoInheritedWidget(child: widget.child, state: this);
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    DemoInheritedWidget? demo = context.dependOnInheritedWidgetOfExactType<DemoInheritedWidget>();
    return Center(
        child: Container(
            child :Column(
                children : [
                  Text(demo!.state!.data.toString()),
                  TextButton(onPressed: ()=>demo.state!.increment(), child: Text("Incresement"))
    ])));
  }
}




//Demo 1
//
// class OngBa extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: ChaMe());
//   }
// }
//
// class ChaMe extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: ConGai(),);
//   }
// }
// class ConGai extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//   DemoInheritedWidget? demo = context.dependOnInheritedWidgetOfExactType<DemoInheritedWidget>();
//     return Container(child : Text(demo!.count.toString()));
//   }
// }


