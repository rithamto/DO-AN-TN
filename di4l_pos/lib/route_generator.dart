import 'package:di4l_pos/enums/add_contact_type.dart';
import 'package:di4l_pos/enums/add_debt_value.dart';
import 'package:di4l_pos/enums/add_type.dart';
import 'package:di4l_pos/enums/register_type.dart';
import 'package:di4l_pos/models/branch/response/branch_response.dart';
import 'package:di4l_pos/models/category/response/category_response.dart';
import 'package:di4l_pos/models/contacts/response/contacts_response.dart';
import 'package:di4l_pos/models/customer-group/response/customer_group_response.dart';
import 'package:di4l_pos/models/price/response/price_response.dart';
import 'package:di4l_pos/models/products/response/product_response.dart';
import 'package:di4l_pos/models/sell/response/sell_response.dart';
import 'package:di4l_pos/models/stock_adjustment/response/stock_adjustment_response.dart';
import 'package:di4l_pos/models/unit/response/unit_response.dart';
import 'package:di4l_pos/models/user/response/profile_response.dart';
import 'package:di4l_pos/models/variants/response/variants_response.dart';
import 'package:di4l_pos/models/warranty/warranty_response.dart';
import 'package:di4l_pos/screens/branch_screen/add_branch_screen/add_branch_screen.dart';
import 'package:di4l_pos/screens/branch_screen/branch_screen.dart';
import 'package:di4l_pos/screens/business_screen/business_screen.dart';
import 'package:di4l_pos/screens/cart_table_order_screen/cart_table_order_screen.dart';
import 'package:di4l_pos/screens/cart_table_order_screen/widgets/new_order_detail.dart';
import 'package:di4l_pos/screens/cart_table_order_screen/widgets/payment_screen.dart';
import 'package:di4l_pos/screens/business_screen/sub_screen/location_settings/locationSetting_screen.dart';
import 'package:di4l_pos/screens/business_screen/sub_screen/shop_info/shopInfo_screen.dart';
import 'package:di4l_pos/screens/cash_register_screen/cash_register_screen/cash_register_screen.dart';
import 'package:di4l_pos/screens/cash_register_screen/sub_screen/add_cash_screen.dart';
import 'package:di4l_pos/screens/category_screen/category_screen.dart';
import 'package:di4l_pos/screens/category_screen/sub_screen/add_category_screen.dart';
import 'package:di4l_pos/screens/change_pass_screen/change_pass_screen.dart';
import 'package:di4l_pos/screens/congratulations_screen/congratulations_screen.dart';
import 'package:di4l_pos/screens/contacts_screen/contact_screen.dart';
import 'package:di4l_pos/screens/contacts_screen/customers_screen/customers_screen.dart';
import 'package:di4l_pos/screens/contacts_screen/sub_screens/add_contact_screen/add_contact_screen.dart';
import 'package:di4l_pos/screens/contacts_screen/sub_screens/add_customer_group/add_customer_group_screen.dart';
import 'package:di4l_pos/screens/contacts_screen/sub_screens/detail_screen/detail_contact_screen.dart';
import 'package:di4l_pos/screens/contacts_screen/sub_screens/detail_screen/orders_screen/detail_order_screen/detail_order_screen.dart';
import 'package:di4l_pos/screens/contacts_screen/suppliers_screen/suplliers_screen.dart';
import 'package:di4l_pos/screens/create_order_screen/create_order_screen.dart';
import 'package:di4l_pos/screens/detail_debts_screen/detail_ledger_screen.dart';
import 'package:di4l_pos/screens/detail_debts_screen/add_debt_screen/add_debt_screen.dart';

