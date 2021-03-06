import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_prayer/screens/views/home.dart';
import 'package:my_prayer/screens/views/navigation.dart';
import 'package:my_prayer/screens/views/reminders.dart';
import 'package:my_prayer/screens/views/settings.dart';
import 'package:my_prayer/screens/views/dashboard.dart';
import 'package:my_prayer/screens/views/tasbih_history.dart';
import 'package:my_prayer/utils/router_path_constants.dart';

import 'screens/views/add_prayer.dart';

class PathRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterPathsConstants.ADD_PRAYER:
        return MaterialPageRoute(builder: (_) => AddPrayer());
      case RouterPathsConstants.DASHBOARD:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case RouterPathsConstants.NAVIGATION:
        // var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => Navigation());
      case RouterPathsConstants.REMINDER:
        // var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => ViewReminders());
      case RouterPathsConstants.SETTINGS:
        return MaterialPageRoute(builder: (_) => Settings());
      case RouterPathsConstants.TasbihHistory:
        return MaterialPageRoute(builder: (_) => ViewTasbihHistory());
      case RouterPathsConstants.HOME:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
