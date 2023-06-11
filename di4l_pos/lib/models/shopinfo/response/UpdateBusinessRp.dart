class UpdateBusinessRp {
  bool? success;
  String? message;
  BusinessSetting? businessSetting;

  UpdateBusinessRp({this.success, this.message, this.businessSetting});

  UpdateBusinessRp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    businessSetting = json['business_setting'] != null
        ? new BusinessSetting.fromJson(json['business_setting'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.businessSetting != null) {
      data['business_setting'] = this.businessSetting!.toJson();
    }
    return data;
  }
}

class BusinessSetting {
  int? id;
  String? name;
  int? currencyId;
  String? startDate;
  String? taxNumber1;
  String? taxLabel1;
  String? taxNumber2;
  String? taxLabel2;
  String? codeLabel1;
  String? code1;
  String? codeLabel2;
  String? code2;
  String? defaultSalesTax;
  int? defaultProfitPercent;
  int? ownerId;
  String? timeZone;
  int? fyStartMonth;
  String? accountingMethod;
  String? defaultSalesDiscount;
  String? sellPriceTax;
  String? logo;
  String? skuPrefix;
  int? enableProductExpiry;
  String? expiryType;
  String? onProductExpiry;
  int? stopSellingBefore;
  int? enableTooltip;
  int? purchaseInDiffCurrency;
  String? purchaseCurrencyId;
  String? pExchangeRate;
  int? transactionEditDays;
  int? stockExpiryAlertDays;
  String? keyboardShortcuts;
  String? posSettings;
  String? manufacturingSettings;
  String? woocommerceSkippedOrders;
  String? woocommerceWhOcSecret;
  String? woocommerceWhOuSecret;
  String? woocommerceWhOdSecret;
  String? woocommerceWhOrSecret;
  String? essentialsSettings;
  WeighingScaleSetting? weighingScaleSetting;
  int? enableBrand;
  int? enableCategory;
  int? enableSubCategory;
  int? enablePriceTax;
  int? enablePurchaseStatus;
  int? enableLotNumber;
  int? defaultUnit;
  int? enableSubUnits;
  int? enableRacks;
  int? enableRow;
  int? enablePosition;
  int? enableEditingProductFromPurchase;
  String? salesCmsnAgnt;
  int? itemAdditionMethod;
  int? enableInlineTax;
  String? currencySymbolPlacement;
  List<String>? enabledModules;
  String? dateFormat;
  String? timeFormat;
  RefNoPrefixes? refNoPrefixes;
  String? themeColor;
  String? createdBy;
  String? assetSettings;
  String? repairSettings;
  String? crmSettings;
  int? enableRp;
  String? rpName;
  int? amountForUnitRp;
  int? minOrderTotalForRp;
  String? maxRpPerOrder;
  int? redeemAmountPerUnitRp;
  int? minOrderTotalForRedeem;
  String? minRedeemPoint;
  String? maxRedeemPoint;
  String? rpExpiryPeriod;
  String? rpExpiryType;
  EmailSettings? emailSettings;
  SmsSettings? smsSettings;
  String? customLabels;
  CommonSettings? commonSettings;
  int? isActive;
  int? isSetupModules;
  String? createdAt;
  String? updatedAt;
  String? lastLogin;

