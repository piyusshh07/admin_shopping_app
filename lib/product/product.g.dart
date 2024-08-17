// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      ProductName: json['ProductName'] as String?,
      Description: json['Description'] as String?,
      Category: json['Category'] as String?,
      ImageUrl: json['ImageUrl'] as String?,
      Offer: json['Offer'] as bool?,
      Price: (json['Price'] as num?)?.toDouble(),
      Brand: json['Brand'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'ProductName': instance.ProductName,
      'Description': instance.Description,
      'Category': instance.Category,
      'ImageUrl': instance.ImageUrl,
      'Price': instance.Price,
      'Brand': instance.Brand,
      'Offer': instance.Offer,
    };
