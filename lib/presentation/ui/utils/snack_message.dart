
import 'package:flutter/material.dart';

void showSnackBarMessage(
    String message, BuildContext context, [bool isError = false]
    ){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: isError ? Colors.red : null,));
  
}