  BusinessSetting(
      {this.id,
      this.name,
      this.currencyId,
      this.startDate,
      this.taxNumber1,
      this.taxLabel1,
      this.taxNumber2,
      this.taxLabel2,
      this.codeLabel1,
      this.code1,
      this.codeLabel2,
      this.code2,
      this.defaultSalesTax,
      this.defaultProfitPercent,
      this.ownerId,
      this.timeZone,
      this.fyStartMonth,
      this.accountingMethod,
      this.defaultSalesDiscount,
      this.sellPriceTax,
      this.logo,
      this.skuPrefix,
      this.enableProductExpiry,
      this.expiryType,
      this.onProductExpiry,
      this.stopSellingBefore,
      this.enableTooltip,
      this.purchaseInDiffCurrency,
      this.purchaseCurrencyId,
      this.pExchangeRate,
      this.transactionEditDays,
      this.stockExpiryAlertDays,
      this.keyboardShortcuts,
      this.posSettings,
      this.manufacturingSettings,
      this.woocommerceSkippedOrders,
      this.woocommerceWhOcSecret,
      this.woocommerceWhOuSecret,
      this.woocommerceWhOdSecret,
      this.woocommerceWhOrSecret,
      this.essentialsSettings,
      this.weighingScaleSetting,
      this.enableBrand,
      this.enableCategory,
      this.enableSubCategory,
      this.enablePriceTax,
      this.enablePurchaseStatus,
      this.enableLotNumber,
      this.defaultUnit,
      this.enableSubUnits,
      this.enableRacks,
      this.enableRow,
      this.enablePosition,
      this.enableEditingProductFromPurchase,
      this.salesCmsnAgnt,
      this.itemAdditionMethod,
      this.enableInlineTax,
      this.currencySymbolPlacement,
      this.enabledModules,
      this.dateFormat,
      this.timeFormat,
      this.refNoPrefixes,
      this.themeColor,
      this.createdBy,
      this.assetSettings,
      this.repairSettings,
      this.crmSettings,
      this.enableRp,
      this.rpName,
      this.amountForUnitRp,
      this.minOrderTotalForRp,
      this.maxRpPerOrder,
      this.redeemAmountPerUnitRp,
      this.minOrderTotalForRedeem,
      this.minRedeemPoint,
      this.maxRedeemPoint,
      this.rpExpiryPeriod,
      this.rpExpiryType,
      this.emailSettings,
      this.smsSettings,
      this.customLabels,
      this.commonSettings,
      this.isActive,
      this.isSetupModules,
      this.createdAt,
      this.updatedAt,
      this.lastLogin});

  BusinessSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    currencyId = json['currency_id'];
    startDate = json['start_date'];
    taxNumber1 = json['tax_number_1'];
    taxLabel1 = json['tax_label_1'];
    taxNumber2 = json['tax_number_2'];
    taxLabel2 = json['tax_label_2'];
    codeLabel1 = json['code_label_1'];
    code1 = json['code_1'];
    codeLabel2 = json['code_label_2'];
    code2 = json['code_2'];
    defaultSalesTax = json['default_sales_tax'];
    defaultProfitPercent = json['default_profit_percent'];
    ownerId = json['owner_id'];
    timeZone = json['time_zone'];
    fyStartMonth = json['fy_start_month'];
    accountingMethod = json['accounting_method'];
    defaultSalesDiscount = json['default_sales_discount'];
    sellPriceTax = json['sell_price_tax'];
    logo = json['logo'];
    skuPrefix = json['sku_prefix'];
    enableProductExpiry = json['enable_product_expiry'];
    expiryType = json['expiry_type'];
    onProductExpiry = json['on_product_expiry'];
    stopSellingBefore = json['stop_selling_before'];
    enableTooltip = json['enable_tooltip'];
    purchaseInDiffCurrency = json['purchase_in_diff_currency'];
    purchaseCurrencyId = json['purchase_currency_id'];
    pExchangeRate = json['p_exchange_rate'];
    transactionEditDays = json['transaction_edit_days'];
    stockExpiryAlertDays = json['stock_expiry_alert_days'];
    keyboardShortcuts = json['keyboard_shortcuts'];
    posSettings = json['pos_settings'];
    manufacturingSettings = json['manufacturing_settings'];
    woocommerceSkippedOrders = json['woocommerce_skipped_orders'];
    woocommerceWhOcSecret = json['woocommerce_wh_oc_secret'];
    woocommerceWhOuSecret = json['woocommerce_wh_ou_secret'];
    woocommerceWhOdSecret = json['woocommerce_wh_od_secret'];
    woocommerceWhOrSecret = json['woocommerce_wh_or_secret'];
    essentialsSettings = json['essentials_settings'];
    weighingScaleSetting = json['weighing_scale_setting'] != null
        ? new WeighingScaleSetting.fromJson(json['weighing_scale_setting'])
        : null;
    enableBrand = json['enable_brand'];
    enableCategory = json['enable_category'];
    enableSubCategory = json['enable_sub_category'];
    enablePriceTax = json['enable_price_tax'];
    enablePurchaseStatus = json['enable_purchase_status'];
    enableLotNumber = json['enable_lot_number'];
    defaultUnit = json['default_unit'];
    enableSubUnits = json['enable_sub_units'];
    enableRacks = json['enable_racks'];
    enableRow = json['enable_row'];
    enablePosition = json['enable_position'];
    enableEditingProductFromPurchase =
        json['enable_editing_product_from_purchase'];
    salesCmsnAgnt = json['sales_cmsn_agnt'];
    itemAdditionMethod = json['item_addition_method'];
    enableInlineTax = json['enable_inline_tax'];
    currencySymbolPlacement = json['currency_symbol_placement'];
    enabledModules = json['enabled_modules'].cast<String>();
    dateFormat = json['date_format'];
    timeFormat = json['time_format'];
    refNoPrefixes = json['ref_no_prefixes'] != null
        ? new RefNoPrefixes.fromJson(json['ref_no_prefixes'])
        : null;
    themeColor = json['theme_color'];
    createdBy = json['created_by'];
    assetSettings = json['asset_settings'];
    repairSettings = json['repair_settings'];
    crmSettings = json['crm_settings'];
    enableRp = json['enable_rp'];
    rpName = json['rp_name'];
    amountForUnitRp = json['amount_for_unit_rp'];
    minOrderTotalForRp = json['min_order_total_for_rp'];
    maxRpPerOrder = json['max_rp_per_order'];
    redeemAmountPerUnitRp = json['redeem_amount_per_unit_rp'];
    minOrderTotalForRedeem = json['min_order_total_for_redeem'];
    minRedeemPoint = json['min_redeem_point'];
    maxRedeemPoint = json['max_redeem_point'];
    rpExpiryPeriod = json['rp_expiry_period'];
    rpExpiryType = json['rp_expiry_type'];
    emailSettings = json['email_settings'] != null
        ? new EmailSettings.fromJson(json['email_settings'])
        : null;
    smsSettings = json['sms_settings'] != null
        ? new SmsSettings.fromJson(json['sms_settings'])
        : null;
    customLabels = json['custom_labels'];
    commonSettings = json['common_settings'] != null
        ? new CommonSettings.fromJson(json['common_settings'])
        : null;
    isActive = json['is_active'];
    isSetupModules = json['is_setup_modules'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastLogin = json['last_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['currency_id'] = this.currencyId;
    data['start_date'] = this.startDate;
    data['tax_number_1'] = this.taxNumber1;
    data['tax_label_1'] = this.taxLabel1;
    data['tax_number_2'] = this.taxNumber2;
    data['tax_label_2'] = this.taxLabel2;
    data['code_label_1'] = this.codeLabel1;
    data['code_1'] = this.code1;
    data['code_label_2'] = this.codeLabel2;
    data['code_2'] = this.code2;
    data['default_sales_tax'] = this.defaultSalesTax;
    data['default_profit_percent'] = this.defaultProfitPercent;
    data['owner_id'] = this.ownerId;
    data['time_zone'] = this.timeZone;
    data['fy_start_month'] = this.fyStartMonth;
    data['accounting_method'] = this.accountingMethod;
    data['default_sales_discount'] = this.defaultSalesDiscount;
    data['sell_price_tax'] = this.sellPriceTax;
    data['logo'] = this.logo;
    data['sku_prefix'] = this.skuPrefix;
    data['enable_product_expiry'] = this.enableProductExpiry;
    data['expiry_type'] = this.expiryType;
    data['on_product_expiry'] = this.onProductExpiry;
    data['stop_selling_before'] = this.stopSellingBefore;
    data['enable_tooltip'] = this.enableTooltip;
    data['purchase_in_diff_currency'] = this.purchaseInDiffCurrency;
    data['purchase_currency_id'] = this.purchaseCurrencyId;
    data['p_exchange_rate'] = this.pExchangeRate;
    data['transaction_edit_days'] = this.transactionEditDays;
    data['stock_expiry_alert_days'] = this.stockExpiryAlertDays;
    data['keyboard_shortcuts'] = this.keyboardShortcuts;
    data['pos_settings'] = this.posSettings;
    data['manufacturing_settings'] = this.manufacturingSettings;
    data['woocommerce_skipped_orders'] = this.woocommerceSkippedOrders;
    data['woocommerce_wh_oc_secret'] = this.woocommerceWhOcSecret;
    data['woocommerce_wh_ou_secret'] = this.woocommerceWhOuSecret;
    data['woocommerce_wh_od_secret'] = this.woocommerceWhOdSecret;
    data['woocommerce_wh_or_secret'] = this.woocommerceWhOrSecret;
    data['essentials_settings'] = this.essentialsSettings;
    if (this.weighingScaleSetting != null) {
      data['weighing_scale_setting'] = this.weighingScaleSetting!.toJson();
    }
    data['enable_brand'] = this.enableBrand;
    data['enable_category'] = this.enableCategory;
    data['enable_sub_category'] = this.enableSubCategory;
    data['enable_price_tax'] = this.enablePriceTax;
    data['enable_purchase_status'] = this.enablePurchaseStatus;
    data['enable_lot_number'] = this.enableLotNumber;
    data['default_unit'] = this.defaultUnit;
    data['enable_sub_units'] = this.enableSubUnits;
    data['enable_racks'] = this.enableRacks;
    data['enable_row'] = this.enableRow;
    data['enable_position'] = this.enablePosition;
    data['enable_editing_product_from_purchase'] =
        this.enableEditingProductFromPurchase;
    data['sales_cmsn_agnt'] = this.salesCmsnAgnt;
    data['item_addition_method'] = this.itemAdditionMethod;
    data['enable_inline_tax'] = this.enableInlineTax;
    data['currency_symbol_placement'] = this.currencySymbolPlacement;
    data['enabled_modules'] = this.enabledModules;
    data['date_format'] = this.dateFormat;
    data['time_format'] = this.timeFormat;
    if (this.refNoPrefixes != null) {
      data['ref_no_prefixes'] = this.refNoPrefixes!.toJson();
    }
    data['theme_color'] = this.themeColor;
    data['created_by'] = this.createdBy;
    data['asset_settings'] = this.assetSettings;
    data['repair_settings'] = this.repairSettings;
    data['crm_settings'] = this.crmSettings;
    data['enable_rp'] = this.enableRp;
    data['rp_name'] = this.rpName;
    data['amount_for_unit_rp'] = this.amountForUnitRp;
    data['min_order_total_for_rp'] = this.minOrderTotalForRp;
    data['max_rp_per_order'] = this.maxRpPerOrder;
    data['redeem_amount_per_unit_rp'] = this.redeemAmountPerUnitRp;
    data['min_order_total_for_redeem'] = this.minOrderTotalForRedeem;
    data['min_redeem_point'] = this.minRedeemPoint;
    data['max_redeem_point'] = this.maxRedeemPoint;
    data['rp_expiry_period'] = this.rpExpiryPeriod;
    data['rp_expiry_type'] = this.rpExpiryType;
    if (this.emailSettings != null) {
      data['email_settings'] = this.emailSettings!.toJson();
    }
    if (this.smsSettings != null) {
      data['sms_settings'] = this.smsSettings!.toJson();
    }
    data['custom_labels'] = this.customLabels;
    if (this.commonSettings != null) {
      data['common_settings'] = this.commonSettings!.toJson();
    }
    data['is_active'] = this.isActive;
    data['is_setup_modules'] = this.isSetupModules;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['last_login'] = this.lastLogin;
    return data;
  }
}

class WeighingScaleSetting {
  String? labelPrefix;
  String? productSkuLength;
  String? qtyLength;
  String? qtyLengthDecimal;

