import 'dart:developer';

import 'package:curd_supabase/model/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final supabase = Supabase.instance.client.from('todoApp');

  Future<void> insertData(todoModel todoData) async {
    try {
      await supabase.insert([todoData.toJson()]);
    } catch (e) {
      throw Exception('Error inserting data: $e');
    }
  }

  Future<void> deleteData(int id) async {
    try {
      await supabase.delete().eq('id', id);
    } catch (e) {}
  }

  Future<List<todoModel>> fetchData() async {
    try {
      final response = await supabase.select('*');

      if (response.isNotEmpty) {
        return response.map((json) => todoModel.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<void> updateData(todoModel data,int id) async {

    try {
      final res = await supabase.update(data.toJson()).eq('id', id);
      if (res != null) {
        log("data updated sucess");
        log("$res");
      } else {
        log("df");
      }
    } catch (e) {
      log("$e");
    }
  }
}
