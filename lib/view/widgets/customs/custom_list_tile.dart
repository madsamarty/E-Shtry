import 'dart:ui';

import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String leadingIcon, title, trailingIcon;

  const CustomListTile(
      {Key? key,
      required this.leadingIcon,
      required this.title,
      this.trailingIcon = "assets/icons/Icon_Arrow-Right.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: ListTile(
        leading: SizedBox(
          height: 25,
          width: 25,
          child: Image.asset(
            leadingIcon,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        trailing: Image.asset(trailingIcon),
      ),
    );
  }
}
