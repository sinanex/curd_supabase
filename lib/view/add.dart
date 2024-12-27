import 'package:curd_supabase/controller/imageProvider.dart';
import 'package:curd_supabase/controller/todoProvider.dart';
import 'package:curd_supabase/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer2<TodoProvider, Imageprovider>(
          builder: (context, todoPro, imagePro, child) => Column(
            spacing: 20,
            children: [
              Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: imagePro.imageFile != null
                        ? ClipOval(
                            child: Image.file(
                              imagePro.imageFile!,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          )
                        : Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.grey,
                          ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        imagePro.pickImage();
                      },
                      child: Text("Add image")),
                ],
              ),
              TextField(
                controller: todoPro.titleCtrl,
                decoration: InputDecoration(
                  hintText: 'title',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: todoPro.subtitleCtrl,
                decoration: InputDecoration(
                  hintText: 'subtitle',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (imagePro.imageFile != null &&
                        todoPro.subtitleCtrl.text.isNotEmpty &&
                        todoPro.titleCtrl.text.isNotEmpty) {
                      imagePro.addImage();
                      todoPro.addData(todoModel(
                          subtitle: todoPro.subtitleCtrl.text,
                          title: todoPro.titleCtrl.text));
                      Navigator.pop(context);
                      todoPro.titleCtrl.clear();
                      todoPro.subtitleCtrl.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("fill all feild")));
                    }
                  },
                  child: Text("submit")),
            ],
          ),
        ),
      ),
    );
  }
}
