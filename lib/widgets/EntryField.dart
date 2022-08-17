import 'dart:math';

import 'package:dynamic_form/model/UsersModel.dart';
import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final Function() onRemove;
  final UserModel? model;
  final Function(String)? onChangedEmail;
  final Function(String)? onChangedAge;

  const EntryField(
      {required this.onRemove,
      required this.model,
      Key? key,
      required this.onChangedAge,
      required this.onChangedEmail})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController email =
        TextEditingController(text: model?.email ?? '');
    TextEditingController age =
        TextEditingController(text: model?.age?.toString() ?? '');
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(23),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.clear, color: Colors.red)),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: email,
            keyboardType: TextInputType.emailAddress,
            onChanged: onChangedEmail,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'What is your email',
              labelText: 'Email *',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: age,
            keyboardType: TextInputType.number,
            onChanged: onChangedAge,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'What is your age',
              labelText: 'Age *',
            ),
          ),
        ],
      ),
    );
  }
}
