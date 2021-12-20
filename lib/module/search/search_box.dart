import 'package:flutter/material.dart';
import 'package:inherited_widget/module/search/search_bloc.dart';
class SearchBox extends StatefulWidget {
  SearchBox({required this.bloc, Key? key}) : super(key: key);
  final SearchBloc bloc;
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {

  final searchController = TextEditingController();
  @override
  void initState(){
    super.initState();

    searchController.addListener(() {
      widget.bloc.search(searchController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child :TextFormField(
          controller : searchController,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            hintText: 'Search...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        )
    );
  }
}

