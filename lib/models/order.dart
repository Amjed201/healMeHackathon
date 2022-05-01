// import 'package:get/get.dart';
//
// class Order {
//   Order({
//     this.id,
//     this.orderId,
//     this.offerItemId,
//     this.code,
//     this.quantity,
//     this.price,
//     this.createdAt,
//     this.updatedAt,
//     this.offerItem,
//     this.order,
//   });
//
//   int? id;
//   int? orderId;
//   int? offerItemId;
//   String? code;
//   dynamic? quantity;
//   int? price;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   OfferItem? offerItem;
//   OrderClass? order;
//
//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//         id: json["id"],
//         orderId: json["order_id"],
//         offerItemId: json["offer_item_id"],
//         code: json["code"],
//         quantity: json["quantity"],
//         price: json["price"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         offerItem: OfferItem.fromJson(json["offer_item"]),
//         order: OrderClass.fromJson(json["order"]),
//       );
// }
//
// class OfferItem {
//   OfferItem({
//     this.id,
//     this.offerId,
//     this.title,
//     this.enTitle,
//     this.quantity,
//     this.description,
//     this.enDescription,
//     this.price,
//     this.offerPrice,
//     this.discountTypeId,
//     this.discountAmount,
//     this.offerTerms,
//     this.sorting,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//     this.offer,
//   });
//
//   int? id;
//   int? offerId;
//   String? title;
//   String? enTitle;
//   int? quantity;
//   String? description;
//   String? enDescription;
//   int? price;
//   int? offerPrice;
//   int? discountTypeId;
//   int? discountAmount;
//   String? offerTerms;
//   int? sorting;
//   int? isActive;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   Offer? offer;
//
//   factory OfferItem.fromJson(Map<String, dynamic> json) => OfferItem(
//         id: json["id"],
//         offerId: json["offer_id"],
//         title: json["title"],
//         enTitle: json["en_title"],
//         quantity: json["quantity"],
//         description: json["description"],
//         enDescription: Get.locale!.languageCode == 'ar'
//             ? json["description"]
//             : json["en_description"],
//         price: json["price"],
//         offerPrice: json["offer_price"],
//         discountTypeId: json["discount_type_id"],
//         discountAmount: json["discount_amount"],
//         offerTerms: json["offer_terms"],
//         sorting: json["sorting"],
//         isActive: json["is_active"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         offer: Offer.fromJson(json["offer"]),
//       );
// }
//
// class Offer {
//   Offer({
//     this.id,
//     this.vendorId,
//     this.title,
//     this.enTitle,
//     this.description,
//     this.enDescription,
//     this.price,
//     this.offerPrice,
//     this.discountTypeId,
//     this.discountAmount,
//     this.offerCategoryId,
//     this.image,
//     this.offerTerms,
//     this.sorting,
//     this.isActive,
//     this.rateValue,
//     this.createdAt,
//     this.updatedAt,
//     this.vendor,
//   });
//
//   int? id;
//   int? vendorId;
//   String? title;
//   String? enTitle;
//   String? description;
//   String? enDescription;
//   int? price;
//   int? offerPrice;
//   int? discountTypeId;
//   int? discountAmount;
//   int? offerCategoryId;
//   String? image;
//   String? offerTerms;
//   int? sorting;
//   int? isActive;
//   double? rateValue;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   Vendor? vendor;
//
//   factory Offer.fromJson(Map<String, dynamic> json) => Offer(
//         id: json["id"],
//         vendorId: json["vendor_id"],
//         title: json["title"],
//         enTitle: json["en_title"],
//         description: json["description"],
//         enDescription: Get.locale!.languageCode == 'ar'
//             ? json["description"]
//             : json["en_description"],
//         price: json["price"],
//         offerPrice: json["offer_price"],
//         discountTypeId: json["discount_type_id"],
//         discountAmount: json["discount_amount"],
//         offerCategoryId: json["offer_category_id"],
//         image: json["image"],
//         offerTerms: json["offer_terms"],
//         sorting: json["sorting"],
//         isActive: json["is_active"],
//         rateValue:
//             json["rate_value"] == null ? null : json["rate_value"].toDouble(),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         vendor: Vendor.fromJson(json["vendor"]),
//       );
// }
//
// class Vendor {
//   Vendor({
//     this.id,
//     this.name,
//     this.enName,
//     this.phoneNumber,
//     this.image,
//     this.lat,
//     this.long,
//     this.sorting,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int? id;
//   String? name;
//   String? enName;
//   String? phoneNumber;
//   String? image;
//   String? lat;
//   String? long;
//   int? sorting;
//   int? isActive;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
//         id: json["id"],
//         name: json["name"],
//         enName:
//             Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
//         phoneNumber: json["phone_number"],
//         image: json["image"],
//         lat: json["lat"],
//         long: json["long"],
//         sorting: json["sorting"],
//         isActive: json["is_active"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
// }
//
// class OrderClass {
//   OrderClass({
//     this.id,
//     this.offerId,
//     this.userId,
//     this.orderStatusId,
//     this.paymentMethodId,
//     this.promoCodeId,
//     this.discountAmount,
//     this.price,
//     this.serviceFees,
//     this.totalPrice,
//     this.isRated,
//     this.createdAt,
//     this.updatedAt,
//     this.orderStatus,
//     this.promoCode,
//     this.paymentMethod,
//     this.invoice,
//     this.mbokImage,
//   });
//
//   int? id;
//   int? offerId;
//   int? userId;
//   int? orderStatusId;
//   int? paymentMethodId;
//   dynamic promoCodeId;
//   dynamic discountAmount;
//   dynamic price;
//   dynamic serviceFees;
//   dynamic totalPrice;
//   int? isRated;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   OrderStatus? orderStatus;
//   dynamic promoCode;
//   OrderStatus? paymentMethod;
//   Invoice? invoice;
//   String? mbokImage;
//
//   factory OrderClass.fromJson(Map<String, dynamic> json) => OrderClass(
//         id: json["id"] ?? 0,
//         // offerId: json["offer_id"]??0,
//         userId: json["user_id"] ?? 0,
//         orderStatusId: json["order_status_id"] ?? 0,
//         paymentMethodId: json["payment_method_id"] ?? 0,
//         promoCodeId: json["promo_code_id"] ?? 0,
//         discountAmount: json["discount_amount"] ?? 0,
//         price: json["price"] ?? 0,
//         serviceFees: json["service_fees"] ?? 0,
//         totalPrice: json["total_price"] ?? 0,
//         isRated: json["is_rated"],
//         createdAt: DateTime.parse(json["created_at"] ?? 0),
//         updatedAt: DateTime.parse(json["updated_at"] ?? 0),
//         orderStatus: OrderStatus.fromJson(json["order_status"] ?? 0),
//         promoCode: json["promo_code"] ?? '',
//         mbokImage: json["mbok_images"].isEmpty
//             ? null
//             : json["mbok_images"].last["image"],
//         paymentMethod: json["payment_method"] == null
//             ? null
//             : OrderStatus.fromJson(json["payment_method"]),
//         invoice:
//             json["invoice"] == null ? null : Invoice.fromJson(json["invoice"]),
//       );
// }
//
// class Invoice {
//   Invoice({
//     this.id,
//     this.customerName,
//     this.orderId,
//     this.invoiceStatusId,
//     this.paymentMethodId,
//     this.transactionId,
//     this.transactionDate,
//     this.amount,
//     this.isActive,
//     this.isUse,
//     this.createdBy,
//     this.updatedBy,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int? id;
//   String? customerName;
//   int? orderId;
//   int? invoiceStatusId;
//   int? paymentMethodId;
//   dynamic transactionId;
//   dynamic transactionDate;
//   int? amount;
//   int? isActive;
//   int? isUse;
//   int? createdBy;
//   int? updatedBy;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
//         id: json["id"],
//         customerName: json["customer_name"],
//         orderId: json["order_id"],
//         invoiceStatusId: json["invoice_status_id"],
//         paymentMethodId: json["payment_method_id"],
//         transactionId: json["transaction_id"],
//         transactionDate: json["transaction_date"],
//         amount: json["amount"],
//         isActive: json["is_active"],
//         isUse: json["is_use"],
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );
// }
//
// class OrderStatus {
//   OrderStatus({
//     this.id,
//     this.name,
//     this.enName,
//     // this.createdAt,
//     // this.updatedAt,
//     // this.isActive,
//   });
//
//   int? id;
//   String? name;
//   String? enName;
//
//   // DateTime? createdAt;
//   // DateTime? updatedAt;
//   // int? isActive;
//
//   factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
//         id: json["id"],
//         name: json["name"],
//         enName:
//             Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
//         // createdAt: DateTime.parse(json["created_at"]),
//         // updatedAt: DateTime.parse(json["updated_at"]),
//         // isActive: json["is_active"] == null ? null : json["is_active"],
//       );
// }

// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

class Order {
  Order({
    this.id,
    this.offerId,
    this.userId,
    this.orderStatusId,
    this.paymentMethodId,
    this.promoCodeId,
    this.discountAmount,
    this.code,
    this.price,
    this.serviceFees,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.isRated,
   required this.orderItems,
    this.paymentMethod,
    this.orderStatus,
    this.promoCode,
    this.invoice,
    this.mbokImage,
  });

  int? id;
  int? offerId;
  int? userId;
  int? orderStatusId;
  int? paymentMethodId;
  dynamic promoCodeId;
  dynamic discountAmount;
  String? code;
  dynamic price;
  int? serviceFees;
  dynamic totalPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isRated;
  List<OrderItem?> orderItems;
  PaymentMethod? paymentMethod;
  OrderStatus? orderStatus;
  dynamic promoCode;
  Invoice? invoice;
  String? mbokImage;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        offerId: json["offer_id"],
        userId: json["user_id"],
        orderStatusId: json["order_status_id"],
        paymentMethodId: json["payment_method_id"],
        paymentMethod: PaymentMethod.fromJson(json["payment_method"]),
        promoCodeId: json["promo_code_id"],
        discountAmount: json["discount_amount"],
        code: json["code"],
        price: json["price"],
        serviceFees: json["service_fees"],
        totalPrice: json["total_price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isRated: json["is_rated"],
        orderItems: List<OrderItem>.from(
            json["order_items"].map((x) => OrderItem.fromJson(x))),
        orderStatus: OrderStatus.fromJson(json["order_status"]),
        promoCode: json["promo_code"],
        invoice: Invoice.fromJson(json["invoice"]),
        mbokImage: json["mbok_images"].isEmpty
            ? null
            : json["mbok_images"].last["image"],
      );
}

