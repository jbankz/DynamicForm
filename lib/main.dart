import 'package:dynamic_form/model/UsersModel.dart';
import 'package:dynamic_form/widgets/EntryField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<UserModel> _users = [UserModel()];

  void _removeField(UserModel model) {
    if (_users.length == 1) return;
    _users.remove(model);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: () => _toJson(), icon: Icon(Icons.save))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  ..._users
                      .map((model) => EntryField(
                            onRemove: () => _removeField(model),
                            model: model,
                            onChangedEmail: (v) => model..email = v,
                            onChangedAge: (v) => model..age = int.tryParse(v),
                          ))
                      .toList(),
                ],
              )),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _addField(),
                child: const Center(
                  child: Text(
                    'Add Field +',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addField() {
    _users.add(UserModel());
    setState(() {});
  }

  void _toJson() {
    if (_users.isEmpty) return;
    _users.map((user) => print(user.toMap())).toList();
  }
}
