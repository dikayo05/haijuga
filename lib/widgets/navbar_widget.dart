import 'package:flutter/material.dart';

TabBar navbarWidget() {
  return const TabBar(tabs: [
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.chat)),
    Tab(icon: Icon(Icons.person)),
  ]);
}