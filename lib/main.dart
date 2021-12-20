import 'package:provider/provider.dart';
import 'package:stream_channel/stream_channel.dart' as stream;
import 'dart:async';
import 'package:flutter/material.dart';

import 'module/search/search_bloc.dart';
import 'module/search/search_view.dart';
void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'App Demo',
      home: Scaffold(
        appBar : AppBar(title: Text("Deomo bloc")),
        body : Provider<SearchBloc>.value(
            value: SearchBloc(),
            child : SearchView())
      )
    );
  }
}



