import 'package:curd_supabase/model/model.dart';
import 'package:curd_supabase/services/services.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
SupabaseServices services = SupabaseServices();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController subtitleCtrl = TextEditingController();
     

  void addData(todoModel data)async{
  services.insertData(data);
  notifyListeners();
  }
  
}