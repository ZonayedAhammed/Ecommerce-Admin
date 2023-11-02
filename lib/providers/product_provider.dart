import 'package:database_firebase_acc/db/db_helper.dart';
import 'package:flutter/foundation.dart';
import '../models/category_model.dart';

class ProductProvider extends ChangeNotifier{
  List<CategoryModel> categoryList =[];

  Future<void>addCategory(String name) {
    final category = CategoryModel(name: name);
    return DbHelper.addCategory(category);
}
getAllCategories() {
  DbHelper.getAllCategories().listen((snapshot) {
    categoryList = List.generate(snapshot.docs.length, (index) =>
        CategoryModel.fromJson(snapshot.docs[index].data()
        ));
    notifyListeners();
  });
}
}