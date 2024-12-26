import 'package:curd_supabase/controller/todoProvider.dart';
import 'package:curd_supabase/view/add.dart';
import 'package:curd_supabase/view/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<TodoProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddPage()));
          }),
      body: RefreshIndicator(
        onRefresh: ()async{
              Provider.of<TodoProvider>(context, listen: false).fetchData();
        },
        child: Consumer<TodoProvider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.dataList.length,
            itemBuilder: (context, index) {
              final data = value.dataList[index];
              return ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editPage(
                                      id: data.id,
                                      subtitle: data.subtitle,
                                      title: data.title)));
                        },
                        icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          value.deleteData(id: data.id!);
                        },
                        icon: Icon(Icons.delete)),
                  ],
                ),
                title: Text(data.title!),
              );
            },
          ),
        ),
      ),
    );
  }
}
