import 'package:clock_app/page/alarm_page.dart';
import 'package:clock_app/page/home_page.dart';
import 'package:clock_app/page/stopwatch_page.dart';
import 'package:clock_app/page/timer_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       // backgroundColor: bagColor,
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
        AlarmPage.routeName: (_) => const AlarmPage(),
        StopwatchPage.routeName: (_) => const StopwatchPage(),
        TimerPage.routeName: (_) => const TimerPage(),
      },
    );
  }
}