  WeighingScaleSetting(
      {this.labelPrefix,
      this.productSkuLength,
      this.qtyLength,
      this.qtyLengthDecimal});

  WeighingScaleSetting.fromJson(Map<String, dynamic> json) {
    labelPrefix = json['label_prefix'];
    productSkuLength = json['product_sku_length'];
    qtyLength = json['qty_length'];
    qtyLengthDecimal = json['qty_length_decimal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label_prefix'] = this.labelPrefix;
    data['product_sku_length'] = this.productSkuLength;
    data['qty_length'] = this.qtyLength;
    data['qty_length_decimal'] = this.qtyLengthDecimal;
    return data;
  }
}

class RefNoPrefixes {
  String? purchase;
  String? purchaseReturn;
  String? purchaseOrder;
  String? stockTransfer;
  String? stockAdjustment;
  String? sellReturn;
  String? expense;
  String? contacts;
  String? purchasePayment;
  String? sellPayment;
  String? expensePayment;
  String? businessLocation;
  String? username;
  String? subscription;
  String? draft;
  String? salesOrder;

  RefNoPrefixes(
      {this.purchase,
      this.purchaseReturn,
      this.purchaseOrder,
      this.stockTransfer,
      this.stockAdjustment,
      this.sellReturn,
      this.expense,
      this.contacts,
      this.purchasePayment,
      this.sellPayment,
      this.expensePayment,
      this.businessLocation,
      this.username,
      this.subscription,
      this.draft,
      this.salesOrder});

