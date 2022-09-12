import 'package:clock_app/page/alarm_page.dart';
import 'package:clock_app/page/clock_view.dart';
import 'package:clock_app/page/stopwatch_page.dart';
import 'package:clock_app/page/timer_page.dart';
import 'package:clock_app/utils/constant.dart';
import 'package:clock_app/utils/helper_function.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timezone = DateTime.now().timeZoneOffset.toString().split('.').first;
    var offSign = '';
    if (!timezone.startsWith('-')) {
      offSign = '+';
    }

    return Scaffold(
      backgroundColor: bagColor,
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () =>Navigator.pushReplacementNamed(context, HomePage.routeName),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/clock_icon.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    const Text('Clock'),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                  onPressed: () =>Navigator.pushReplacementNamed(context, AlarmPage.routeName),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/alarm_icon.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        'Alarm',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              TextButton(clipBehavior: Clip.antiAlias,
                  onPressed: () =>Navigator.pushReplacementNamed(context, StopwatchPage.routeName),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/stopwatch_icon.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      const Text('Stop Watch'),
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                  onPressed: () =>Navigator.pushReplacementNamed(context, TimerPage.routeName),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/timer_icon.png',
                        height: 45,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                      const Text('Timer')
                    ],
                  )),
            ],
          ),
          const VerticalDivider(
            color: Colors.white,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
              alignment: Alignment.center,
              color: bagColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Clock',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    getFormatDate(DateTime.now(), 'HH:mm'),
                    style: const TextStyle(fontSize: 64, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(getFormatDate(DateTime.now(), 'EEE, d MMM'),
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                  const SizedBox(
                    height: 32,
                  ),
                  const ClockView(),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'TimeZone',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.language,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'UTC $offSign $timezone',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
