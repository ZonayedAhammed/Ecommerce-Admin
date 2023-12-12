import 'package:database_firebase_acc/pages/launcher_screen.dart';
import 'package:database_firebase_acc/pages/new_product_page.dart';
import 'package:database_firebase_acc/pages/category_page.dart';
import 'package:database_firebase_acc/pages/product_details_page.dart';
import 'package:database_firebase_acc/pages/view_product_page.dart';
import 'package:database_firebase_acc/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'pages/dashboard_screen.dart';
import 'pages/login_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProductProvider(),),
    ],
      
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

        initialRoute:LauncherScreen.routeName,
        builder: EasyLoading.init(),
        routes:

        {
          LauncherScreen.routeName:(_) => LauncherScreen(),
          LoginScreen.routeName:(_) => LoginScreen(),
          DashboardScreen.routeName:(_) => DashboardScreen(),
          NewProductPage.routeName:(_) => NewProductPage(),
          ViewProductPage.routeName:(_) => ViewProductPage(),
          CategoryPage.routeName:(_) => CategoryPage(),
          ProductDetailsPage.routeName:(_) => ProductDetailsPage(),

        },
    );
  }
}