import 'package:di4l_pos/screens/errors_screen/not_found_screen/not_found_screen.dart';
import 'package:di4l_pos/screens/expense_screen/add_revenue_expense_screen.dart';
import 'package:di4l_pos/screens/forgot_passwrod_screen/forgot_password_screen.dart';
import 'package:di4l_pos/screens/generate_code_screen/generate_code_screen.dart';
import 'package:di4l_pos/screens/kitchen_screen/kitchen_screen.dart';
import 'package:di4l_pos/screens/kitchen_screen/kitchen_detail_order.dart';
import 'package:di4l_pos/screens/login_screen/login_screen.dart';
import 'package:di4l_pos/screens/main_screen/main_screen.dart';
import 'package:di4l_pos/screens/main_screen/mobile/edit_more_screen.dart';
import 'package:di4l_pos/screens/manage_screen/manage_screen.dart';
import 'package:di4l_pos/screens/notifications_screen/notifications_screen.dart';
import 'package:di4l_pos/screens/onboard_screen/onboard_screen.dart';
import 'package:di4l_pos/screens/order_deltail_screen/order_deltail_screen.dart';
import 'package:di4l_pos/screens/order_screen/order_screen.dart';
import 'package:di4l_pos/screens/order_screen/sub_screens/add_order_screen/subs/add_order_detail_screen.dart';
import 'package:di4l_pos/screens/products_screen/sub_screens/select_product%20screen.dart';
import 'package:di4l_pos/screens/order_table_screen/order_food_screen.dart';
import 'package:di4l_pos/screens/order_table_screen/order_table_screen.dart';
import 'package:di4l_pos/screens/order_table_screen/widgets/order_success_food.dart';
import 'package:di4l_pos/screens/price_screen/add_price_screen/add_price_screen.dart';
import 'package:di4l_pos/screens/price_screen/price_screen.dart';
import 'package:di4l_pos/screens/products_screen/products_screen.dart';
import 'package:di4l_pos/screens/products_screen/sub_screens/add_product_screen/add_product_screen.dart';
import 'package:di4l_pos/screens/products_screen/sub_screens/add_product_screen/product_setting_screen.dart';
import 'package:di4l_pos/screens/products_screen/sub_screens/detail_product_screen.dart';
import 'package:di4l_pos/screens/profile_screen/mobile/subscreen/update_profile.dart';
import 'package:di4l_pos/screens/profile_screen/profile_screen.dart';
import 'package:di4l_pos/screens/register_screen/register_screen.dart';
import 'package:di4l_pos/screens/reports_screen/report_screen.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/profit_and_loss_screen/profit_and_loss_screen.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/stock_screen/stock_screen.dart';

import 'package:di4l_pos/screens/scan_code_screen/scan_code_screen.dart';
import 'package:di4l_pos/screens/sellOnline_screen/sellOnline_screen.dart';
import 'package:di4l_pos/screens/sell_return_screen/sell_return_screen.dart';
import 'package:di4l_pos/screens/settings_screen/settings_screen.dart';
import 'package:di4l_pos/screens/settings_screen/sub_screens/change_language_screen.dart';
import 'package:di4l_pos/screens/splash_screen/splash_screen.dart';
import 'package:di4l_pos/screens/stock_adjustment_screen/add_stock_adjustment_screen.dart';
import 'package:di4l_pos/screens/stock_manage/stock_manage_screen_mobile.dart';
import 'package:di4l_pos/screens/stock_adjustment_screen/stock_adjustment_detail.dart';
import 'package:di4l_pos/screens/stock_transfers_screen/add_stock_transfers_screen.dart';
import 'package:di4l_pos/screens/stock_transfers_screen/stock_transfers_detail.dart';
import 'package:di4l_pos/screens/stock_transfers_screen/stock_transfers_screen.dart';
import 'package:di4l_pos/screens/switch_account/switch_account_screen.dart';
import 'package:di4l_pos/screens/table_order_screen/table_order_screen.dart';
import 'package:di4l_pos/screens/temp_order_screen/temp_order_screen.dart';
import 'package:di4l_pos/screens/unit_screen/sub_screens/add_unit_screen.dart';
import 'package:di4l_pos/screens/unit_screen/unit_screen.dart';
import 'package:di4l_pos/screens/variant_screen/sub_screen/add_variantion_screen.dart';
import 'package:di4l_pos/screens/variant_screen/variant_screen.dart';
import 'package:di4l_pos/screens/warranties_screen/sub_screen/add_warranty_screen.dart';
import 'package:di4l_pos/screens/warranties_screen/warranties_screen.dart';
import 'package:di4l_pos/screens/webview_screen/webview_screen.dart';
import 'package:flutter/material.dart';

