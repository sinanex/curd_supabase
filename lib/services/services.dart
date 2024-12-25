import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final supabase = Supabase.instance.client.from('todoApp');

  Future<void> insertData(
      {required String title, required String subtitle}) async {
    try {
      final response = await supabase.insert([
        {'title': title, 'subtitle': subtitle}
      ]);
    } catch (e) {
      print('Error inserting data: $e');
    }
  }
}
