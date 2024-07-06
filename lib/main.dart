import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:roadmap_generator_website/constants/colors.dart';
import 'package:roadmap_generator_website/pages/home_page.dart';
import 'package:roadmap_generator_website/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(scaffoldBackgroundColor: pageBackgroundColor, fontFamily: "InriaSans", canvasColor: Colors.red),
      title: 'Flutter Demo',
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: HomePage(),
        breakpoints: [

          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ]
      ),
    );
  }
}