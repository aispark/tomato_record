import 'package:flutter/material.dart';
import 'package:tomato_record/screens/start/address_page.dart';
import 'package:tomato_record/screens/start/auth_page.dart';
import 'package:tomato_record/screens/start/intro_page.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  final PageController _controller = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          IntroPage(_controller),
          const AddressPage(),
          const AuthPage()
        ],
      ),
    );
  }
}
