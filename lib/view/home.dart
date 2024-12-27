
import 'package:curd_supabase/controller/imageProvider.dart';
import 'package:curd_supabase/controller/todoProvider.dart';
import 'package:curd_supabase/view/add.dart';
import 'package:curd_supabase/view/update.dart';
import 'package:flutter/material.dart';
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
    Provider.of<Imageprovider>(context, listen: false).getImage();
    super.initState();
  }

  @override
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
      onRefresh: () async {
        Provider.of<TodoProvider>(context, listen: false).fetchData();
        Provider.of<Imageprovider>(context, listen: false).getImage();
      },
      child: Consumer2<Imageprovider, TodoProvider>(
          builder: (context, img, todo, child) {
        final itemCount = 
            (img.imageList.length - 1).clamp(0, todo.dataList.length);

        return ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            final data = todo.dataList[index];
            final image = img.imageList[index + 1];

            return ListTile(
              leading: Image.network(
                image,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.error),
              ),
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
                        todo.deleteData(id: data.id!);
                        img.delteImage(path: image);
                      },
                      icon: Icon(Icons.delete)),
                ],
              ),
              title: Text(data.title!),
            );
          },
        );
      }),
    ),
  );
}
}