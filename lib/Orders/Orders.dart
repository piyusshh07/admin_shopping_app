import 'package:json_annotation/json_annotation.dart';
part 'Orders.g.dart';

@JsonSerializable()
class Orders {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "BoughtProductName")
  String? BoughtProductName;

  @JsonKey(name: "BoughtProductImage")
  String? BoughtProductImage;

  @JsonKey(name: "Price")
  double? ProductPrice;

  @JsonKey(name: 'UserName')
  String? UserName;

  @JsonKey(name: 'Address')
  String? Address;

  @JsonKey(name: 'Datetime')
  String? Datetime;

  @JsonKey(name: 'MobileNo')
  int? MobileNo;


  Orders({
    this.id,
    this.BoughtProductName,
    this.ProductPrice,
    this.BoughtProductImage,
    this.MobileNo,
    this.UserName,
    this.Address,
    this.Datetime
  });

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}