import 'screens/expense_screen/revenue_expense_screen.dart';
import 'screens/stock_adjustment_screen/stock_adjustment_screen.dart';

class RouteGenerator {
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String switchAccount = '/switch-account';
  static const String onboardScreen = '/onboard-screen';
  static const String forgotPasswordScreen = '/forgot-password-screen';
  static const String registerScreen = '/register-screen';
  static const String congratulationsScreen = '/congratulations-screen';
  static const String homeScreen = '/home-screen';
  static const String mainScreen = '/main-screen';
  static const String productsScreen = '/products-screen';
  static const String unitScreen = '/unit-screen';
  static const String categoryScreen = '/category-screen';
  static const String warrantiesScreen = '/warranties-screen';
  static const String branchScreen = '/branch-screen';
  static const String priceScreen = '/price-screen';
  static const String variantScreen = '/variant-screen';
  static const String notificationsScreen = '/notifications-screen';
  static const String webViewScreen = '/webview-screen';
  static const String changePassScreen = '/change-pass-screen';
  static const String profileScreen = '/profile-screen';
  static const String saleOrderScreen = '/sales-order-screen';
  static const String createOrderScreen = '/create-order-screen';
  static const String sellReturnScreen = '/sell-return-screen';
  static const String tempOrderScreen = '/temp-order-screen';
  static const String addProductScreen = '/add-product-screen';
  static const String addUnitScreen = '/add-unit-screen';
  static const String addPriceScreen = '/add-price-screen';
  static const String changeLanguageScreen = '/change-language-screen';
  static const String suppliersScreen = '/suppliers-screen';
  static const String customersScreen = '/customers-screen';
  static const String contactsScreen = '/contacts-screen';
  static const String detailDebtsScreen = '/detail-debts-screen';
  static const String addDebtScreen = '/add-debt-screen';
  static const String addContactScreen = '/add-contact';
  static const String scanBarCodeScreen = '/scan-barcode-screen';
  static const String generateCodeScreen = '/generate-code-screen';
  static const String profitAndLossScreen = '/profit-and-loss-screen';
  static const String stockScreen = '/stock-screen';
  static const String cashRegisterScreen = '/cash-register-screen';
  static const String settingsScreen = '/settings-screen';
  static const String addCategoryScreen = '/add-category-screen';
  static const String addBranchScreen = '/add-branch-screen';
  static const String detailContactScreen = '/detail-contact-screen';
  static const String addCashRegisterScreen = '/add-cash-register-screen';
  static const String customerGroupScreen = '/customer-group-screen';
  static const String addCustomerGroupScreen = '/add-customer-group-screen';
  static const String detailProductScreen = '/detail-product-screen';
  static const String addWarrantyScreen = '/add-warranty-screen';
  static const String addSellScreen = '/add-sell-screen';
  static const String sellDetailScreen = '/sell-detail-screen';
  static const String addVariantionScreen = '/add-variantion-screen';
  static const String editMoreScreen = '/edit_more_screen';
  static const String businessSettingsScreen = '/business-settings-screen';
  static const String shopinfoScreen = '/business_screen/sub_screen/shop_info';
  static const String orderScreen = '/order-screen';
  static const String orderDetailScreen = '/order-detail-screen';
  static const String detailOrderScreen = '/detail-order-screen';

  static const String updateProfile = '/update-profile-screen';

  static const String settingLocantionScreen =
      '/business_screen/sub_screen/location_settings';
  static const String settingDistrictScreen =
      '/business_screen/sub_screen/location_settings';
  static const String settingProvinceScreen =
      '/business_screen/sub_screen/location_settings';
  static const String settingCommuneScreen =
      '/business_screen/sub_screen/location_settings';

