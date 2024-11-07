import 'package:flutter/material.dart';
import 'package:goes_hunt/core/lifecycle/lifecycle_manager.dart';

class MyAppLayout extends StatefulWidget {
  const MyAppLayout({super.key});

  @override
  State<MyAppLayout> createState() => _MyAppLayoutState();
}

class _MyAppLayoutState extends State<MyAppLayout> {
  @override
  Widget build(BuildContext context) {
    return LifecycleManager(child: MaterialApp());
  }
}
