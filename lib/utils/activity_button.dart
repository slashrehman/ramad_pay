import 'package:flutter/material.dart';

GestureDetector buildActivityButton(
    IconData icon, String title, Color backgroundColor, Color iconColor) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.all(10),
      height: 90,
      width: 90,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
