import 'package:flutter/material.dart';

import '../../../constants.dart';

class data_user extends StatelessWidget {
  final String data_name;
  final String data;

  const data_user({
    Key? key,
    required this.data_name,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(
            fontSize: 25,
          ),
          children: [
            TextSpan(
              text: data_name,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: laranja,
              ),
            ),
            TextSpan(
              text: data,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: verde_escuro,
              ),
            ),
          ],
        ),
      ),
    );
  }
}