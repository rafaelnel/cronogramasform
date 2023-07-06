import 'package:flutter/material.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  final List<String> _lista = ["Aula 1", "Aula 2", "Aula 3", "Aula 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Lista de Aulas"), backgroundColor: Colors.orange),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Center(
            child: ListView(
          children: _lista.map((text) {
            return ListTile(
              tileColor: Colors.orange,
              title: Text(text),
              trailing: const Icon(Icons.book),
            );
          }).toList(),
        )),
      ),
    );
  }
}
