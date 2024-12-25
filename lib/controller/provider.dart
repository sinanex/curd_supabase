import 'dart:developer';

import 'package:curd_supabase/model/model.dart';
import 'package:curd_supabase/services/services.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  SupabaseServices services = SupabaseServices();
  List<todoModel> dataList = [];
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController subtitleCtrl = TextEditingController();
  void fetchData() async {
    dataList = await services.fetchData();
    if(dataList.isNotEmpty){
      log("data fetch success");
    }
    notifyListeners();
  }

  void addData(todoModel data) async {
    services.insertData(data);
    fetchData();
    notifyListeners();
  }
  void deleteData({required int id})async{
    services.deleteData(id);
    fetchData();
    notifyListeners();
  }
}
