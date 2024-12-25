import 'package:curd_supabase/controller/provider.dart';
import 'package:curd_supabase/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TodoProvider>(
          builder: (context, value, child) => Column(
            spacing: 20,
            children: [
              TextField(
                controller: value.titleCtrl,
                decoration: InputDecoration(
                  hintText: 'title',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: value.subtitleCtrl,
                decoration: InputDecoration(
                  hintText: 'subtitle',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    value.addData(todoModel(
                        subtitle: value.subtitleCtrl.text.trim(),
                        title: value.titleCtrl.text.trim()));
                  },
                  child: Text("submit")),
            ],
          ),
        ),
      ),
    );
  }
}
