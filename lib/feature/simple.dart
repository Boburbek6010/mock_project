import 'dart:developer';

import 'package:flutter/material.dart';

class Simple extends StatelessWidget {
  const Simple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton(
          items: const [
            DropdownMenuItem(
              value: "uz",
              child: Text("hello"),
            ),
            DropdownMenuItem(
              value: "ru",
              child: Text("salom"),
            ),
            DropdownMenuItem(
              value: "en",
              child: Text("Hola"),
            ),
          ],
          value: "uz",
          onChanged: (value) {
            log("onChanged: $value");
          },
        ),
      ),
    );
  }
}
