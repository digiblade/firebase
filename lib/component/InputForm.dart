import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController ctrl;
  final bool obscure;
  final String placeholder;
  const InputField({
    Key key,
    this.ctrl,
    this.obscure,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ctrl,
      obscureText: obscure,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black12,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black12,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black54,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
