// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      id: json['id'] as String?,
      BoughtProductName: json['BoughtProductName'] as String?,
      ProductPrice: (json['Price'] as num?)?.toDouble(),
      BoughtProductImage: json['BoughtProductImage'] as String?,
      MobileNo: (json['MobileNo'] as num?)?.toInt(),
      UserName: json['UserName'] as String?,
      Address: json['Address'] as String?,
      Datetime: json['Datetime'] as String?,
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'id': instance.id,
      'BoughtProductName': instance.BoughtProductName,
      'BoughtProductImage': instance.BoughtProductImage,
      'Price': instance.ProductPrice,
      'UserName': instance.UserName,
      'MobileNo': instance.MobileNo,
      'Address' : instance.Address,
      'Datetime' : instance.Datetime
    };
