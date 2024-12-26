import 'dart:convert';
import 'dart:developer';

import 'package:curd_supabase/controller/todoProvider.dart';
import 'package:curd_supabase/model/model.dart';
import 'package:curd_supabase/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class editPage extends StatefulWidget {
  String? title;
  String? subtitle;
  int? id;
  editPage(
      {super.key,
      required this.id,
      required this.subtitle,
      required this.title});

  @override
  State<editPage> createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    title = TextEditingController(text: widget.title);
    subtitle = TextEditingController(text: widget.subtitle);

    super.initState();
  }

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
                controller: title,
                decoration: InputDecoration(
                  hintText: 'title',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: subtitle,
                decoration: InputDecoration(
                  hintText: 'subtitle',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    value.updateData(
                        data: todoModel(
                            subtitle: subtitle.text, title: title.text),
                        id: widget.id!);
                  log("");
                  },
                  child: Text("submit")),
            ],
          ),
        ),
      ),
    );
  }
}
