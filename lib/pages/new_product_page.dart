import 'dart:io';

import 'package:database_firebase_acc/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class NewProductPage extends StatefulWidget {
  static const String routeName= "/newproduct";
  const NewProductPage({super.key});
  @override
  State<NewProductPage> createState() => _NewProductPageState();
}
class _NewProductPageState extends State<NewProductPage> {
  String? localImagePath;
  CategoryModel? categoryModel;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Product'),),
      body: Form(
        key: _formKey,
        child: ListView(
          padding:const EdgeInsets.all(8.0),
          children: [
            _buildImageSection(),
          ],
        ),
      ),
      );
  }

  _buildImageSection() {
    return Card(
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
       children: [

         localImagePath == null ? const Icon(Icons.card_giftcard, size: 100,):
             Image.file(File(localImagePath!), width: 100,height: 100,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             TextButton.icon(
                 onPressed:(){
                   _getImage(ImageSource.camera);
                 },
             icon: const Icon(Icons.camera),
             label: const Text('Capture'),
             ),
             TextButton.icon(
               onPressed:(){
                 _getImage(ImageSource.gallery);
               },
               icon: const Icon(Icons.photo_album),
               label: const Text('Gallery'),
             )
           ],
         ),
       ],
        ),
     ),
    );
  }

  void _getImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source, imageQuality:60);
    if(file != null){
      setState(() {
        localImagePath = file.path;
      });
    }
  }

  Widget _buildCategorySection(){
    return Card(
        child: Consumer<ProductProvider>(
        builder: (context, provider, child) =>DropdownButtonFormField<CategoryModel>(
      value: categoryModel,
          hint: const Text('Select a category'),
          isExpanded: true,
          items: provider.categoryList.map((category) => DropdownMenuItem<CategoryModel>(
              value: category,
              child: Text(category.name))).toList(),
          onChanged: (value){
            setState(() {
             categoryModel= value;
            });
          },
        ),
      ),
    );
  }
}



