// To parse this JSON data, do
//
//     final settingsResponse = settingsResponseFromJson(jsonString);

import 'dart:convert';

SettingsResponse settingsResponseFromJson(String str) => SettingsResponse.fromJson(json.decode(str));

String settingsResponseToJson(SettingsResponse data) => json.encode(data.toJson());

class SettingsResponse {
  SettingsResponse({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  SettingData? data;

  factory SettingsResponse.fromJson(Map<String, dynamic> json) => SettingsResponse(
    error: json["error"],
    message: json["message"],
    data: SettingData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data!.toJson(),
  };
}

class SettingData {
  SettingData({
    this.logo,
    this.privacyPolicy,
    this.termsConditions,
    this.fcmServerKey,
    this.contactUs,
    this.aboutUs,
    this.currency,
    this.userData,
    this.systemSettings,
    this.tags,
  });

  List<String>? logo;
  List<String>? privacyPolicy;
  List<String>? termsConditions;
  List<String>? fcmServerKey;
  List<String>? contactUs;
  List<String>? aboutUs;
  List<String>? currency;
  List<dynamic>? userData;
  List<SystemSetting>? systemSettings;
  List<dynamic>? tags;

  factory SettingData.fromJson(Map<String, dynamic> json) => SettingData(
    logo: List<String>.from(json["logo"].map((x) => x)),
    privacyPolicy: List<String>.from(json["privacy_policy"].map((x) => x)),
    termsConditions: List<String>.from(json["terms_conditions"].map((x) => x)),
    fcmServerKey: List<String>.from(json["fcm_server_key"].map((x) => x)),
    contactUs: List<String>.from(json["contact_us"].map((x) => x)),
    aboutUs: List<String>.from(json["about_us"].map((x) => x)),
    currency: List<String>.from(json["currency"].map((x) => x)),
    userData: List<dynamic>.from(json["user_data"].map((x) => x)),
    systemSettings: List<SystemSetting>.from(json["system_settings"].map((x) => SystemSetting.fromJson(x))),
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "logo": List<dynamic>.from(logo!.map((x) => x)),
    "privacy_policy": List<dynamic>.from(privacyPolicy!.map((x) => x)),
    "terms_conditions": List<dynamic>.from(termsConditions!.map((x) => x)),
    "fcm_server_key": List<dynamic>.from(fcmServerKey!.map((x) => x)),
    "contact_us": List<dynamic>.from(contactUs!.map((x) => x)),
    "about_us": List<dynamic>.from(aboutUs!.map((x) => x)),
    "currency": List<dynamic>.from(currency!.map((x) => x)),
    "user_data": List<dynamic>.from(userData!.map((x) => x)),
    "system_settings": List<dynamic>.from(systemSettings!.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags!.map((x) => x)),
  };
}

class SystemSetting {
  SystemSetting({
    this.systemConfigurations,
    this.systemTimezoneGmt,
    this.systemConfigurationsId,
    this.appName,
    this.supportNumber,
    this.supportEmail,
    this.currentVersion,
    this.currentVersionIos,
    this.isVersionSystemOn,
    this.areaWiseDeliveryCharge,
    this.currency,
    this.deliveryCharge,
    this.minAmount,
    this.systemTimezone,
    this.isReferEarnOn,
    this.minReferEarnOrderAmount,
    this.referEarnBonus,
    this.referEarnMethod,
    this.maxReferEarnAmount,
    this.referEarnBonusTimes,
    this.minimumCartAmt,
    this.lowStockLimit,
    this.maxItemsCart,
    this.deliveryBoyBonusPercentage,
    this.maxProductReturnDays,
    this.isDeliveryBoyOtpSettingOn,
    this.isSingleSellerOrder,
    this.cartBtnOnList,
    this.expandProductImages,
    this.taxName,
    this.taxNumber,
    this.companyName,
    this.companyUrl,
  });

  String? systemConfigurations;
  String? systemTimezoneGmt;
  String? systemConfigurationsId;
  String? appName;
  String? supportNumber;
  String? supportEmail;
  String? currentVersion;
  String? currentVersionIos;
  String? isVersionSystemOn;
  String? areaWiseDeliveryCharge;
  String? currency;
  String? deliveryCharge;
  String? minAmount;
  String? systemTimezone;
  String? isReferEarnOn;
  String? minReferEarnOrderAmount;
  String? referEarnBonus;
  String? referEarnMethod;
  String? maxReferEarnAmount;
  String? referEarnBonusTimes;
  String? minimumCartAmt;
  String? lowStockLimit;
  String? maxItemsCart;
  String? deliveryBoyBonusPercentage;
  String? maxProductReturnDays;
  String? isDeliveryBoyOtpSettingOn;
  String? isSingleSellerOrder;
  String? cartBtnOnList;
  String? expandProductImages;
  String? taxName;
  String? taxNumber;
  String? companyName;
  String? companyUrl;

  factory SystemSetting.fromJson(Map<String, dynamic> json) => SystemSetting(
    systemConfigurations: json["system_configurations"],
    systemTimezoneGmt: json["system_timezone_gmt"],
    systemConfigurationsId: json["system_configurations_id"],
    appName: json["app_name"],
    supportNumber: json["support_number"],
    supportEmail: json["support_email"],
    currentVersion: json["current_version"],
    currentVersionIos: json["current_version_ios"],
    isVersionSystemOn: json["is_version_system_on"],
    areaWiseDeliveryCharge: json["area_wise_delivery_charge"],
    currency: json["currency"],
    deliveryCharge: json["delivery_charge"],
    minAmount: json["min_amount"],
    systemTimezone: json["system_timezone"],
    isReferEarnOn: json["is_refer_earn_on"],
    minReferEarnOrderAmount: json["min_refer_earn_order_amount"],
    referEarnBonus: json["refer_earn_bonus"],
    referEarnMethod: json["refer_earn_method"],
    maxReferEarnAmount: json["max_refer_earn_amount"],
    referEarnBonusTimes: json["refer_earn_bonus_times"],
    minimumCartAmt: json["minimum_cart_amt"],
    lowStockLimit: json["low_stock_limit"],
    maxItemsCart: json["max_items_cart"],
    deliveryBoyBonusPercentage: json["delivery_boy_bonus_percentage"],
    maxProductReturnDays: json["max_product_return_days"],
    isDeliveryBoyOtpSettingOn: json["is_delivery_boy_otp_setting_on"],
    isSingleSellerOrder: json["is_single_seller_order"],
    cartBtnOnList: json["cart_btn_on_list"],
    expandProductImages: json["expand_product_images"],
    taxName: json["tax_name"],
    taxNumber: json["tax_number"],
    companyName: json["company_name"],
    companyUrl: json["company_url"],
  );

  Map<String, dynamic> toJson() => {
    "system_configurations": systemConfigurations,
    "system_timezone_gmt": systemTimezoneGmt,
    "system_configurations_id": systemConfigurationsId,
    "app_name": appName,
    "support_number": supportNumber,
    "support_email": supportEmail,
    "current_version": currentVersion,
    "current_version_ios": currentVersionIos,
    "is_version_system_on": isVersionSystemOn,
    "area_wise_delivery_charge": areaWiseDeliveryCharge,
    "currency": currency,
    "delivery_charge": deliveryCharge,
    "min_amount": minAmount,
    "system_timezone": systemTimezone,
    "is_refer_earn_on": isReferEarnOn,
    "min_refer_earn_order_amount": minReferEarnOrderAmount,
    "refer_earn_bonus": referEarnBonus,
    "refer_earn_method": referEarnMethod,
    "max_refer_earn_amount": maxReferEarnAmount,
    "refer_earn_bonus_times": referEarnBonusTimes,
    "minimum_cart_amt": minimumCartAmt,
    "low_stock_limit": lowStockLimit,
    "max_items_cart": maxItemsCart,
    "delivery_boy_bonus_percentage": deliveryBoyBonusPercentage,
    "max_product_return_days": maxProductReturnDays,
    "is_delivery_boy_otp_setting_on": isDeliveryBoyOtpSettingOn,
    "is_single_seller_order": isSingleSellerOrder,
    "cart_btn_on_list": cartBtnOnList,
    "expand_product_images": expandProductImages,
    "tax_name": taxName,
    "tax_number": taxNumber,
    "company_name": companyName,
    "company_url": companyUrl,
  };
}


