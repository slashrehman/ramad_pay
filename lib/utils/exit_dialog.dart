import 'package:flutter/material.dart';
import '../app_basics/colors.dart';

Future<bool> onWillPop(context) async {
  final shouldPop = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      actionsAlignment: MainAxisAlignment.end,
      title: const Text(
        'CLOSE APPLICATION',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue),
      ),
      content: const Text('Are you sure you want to close the application?',
          textAlign: TextAlign.center),
      actions: [
        TextButton(
          child: const Text('Cancel',
              style:
              TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
          onPressed: () => Navigator.pop(context, false),
        ),
        TextButton(
          child: const Text(
            'Confirm',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
          onPressed: () {},
        ),
      ],
    ),
  );
  return shouldPop ?? false;
}
