import 'package:cronogramasform/pagina.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cadastro Aula",
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const Pagina(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _aulaformKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'pendente',
      'label': 'Pendente',
      'icon': const Icon(Icons.priority_high),
      'textStyle': const TextStyle(color: Colors.yellow),
    },
    {
      'value': 'pinistrada',
      'label': 'Ministrada',
      'icon': const Icon(Icons.check),
      'textStyle': const TextStyle(color: Colors.green),
    },
    {
      'value': 'cancelada',
      'label': 'Cancelada',
      'icon': const Icon(Icons.close),
      'textStyle': const TextStyle(color: Colors.red),
    },
  ];
  final TextEditingController _diacontroller = TextEditingController();
  final TextEditingController _turmacontroller = TextEditingController();
  final TextEditingController _unidadecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro Aula"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: const EdgeInsets.all(200),
        child: Center(
            child: SingleChildScrollView(
          child: Form(
              key: _aulaformKey,
              child: Column(
                children: [
                  DateTimeField(
                    controller: _diacontroller,
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_month),
                      labelText: "Dia: ",
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Campo obrigatório";
                      }
                    },
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown,
                    initialValue: 'pendente',
                    icon: const Icon(Icons.book),
                    labelText: 'Status aula:',
                    items: _items,
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                  TextFormField(
                    controller: _turmacontroller,
                    decoration: const InputDecoration(
                      labelText: "Turma: ",
                      icon: Icon(Icons.group),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      }
                    },
                  ),
                  TextFormField(
                    controller: _unidadecontroller,
                    decoration: const InputDecoration(
                      labelText: "Unidade: ",
                      icon: Icon(Icons.business),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      }
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_aulaformKey.currentState!.validate()) {
                          debugPrint("Aula Cadastrada");
                          Fluttertoast.showToast(
                              msg: "Aula Cadastrada",
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.green);
                        }
                      },
                      child: const Text("Cadastrar Aula")),
                ],
              )),
        )),
      ),
    );
  }
}
