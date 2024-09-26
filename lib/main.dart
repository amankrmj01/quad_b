import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quad_b/presentation/utils/consts/colors.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        scaffoldBackgroundColor: color4,
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Color.lerp(Colors.red, Colors.white, 0.5),
        // ),
      ),
    );
  }
}
