import 'package:curd_supabase/controller/provider.dart';
import 'package:curd_supabase/view/add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  Provider.of<TodoProvider>(context,listen: false).fetchData();
    return Scaffold(
      floatingActionButton: FloatingActionButton( child: Icon(Icons.add), onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
      }),
      body: Consumer<TodoProvider>(
        builder:(context, value, child) =>  ListView.builder(
          itemCount: value.dataList.length,
          itemBuilder: (context, index) {
         final data = value.dataList[index];
          return ListTile(
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              IconButton(onPressed: (){
                  value.deleteData(id: data.id!);
              }, icon: Icon(Icons.delete)),
              ],
            ),
            title: Text(data.title!),
          );
        },),
      ),
    );
  }
}