import 'package:flutter/material.dart';
import '../models/dashboard_item.dart';

class DashboardItemView extends StatelessWidget {
  final DashboardItem item;
  const DashboardItemView({super.key, required this.item,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => Navigator.pushNamed(context,item.route),
      child: Card(
        color:Colors.blueGrey.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Column(
           mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon, size: 40,color: Colors.white,),
              Text(item.name, style:  const TextStyle(color: Colors.white, fontSize: 18,),),
            ],
          ),
        ),
      ),
    );
  }
}
