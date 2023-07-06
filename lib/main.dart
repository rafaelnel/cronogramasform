import 'package:cronogramasform/cadastro.dart';
import 'package:cronogramasform/login.dart';
import 'package:cronogramasform/pagina.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Aulas",
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
        ),
        debugShowCheckedModeBanner: false,
        home: const Login(),
        routes: {
          '/login': (context) => const Login(),
          '/pagina': (context) => const Pagina(),
          '/cadastro': (context) => const Home()
        });
  }
}


// https://walkingtree.tech/wp-content/uploads/2020/10/Theming-in-Flutter.jpg