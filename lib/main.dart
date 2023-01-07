import 'package:expence_tacker/pages/expense_add_page.dart';
import 'package:expence_tacker/pages/home_page.dart';
import 'package:expence_tacker/pages/launcher_page.dart';
import 'package:expence_tacker/pages/loan_add.dart';
import 'package:expence_tacker/pages/loan_page.dart';
import 'package:expence_tacker/pages/login_page.dart';
import 'package:expence_tacker/pages/multi_screen_pages.dart';
import 'package:expence_tacker/provider/expence_provider.dart';
import 'package:expence_tacker/provider/loan_provider.dart';
import 'package:expence_tacker/provider/multi_screen_provider.dart';
import 'package:expence_tacker/provider/user_provider.dart';
import 'package:expence_tacker/utils/notifications_util.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService notificationService = NotificationService();
  await notificationService.init();
  await notificationService.requestIOSPermissions();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ExpenceProvider()),
        ChangeNotifierProvider(create: (context)=>UserProvider()),
        ChangeNotifierProvider(create: (context)=>MultiScreenProvider()),
        ChangeNotifierProvider(create: (context)=>LoanProvider()),
      ],
      child: const MyApp()),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //home: HomeScreen(),
      initialRoute: LauncherPage.routeName,
      routes: {
        LoginPage.routeName:(context)=>const LoginPage(),
        HomePage.routeName:(context)=>const HomePage(),
        ExpenseAddPage.routeName:(context)=>const ExpenseAddPage(),
        LauncherPage.routeName:(context)=>const LauncherPage(),
        MultiScreenPages.routeName:(context)=>const MultiScreenPages(),
        LoanPage.routeName:(context)=> LoanPage(),
        LoanAdd.routeName:(context)=>const LoanAdd(),
      },

    );
  }
}
