import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/dependencies.dart';
import 'package:store_app/core/routing/router.dart';
import 'package:store_app/core/utils/themes.dart';


final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(390, 844));
    return MultiProvider(
      providers: providers,
      builder:(context, child) =>  MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        routerConfig: router,
      ),
    );
  }
}


