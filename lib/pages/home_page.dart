import 'package:flutter/material.dart';

// widget
import 'package:haijuga/widgets/navbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Text('profile'),
          ]),
          bottomNavigationBar: navbarWidget(),
        ));
  }
}