class Invoice {
  Invoice({
    this.id,
    this.customerName,
    this.orderId,
    this.invoiceStatusId,
    this.paymentMethodId,
    this.transactionId,
    this.transactionDate,
    this.amount,
    this.isActive,
    this.isUse,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? customerName;
  int? orderId;
  int? invoiceStatusId;
  int? paymentMethodId;
  dynamic transactionId;
  dynamic transactionDate;
  int? amount;
  int? isActive;
  int? isUse;
  int? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json["id"],
        customerName: json["customer_name"],
        orderId: json["order_id"],
        invoiceStatusId: json["invoice_status_id"],
        paymentMethodId: json["payment_method_id"],
        transactionId: json["transaction_id"],
        transactionDate: json["transaction_date"],
        amount: json["amount"],
        isActive: json["is_active"],
        isUse: json["is_use"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class OrderItem {
  OrderItem({
    this.id,
    this.orderId,
    this.offerItemId,
    this.quantity,
    this.price,
    this.offerItem,
  });

  int? id;
  int? orderId;
  int? offerItemId;
  int? quantity;
  int? price;
  OfferItem? offerItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        orderId: json["order_id"],
        offerItemId: json["offer_item_id"],
        quantity: json["quantity"],
        price: json["price"],
        offerItem: json["offer_item"] == null
            ? null
            : OfferItem.fromJson(json["offer_item"]),
      );
}

class OfferItem {
  OfferItem({
    this.id,
    this.offerId,
    this.title,
    this.enTitle,
    this.quantity,
    this.description,
    this.enDescription,
    this.price,
    this.offerPrice,
    this.discountTypeId,
    this.discountAmount,
    this.offerTerms,
    this.offerEnTerms,
    this.sorting,
    this.image,
    this.isActive,
    this.serviceFees,
    this.createdAt,
    this.updatedAt,
    this.offer,
  });

  int? id;
  int? offerId;
  String? title;
  String? enTitle;
  int? quantity;
  String? description;
  String? enDescription;
  int? price;
  int? offerPrice;
  int? discountTypeId;
  int? discountAmount;
  String? offerTerms;
  String? offerEnTerms;
  int? sorting;
  String? image;
  int? isActive;
  int? serviceFees;
  DateTime? createdAt;
  DateTime? updatedAt;
  Offer? offer;

  factory OfferItem.fromJson(Map<String, dynamic> json) => OfferItem(
        id: json["id"],
        offerId: json["offer_id"],
        title:
            Get.locale!.languageCode == 'ar' ? json["title"] : json["en_title"],
        description: Get.locale!.languageCode == 'ar'
            ? json["description"]
            : json["en_description"],
        quantity: json["quantity"],
        price: json["price"],
        offerPrice: json["offer_price"],
        discountTypeId: json["discount_type_id"],
        discountAmount: json["discount_amount"],
        offerTerms: json["offer_terms"],
        offerEnTerms: json["offer_en_terms"],
        sorting: json["sorting"],
        image: json["image"],
        isActive: json["is_active"],
        serviceFees: json["service_fees"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        offer: Offer.fromJson(json["offer"]),
      );
}

class Offer {
  Offer({
    this.id,
    this.vendorId,
    this.title,
    this.enTitle,
    this.description,
    this.enDescription,
    this.price,
    this.offerPrice,
    this.discountTypeId,
    this.discountAmount,
    this.offerCategoryId,
    this.image,
    this.offerTerms,
    this.sorting,
    this.isActive,
    this.rateValue,
    this.createdAt,
    this.updatedAt,
    this.vendor,
  });

  int? id;
  int? vendorId;
  String? title;
  String? enTitle;
  String? description;
  String? enDescription;
  int? price;
  int? offerPrice;
  int? discountTypeId;
  int? discountAmount;
  int? offerCategoryId;
  String? image;
  String? offerTerms;
  int? sorting;
  int? isActive;
  double? rateValue;
  DateTime? createdAt;
  DateTime? updatedAt;
  Vendor? vendor;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        vendorId: json["vendor_id"],
        title: json["title"],
        enTitle: json["en_title"],
        description: json["description"],
        enDescription: Get.locale!.languageCode == 'ar'
            ? json["description"]
            : json["en_description"],
        price: json["price"],
        offerPrice: json["offer_price"],
        discountTypeId: json["discount_type_id"],
        discountAmount: json["discount_amount"],
        offerCategoryId: json["offer_category_id"],
        image: json["image"],
        offerTerms: json["offer_terms"],
        sorting: json["sorting"],
        isActive: json["is_active"],
        rateValue:
            json["rate_value"] == null ? null : json["rate_value"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        vendor: Vendor.fromJson(json["vendor"]),
      );
}

class Vendor {
  Vendor({
    this.id,
    this.name,
    this.enName,
    this.phoneNumber,
    this.image,
    this.lat,
    this.long,
    this.sorting,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? enName;
  String? phoneNumber;
  String? image;
  String? lat;
  String? long;
  int? sorting;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        name: json["name"],
        enName:
            Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
        phoneNumber: json["phone_number"],
        image: json["image"],
        lat: json["lat"],
        long: json["long"],
        sorting: json["sorting"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}

class PaymentMethod {
  PaymentMethod({
    this.id,
    this.name,
    this.isActive,
  });

  int? id;
  String? name;
  int? isActive;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json["id"],
        name: Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
        isActive: json["is_active"],
      );
}

class OrderStatus {
  OrderStatus({
    this.id,
    this.name,
  });

  int? id;
  String? name;


  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
        id: json["id"],
        name:
            Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
      );
}
