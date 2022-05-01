// To parse this JSON data, do
//
//     final addOrder = addOrderFromJson(jsonString);

import 'dart:convert';

AddOrder addOrderFromJson(String str) => AddOrder.fromJson(json.decode(str));

String addOrderToJson(AddOrder data) => json.encode(data.toJson());

class AddOrder {
  AddOrder({
    this.promoCode,
    this.paymentId,
    required this.orderItems,
  });

  String? promoCode;
  int? paymentId;
  List<OrderItem> orderItems;

  factory AddOrder.fromJson(Map<String, dynamic> json) => AddOrder(
    promoCode: json["promo_code"],
    paymentId: json["payment_method_id"],
    orderItems: List<OrderItem>.from(json["order_items"].map((x) => OrderItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "promo_code": promoCode,
    "payment_method_id": paymentId,
    "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
  };
}

class OrderItem {
  OrderItem({
    required this.offerItemId,
    required this.quantity,
  });

  int offerItemId;
  int quantity;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    offerItemId: json["offer_item_id"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "offer_item_id": offerItemId,
    "quantity": quantity,
  };
}
