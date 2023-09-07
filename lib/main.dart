import 'package:flutter/material.dart';
import 'package:flutter_world_time/pages/choose_location.dart';
import 'package:flutter_world_time/pages/home.dart';
import 'package:flutter_world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation()
    },
    builder: (context, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: child!,
      );
    },
  ));
}

