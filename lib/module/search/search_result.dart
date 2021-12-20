
import 'package:flutter/cupertino.dart';

import 'search_bloc.dart';

class Result extends StatefulWidget {
  Result({required this.bloc,Key? key}) : super(key: key);
  final SearchBloc bloc;
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child : StreamBuilder<List<String>>(
          initialData: [],
          stream : widget.bloc.searchController.stream,
          builder : (context,snapshot){
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  return _buildRow(snapshot.data![index]);
                });

          },
        )
    );
  }
  Widget _buildRow(String data){
    return Container(child : Text(data,style : TextStyle(fontSize : 20)));
  }
}
