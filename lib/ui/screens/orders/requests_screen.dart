import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logistic/controllers/auth_controller.dart';
import 'package:logistic/controllers/bid_controller.dart';
import 'package:logistic/ui/screens/orders/request_details_screen.dart';
import 'package:logistic/ui/widgets/back.dart';
import 'package:logistic/ui/widgets/commonButton.dart';
import 'package:logistic/ui/widgets/global/loading.dart';
import 'package:logistic/ui/widgets/request_card_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RequestScreen extends StatefulWidget {
  int orderId;

  RequestScreen(this.orderId, {Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final auth = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<BidController>().getBids(widget.orderId);
  }

  PreferredSizeWidget getCancelAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Color(0xffFBFBFB),
      leading: PopButton(),
      centerTitle: true,
      title: AutoSizeText(
        'offers'.tr,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              showMaterialModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Container(
                  height: 400,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 8.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 19.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Reason 1",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 8.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 19.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              "Reason 2",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 8.h,
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          enabled: true,
                          maxLines: 3,
                          keyboardType: TextInputType.text,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabled: true,
                            hintText: 'reasons'.tr,
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors.grey[400]!,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors.grey[400]!,
                                width: 2.0,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors.grey[400]!,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      GradientButton('cancel'.tr, () {})
                    ],
                  ),
                ),
              );
            },
            child: AutoSizeText(
              'cancel'.tr,
              style: TextStyle(
                color: Colors.red[400],
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFBFBFB),
        resizeToAvoidBottomInset: true,
        appBar: getCancelAppBar(),
        body: GetBuilder<BidController>(builder: (controller) {
          return SafeArea(
            child: GetBuilder<BidController>(builder: (controller) {
              return controller.loading
                  ? const LoadingWidget()
                  : controller.bids.isEmpty
                      ? Center(
                          child: Text('noBids'.tr),
                        )
                      : ListView.builder(
                          itemCount: controller.bids.length,
                          itemBuilder: (context, index) => InkWell(
                              onTap: () => Get.to(() =>
                                  RequestDetailsScreen(controller.bids[index])),
                              child: const RequestCard()),
                        );
            }),
          );
        }));
  }
}
