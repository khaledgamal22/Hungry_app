import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/routes/app_router.dart';
import 'package:hungry/core/routes/routing.dart';

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        title: 'Hungry App',
        onGenerateRoute: AppRouter().generateRouter,
        initialRoute: Routing.main,
      ),
    );
  }
}
