import 'package:curd_supabase/home.dart';
import 'package:curd_supabase/services/services.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final url = 'https://ggqzlvjlhzqgsweivlko.supabase.co';
final anon =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdncXpsdmpsaHpxZ3N3ZWl2bGtvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ2NzU1NzEsImV4cCI6MjA1MDI1MTU3MX0.mT7LSj7iJ0h7o58iNMkQZOOOkqDIiHGoYkx2Y26pRm8';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: url, anonKey: anon);
   
  runApp(MyApp());
  SupabaseServices ser = SupabaseServices();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}