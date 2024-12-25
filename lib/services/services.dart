import 'dart:convert';
import 'dart:developer';

import 'package:curd_supabase/model/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final supabase = Supabase.instance.client.from('todoApp');

  Future<void> insertData(todoModel todoData) async {
    try {
 await supabase.insert([todoData.toJson()]);
    } catch (e) {
      print('Error inserting data: $e');
    }
  }
  Future<void>deleteData()async{
    try {
      await supabase.delete().eq('id', 9);
    } catch (e) {
      
    }

    
  }


  Future<List<todoModel>> fetchData() async {
    try {
      final response = await supabase.select('*'); 

      if (response.isNotEmpty) {
        return response.map<todoModel>((json) => todoModel.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e'); 
      return [];
    }
  }
}

