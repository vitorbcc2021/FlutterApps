import 'dart:io';

import 'package:final_project/login_screen.dart';
import 'package:final_project/controllers/post_controller.dart';
import 'package:final_project/repositories/post_repository.dart';
import 'package:final_project/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/user_controller.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  Get.put(UserRepository());
  Get.put(PostRepository());

  Get.put(UserController(repository: Get.find<UserRepository>()));
  Get.put(PostController(repository: Get.find<PostRepository>()));

  PostController pc = Get.find<PostController>();

  pc.length = (await pc.getAllPosts()).length;

  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey.shade900),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    ),
  );
}