  RefNoPrefixes.fromJson(Map<String, dynamic> json) {
    purchase = json['purchase'];
    purchaseReturn = json['purchase_return'];
    purchaseOrder = json['purchase_order'];
    stockTransfer = json['stock_transfer'];
    stockAdjustment = json['stock_adjustment'];
    sellReturn = json['sell_return'];
    expense = json['expense'];
    contacts = json['contacts'];
    purchasePayment = json['purchase_payment'];
    sellPayment = json['sell_payment'];
    expensePayment = json['expense_payment'];
    businessLocation = json['business_location'];
    username = json['username'];
    subscription = json['subscription'];
    draft = json['draft'];
    salesOrder = json['sales_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['purchase'] = this.purchase;
    data['purchase_return'] = this.purchaseReturn;
    data['purchase_order'] = this.purchaseOrder;
    data['stock_transfer'] = this.stockTransfer;
    data['stock_adjustment'] = this.stockAdjustment;
    data['sell_return'] = this.sellReturn;
    data['expense'] = this.expense;
    data['contacts'] = this.contacts;
    data['purchase_payment'] = this.purchasePayment;
    data['sell_payment'] = this.sellPayment;
    data['expense_payment'] = this.expensePayment;
    data['business_location'] = this.businessLocation;
    data['username'] = this.username;
    data['subscription'] = this.subscription;
    data['draft'] = this.draft;
    data['sales_order'] = this.salesOrder;
    return data;
  }
}

class EmailSettings {
  String? mailDriver;
  String? mailHost;
  String? mailPort;
  String? mailUsername;
  String? mailPassword;
  String? mailEncryption;
  String? mailFromAddress;
  String? mailFromName;
  String? mailFromStartLesson;

  EmailSettings(
      {this.mailDriver,
      this.mailHost,
      this.mailPort,
      this.mailUsername,
      this.mailPassword,
      this.mailEncryption,
      this.mailFromAddress,
      this.mailFromName,
      this.mailFromStartLesson});

  EmailSettings.fromJson(Map<String, dynamic> json) {
    mailDriver = json['mail_driver'];
    mailHost = json['mail_host'];
    mailPort = json['mail_port'];
    mailUsername = json['mail_username'];
    mailPassword = json['mail_password'];
    mailEncryption = json['mail_encryption'];
    mailFromAddress = json['mail_from_address'];
    mailFromName = json['mail_from_name'];
    mailFromStartLesson = json['mail_from_start_lesson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mail_driver'] = this.mailDriver;
    data['mail_host'] = this.mailHost;
    data['mail_port'] = this.mailPort;
    data['mail_username'] = this.mailUsername;
    data['mail_password'] = this.mailPassword;
    data['mail_encryption'] = this.mailEncryption;
    data['mail_from_address'] = this.mailFromAddress;
    data['mail_from_name'] = this.mailFromName;
    data['mail_from_start_lesson'] = this.mailFromStartLesson;
    return data;
  }
}

class SmsSettings {
  String? smsService;
  String? smsStartLesson;
  String? nexmoKey;
  String? nexmoSecret;
  String? nexmoFrom;
  String? twilioSid;
  String? twilioToken;
  String? twilioFrom;
  String? speedToken;
  String? speedFrom;
  String? url;
  String? sendToParamName;
  String? msgParamName;
  String? requestMethod;
  String? header1;
  String? headerVal1;
  String? header2;
  String? headerVal2;
  String? header3;
  String? headerVal3;
  String? param1;
  String? paramVal1;
  String? param2;
  String? paramVal2;
  String? param3;
  String? paramVal3;
  String? param4;
  String? paramVal4;
  String? param5;
  String? paramVal5;
  String? param6;
  String? paramVal6;
  String? param7;
  String? paramVal7;
  String? param8;
  String? paramVal8;
  String? param9;
  String? paramVal9;
  String? param10;
  String? paramVal10;

  SmsSettings(
      {this.smsService,
      this.smsStartLesson,
      this.nexmoKey,
      this.nexmoSecret,
      this.nexmoFrom,
      this.twilioSid,
      this.twilioToken,
      this.twilioFrom,
      this.speedToken,
      this.speedFrom,
      this.url,
      this.sendToParamName,
      this.msgParamName,
      this.requestMethod,
      this.header1,
      this.headerVal1,
      this.header2,
      this.headerVal2,
      this.header3,
      this.headerVal3,
      this.param1,
      this.paramVal1,
      this.param2,
      this.paramVal2,
      this.param3,
      this.paramVal3,
      this.param4,
      this.paramVal4,
      this.param5,
      this.paramVal5,
      this.param6,
      this.paramVal6,
      this.param7,
      this.paramVal7,
      this.param8,
      this.paramVal8,
      this.param9,
      this.paramVal9,
      this.param10,
      this.paramVal10});

