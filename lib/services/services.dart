
import 'dart:developer';
import 'dart:io';
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
    } catch (e) {
      log('Error deleting data: $e');
    }
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

  Future<void> updateData(todoModel data, int id) async {
    try {
      final res = await supabase.update(data.toJson()).eq('id', id);
      if (res != null) {
        log("Data updated successfully");
        log("$res");
      } else {
        log("No data updated");
      }
    } catch (e) {
      log("Error updating data: $e");
    }
  }

  Future<void> uploadImage(File image) async {
    final supabase = Supabase.instance.client;

    final bucketName = 'images';
    final fileName = DateTime.now().toIso8601String() + '.jpg';

    try {
      final response = await supabase.storage.from(bucketName).upload(fileName, image);

      final publicUrl = supabase.storage.from(bucketName).getPublicUrl(fileName);
      print('File uploaded successfully. Public URL: $publicUrl');
    } catch (error) {
      print('Error uploading image: $error');
    }
  }
}
