import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/models/category.dart';
import 'package:logistic/models/merchant.dart' as merchant;
import 'package:logistic/models/merchant.dart';
import 'package:logistic/models/offer.dart';
import 'package:logistic/services/apiService.dart';

enum types {
  offers,
  merchants,
}

class OffersController extends GetxController {
  var _selectedType = types.offers;

  get selectedType => _selectedType;

  set selectedType(value) {
    _selectedType = value;
    update();
  }

  List<merchant.Merchant> get vendors => _vendors;
  List<merchant.Merchant> _vendors = [];
  List<Deals> _recent = [];
  List<Deals> _best = [];
  List<Deals> _offers = [];
  List<Deals> _hot = [];
  List<Ads> _ads = [];
  List<Deals> _searchOffers = [];
  List<String?> _imageSliders = [];
  List<Category> _categories = [];
  List<SubCategory> _subCategories = [];
  bool _loading = false;

  bool get loading => _loading;

  List<Category> get categories => _categories;

  List<SubCategory> get subCategories => _subCategories;

  set subCategories(List<SubCategory> value) {
    _subCategories = value;
  }

  List<Deals> get recent => _recent;

  List<Deals> get best => _best;

  List<Deals> get offers => _offers;

  List<Deals> get hot => _hot;

  List<Ads> get ads => _ads;

  List<Deals> get searchOffers => _searchOffers;

  List<String?> get imageSliders => _imageSliders;

  final api = Get.find<ApiService>();

  getCategories({required BuildContext context}) async {
    try {
      _loading = true;
      update();
      _categories = await api.getCategories(context);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  getSubCategories({required BuildContext context, required int id}) async {
    try {
      _loading = true;
      update();
      _subCategories = await api.getSubCategory(context, id);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  getBanners({required BuildContext context}) async {
    try {
      _loading = true;
      update();
      _ads = await api.getBanners(context);
      _imageSliders = _ads.map((e) => e.image).toList();
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  getHot({required BuildContext context}) async {
    try {
      _loading = true;
      update();
      _hot = await api.getHotDeals(context);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  getRecent({required BuildContext context}) async {
    try {
      _loading = true;
      update();
      _recent = await api.getRecentDeals(context);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  getBestSeller({required BuildContext context}) async {
    try {
      _loading = true;
      update();
      _best = await api.getBestSellers(context);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  getMerchants({required BuildContext context, int? id}) async {
    try {
      _loading = true;
      update();
      _vendors = await api.getMerchants(context, categoryId: id);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  getOffers({required BuildContext context, int? id, int? subId}) async {
    try {
      _loading = true;
      update();
      _offers = await api.getOffers(context, categoryId: id, subId: subId,page: 1);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  Future<List<Deals>> paginateOffers(
      {required BuildContext context, int? id, int? subId, int? page}) async {
    try {
      // _loading = true;
      // update();
      _offers = await api.getOffers(context,
          categoryId: id, subId: subId, page: page);
      // _loading = false;
      // update();
    } catch (e) {
      print(e.toString());
      // _loading = false;
      // update();
    }
    return _offers;
  }

  search({required BuildContext context, required String key}) async {
    try {
      _loading = true;
      update();
      _searchOffers = await api.searchOffers(context, key);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  double calculatePercentege(double price, double offerPrice) {
    double percentege = ((price - offerPrice) / price) * 100;
    return percentege.roundToDouble();
  }
}