  static const String kitchenScreen = '/kitchen-screen';
  static const String kitchenDetail = '/kitchen-detail';
  static const String sellOnline = '/sellOnline_screen';
  static const String productSettingScreen = '/product-setting-screen';
  static const String tableOrderScreen = '/table-order-screen';
  static const String orderFoodScreen = '/order-food-screen';
  static const String orderFoodSuccessScreen = '/order-food-success-screen';
  static const String cartTableOrderScreen = '/cart-food-screen';
  static const String homeTableOrderSreen = '/home-table-order-sreen';
  static const String paymentScreen = '/payment-sreen';
  static const String newOrderDetail = '/new-order-detail';
  static const String foodDetail = '/food-detail';
  static const String reportScreen = '/report-screen';
  static const String stockAdjustmentScreen = '/stock-adjustment-screen';
  static const String addStockAdjustmentScreen = '/add-stock-adjustment-screen';
  static const String stockTransfersScreen = '/stock-transfers-screen';
  static const String addStockTransfersScreen = '/add-stock-transfers-screen';
  static const String orderTableScreen = '/order-table-screen';
  static const String addOrderScreen = '/add-order-screen';
  static const String addOrderDetailScreen = '/add-order-detail-screen';
  static const String revenueExpensePage = '/revenue_expense_screen';
  static const String selectPorductForOrder = '/select-porduct-for-order';
  static const String addExpense = '/add-expense';
  static const String stockManege = '/stock-manage';
  static const String stockAdjustmentDetail = '/stock-adjustment-detail';
  static const String stockTransferDetail = '/stock-transfer-detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => SplashScreen.provider(),
          settings: settings,
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
      case addOrderDetailScreen:
        final args = settings.arguments;

        return MaterialPageRoute(
          builder: (context) =>
              AddOrderDetailScreen.provider(args as List<Product>?),
          settings: settings,
        );
      case selectPorductForOrder:
        return MaterialPageRoute(
          builder: (context) => SelectProductForOder.provider(),
          settings: settings,
        );
      case revenueExpensePage:
        return MaterialPageRoute(
          builder: (context) => RevenueExpensePage.provider(),
          settings: settings,
        );
      case orderDetailScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final model = args?['SELLDATA'] as SellData?;
        return MaterialPageRoute(
          builder: (context) => OrderDetailScreen(
            sellData: model!,
          ),
          settings: settings,
        );
      case detailOrderScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final model = args?['SELL_DATA'] as SellData?;
        return MaterialPageRoute(
          builder: (context) => DetailOrderScreen(
            sellData: model!,
          ),
          settings: settings,
        );
      case orderScreen:
        return MaterialPageRoute(
          builder: (context) => const OrderScreen(),
          settings: settings,
        );
      case settingLocantionScreen:
        return MaterialPageRoute(
          builder: (context) => LocationSetting.provider(),
          settings: settings,
        );
      case sellOnline:
        return MaterialPageRoute(
          builder: (context) => SellOnlneScreen.providers(),
          settings: settings,
        );
      case stockManege:
        return MaterialPageRoute(
          builder: (context) => StockManageScreenMobile.provider(),
          settings: settings,
        );

