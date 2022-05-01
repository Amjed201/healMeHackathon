import 'package:get/get.dart';

class Ads {
  Ads({
    required this.id,
    required this.title,
    required this.text,
    required this.image,
    required this.offer,
  });

  int id;
  String? title;
  String? text;
  String? image;
  Deals? offer;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
      id: json["id"],
      title: json["title"] ?? '',
      text: json["text"] ?? '',
      image: json["image"] ?? '',
      offer: json["offer"] == null ? null : Deals.fromJson(json["offer"]));
}

class Deals {
  Deals({
    required this.id,
    required this.vendorId,
    required this.title,
    required this.enTitle,
    required this.description,
    required this.enDescription,
    required this.price,
    required this.offerPrice,
    required this.discountTypeId,
    required this.discountAmount,
    required this.offerCategoryId,
    required this.image,
    required this.offerTerms,
    required this.sorting,
    required this.isActive,
    required this.rateValue,
    required this.createdAt,
    required this.updatedAt,
    required this.vendor,
    required this.discountType,
    required this.offerCategory,
    required this.offerRates,
    required this.offerItems,
    required this.offerImages,
    required this.offerSubCategories,
    required this.isLiked,
  });

  int id;
  int vendorId;
  String title;
  String enTitle;
  String description;
  String enDescription;
  int price;
  int offerPrice;
  int discountTypeId;
  int discountAmount;
  int offerCategoryId;
  String image;
  String? offerTerms;
  int sorting;
  int isActive;
  dynamic rateValue;
  DateTime createdAt;
  DateTime updatedAt;
  Vendor vendor;
  DiscountType discountType;
  OfferCategory offerCategory;
  List<OfferRate> offerRates;
  List<OfferItem> offerItems;
  List<OfferImage> offerImages;
  List<dynamic> offerSubCategories;
  int? isLiked;

