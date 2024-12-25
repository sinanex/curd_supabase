import 'package:curd_supabase/services/services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController subtitleCtrl = TextEditingController();
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: InputDecoration(
                hintText: 'title',
                border: OutlineInputBorder(),
              ),
            ),
             TextField(
              controller: subtitleCtrl,
              decoration: InputDecoration(
                hintText: 'subtitle',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(onPressed: (){
              SupabaseServices supabaseServices = SupabaseServices();
              supabaseServices.insertData(title: titleCtrl.text, subtitle: subtitleCtrl.text);
            }, child: Text("submit")),
          ],
        ),
      ),
    );
  }
}