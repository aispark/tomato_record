import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:tomato_record/screens/home_screen.dart';

import '../screens/start_screen.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [const BeamPage(child: HomeScreen(), key: ValueKey('home'))];
  }

  @override
  List<Pattern> get pathPatterns => ['/'];
}

class AuthLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/auth'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('auth'),
          title: 'auth',
          child: StartScreen(),
        ),
      ];
}
