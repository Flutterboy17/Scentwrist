import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scentwrist/pages/watch_page.dart';

import 'utils/app_colors.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScentWrist',
      home: WatchPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
    );
  }
}
