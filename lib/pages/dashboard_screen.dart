import 'package:database_firebase_acc/auth/auth_services.dart';
import 'package:database_firebase_acc/customewidgets/dashborad_item_view.dart';
import 'package:database_firebase_acc/models/dashboard_item.dart';
import 'package:database_firebase_acc/pages/launcher_screen.dart';
import 'package:database_firebase_acc/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DashboardScreen extends StatelessWidget {
  static const String routeName = '/dashboard';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getAllCategories();
    return  Scaffold(
      appBar:AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
          onPressed:(){
            AuthService.logout().then((value) => Navigator.pushReplacementNamed(context, LauncherScreen.routeName));
               },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: DashboardItem.dashboardItemList.length,
          itemBuilder: (context, index){
            final item = DashboardItem.dashboardItemList[index];
            return DashboardItemView(item:item);
          },
        ),
      );
    }
  }