      case productSettingScreen:
        return MaterialPageRoute(
          builder: (context) => const ProductSettingScreen(),
          settings: settings,
        );
      case editMoreScreen:
        return MaterialPageRoute(
          builder: (context) => EditMoreScreen.provider(),
          settings: settings,
        );
      case shopinfoScreen:
        return MaterialPageRoute(
          builder: (context) => ShopInfoScreen.provider(),
          settings: settings,
        );
      case switchAccount:
        return MaterialPageRoute(
          builder: (context) => SwitchAccountScreen.provider(),
          settings: settings,
        );
      case onboardScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardScreen(),
          settings: settings,
        );
      case forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
          settings: settings,
        );
      case registerScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['REGISTER_TYPE'] as RegisterType?;
        return MaterialPageRoute(
          builder: (context) => RegisterScreen.provider(registerType: type),
          settings: settings,
        );
      case congratulationsScreen:
        return MaterialPageRoute(
          builder: (context) => CongratulationsScreen.provider(),
          settings: settings,
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => ManageScreen.provider(),
          settings: settings,
        );
      case mainScreen:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
          settings: settings,
        );
      case productsScreen:
        return MaterialPageRoute(
          builder: (context) => const ProductsScreen(),
          settings: settings,
        );
      case unitScreen:
        return MaterialPageRoute(
          builder: (context) => UnitScreen.provider(),
          settings: settings,
        );
      case categoryScreen:
        return MaterialPageRoute(
          builder: (context) => CategoryScreen.provider(),
          settings: settings,
        );
      case warrantiesScreen:
        return MaterialPageRoute(
          builder: (context) => WarrantiesScreen.provider(),
          settings: settings,
        );
      case branchScreen:
        return MaterialPageRoute(
          builder: (context) => const BranchScreen(),
          settings: settings,
        );
      case priceScreen:
        return MaterialPageRoute(
          builder: (context) => const PriceScreen(),
          settings: settings,
        );
      case variantScreen:
        return MaterialPageRoute(
          builder: (context) => VariantScreen.provider(),
          settings: settings,
        );
      case notificationsScreen:
        return MaterialPageRoute(
          builder: (context) => const NotificationsScreen(),
          settings: settings,
        );
      case webViewScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final title = args?['TITLE'] as String?;
        final url = args?['URL'] as String?;
        return MaterialPageRoute(
          builder: (context) => WebViewScreen.provider(
            title: title,
            url: url,
          ),
          settings: settings,
        );
      case changePassScreen:
        return MaterialPageRoute(
          builder: (context) => ChangePassScreen.provider(),
          settings: settings,
        );
      case profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
          settings: settings,
        );
      // case saleOrderScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const SalesOrderScreen(),
      //     settings: settings,
      //   );
      case createOrderScreen:
        return MaterialPageRoute(
          builder: (context) => CreateOrderScreen.provider(),
          settings: settings,
        );
      case sellReturnScreen:
        return MaterialPageRoute(
          builder: (context) => SellReturnScreen.provider(),
          settings: settings,
        );
      case tempOrderScreen:
        return MaterialPageRoute(
          builder: (context) => TempOrderScreen.provider(),
          settings: settings,
        );
      case addProductScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_PRODUCT_TYPE'] as AddType?;
        final model = args?['PRODUCT_MODEL'] as Product?;
        return MaterialPageRoute(
          builder: (context) => AddProductScreen.provider(
            addProductType: type,
            product: model,
          ),
          settings: settings,
        );

      case addPriceScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_PRICE_TYPE'] as AddType?;
        final model = args?['PRICE_MODEL'] as Price?;
        return MaterialPageRoute(
          builder: (context) => AddPriceScreen.provider(
            addPriceType: type,
            price: model,
          ),
          settings: settings,
        );
      case changeLanguageScreen:
        return MaterialPageRoute(
          builder: (context) => ChangeLanguageScreen.provider(),
          settings: settings,
        );
      case suppliersScreen:
        return MaterialPageRoute(
          builder: (context) => const SuppliersScreen(),
          settings: settings,
        );
      case customersScreen:
        return MaterialPageRoute(
          builder: (context) => const CustomersScreen(),
          settings: settings,
        );

      case contactsScreen:
        return MaterialPageRoute(
          builder: (context) => ContactsScreen.provider(),
          settings: settings,
        );
      case detailDebtsScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_CONTACT_TYPE'] as AddContactType?;
        final contactModel = args?['CONTACT_MODEL'] as ContactModel?;
        return MaterialPageRoute(
          builder: (context) => DetailLedgersScreen.provider(
            addContactType: type,
            contactModel: contactModel,
          ),
          settings: settings,
        );

      case addDebtScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_TYPE'] as AddType?;
        final value = args?['ADD_VALUE'] as AddDebtValue?;

        return MaterialPageRoute(
          builder: (context) => AddDebtScreen.provider(
            addType: type,
            addValue: value,
          ),
          settings: settings,
        );
      case addContactScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_CONTACT_TYPE'] as AddContactType?;
        final contactModel = args?['CONTACT_MODEL'] as ContactModel?;
        return MaterialPageRoute(
          builder: (context) => AddContactScreen.provider(
            addContactType: type,
            contactModel: contactModel,
          ),
          settings: settings,
        );
      case scanBarCodeScreen:
        return MaterialPageRoute(
          builder: (context) => ScanCodeScreen.provider(),
          settings: settings,
        );
      case generateCodeScreen:
        return MaterialPageRoute(
          builder: (context) => GenerateCodeScreen.provide(),
          settings: settings,
        );
      case profitAndLossScreen:
        return MaterialPageRoute(
          builder: (context) => ProfitAndLossScreen.provide(),
          settings: settings,
        );
      case stockScreen:
        return MaterialPageRoute(
          builder: (context) => StockScreen.provider(),
          settings: settings,
        );
      case cashRegisterScreen:
        return MaterialPageRoute(
          builder: (context) => CashRegisterScreen.provider(),
          settings: settings,
        );
      case settingsScreen:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
          settings: settings,
        );
      case addCategoryScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_CATEGORY_TYPE'] as AddType?;
        final categoryModel = args?['CATEGORY_MODEL'] as CategoryModel?;
        return MaterialPageRoute(
          builder: (context) => AddCategoryScreen.provider(
            addCategoryType: type,
            categoryModel: categoryModel,
          ),
          settings: settings,
        );
      case addBranchScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_BRANCH_TYPE'] as AddType?;
        final branch = args?['BRANCH_MODEL'] as Branch?;
        return MaterialPageRoute(
          builder: (context) => AddBranchScreen.provider(
            addBranchType: type,
            branch: branch,
          ),
          settings: settings,
        );
      case addUnitScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_UNIT_TYPE'] as AddType?;
        final unit = args?['UNIT_MODEL'] as Unit?;
        return MaterialPageRoute(
          builder: (context) => AddUnitScreen.provider(
            addUnitType: type,
            unit: unit,
          ),
          settings: settings,
        );
      case detailContactScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_CONTACT_TYPE'] as AddContactType?;
        final model = args?['CONTACT_MODEL'] as ContactModel?;
        return MaterialPageRoute(
          builder: (context) => DetailContactScreen.provider(type, model),
          settings: settings,
        );
      case addCashRegisterScreen:
        return MaterialPageRoute(
          builder: (context) => AddCashRegisterScreen.provider(),
          settings: settings,
        );
      // case customerGroupScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => CustomerGroupScreen.provider(),
      //     settings: settings,
      //   );
      case addCustomerGroupScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_CUSTOMER_GROUP_TYPE'] as AddType?;
        final model = args?['CUSTOMER_GROUP_MODEL'] as CustomerGroupModel?;
        return MaterialPageRoute(
          builder: (context) => AddCustomerGroupScreen.provider(
            addCustomerGroupType: type,
            customerGroupModel: model,
          ),
          settings: settings,
        );
      case detailProductScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final model = args?['PRODUCT_MODEL'] as Product?;
        return MaterialPageRoute(
          builder: (context) => DetailProductScreen(
            product: model,
          ),
          settings: settings,
        );
      // case sellDetailScreen:
      //   final args = settings.arguments as Map<String, dynamic>?;
      //   final model = args?['SELLDATA'] as SellData?;
      //   return MaterialPageRoute(
      //     builder: (context) => SellDetailScreen(
      //       sellData: model!,
      //     ),
      //     settings: settings,
      //   );
      case addWarrantyScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_WARRANTY_TYPE'] as AddType?;
        final model = args?['WARRANTY_MODEL'] as Warranty?;
        return MaterialPageRoute(
          builder: (context) => AddWarrantyScreen.provider(
            addWarrantyType: type,
            warranty: model,
          ),
          settings: settings,
        );
      case addVariantionScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final type = args?['ADD_VARIANTION_TYPE'] as AddType?;
        final model = args?['VARIANTION_MODEL'] as Variant?;
        return MaterialPageRoute(
          builder: (context) => AddVariantionScreen.provider(
            addVariantionType: type,
            variant: model,
          ),
          settings: settings,
        );
      case businessSettingsScreen:
        return MaterialPageRoute(
          builder: (context) => BusinessSettingScreen.provider(),
          settings: settings,
        );
      case updateProfile:
        final args = settings.arguments as Map<String, dynamic>?;
        final model = args?['PROFILE'] as ProfileResponse?;
        return MaterialPageRoute(
          builder: (context) => UpdateProfileScreen.provider(profile: model!),
          settings: settings,
        );
      case kitchenScreen:
        return MaterialPageRoute(
          builder: (context) => KitchenScreen(),
          settings: settings,
        );
      case kitchenDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        final id = args?['orderId'];
        return MaterialPageRoute(
          builder: (context) => KitchenDetailOrder.provider(orderId: id),
          settings: settings,
        );
      case reportScreen:
        return MaterialPageRoute(
          builder: (context) => const ReportScreen(),
          settings: settings,
        );
      case stockAdjustmentScreen:
        return MaterialPageRoute(
          builder: (context) => const StockAdjustmentScreen(),
          settings: settings,
        );
      case stockAdjustmentDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        final id = args?['stockAdjustmentId'];
        return MaterialPageRoute(
          builder: (context) =>
              StockAdjustmentDetail.provider(stockadjustmentId: id),
          settings: settings,
        );
      case addStockAdjustmentScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        final stockAdjustmentData =
            args?['STOCK_ADJUSTMENT_DATA'] as StockAdjustmentData?;
        return MaterialPageRoute(
          builder: (context) => AddStockAdjustmentScreen.provider(
            stockAdjustmentData: stockAdjustmentData,
          ),
          settings: settings,
        );
      case stockTransfersScreen:
        return MaterialPageRoute(
          builder: (context) => const StockTransfersScreen(),
          settings: settings,
        );
      case stockTransferDetail:
        final args = settings.arguments as Map<String, dynamic>?;
        final id = args?['stockTransferId'];
        return MaterialPageRoute(
          builder: (context) =>
              StockTransferDetail.provider(stockTransferId: id),
          settings: settings,
        );
      case addStockTransfersScreen:
        return MaterialPageRoute(
          builder: (context) => AddStockTransfersScreen.provider(),
          settings: settings,
        );
      case tableOrderScreen:
        return MaterialPageRoute(
          builder: (context) => const TableOrderScreen(),
          settings: settings,
        );
      case orderFoodScreen:
        return MaterialPageRoute(
          builder: (context) => OrderFoodScreen.provider(),
          settings: settings,
        );
      case orderFoodSuccessScreen:
        return MaterialPageRoute(
          builder: (context) => const OrderFoodSuccessScreen(),
          settings: settings,
        );
      case cartTableOrderScreen:
        return MaterialPageRoute(
          builder: (context) => CartTableOrderScreen.provider(),
          settings: settings,
        );
      case paymentScreen:
        return MaterialPageRoute(
          builder: (context) => PaymentScreen.provider(),
          settings: settings,
        );
      case newOrderDetail:
        return MaterialPageRoute(
          builder: (context) => NewOrderDetail.provider(),
          settings: settings,
        );
      case orderTableScreen:
        return MaterialPageRoute(
          builder: (context) => OrderTableScreen.provider(),
          settings: settings,
        );
      case addExpense:
        return MaterialPageRoute(
          builder: (context) => AddExpensePage.provider(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
          settings: settings,
        );
    }
  }
}
