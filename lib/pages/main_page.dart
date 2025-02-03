import 'package:flutter/material.dart';
import 'package:haijuga/pages/create_post_page.dart';

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
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePostPage()));
                },
              ),
            ],
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
