import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:curd_supabase/model/model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final supabase = Supabase.instance.client.from('todoApp');
  final bucketName = 'images';
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

    final fileName = 'image' + DateTime.now().toString() + '.jpg';

    try {
      await supabase.storage.from(bucketName).upload(fileName, image);
    } catch (error) {
      print('Error uploading image: $error');
    }
  }

  Future<List<String>> getBucketSupabse() async {
    try {
      final List<FileObject> objects =
          await Supabase.instance.client.storage.from('images').list();
      if (objects.isNotEmpty) {
        log("success fetching images ${objects.length -1}");
        return objects
            .map((img) => Supabase.instance.client.storage
                .from('images')
                .getPublicUrl(img.name))
            .toList();
      } else {
        log("error fetchin ");
      }
    } catch (e) {
      log("$e");
    }
    return [];
  }

  Future deleteFile(String path) async {
    int lastSlashIndex = path.lastIndexOf('/image');

    String fileName = path.substring(lastSlashIndex + 1);
    String cleanedFileName = fileName.replaceAll('%20', ' ');
    log("File deleted : $cleanedFileName");
    try { await Supabase.instance.client.storage
          .from('images')
          .remove([cleanedFileName]);
    } catch (e) {
      log("Failed to delete file: $e");
      return false;
    }
  }
}

