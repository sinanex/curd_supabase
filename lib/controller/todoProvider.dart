import 'dart:developer';

import 'package:curd_supabase/model/model.dart';
import 'package:curd_supabase/services/services.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  SupabaseServices services = SupabaseServices();
  List<todoModel> dataList = [];
  bool isLodd = false;
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController subtitleCtrl = TextEditingController();
  void fetchData() async {
    dataList = await services.fetchData();
    if (dataList.isNotEmpty) {
      log("data fetch success");
      isLodd = true;
    } else {
      isLodd = false;
    }
    notifyListeners();
  }

  void addData(todoModel data) async {
   try {
      services.insertData(data);
   } catch (e) {
     log("$e");
   }

    notifyListeners();
  }

  void deleteData({required int id}) async {
    services.deleteData(id);
    notifyListeners();
  }
  void updateData({required todoModel data ,required int id})async{
  await services.updateData(data,id);
  notifyListeners();
  }
}
