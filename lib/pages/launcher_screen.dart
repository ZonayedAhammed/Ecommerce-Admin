import 'package:database_firebase_acc/auth/auth_services.dart';
import 'package:database_firebase_acc/pages/dashboard_screen.dart';
import 'package:database_firebase_acc/pages/login_screen.dart';
import 'package:flutter/material.dart';


class LauncherScreen extends StatefulWidget {
  static const String routeName = '/';
  const LauncherScreen({super.key});
  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}
class _LauncherScreenState extends State<LauncherScreen> {
@override
  void initState() {
   Future.delayed(const Duration(seconds: 2), (){
     if(AuthService.currentUser != null){
       Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
     }
     else{
       Navigator.pushReplacementNamed(context, LoginScreen.routeName);
     }
   });
   super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
