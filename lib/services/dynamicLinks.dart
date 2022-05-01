import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/configController.dart';
import 'package:logistic/controllers/offerController.dart';
import 'package:logistic/models/offer.dart';

class DynamicLinkService {
  ///Build a dynamic link firebase
  static Future<String> buildDynamicLink(String id) async {
    String url = "https://kafi.page.link";
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse('$url/offer/$id'),
      androidParameters: AndroidParameters(
        packageName: "com.business.kafi",
        minimumVersion: 0,
      ),
      iosParameters: IosParameters(
        bundleId: "com.business.kafi",
        minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          // description: "Once upon a time in the town",
          imageUrl: Uri.parse(
              "https://play-lh.googleusercontent.com/sZZ6U_Iszq96mI6ejuYUxN8RUGwTYvw4GGX0qRYSqWcdiN2p5IPLShX1cmY3d8ortmOz=s180-rw"),
          title: Get.find<ConfigController>().shareText??''),
    );
    final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
    return dynamicUrl.shortUrl.toString();
  }


  static handleDynamicLink(Uri url) {
    List<String> separatedString = [];
    separatedString.addAll(url.path.split('/'));
    if (separatedString[1] == "offer") {
      Deals offer = Get.find<OffersController>().recent
          .where((element) => element.id.toString() == separatedString[2])
          .first;

    }
  }
  static   void initDynamicLinks() async {
    final PendingDynamicLinkData? data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      handleDynamicLink(deepLink);
    }
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
          final Uri? deepLink = dynamicLink?.link;

          if (deepLink != null) {
            handleDynamicLink(deepLink);
          }
        }, onError: (OnLinkErrorException e) async {
      print(e.message);
    });
  }

}
