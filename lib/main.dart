import 'package:curd_supabase/constants/supbaseKey.dart';
import 'package:curd_supabase/controller/provider.dart';
import 'package:curd_supabase/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: url, anonKey: anon);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
