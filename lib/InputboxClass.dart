import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordInputBox extends StatelessWidget {
  final String  hintText;

  const PasswordInputBox(
      {Key? key,
        required this.hintText
      }

      ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide( color: Colors.black,width: 25),
          ),
          // errorText: 'Wrong password',
          prefixIcon: const Icon(Icons.lock_rounded,color: Colors.red,),
          suffixIcon: const Icon(Icons.remove_red_eye,color: Colors.red,),
          labelText: hintText,
        ),
        style: const TextStyle(color: Colors.black,),
    );

  }

}
class DetailsInputBox extends StatelessWidget{
  final String hintText;
  final Icon prefixIcon;

  const DetailsInputBox(
      {Key? key,
        required this.hintText,
        required this.prefixIcon

      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide( color: Colors.black,width: 25),

          ),
          prefixIcon:  prefixIcon,
          // errorText: 'Invalid email',
          labelText: hintText,
        ),
        style: const TextStyle(color: Colors.black,),

    );

  }

}