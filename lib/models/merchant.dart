// To parse required this JSON data, do
//
//     final merchant = merchantFromJson(jsonString);

import 'package:get/get.dart';
import 'package:logistic/models/offer.dart';

class Merchant {
  Merchant({
    required this.id,
    required this.name,
    required this.enName,
    required this.phoneNumber,
    required this.image,
    required this.coverImage,
    required this.lat,
    required this.long,
    required this.sorting,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.numberOfOffers,
    required this.offers,
    required this.vendorSocialMedia,
  });

  int id;
  String name;
  String enName;
  String phoneNumber;
  String image;
  String coverImage;
  String lat;
  String long;
  int sorting;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int numberOfOffers;
  List<Deals> offers;
  List<VendorSocialMedia> vendorSocialMedia;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        id: json["id"],
        name: json["name"],
        enName:
            Get.locale!.languageCode == 'ar' ? json["name"] : json["en_name"],
        phoneNumber: json["phone_number"],
        image: json["image"],
        coverImage: json["cover_image"],
        lat: json["lat"],
        long: json["long"],
        sorting: json["sorting"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        numberOfOffers: json["number_of_offers"],
        offers: List<Deals>.from(json["offers"].map((x) => Deals.fromJson(x))),
        vendorSocialMedia: List<VendorSocialMedia>.from(
            json["vendor_social_media"]
                .map((x) => VendorSocialMedia.fromJson(x))),
      );
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
    required this.description,
    required this.enDescription,
    required this.price,
    required this.offerPrice,
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
  String description;
  String enDescription;
  int price;
  int offerPrice;
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
        enTitle: json["en_title"],
        quantity: json["quantity"],
        description: json["description"],
        enDescription: json["en_description"],
        price: json["price"],
        offerPrice: json["offer_price"],
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
  int rateValue;
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

class VendorSocialMedia {
  VendorSocialMedia({
    required this.id,
    required this.vendorId,
    required this.socialMediaId,
    required this.socialMediaUrl,
    required this.sorting,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int vendorId;
  int socialMediaId;
  String socialMediaUrl;
  int sorting;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory VendorSocialMedia.fromJson(Map<String, dynamic> json) =>
      VendorSocialMedia(
        id: json["id"],
        vendorId: json["vendor_id"],
        socialMediaId: json["social_media_id"],
        socialMediaUrl: json["social_media_url"],
        sorting: json["sorting"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "social_media_id": socialMediaId,
        "social_media_url": socialMediaUrl,
        "sorting": sorting,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
