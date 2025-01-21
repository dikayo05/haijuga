import 'package:flutter/material.dart';

import 'package:haijuga/pages/views/profile_view.dart';

// widget
import 'package:haijuga/widgets/navbar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('haijuga'),
          ),
          body: const TabBarView(children: [
            Text('home'),
            Text('message'),
            ProfileView(),
          ]),
          bottomNavigationBar: navbarWidget(),
        ));
  }
}