  SmsSettings.fromJson(Map<String, dynamic> json) {
    smsService = json['sms_service'];
    smsStartLesson = json['sms_start_lesson'];
    nexmoKey = json['nexmo_key'];
    nexmoSecret = json['nexmo_secret'];
    nexmoFrom = json['nexmo_from'];
    twilioSid = json['twilio_sid'];
    twilioToken = json['twilio_token'];
    twilioFrom = json['twilio_from'];
    speedToken = json['speed_token'];
    speedFrom = json['speed_from'];
    url = json['url'];
    sendToParamName = json['send_to_param_name'];
    msgParamName = json['msg_param_name'];
    requestMethod = json['request_method'];
    header1 = json['header_1'];
    headerVal1 = json['header_val_1'];
    header2 = json['header_2'];
    headerVal2 = json['header_val_2'];
    header3 = json['header_3'];
    headerVal3 = json['header_val_3'];
    param1 = json['param_1'];
    paramVal1 = json['param_val_1'];
    param2 = json['param_2'];
    paramVal2 = json['param_val_2'];
    param3 = json['param_3'];
    paramVal3 = json['param_val_3'];
    param4 = json['param_4'];
    paramVal4 = json['param_val_4'];
    param5 = json['param_5'];
    paramVal5 = json['param_val_5'];
    param6 = json['param_6'];
    paramVal6 = json['param_val_6'];
    param7 = json['param_7'];
    paramVal7 = json['param_val_7'];
    param8 = json['param_8'];
    paramVal8 = json['param_val_8'];
    param9 = json['param_9'];
    paramVal9 = json['param_val_9'];
    param10 = json['param_10'];
    paramVal10 = json['param_val_10'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sms_service'] = this.smsService;
    data['sms_start_lesson'] = this.smsStartLesson;
    data['nexmo_key'] = this.nexmoKey;
    data['nexmo_secret'] = this.nexmoSecret;
    data['nexmo_from'] = this.nexmoFrom;
    data['twilio_sid'] = this.twilioSid;
    data['twilio_token'] = this.twilioToken;
    data['twilio_from'] = this.twilioFrom;
    data['speed_token'] = this.speedToken;
    data['speed_from'] = this.speedFrom;
    data['url'] = this.url;
    data['send_to_param_name'] = this.sendToParamName;
    data['msg_param_name'] = this.msgParamName;
    data['request_method'] = this.requestMethod;
    data['header_1'] = this.header1;
    data['header_val_1'] = this.headerVal1;
    data['header_2'] = this.header2;
    data['header_val_2'] = this.headerVal2;
    data['header_3'] = this.header3;
    data['header_val_3'] = this.headerVal3;
    data['param_1'] = this.param1;
    data['param_val_1'] = this.paramVal1;
    data['param_2'] = this.param2;
    data['param_val_2'] = this.paramVal2;
    data['param_3'] = this.param3;
    data['param_val_3'] = this.paramVal3;
    data['param_4'] = this.param4;
    data['param_val_4'] = this.paramVal4;
    data['param_5'] = this.param5;
    data['param_val_5'] = this.paramVal5;
    data['param_6'] = this.param6;
    data['param_val_6'] = this.paramVal6;
    data['param_7'] = this.param7;
    data['param_val_7'] = this.paramVal7;
    data['param_8'] = this.param8;
    data['param_val_8'] = this.paramVal8;
    data['param_9'] = this.param9;
    data['param_val_9'] = this.paramVal9;
    data['param_10'] = this.param10;
    data['param_val_10'] = this.paramVal10;
    return data;
  }
}

class CommonSettings {
  String? enableProductWarranty;
  String? defaultCreditLimit;
  String? defaultDatatablePageEntries;

  CommonSettings(
      {this.enableProductWarranty,
      this.defaultCreditLimit,
      this.defaultDatatablePageEntries});

  CommonSettings.fromJson(Map<String, dynamic> json) {
    enableProductWarranty = json['enable_product_warranty'];
    defaultCreditLimit = json['default_credit_limit'];
    defaultDatatablePageEntries = json['default_datatable_page_entries'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enable_product_warranty'] = this.enableProductWarranty;
    data['default_credit_limit'] = this.defaultCreditLimit;
    data['default_datatable_page_entries'] = this.defaultDatatablePageEntries;
    return data;
  }
}