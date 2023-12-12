import 'package:cached_network_image/cached_network_image.dart';
import 'package:database_firebase_acc/models/product_model.dart';
import 'package:database_firebase_acc/providers/product_provider.dart';
import 'package:database_firebase_acc/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constans.dart';

class ProductDetailsPage extends StatefulWidget {
  static const String routeName = '/productdetails';
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late String id;
  late ProductModel productModel;
  late ProductProvider provider;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as String;
    provider = Provider.of<ProductProvider>(context);
    productModel =provider
        .getProductById(id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(productModel.name),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: 250,
            fadeInDuration: const Duration(seconds: 2),
            fadeInCurve:Curves.easeInOut,
            imageUrl: productModel.imageUrl,
            placeholder: (context, url)=> const Center (child: CircularProgressIndicator(),),
            errorWidget:(context, url, error) => const Center(child: Icon(Icons.error),),
          ),

          ListTile(
            title: Text(productModel.category.name),
              subtitle: Text(productModel.description ?? "Descripton not found"),
          ),

      ListTile(
        title: Text('$currencySymbol${productModel.price}',style:Theme.of(context).textTheme.displayMedium,),
        subtitle: Text('Price after discount:${provider.priceAfterDiscount(productModel.price,productModel.discount,)}',style:Theme.of(context).textTheme.titleLarge),
        trailing: IconButton.outlined(
            onPressed: (){},
            icon: const Icon(Icons.edit),
      ),),

      ListTile(
        title: Text('Discount: ${productModel.discount}%',style:Theme.of(context).textTheme.titleLarge),
          trailing: IconButton.outlined(
          onPressed: (
              ){showSingleTextInputDialog(context: context,
              title: 'Update Discount',
              onSave: (value){
                provider.updateProductField(id, 'discount', int.parse(value));
              });
            },
        icon: const Icon(Icons.edit),
      ),),
        ],
      ),
    );
  }
}