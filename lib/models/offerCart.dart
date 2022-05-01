
import 'package:logistic/models/offer.dart';

class OfferCart {
  int quantity = 1;
  int vendorId;
  OfferItem offer;
  OfferCart({required this.offer , required this.quantity, required this.vendorId});
}