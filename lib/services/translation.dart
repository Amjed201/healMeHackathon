import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          "login": "Login",
          "save": "Save",
          "home": "Home",
          "help": "Help",
          "completeInfo": "Complete your information",
          "cancel": "Cancel Order",
          "newOrder": "New Order + ",
          "confirmOrder": "Confirm Order",
          "paymentMethod": "Payment Method",
          "startDate": "Start Date",
          "startTime": "Start Time",

          //splash page
          "welcome": "Welcome back",
          "tryAgain": "Error occurred, please try again later",

          //tabs
          "myAcc": "My Account",
          "myOrders": "My Orders",
          "offers": "Offers",

          //auth pages
          "startSave": "Start saving now",
          "mobile": "Mobile",
          "phone": "Phone Number",
          "mobileConfirm": "Mobile Confirm",
          "enterCode":
              "Please Enter Confirmation Code That Sent To Mobile Number",
          "modify": "Modify",
          "confirmVerify": "Confirm Verification",
          "resend": "Resend",
          "createAcc": "Create Account",
          "pass": "Password",
          "enterPass": "Enter Your Password",
          "rePass": "Confirm Password",
          "enterRePass": "Confirm Your Password",
          "agreeTerms": "Your follow-up indicates acceptance of ",
          "serviceTerms": "Terms and conditions",
          "register": "Register",
          "suspended_account": "Your Account Is Suspended",
          "suspended_account_reason": "Your Account Is Suspended Due To",
          "contact_support": "Contact Support",

          //my account page
          "myAccount": "My Account",
          "enterAccount": "Enter To Your Account",
          "noCredit": "You have no credit",
          "charge": "Charge wallet",
          "registerLogin": "Register/Login",
          "favOffers": "Favorite Offers",
          "noFavorite": "Looks like you haven't add any favorite offer",
          "addedToFav": "Offer has been added to favorites",
          "deleteFromFav": "Offer has been removed from favorites",
          "know": "Know More",
          "contact": "Contact Us",
          "shareApp": "Share App",
          "shareDescription": "\n كل البتحتاج ليهو بسعر مخفض \n"
              "أعثر علي أفضل العروض والتخفيضات المحدثة يوميا مع تطبيق كافي .",
          "changeLang": "Change Language",
          "logout": "Logout",
          "sureLogout": "Are you sure you want to logout?",
          "yes": "Yes",
          "no": "No",
          "signUpFirst": "Please sign up first to continue",
          "settings": "Settings",
          "userName": "User Name",
          "manegeContact": "Manege Contacts",

          //edit profile page
          "editProf": "Edit Profile",
          "name": "Name",
          "email": "Email",
          "birthday": "Birthday ",
          "city": "City",
          "zone": "Zone",
          "gender": "Gender",
          "update": "Update",

          //my orders page
          "coupons": "Coupons",
          "noOffers": "Looks like you haven't made any order yet",
          "noOldOffers": "Looks like you haven't made any order yet",
          "receiveOffer": "Receive Offer",
          "verificationCodeIs": "your verification code is :",
          "runningOrders": "Running Orders",
          "historyOrders": "Previous Orders",
          "rateOrder": "Rate Orders",
          "rate": "Rate",
          "rated": "Rated",
          "enterRate": "Your comment ...",
          "show": "Show details",
          "hide": "Hide details",
          "pay": "Pay now",
          "claim": "Claim offer",

          //offers page
          "lookingFor": "What are you looking for ?",
          "discover": "Discover Places",
          "discoverNearby": "Discover nearby offers",
          "hotDeals": "Hot Deals",
          "recent": "Recent",
          "bestSeller": "Best Seller",
          "seeAll": "See All",
          "sdg": "SDG",

          //all offers page
          "merchants": "Merchants",
          "availableOffers": "Available Offers",

          //offer details page
          "terms": "Terms Of Use",
          "offerContent": "Offer Content",
          "branch": "Available Branches",
          "wantOffer": "I want this offer",
          "offerAdded": "Offer has been added to your card",

          //cart page
          "cart": "Cart",
          "wishList": "Add to wishlist",
          "delete": "Delete",
          "deleteCart": "Delete Cart",
          "deleteAll": "Delete All",
          "promo": "Promo Code",
          "apply": "Apply",
          "theRequiredAmount": "The total required amount",
          "totalPrice": "Total Price",
          "serviceFees": "Service Fees",
          "requiredAmount": "Total required amount",
          "continue": "Continue",
          "cartEmpty": "Your Cart is empty :(",
          "completeOrderFirst":
              "Please complete your order first , or Remove items in the cart",
          "completeOrder": "Complete Order",
          "multipleNotAllowed": "You can't order for multiple vendors ",

          //payment page
          "completePay": "Complete Payment for order: #",
          "completePayment": "Complete Payment",
          "uploadMbokInvoice": "Please upload an invoice screenshot from Mbok",
          "accountName": "Account name: ",
          "accountNo": "Account No: ",
          "sentSuccess": "Invoice sent successfully",
          "mbok": "Mbok",
          "fawri": "Fawri",
          "syper": "Syper Pay Plus",

          //order done page
          "orderSuccess": "Your Order was sent successfully",
          "goOffers": "Go To Offer to confirm payment",

          //know more page
          "howBuy": "How To Buy",
          "about": "About Kafi",
          "faq": "FAQs",
          "privacy": "Privacy Policy",
          "refund": "Refund Policy",

          //contact us page
          "follow": "Follow us through",
          "orSend": "Or send to us",
          "yourMessage": "Your Message",
          "send": "Send",

          //terms page
          "termsUse": "Terms Of Use",

          //search page
          "noSearch": "There are no search results",

          // intro page
          "skip": "Skip",
          "done": "Done",
          "textIntro1": "The first platform for discount offers in Sudan",
          "textIntro2": "Find your  nearest offers and save more",
          "textIntro3":
              "Pay inside the app and get the coupon and enjoy the discount",

          //ads page
          "ads": "Advertisement",

          //notifications page
          "notifications": "Notifications",

          "map": "Show in map"
        },
        //ARABIC LANGUAGE
        'ar_AR': {
          "login": "تسجيل الدخول",
          "home": "الرئيسية",
          "help": "المساعدة",
          "save": "حفظ البيانات",
          "completeInfo": "اكمال البيانات",
          "cancel": "الغاء الطلب",
          "newOrder": "+ انشاء طلب جديد",
          "confirmOrder": "تأكيد الطلب",
          "paymentMethod": "طريقة الدفع",
          "startDate": "تاريخ الانطلاق",
          "startTime": "وقت الانطلاق",

          //splash page
          "welcome": "مرحبا",
          "tryAgain": "لقد حدث خطأ, الرجاء المحاولة لاحقا",

          //tabs
          "myAcc": "حسابي",
          "myOrders": "طلباتي",
          "offers": "العروض",

          //auth pages
          "startSave": "ابدأ الحفظ الآن",
          "mobile": "الهاتف المحمول",
          "phone": "رقم الهاتف",
          "mobileConfirm": "التحقق من رقم الهاتف",
          "enterCode": "الرجاء إدخال الرقم السري المرسل الى الرقم ",
          "modify": "تعديل",
          "confirmVerify": "تحقق الان",
          "resend": "إعادة إرسال الرمز خلال ",
          "createAcc": "إنشاء حساب",
          "pass": "كلمة المرور",
          "enterPass": "أدخل كلمة المرور",
          "rePass": "تأكيد كلمة المرور",
          "enterRePass": "تأكيد كلمة المرور",
          "agreeTerms": "تشير متابعتك الى الموافقة على",
          "serviceTerms": " الشروط والاحكام",
          "suspended_account": "تم تعليق حسابك",
          "suspended_account_reason": "تم تعليق حسابك مؤقتاً نتيجة ل",
          "contact_support": "تواصل مع الدعم",

          //my account page
          "register": "تسجيل",
          "myAccount": "حسابي",
          "enterAccount": "أدخل إلى حسابك",
          "noCredit": "ليس لديك رصيد",
          "charge": "شحن المحفظة",
          "registerLogin": "تسجيل / تسجيل الدخول",
          "favOffers": "العروض المفضلة",
          "noFavorite": "لم تقم باضافة اي عروض الى المفضلة",
          "addedToFav": "تمت اضافة العرض الى المفضلة",
          "deleteFromFav": "تم حذف العرض من المفضلة",
          "know": "معرفة المزيد",
          "contact": "اتصل بنا",
          "shareApp": "مشاركة التطبيق",
          "shareDescription": "\n كل البتحتاج ليهو بسعر مخفض \n"
              "أعثر علي أفضل العروض والتخفيضات المحدثة يوميا مع تطبيق كافي .",
          "changeLang": "تغيير اللغة",
          "logout": "تسجيل الخروج",
          "sureLogout": "هل انت متأكد من تسجيل الخروج ؟",
          "yes": "نعم",
          "no": "لا",
          "signUpFirst": "قم بتسجبل حسابك للمتابعة",
          "settings": "الإعدادات",
          "userName": "إسم المستخدم",
          "manegeContact": "إدارة جهات الإتصال",

          //edit profile page
          "editProf": "تحرير الملف الشخصي",
          "name": "اسم الكريم",
          "email": "البريد الإلكتروني",
          "birthday": "تاريخ الميلاد",
          "city": "المدينة",
          "zone": "المنطقة",
          "gender": "الجنس",
          "update": "تحديث",

          //my orders page
          "coupons": "القسائم",
          "noOffers": "لا توجد لديك طلبات حالية",
          "noOldOffers": "لا توجد لديك طلبات سابقة",
          "receiveOffer": "استلام العرض",
          "verificationCodeIs": "كود الاستلام الخاص بك :",
          "runningOrders": "الطلبات الحالية",
          "historyOrders": "الطلبات السابقة",
          "rateOrder": "تقييم الطلب",
          "rate": "تقييم",
          "rated": "تم التقييم",
          "enterRate": "اكتب ملاحظاتك ...",
          "show": "عرض تفاصيل الطلب",
          "hide": "اخفاء تفاصيل الطلب",
          "pay": "ادفع الان",
          "claim": "كود الاستلام",

          //offers page
          "lookingFor": "ما الذي تبحث عنه؟",
          "discover": "اكتشاف الأماكن",
          "discoverNearby": "استكشف العروض القريبة",
          "hotDeals": "العروض المميزة",
          "recent": "الاحدث",
          "bestSeller": "الأفضل مبيعًا",
          "seeAll": "عرض الكل",
          "sdg": "جنيه",

          //all offers page
          "merchants": "التجار",
          "availableOffers": "العروض المتاحة",

          //offer details page
          "terms": "شروط الاستخدام",
          "offerContent": "تفاصيل العرض",
          "branch": "الفروع المتاحة",
          "wantOffer": "أريد هذا العرض",
          "offerAdded": "تمت اضافة العرض الى السلة",

          //cart page
          "cart": "عربة التسوق",
          "wishList": "أضف إلى قائمة الرغبات",
          "delete": "حذف",
          "deleteCart": "حذف السلة",
          "deleteAll": "حذف الكل",
          "promo": "الرمز الترويجي",
          "apply": "تطبيق",
          "cartEmpty": "عربة التسوق فارغة",
          "completeOrderFirst":
              "اكمل طلبك من المتجر السابق اولا , او قم بحذف السلة ",
          "completeOrder": "اكمال الطلب",
          "multipleNotAllowed": "غير مسموح بالطلب من اكثر من متجر ",

          //payment page
          "theRequiredAmount": "إجمالي المبلغ المطلوب",
          "totalPrice": "إجمالي السعر",
          "serviceFees": "رسوم الخدمة",
          "requiredAmount": "إجمالي المبلغ المطلوب",
          "continue": "متابعة",
          "completePay": "إتمام الدفع للطلب: #",
          "completePayment": "إتمام الدفع",
          "uploadMbokInvoice": "الرجاء ارفاق اشعار المعاملة من تطبيق بنكك",
          "accountName": "اسم الحساب :",
          "accountNo": "رقم الحساب :",
          "sentSuccess": "تم ارسال الاشعار بنجاح",
          "mbok": "بنكك",
          "fawri": "فوري",
          "syper": "سايبر باي بلس",

          //order done page
          "orderSuccess": "تم إرسال طلبك بنجاح",
          "goOffers": "الذهاب الى تأكيد الدفع للطلب",

          //contact us page
          "follow": "تابعنا من خلال",
          "orSend": "أو أرسل إلينا",
          "yourMessage": "رسالتك",
          "send": "أرسل",

          //know more page
          "howBuy": "كيف تشتري",
          "about": "حول كافي",
          "faq": "الأسئلة الشائعة",
          "privacy": "سياسة الخصوصية",
          "refund": "سياسة رد الأموال",

          //terms page
          "termsUse": "شروط الاستخدام",

          //search page
          "noSearch": "لا توجد نتائج للبحث",

          // intro page
          "skip": "تخطي",
          "done": "تم",
          "textIntro1": "المنصة الأولى لعروض التخفيضات في السودان",
          "textIntro2": "ابحث عن أقرب العروض ووفر أكثر",
          "textIntro3": "ادفع داخل التطبيق واحصل على الكوبون واستمتع بالخصم",

          //ads page
          "ads": "اعلان",

          //notification page
          "notifications": "الاشعارات",

          "map": "عرض الخريطة"
        },
      };
}
