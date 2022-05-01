import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistic/models/offerCart.dart';
import 'package:logistic/models/offerCart.dart';
import 'package:logistic/models/offerCart.dart';
import 'package:logistic/models/offerCart.dart';
import 'package:logistic/models/offerCart.dart';
import 'package:logistic/services/apiService.dart';
import 'package:logistic/services/helpers.dart';

class CartController extends GetxController {
  final api = Get.find<ApiService>();

  List<OfferCart> _cartItems = [];

  set cartItems(List<OfferCart> value) {
    _cartItems = value;
  }

  bool _loading = false;

  set discount(int value) {
    _discount = value;
  }

  List<OfferCart> get cartItems => _cartItems;
  int _discount = 0;
  int _totalFees = 0;

  int get totalFees => _totalFees;

  set totalFees(int value) {
    _totalFees = value;
    update();
  }

  String? _promo;

  bool get loading => _loading;

  int get discount => _discount;

  String? get promo => _promo;

  set promo(String? value) {
    _promo = value;
  }

  int get itemsCount => _cartItems.length;

  double get totalAmount {
    var _total = 0.0;
    _cartItems.forEach((item) {
      _total += double.tryParse(item.offer.offerPrice.toString())! *
          num.parse(item.quantity.toString());
    });
    return _total;
  }

  void incrementAdd(OfferCart item, BuildContext context) {
    bool canBeAdded = validateDifferentVendor(item, context);
    if (canBeAdded) {
      if (_cartItems.isNotEmpty) {
        try {
          var existingItem = _cartItems.firstWhere(
            (itemToCheck) => itemToCheck.offer.id == item.offer.id,
          );
          if (existingItem != null) {
            //if item already exists , increment the quantity
            existingItem.quantity++;
            calculateServiceFees();
            update();
            // showToast('offerAdded'.tr, context);
          }
        } catch (e) {
          //add item for the first time
          item.quantity = 1;
          _cartItems.add(item);
          calculateServiceFees();
          update();
        }
      } else {
        //add item for the first time
        item.quantity = 1;
        _cartItems.add(item);
        calculateServiceFees();
        showToast('offerAdded'.tr, context);
        update();
      }
    }
  }

  void decrementRemove(OfferCart item) {
    var existingItem = _cartItems.firstWhere(
      (itemToCheck) => itemToCheck.offer.id == item.offer.id,
    );
    if (existingItem != null) {
      if (existingItem.quantity == 1) {
        _cartItems.remove(item);
        calculateServiceFees();
        update();
      } else {
        //if item already exists , decrement the quantity
        existingItem.quantity--;
        calculateServiceFees();
        update();
      }
    }
  }

  int calculateServiceFees() {
    _totalFees =0;
    for (var element in _cartItems) {
      num fees = 0;
      print('quantity: ${element.quantity} total: ${element.quantity * num.parse(element.offer.serviceFees.toString())}');
      fees = (num.parse(element.offer.serviceFees.toString()) * element.quantity);
      _totalFees = int.parse((fees + _totalFees).toString());
    }
    return _totalFees;
  }

  void removeItem(OfferCart item) {
    _cartItems.remove(item);
    update();
  }

  void clearCart() {
    _cartItems = [];
    update();
  }

  bool validateDifferentVendor(OfferCart item, BuildContext context) {
    for (var element in _cartItems) {
      if (element.vendorId == item.vendorId) {
        return true;
      } else {
        Get.defaultDialog(
          title: 'multipleNotAllowed'.tr,
          content: Text('completeOrderFirst'.tr),
          cancel: InkWell(
              onTap: () {
                Get.back();
                Get.find<CartController>().clearCart();
              },
              child:
                  Text('deleteCart'.tr, style: TextStyle(color: Colors.red))),
          confirm: InkWell(
              onTap: () {
                Get.back();
              },
              child: Text('completeOrder'.tr,
                  style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor))),
        );
        // showToast('completeOrderFirst'.tr, context);
        return false;
      }
    }
    return true;
  }

  applyPromo({required BuildContext context, required String promo}) async {
    try {
      _loading = true;
      update();
      _discount = await api.applyPromo(context, promo);
      _loading = false;
      update();
    } catch (e) {
      print(e.toString());
      _discount = 0;
      _loading = false;
      update();
    }
  }
}
