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
          "endDate": "End Date",
          "endTime": "End Time",
          "deliverFrom": "Deliver from",
          "deliverTo": "Deliver to",
          "deliveryDetails": "Delivery details",
          "reciver": "Reciver",
          "anotherPerson": "Another person",
          "reciverName": "Reciver name",
          "reciverPhone": "Reciver phone",
          "reciverPhone2": "Another Reciver phone (optional)",
          "shipmentDetails": "Shipment details",
          "chooseRegion": "Choose region",
          "chooseCity": "Choose City",
          "welcome": "Welcome back",
          "tryAgain": "Error occurred, please try again later",
          "myAcc": "My Account",
          "myOrders": "My Orders",
          "offers": "Offers",
          "acceptOrder": "Accept Order",
          "mobile": "Mobile",
          "phone": "Phone Number",
          "secondaryPhone": "Secondary Phone Number",
          "shortPhone": "Phone Number is short",
          "enterPhone": "Please enter your phone number",
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
          "myAccount": "My Account",
          "enterAccount": "Enter To Your Account",
          "noCredit": "You have no credit",
          "charge": "Charge wallet",
          "registerLogin": "Register/Login",
          "contact": "Contact Us",
          "changeLang": "Change Language",
          "logout": "Logout",
          "sureLogout": "Are you sure you want to logout?",
          "sureDelete": "Are you sure you want to delete the conctact?",
          "yes": "Yes",
          "no": "No",
          "signUpFirst": "Please sign up first to continue",
          "settings": "Settings",
          "userName": "User name",
          "manegeContact": "Manege contacts",
          "noContacts": "No Contacts Available",
          "contactUs": "Contact us",
          "customerService": "Customer service",
          "online": "Online",
          "writeMessage": "Write your message",
          "editProf": "Edit Profile",
          "name": "Name",
          "enterName": "Enter a name",
          "email": "Email",
          "birthday": "Birthday ",
          "city": "City",
          "zone": "Zone",
          "gender": "Gender",
          "update": "Update",
          "userUpdated": "Updated successfully",
          "runningOrders": "Running Orders",
          "historyOrders": "Previous Orders",
          "rateOrder": "Rate Orders",
          "rate": "Rate",
          "rated": "Rated",
          "enterRate": "Your comment ...",
          "show": "Show details",
          "hide": "Hide details",
          "pay": "Pay now",
          "cancelOrder": "Cancel order",
          "confirmLoading": "Confirm loading",
          "orderDate": "Order date",
          "orderPrice": "Order price",
          "orderDetails": "Order details",
          "theRequiredAmount": "The total required amount",
          "totalPrice": "Total Price",
          "requiredAmount": "Total required amount",
          "continue": "Continue",
          "orderSuccess": "Your Order was sent successfully",
          "privacy": "Privacy Policy",
          "refund": "Refund Policy",
          "yourMessage": "Your Message",
          "send": "Send",
          "termsUse": "Terms Of Use",
          "skip": "Skip",
          "done": "Done",
          "notifications": "Notifications",
          "map": "Show in map",
          "manageContacts": "Manage Contacts",
          "addContact": "Add Contacts",
          "editContact": "Edit Contacts",
          "reasons": "Other reasons",
          "addedSuccess": "Contact added successfuly",
          "add": "Add",
          "enterFields": "Please enter all fields",
          "calculatePrice": "Calculating Price",
          "estPrice": "Estimated Price",

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
          "endDate": "تاريخ الوصول",
          "endTime": "وقت الوصول",
          "deliverFrom": "الشحن من",
          "deliverTo": "الشحن الى",
          "deliveryDetails": "تفاصيل الشحن",
          "reciver": "المستلم",
          "anotherPerson": "شخص اخر",
          "reciverName": "اسم المستلم",
          "reciverPhone": "هاتف المستلم",
          "reciverPhone2": "هاتف المستلم اضافي (اختياري)",
          "shipmentDetails": "تفاصيل الشحن",
          "chooseRegion": "اختر المنطقة",
          "chooseCity": "اختر المدينة",
          "welcome": "مرحبا",
          "tryAgain": "لقد حدث خطأ, الرجاء المحاولة لاحقا",
          "myAcc": "حسابي",
          "myOrders": "طلباتي",
          "offers": "العروض",
          "acceptOrder": "الموافقة على العروض",
          "mobile": "الهاتف المحمول",
          "phone": "رقم الهاتف",
          "secondaryPhone": "  رقم الهاتف (احتياطي)",
          "enterPhone": "الرجاء كتابة رقم الهاتف",
          "shortPhone": "رقم الهاتف قصير",
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
          "customerService": "خدمة العملاء",
          "online": "متصل",
          "writeMessage": "أكتب رسالتك ...",
          "register": "تسجيل",
          "myAccount": "حسابي",
          "enterAccount": "أدخل إلى حسابك",
          "noCredit": "ليس لديك رصيد",
          "charge": "شحن المحفظة",
          "registerLogin": "تسجيل / تسجيل الدخول",
          "know": "معرفة المزيد",
          "contact": "اتصل بنا",
          "changeLang": "تغيير اللغة",
          "logout": "تسجيل الخروج",
          "sureLogout": "هل انت متأكد من تسجيل الخروج ؟",
          "sureDelete": "هل انت متأكد من حذف جهة الاتصال ؟",
          "yes": "نعم",
          "no": "لا",
          "signUpFirst": "قم بتسجبل حسابك للمتابعة",
          "settings": "الإعدادات",
          "userName": "إسم المستخدم",
          "manegeContact": "إدارة جهات الإتصال",
          "addContact": "اضافة جهة اتصال",
          "editContact": "تعديل جهة اتصال",
          "noContacts": "لا توجد جهات اتصال",
          "contactUs": "تواصل معنا",
          "editProf": "تحرير الملف الشخصي",
          "name": "اسم الكريم",
          "enterName": "الرجاء ادخال الاسم ",
          "email": "البريد الإلكتروني",
          "birthday": "تاريخ الميلاد",
          "city": "المدينة",
          "zone": "المنطقة",
          "gender": "الجنس",
          "update": "تحديث",
          "userUpdated": "تم تحديث البيانات",
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
          "lookingFor": "ما الذي تبحث عنه؟",
          "discover": "اكتشاف الأماكن",
          "discoverNearby": "استكشف العروض القريبة",
          "hotDeals": "العروض المميزة",
          "recent": "الاحدث",
          "bestSeller": "الأفضل مبيعًا",
          "seeAll": "عرض الكل",
          "availableOffers": "العروض المتاحة",
          "terms": "شروط الاستخدام",
          "offerContent": "تفاصيل العرض",
          "branch": "الفروع المتاحة",
          "wantOffer": "أريد هذا العرض",
          "offerAdded": "تمت اضافة العرض الى السلة",
          "cancelOrder": "إلغاء الطلب",
          "confirmLoading": "تأكيد الشحن",
          "orderDate": "تاريخ الطلب",
          "orderPrice": "سعر الطلب",
          "orderDetails": "تفاصيل الطلب",
          "delete": "حذف",
          "theRequiredAmount": "إجمالي المبلغ المطلوب",
          "totalPrice": "إجمالي السعر",
          "requiredAmount": "إجمالي المبلغ المطلوب",
          "continue": "متابعة",
          "orderSuccess": "تم إرسال طلبك بنجاح",
          "yourMessage": "رسالتك",
          "send": "أرسل",
          "privacy": "سياسة الخصوصية",
          "refund": "سياسة رد الأموال",
          "termsUse": "شروط الاستخدام",
          "notifications": "الاشعارات",
          "map": "عرض الخريطة",
          "manageContacts": "إدارة جهات إتصالي",
          "reasons": "اسباب اخرى",
          "addedSuccess": "تمت الاضافة بنجاح",
          "add": "اضافة",
          "enterFields": "الرجاء ادخال البيانات",
          "calculatePrice": "جاري حساب السعر",
          "estPrice": "السعر التقريبي",
        },
      };
}
