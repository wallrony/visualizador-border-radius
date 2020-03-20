import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  TextEditingController controller;
  Function onChanged;

  AppInput(this.controller, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Radius",
        labelStyle: TextStyle(
          fontSize: 18,
          color: Colors.indigo
        ),
        hintText: "Digite a curvatura a visualizar",
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        )
      ),
    );
  }
}
