import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "ProductName")
  String? ProductName;

  @JsonKey(name: "Description")
  String? Description;

  @JsonKey(name: "Category")
  String? Category;

  @JsonKey(name: "ImageUrl")
  String? ImageUrl;

  @JsonKey(name: "Price")
  double? Price;

  @JsonKey(name: "Brand")
  String? Brand;

  @JsonKey(name: "Offer")
  bool? Offer;

  Product({
    this.id,
    this.ProductName,
    this.Description,
    this.Category,
    this.ImageUrl,
    this.Offer,
    this.Price,
    this.Brand,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}