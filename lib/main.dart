import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_todo_app/screens/detail_screen.dart';
import 'package:my_todo_app/screens/home_screen.dart';
import 'package:my_todo_app/screens/splash_screen.dart';
import 'package:my_todo_app/screens/task_detail_screen.dart';
import 'package:my_todo_app/screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyToDoApp());
}

class MyToDoApp extends StatelessWidget {
  const MyToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Todo App',
      home: const HomeScreen(),
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        DetailScreen.id: (context) => const DetailScreen(),
        TaskDetailScreen.id: (context) => const TaskDetailScreen(),
      },
    );
  }
}
