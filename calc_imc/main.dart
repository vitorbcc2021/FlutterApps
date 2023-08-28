import 'package:flutter/material.dart';
import "home_page.dart";

void main() {
  runApp(
    MaterialApp(
      title: "Calculadora IMC",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true),
      home: const HomePage(),
    ),
  );
}
