import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/models/offer.dart';
import 'package:logistic/services/apiService.dart';

class FavoriteController extends GetxController {
  bool _loading = false;
  List<Deals> _favorites = [];
  bool _isFav = false;

  bool get loading => _loading;

  bool get isFav => _isFav;

  List<Deals> get favorites => _favorites;

  final api = Get.find<ApiService>();

  getFavorites({required BuildContext context}) async {
    try {
      _loading = true;
      update();
      _favorites = await api.getFavorites(context);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _loading = false;
      update();
    }
  }

  addToFav(BuildContext context, int offerId) async {
    try {
      // _loading = true;
      update();
     await api.addFav(context, offerId);
      // _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      // _loading = false;
      update();
    }
    getFavorites(context: context);
  }
}
