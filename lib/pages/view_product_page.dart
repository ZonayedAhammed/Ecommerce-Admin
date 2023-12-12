import 'package:cached_network_image/cached_network_image.dart';
import 'package:database_firebase_acc/pages/product_details_page.dart';
import 'package:database_firebase_acc/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewProductPage extends StatelessWidget {
  static const String routeName= "/viewproduct";
  const ViewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
    title: const Text('View Product'),),
  body: Consumer<ProductProvider>(
    builder: (context, provider , child) =>ListView.builder(
      itemCount: provider.productList.length,
      itemBuilder: (context,index)
      {
        final product = provider.productList[index];
        return ListTile(
          onTap:()=>Navigator.pushNamed(context, ProductDetailsPage.
              routeName,arguments: product.id
          ),
          leading: SizedBox(
            width: 100,
            height: 100,
            child: CachedNetworkImage(
              fadeInDuration: const Duration(seconds: 3),
              fadeInCurve:Curves.easeInOut,
              imageUrl: product.imageUrl,
              placeholder: (context, url)=> const Center (child: CircularProgressIndicator(),),
              errorWidget:(context, url, error) => const Center(child: Icon(Icons.error),),
            ),
          ),
          title: Text(product.name),
          subtitle: Text('Stock: ${product.stock}'),

             );
           }
         ),
       ),
     );
   }
}