  factory Deals.fromJson(Map<String, dynamic> json) => Deals(
        id: json["id"],
        vendorId: json["vendor_id"],
        title: json["title"],
        enTitle:
            Get.locale!.languageCode == 'ar' ? json["title"] : json["en_title"],
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
        offerTerms: Get.locale!.languageCode == 'ar' ? json["offer_terms"]: json["offer_en_terms"],
        sorting: json["sorting"],
        isLiked: json["is_favorite"],
        isActive: json["is_active"],
        rateValue: json["rate_value"] == null ? null : json["rate_value"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        vendor: Vendor.fromJson(json["vendor"]),
        discountType: DiscountType.fromJson(json["discount_type"]),
        offerCategory: OfferCategory.fromJson(json["offer_category"]),
        offerRates: List<OfferRate>.from(
            json["offer_rates"].map((x) => OfferRate.fromJson(x))),
        offerItems: List<OfferItem>.from(
            json["offer_items"].map((x) => OfferItem.fromJson(x))),
        offerImages: List<OfferImage>.from(
            json["offer_images"].map((x) => OfferImage.fromJson(x))),
        offerSubCategories:
            List<dynamic>.from(json["offer_sub_categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "title": title,
        "en_title": enTitle,
        "description": description,
        "en_description": enDescription,
        "price": price,
        "offer_price": offerPrice,
        "discount_type_id": discountTypeId,
        "discount_amount": discountAmount,
        "offer_category_id": offerCategoryId,
        "image": image,
        "offer_terms": offerTerms,
        "sorting": sorting,
        "is_active": isActive,
        "rate_value": rateValue,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "vendor": vendor.toJson(),
        "discount_type": discountType.toJson(),
        "offer_category": offerCategory.toJson(),
        "offer_rates": List<dynamic>.from(offerRates.map((x) => x.toJson())),
        "offer_items": List<dynamic>.from(offerItems.map((x) => x.toJson())),
        "offer_images": List<dynamic>.from(offerImages.map((x) => x.toJson())),
        "offer_sub_categories":
            List<dynamic>.from(offerSubCategories.map((x) => x)),
      };
}

class DiscountType {
  DiscountType({
    required this.id,
    required this.name,
    required this.enName,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String enName;
  DateTime createdAt;
  DateTime updatedAt;

  factory DiscountType.fromJson(Map<String, dynamic> json) => DiscountType(
        id: json["id"],
        name: json["name"],
        enName: json["en_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "en_name": enName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class OfferCategory {
  OfferCategory({
    required this.id,
    required this.name,
    required this.enName,
    required this.image,
    required this.icon,
    required this.sorting,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String enName;
  String image;
  String icon;
  int sorting;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory OfferCategory.fromJson(Map<String, dynamic> json) => OfferCategory(
        id: json["id"],
        name: json["name"],
        enName: json["en_name"],
        image: json["image"],
        icon: json["icon"],
        sorting: json["sorting"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "en_name": enName,
        "image": image,
        "icon": icon,
        "sorting": sorting,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class OfferImage {
  OfferImage({
    required this.id,
    required this.offerId,
    required this.image,
    required this.sorting,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int offerId;
  String image;
  int sorting;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory OfferImage.fromJson(Map<String, dynamic> json) => OfferImage(
        id: json["id"],
        offerId: json["offer_id"],
        image: json["image"],
        sorting: json["sorting"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "offer_id": offerId,
        "image": image,
        "sorting": sorting,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class OfferItem {
  OfferItem({
    required this.id,
    required this.offerId,
    required this.title,
    required this.enTitle,
    required this.quantity,
    required this.image,
    required this.description,
    required this.enDescription,
    required this.price,
    required this.offerPrice,
    required this.serviceFees,
    required this.discountTypeId,
    required this.discountAmount,
    required this.offerTerms,
    required this.sorting,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int offerId;
  String title;
  String enTitle;
  int quantity;
  String? image;
  String description;
  String enDescription;
  int price;
  int offerPrice;
  int? serviceFees;
  int discountTypeId;
  int discountAmount;
  String offerTerms;
  int sorting;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory OfferItem.fromJson(Map<String, dynamic> json) => OfferItem(
        id: json["id"],
        offerId: json["offer_id"],
        title: json["title"],
        enTitle:
            Get.locale!.languageCode == 'ar' ? json["title"] : json["en_title"],
        quantity: json["quantity"],
        image: json["image"] ?? null,
        description: json["description"],
        enDescription: Get.locale!.languageCode == 'ar'
            ? json["description"]
            : json["en_description"],
        price: json["price"],
        offerPrice: json["offer_price"],
        serviceFees: json["service_fees"],
        discountTypeId: json["discount_type_id"],
        discountAmount: json["discount_amount"],
        offerTerms: json["offer_terms"],
        sorting: json["sorting"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "offer_id": offerId,
        "title": title,
        "en_title": enTitle,
        "quantity": quantity,
        "description": description,
        "en_description": enDescription,
        "price": price,
        "offer_price": offerPrice,
        "discount_type_id": discountTypeId,
        "discount_amount": discountAmount,
        "offer_terms": offerTerms,
        "sorting": sorting,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class OfferRate {
  OfferRate({
    required this.id,
    required this.offerId,
    required this.userId,
    required this.rateValue,
    required this.comment,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int offerId;
  int userId;
  dynamic rateValue;
  String comment;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory OfferRate.fromJson(Map<String, dynamic> json) => OfferRate(
        id: json["id"],
        offerId: json["offer_id"],
        userId: json["user_id"],
        rateValue: json["rate_value"],
        comment: json["comment"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "offer_id": offerId,
        "user_id": userId,
        "rate_value": rateValue,
        "comment": comment,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Vendor {
  Vendor({
    required this.id,
    required this.name,
    required this.enName,
    required this.phoneNumber,
    required this.image,
    required this.lat,
    required this.long,
    required this.branches,
    required this.sorting,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String enName;
  String phoneNumber;
  String image;
  String lat;
  String long;
  List<Branch>? branches;
  int sorting;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        name: json["name"],
        enName:
            Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
        phoneNumber: json["phone_number"],
        image: json["image"],
        lat: json["lat"],
        long: json["long"],
        branches: json["vendor_branches"] == null
            ? null
            : List<Branch>.from(
                json["vendor_branches"].map((x) => Branch.fromJson(x))),
        sorting: json["sorting"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "en_name": enName,
        "phone_number": phoneNumber,
        "image": image,
        "lat": lat,
        "long": long,
        "sorting": sorting,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Branch {
  Branch({
    this.id,
    this.vendorId,
    this.lat,
    this.long,
    this.name,
    this.address,
  });

  int? id;
  int? vendorId;
  String? lat;
  String? long;
  String? name;
  String? address;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        vendorId: json["vendor_id"],
        lat: json["lat"],
        long: json["long"],
        name: Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
        address: Get.locale!.languageCode == 'ar'
            ? json["address"]
            : json["en_address"],
      );
}
