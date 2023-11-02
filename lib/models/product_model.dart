import 'package:database_firebase_acc/models/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@unfreezed
class ProductModel with _$ProductModel{
  @JsonSerializable(explicitToJson: true)
  factory ProductModel({
    String? id,
    required String name,
    required CategoryModel category,
    required num price,
    required num stock,
    required String imageUrl,
    String? description,
    @Default(0.0)double avgRating,
    @Default(true)bool available,
    @Default(false)bool featured,
    @Default(0)int discount,
})= _ProductModel;

  factory ProductModel.fromJson(Map<String,dynamic>json)=>
      _$ProductModelFromJson(json);

}















///id, name, category, price , stock, ovbRating, available,featured, image,description,discount,
///