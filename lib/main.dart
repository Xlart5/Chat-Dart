import 'package:app1/Config/theme/App_theme.dart';
import 'package:app1/Presentation/Providers/chat_provider.dart';
import 'package:app1/Presentation/Screens/Chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Chatprovider())],
      child: MaterialApp(
          title: 'MyApp',
          theme: AppTheme(selectedColor: 3).theme(),
          debugShowCheckedModeBanner: false,
          home: const ChatScreen()),
    );
  }
}
