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
}
