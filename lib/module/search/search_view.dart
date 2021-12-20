import 'package:flutter/material.dart';
import 'package:inherited_widget/module/search/search_bloc.dart';

import 'search_box.dart';
import 'search_result.dart';


class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final SearchBloc searchBloc = SearchBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding : EdgeInsets.all(20),
      child : Column(

        children: [
          SearchBox(bloc: searchBloc,),
          Expanded(child: Result(bloc: searchBloc,))
        ],
      )
    );
  }
}
