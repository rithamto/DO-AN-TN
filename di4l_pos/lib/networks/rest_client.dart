import 'dart:convert';
import 'dart:io';

import 'package:di4l_pos/common/global_configs.dart';
import 'package:di4l_pos/models/add_status_order/request/add_status_order_request.dart';
import 'package:di4l_pos/models/add_status_order/response/add_status_order_response.dart';
import 'package:di4l_pos/models/base/response/sucess_response.dart';
import 'package:di4l_pos/models/branch/add_branch_request.dart';
import 'package:di4l_pos/models/branch/response/add_brand_response.dart';
import 'package:di4l_pos/models/branch/response/branch_response.dart';
import 'package:di4l_pos/models/business_location/response/business_location_response.dart';
import 'package:di4l_pos/models/cart_table_order/add_order_request.dart';
import 'package:di4l_pos/models/cash_register/request/add_cash_register_request.dart';
import 'package:di4l_pos/models/cash_register/request/get_cash_register_request.dart';
import 'package:di4l_pos/models/cash_register/response/add_cash_register_response.dart';
import 'package:di4l_pos/models/cash_register/response/cash_register_response.dart';
import 'package:di4l_pos/models/category/request/add_category_request.dart';
import 'package:di4l_pos/models/category/request/get_category_request.dart';
import 'package:di4l_pos/models/category/response/add_category_response.dart';
import 'package:di4l_pos/models/category/response/category_response.dart';
import 'package:di4l_pos/models/contacts/request/add_contact_request.dart';
import 'package:di4l_pos/models/contacts/response/add_contact_response.dart';
import 'package:di4l_pos/models/contacts/response/contacts_response.dart';
import 'package:di4l_pos/models/contacts/response/ledger_response.dart';
import 'package:di4l_pos/models/customer-group/request/add_customer_group_request.dart';
import 'package:di4l_pos/models/customer-group/response/add_customer_group_response.dart';
import 'package:di4l_pos/models/customer-group/response/customer_group_response.dart';
import 'package:di4l_pos/models/delivery/request/connect_ghtk_request.dart';
import 'package:di4l_pos/models/delivery/response/delivery_response.dart';
import 'package:di4l_pos/models/delivery/response/connect_ghtk_response.dart';
import 'package:di4l_pos/models/kitchen/kitchen_detail_response.dart';
import 'package:di4l_pos/models/kitchen/kitchen_response.dart';
import 'package:di4l_pos/models/modifier_set/modifier_set_response.dart';
import 'package:di4l_pos/models/notifications/response/notification_response.dart';
import 'package:di4l_pos/models/price/add_price_request.dart';
import 'package:di4l_pos/models/price/response/add_price_response.dart';
import 'package:di4l_pos/models/price/response/price_response.dart';
import 'package:di4l_pos/models/products/request/add_product_request.dart';
import 'package:di4l_pos/models/products/request/get_products_request.dart';
import 'package:di4l_pos/models/products/response/add_product_response.dart';
import 'package:di4l_pos/models/products/response/product_response.dart';
import 'package:di4l_pos/models/reports/requests/getProfitDay.dart';
import 'package:di4l_pos/models/reports/responses/expense_report_response.dart';
import 'package:di4l_pos/models/reports/responses/getProfitDayRp.dart';
import 'package:di4l_pos/models/reports/responses/profit_andd_loss_response.dart';
import 'package:di4l_pos/models/reports/responses/report_stock_response.dart';
import 'package:di4l_pos/models/revenue_expense/request/add_expense_category.dart';
import 'package:di4l_pos/models/revenue_expense/request/add_expense_request.dart';
import 'package:di4l_pos/models/revenue_expense/response/add_expense_response.dart';
import 'package:di4l_pos/models/revenue_expense/response/expense_category_response.dart';
import 'package:di4l_pos/models/revenue_expense/response/expense_response.dart';
import 'package:di4l_pos/models/sell/request/add_sell_request.dart';
import 'package:di4l_pos/models/sell/request/get_sell_request.dart';
import 'package:di4l_pos/models/sell/response/sell_response.dart';
import 'package:di4l_pos/models/shopinfo/request/shopSettingPUTRq.dart';
import 'package:di4l_pos/models/shopinfo/response/TaxResponse.dart';
import 'package:di4l_pos/models/stock_adjustment/request/add_stock_adjustment_request.dart';
import 'package:di4l_pos/models/stock_adjustment/response/add_stock_adjustment_response.dart';
import 'package:di4l_pos/models/stock_adjustment/response/stock_adjustment_detail_response.dart';
import 'package:di4l_pos/models/stock_adjustment/response/stock_adjustment_response.dart';
import 'package:di4l_pos/models/shopinfo/response/Currency.dart';
import 'package:di4l_pos/models/shopinfo/response/DefaultUnit.dart';
import 'package:di4l_pos/models/shopinfo/response/ShopSettingRp.dart';
import 'package:di4l_pos/models/shopinfo/response/UpdateBusinessRp.dart';
import 'package:di4l_pos/models/stock_transfers/request/add_stock_transfers_request.dart';
import 'package:di4l_pos/models/stock_transfers/response/add_stock_transfers_response.dart';
import 'package:di4l_pos/models/stock_transfers/response/stock_transfers_detail_response.dart';
import 'package:di4l_pos/models/stock_transfers/response/stock_transfers_response.dart';
import 'package:di4l_pos/models/table/response/table_response.dart';
import 'package:di4l_pos/models/transaction/response/transaction_response.dart';
import 'package:di4l_pos/models/unit/add_unit_request.dart';
import 'package:di4l_pos/models/unit/response/add_unit_reponse.dart';
import 'package:di4l_pos/models/unit/response/unit_response.dart';
import 'package:di4l_pos/models/user/request/account_request.dart';
import 'package:di4l_pos/models/user/request/change_password_request.dart';
import 'package:di4l_pos/models/user/request/login_request.dart';
import 'package:di4l_pos/models/user/request/register_request.dart';
import 'package:di4l_pos/models/user/request/token_request.dart';
import 'package:di4l_pos/models/user/request/update_profile_request.dart';
import 'package:di4l_pos/models/user/response/account_response.dart';
import 'package:di4l_pos/models/user/response/login_response.dart';
import 'package:di4l_pos/models/user/response/profile_response.dart';
import 'package:di4l_pos/models/user/response/register_response.dart';
import 'package:di4l_pos/models/user/response/token_response.dart';
import 'package:di4l_pos/models/user/response/user_response.dart';
import 'package:di4l_pos/models/variants/request/add_variantion_request.dart';
import 'package:di4l_pos/models/variants/response/variants_response.dart';
import 'package:di4l_pos/models/warranty/warranty_request.dart';
import 'package:di4l_pos/models/warranty/warranty_response.dart';
import 'package:di4l_pos/models/product_stock/request/add_product_stock_request.dart';
import 'package:di4l_pos/models/product_stock/response/add_product_stock_response.dart';
import 'package:di4l_pos/models/printer/response/printer_response.dart';
import 'package:di4l_pos/models/printer/request/add_printer_request.dart';
import 'package:di4l_pos/models/printer/response/add_printer_response.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:retrofit/retrofit.dart';

import '../models/sell_report/reponse/sell_report_response.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: GlobalConfigs.kBaseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /// Repo - Business
  @POST('/connector/api/business/register')
  Future<RegisterResponse> register({@Body() required RegisterRequest request});

  @POST('/connector/api/business/add-business')
  Future<RegisterResponse> addBusiness({@Body() required AddBusiness request});

  @GET('/connector/api/business-location')
  Future<BusinessLocationResponse> getBusinessLocation();

  @POST('/connector/api/business-location/activate-deactivate/{id}')
  Future activeBusiness({@Path('id') required int id});

  @POST('/connector/api/business-delete/{id}')
  Future deleteBusiness({@Path('id') required int id});

  /// Repo - Auth
  @POST('/oauth/token')
  Future<TokenResponse> getToken({@Body() required TokenRequest request});

  @POST('/connector/api/login')
  Future<LoginResponse> login({@Body() required LoginRequest request});

  @POST('/connector/api/login-social')
  Future<LoginResponse> loginSocial({@Body() required LoginSocial request});

  @GET('/connector/api/business/select-service')
  Future<AccountResponse> switchAccount();

  @POST('/connector/api/business/select-service')
  Future<LoginResponse> postSwitchAccount(
      {@Body() required AccountRequest request});

  @GET('/connector/api/user/loggedin')
  Future<UserResponse> loggedIn();

  @POST('/connector/api/forget-password')
  Future<SuccessResponse> forgetPassword(
      {@Body() required SendEmailRequest request});

  @POST('/connector/api/update-password')
  Future<SuccessResponse> updatePassword(
      {@Body() required ChangePasswordRequest request});

  @MultiPart()
  @POST('/connector/api/user-update-avatar')
  Future<SuccessResponse> updateAvatar({
    @Part(name: 'profile_photo') File? file,
  });

  @POST('/connector/api/user-update')
  Future<SuccessResponse> updateProfile(
      {@Body() required UpdateProfileRequest request});

  @GET('/connector/api/get-profile')
  Future<ProfileResponse> getProfile();

  /// Repo - Contact
  @GET('/connector/api/contactapi')
  Future<ContactsResponse> getContacts({
    @Query('type') required String type,
    @Query("page") int? page,
  });

  @GET('/connector/api/ledge/{id}')
  Future<LedgerResponse> getLedger(
      {@Path('id') required int id,
      @Query("start_date") String? startDate,
      @Query("end_date") String? endDate});

  @POST('/connector/api/contactapi')
  Future<AddContactResponse> addContact(
      {@Body() required AddContactRequest request});

  @PUT('/connector/api/contactapi/{contactapi}')
  Future<AddContactResponse> updateContact({
    @Body() required AddContactRequest request,
    @Path('contactapi') required int id,
  });

  @DELETE('/connector/api/contactapi/{contactapi}')
  Future deleteContact({@Path('contactapi') required int id});

  @POST('/connector/api/contactapi/transactions')
  Future<TransactionResponse> transactionByContact(
      {@Part(name: 'contact_id') required int contactId});

  @POST('/connector/api/contactapi/transaction-by-status')
  Future<TransactionResponse> transactionContactByStatus(
      {@Part(name: 'status') required String status});

  @POST('/connector/api/contactapi/transaction-by-payment-status')
  Future<TransactionResponse> transactionContactByPaymentStatus(
      {@Part(name: 'status') required String status});

  @MultiPart()
  @POST('/connector/api/contactapi/transaction-of-contact-with-payment-status')
  Future<TransactionResponse> transactionOfContactWithPaymentStatus({
    @Part(name: 'status') required String status,
    @Part(name: 'contact_id') required int contactId,
    @Part(name: 'time_range') required String timeRange,
  });

  /// Repo - CustomGroup
  @GET('/connector/api/customer-group')
  Future<CustomerGroupResponse> getCustomerGroups();

  @GET('/connector/api/customer-group/{id}')
  Future<CustomerGroupResponse> getCustomerGroup({@Path('id') required int id});

  @POST('/connector/api/customer-group')
  Future<AddCustomerGroupResponse> addCustomerGroup(
      {@Body() required AddCustomerGroupRequest request});

  @PUT('/connector/api/customer-group/{customerGroupId}')
  Future<AddCustomerGroupResponse> updateCustomerGroup({
    @Body() required AddCustomerGroupRequest request,
    @Path('customerGroupId') required int id,
  });

  @DELETE('/connector/api/customer-group/{customerGroupId}')
  Future deleteCustomerGroup({@Path('customerGroupId') required int id});

  /// Repo - Product
  @GET('/connector/api/product')
  Future<ProductResponse> getProducts(
      {@Body() required GetProductsRequest request});

  @GET('/connector/api/product/{id}')
  Future<ProductResponse> getProductById({@Path('id') required int id});

  @GET('/connector/api/product-sell-report')
  Future<SellReportResponse> getSellReport(
      {@Query('page') int? page,
      @Query("start_date") String? startDate,
      @Query("end_date") String? endDate});

  @MultiPart()
  @POST('/connector/api/product')
  Future<AddProductResponse> addProduct({
    @Part(name: 'name') required String name,
    @Part(name: 'sku') String? sku,
    @Part(name: 'barcode_type') String? barcodeType,
    @Part(name: 'tax_type') String? taxType,
    @Part(name: 'type') String? type,
    @Part(name: 'brand_id') int? branchId,
    @Part(name: 'unit_id') int? unitId,
    @Part(name: 'category_id') int? categoryId,
    @Part(name: 'warranty_id') int? warrantyId,
    @Part(name: 'tax') String? tax,
    @Part(name: 'alert_quantity') String? alertQuantity,
    @Part(name: 'product_description') String? productDescription,
    @Part(name: 'enable_stock') int? enableStock,
    @Part(name: 'not_for_selling') int? notForSelling,
    @Part(name: 'enable_product_expiry') bool? enableProductExpiry,
    @Part(name: 'expiry_period_type') String? expiryPeriodType,
    @Part(name: 'expiry_period') String? expiryPeriod,
    @Part(name: 'enable_sr_no') int? enableSrNo,
    @Part(name: 'single_dsp') double? defaultSellPrice,
    @Part(name: 'single_dpp') double? defaultPurchasePrice,
    @Part(name: 'product_variation')
        List<ProductVariationRequest>? productVariationRequests,
    @Part(name: 'image', contentType: 'image/jpeg') File? file,
  });

  @PUT('/connector/api/product/{productId}')
  Future<AddProductResponse> updateProduct({
    @Path('productId') required int id,
    @Part(name: 'name') required String name,
    @Part(name: 'sku') String? sku,
    @Part(name: 'barcode_type') String? barcodeType,
    @Part(name: 'tax_type') String? taxType,
    @Part(name: 'type') String? type,
    @Part(name: 'brand_id') int? branchId,
    @Part(name: 'unit_id') int? unitId,
    @Part(name: 'category_id') int? categoryId,
    @Part(name: 'warranty_id') int? warrantyId,
    @Part(name: 'tax') String? tax,
    @Part(name: 'alert_quantity') String? alertQuantity,
    @Part(name: 'product_description') String? productDescription,
    @Part(name: 'enable_stock') int? enableStock,
    @Part(name: 'not_for_selling') int? notForSelling,
    @Part(name: 'enable_product_expiry') bool? enableProductExpiry,
    @Part(name: 'expiry_period_type') String? expiryPeriodType,
    @Part(name: 'expiry_period') String? expiryPeriod,
    @Part(name: 'enable_sr_no') int? enableSrNo,
    @Part(name: 'single_dsp') double? defaultSellPrice,
    @Part(name: 'single_dpp') double? defaultPurchasePrice,
    @Part(name: 'product_variation')
        List<ProductVariationRequest>? productVariationRequests,
    @Part(name: 'image', contentType: 'image/jpeg') File? file,
  });

  @DELETE('/connector/api/product/{productId}')
  Future deleteProduct({@Path('productId') required int id});

  /// Repo - Variant
  @GET('/connector/api/variation-template')
  Future<VariantsResponse> getVariants();

  @POST('/connector/api/variation-template')
  Future<SuccessResponse> addVariantion(
      {@Body() required AddVariantRequest request});

  @PUT('/connector/api/variation-template/{templateId}')
  Future<SuccessResponse> updateVariantion({
    @Body() required AddVariantRequest request,
    @Path('templateId') required int id,
  });

  /// Repo - Price
  @GET('/connector/api/selling-price-group')
  Future<PriceResponse> getPriceGroup();

  @POST('/connector/api/selling-price-group')
  Future<AddPriceResponse> addPrice({@Body() required AddPriceRequest request});

  @PUT('/connector/api/selling-price-group/{priceGroupId}')
  Future<AddPriceResponse> updatePrice({
    @Body() required AddPriceRequest request,
    @Path('priceGroupId') required int id,
  });

  @DELETE('/connector/api/selling-price-group/{priceGroupId}')
  Future deletePrice({@Path('priceGroupId') required int id});

  /// Repo - Unit
  @GET('/connector/api/unit')
  Future<UnitResponse> getUnits();

  @POST('/connector/api/unit')
  Future<AddUnitResponse> addUnit({@Body() required AddUnitRequest request});

  @PUT('/connector/api/unit/{unitId}')
  Future<AddUnitResponse> updateUnit({
    @Body() required AddUnitRequest request,
    @Path('unitId') required int id,
  });

  @DELETE('/connector/api/unit/{unitId}')
  Future deleteUnit({@Path('unitId') required int id});

  /// Repo - Category
  @GET('/connector/api/taxonomy')
  Future<CategoryResponse> getCategory(
      {@Body() required GetCategoryRequest request});

  @POST('/connector/api/taxonomy')
  Future<AddCategoryResponse> addCategory(
      {@Body() required AddCategoryRequest request});

  @PUT('/connector/api/taxonomy/{taxonomyId}')
  Future<AddCategoryResponse> updateCategory({
    @Body() required AddCategoryRequest request,
    @Path('taxonomyId') required int id,
  });

  @DELETE('/connector/api/taxonomy/{taxonomyId}')
  Future deleteCategory({@Path('taxonomyId') required int id});

  /// Repo - Brand
  @GET('/connector/api/brand')
  Future<BranchResponse> getBranch();

  @POST('/connector/api/brand')
  Future<AddBranchResponse> addBranch(
      {@Body() required AddBranchRequest request});

  @PUT('/connector/api/brand/{brandId}')
  Future<AddBranchResponse> updateBranch({
    @Body() required AddBranchRequest request,
    @Path('brandId') required int id,
  });

  @DELETE('/connector/api/brand/{brandId}')
  Future deleteBrand({@Path('brandId') required int id});

  /// Repo - Warranty
  @GET('/connector/api/warranty')
  Future<WarrantyResponse> getWarranties();

  @POST('/connector/api/warranty')
  Future<WarrantyUpdate> addWarranty(
      {@Body() required AddWarrantyRequest request});

  @PUT('/connector/api/warranty/{warrantyId}')
  Future<WarrantyUpdate> updateWarranty({
    @Body() required AddWarrantyRequest request,
    @Path('warrantyId') required int id,
  });

  /// Repo - notifications
  @GET('/connector/api/notifications')
  Future<NotificationResponse> getNotifications();

  /// Repo - Sell
  @GET('/connector/api/profit-loss-report')
  Future<ProfitAndLossResponse> getProfitAndLoss(
      {@Query("start_date") String? startDate,
      @Query("end_date") String? endDate});

  @GET('/connector/api/product-stock-report')
  Future<ReportStockResponse> getReportStock();

  @GET('/connector/api/product-stock-report')
  Future<ReportStockResponse> getReportStockManage();

  @GET('/connector/api/cash-register')
  Future<CashRegisterResponse> getCashRegister(
      {@Body() required GetCashRegisterRequest request});

  @POST('/connector/api/cash-register')
  Future<AddCashRegisterResponse> addCashRegister(
      {@Body() required AddCashRegisterRequest request});

  @GET('/connector/api/sell')
  Future<SellResponse> getSell({required GetSellRequest request});

  @GET('/connector/api/sell')
  Future<SellResponse> getSellById(
      {@Query('contact_id') required int contactId,
      @Query("start_date") String? startDate,
      @Query("end_date") String? endDate});

  @GET('/connector/api/sell')
  Future<SellResponse> getOrder(
      {@Query('page') int? page,
      @Query("start_date") String? startDate,
      @Query("end_date") String? endDate});

  @GET('/connector/api/list-sell-return')
  Future<SellResponse> getSellReturn({required GetSellRequest request});

  @POST('/connector/api/sell')
  Future<SuccessResponse> addSell({@Body() required AddSellRequest request});

  ///Kitchen Repo
  @GET('/connector/api/kitchen')
  Future<KitchenResponse> getKitchens();

  @GET('/connector/api/kitchen/detail-kitchen/{id}')
  Future<KitchenDetailResponse> getDetailKitchens({
    @Path('id') required int id,
  });

  @GET('/connector/api/kitchen/mark-as-cooked/{id}')
  Future markAsCooked({
    @Path('id') required int id,
  });

  ///Table Order
  @GET('/connector/api/table')
  Future<TableResponse> getTables();

  @GET('/connector/api/table/{tableId}')
  Future<TableModel> getTableWithId({@Path('tableId') required int id});

  @GET('/connector/api/modifier-set')
  Future<ModifierResponse> getModifiers();

  @POST('/connector/api/sell')
  Future<SuccessResponse> addOrder({@Body() required AddOrderRequest request});

  @GET('/connector/api/currency')
  Future<List<Currency>> getListCurrency();

  @GET('/connector/api/timezone')
  Future<List<String>> getListTimeZone();

  @GET('/connector/api/business/settings')
  Future<ShopSettingRp> getInfoBussinessSetting();

  @GET('/connector/api/unit')
  Future<DefaultUnitRp> getListDFUnit();

  @POST('/connector/api/business/settings/update')
  Future<UpdateBusinessRp> updateInfoBusiness(
      {@Body() required ShopSettingRq request});

  /// Expense
  ///
  @GET('/connector/api/expense-report')
  Future<List<ExpenseReportResponse>> getExpenseReport(
      {@Query("start_date") String? startDate,
      @Query("end_date") String? endDate});

  @GET('/connector/api/expense')
  Future<ExpenseResponse> getExpenses();

  @POST('/connector/api/expense')
  Future<AddExpenseResponse> addExpense(
      {@Body() required AddExpenseRequest request});

  @GET('/connector/api/expense-categories')
  Future<ExpenseCategoryResponse> getExpenseCateogries();

  //Stock adjustments
  @GET('/connector/api/stock-adjustments')
  Future<StockAdjustmentResponse> getStockAdjustments({
    @Query('page') int? page,
  });

  @GET('/connector/api/stock-adjustments/detail-stock-adjustments/{id}')
  Future<StockAdjustmentDetailResponse> getStockAdjustmentsDetail({
    @Path('id') required int id,
  });

  @POST('/connector/api/stock-adjustments-delete/{stock-adjustments-deleteId}')
  Future deleteStockAdjustment(
      {@Path('stock-adjustments-deleteId') required int id});

  @POST('/connector/api/stock-adjustments-add')
  Future<AddStockAdjustmentResponse> addStockAdjustment(
      {@Body() required AddStockAdjustmentRequest request});

  //Stock Transfer
  @GET('/connector/api/stock-transfers')
  Future<StockTransfersResponse> getStockTransfers({
    @Query('page') int? page,
  });

  @GET('/connector/api/stock-transfers/detail-stock-transfers/{id}')
  Future<StockTransfersDetailResponse> getStockTransferDetail({
    @Path('id') required int id,
  });

  @POST('/connector/api/stock-transfers/delete/{id}')
  Future deleteStockTransfer({@Path('id') required int id});

  @POST('/connector/api/stock-transfers-add')
  Future<AddStockTransfersResponse> addStockTransfers(
      {@Body() required AddStockTransfersRequest request});

  @POST('/connector/api/expense-categories/add')
  Future<AddExpenseCategoryResponse> addExpenseCateogry(
      {@Body() required AddExpenseCategoryRequest request});

  // @MultiPart()
  // @POST('/connector/api/user-update-avatar')
  // Future<SuccessResponse> updateLogo({
  //   @Part(name: 'profile_photo') File? file,
  // });

  @MultiPart()
  @POST('/connector/api/business/settings/update')
  Future<UpdateBusinessRp> updateLogo({
    @Part(name: 'business_logo', contentType: 'image/jpeg') File? file,
  });

  @GET('/connector/api/tax')
  Future<TaxResponse> getTax();

  @GET('connector/api/report-profit-day')
  Future<GetProfitDayRp> getProfitDay({
    @Query("start_date") String? startDate,
    @Query("end_date") String? endDate});
  // @GET('/connector/api/customer-group/{id}')
  // Future<CustomerGroupResponse> getCustomerGroup({@Path('id') required int id});

  @POST('/connector/api/status-order-pos')
  Future<AddStatusOrderResponse> addStatusOrder(
      {@Body() required AddStatusOrderRequest request});

  @PUT('/connector/api/status-order-pos/{id}')
  Future<AddStatusOrderResponse> updateStatusOrder({
    @Body() required AddStatusOrderRequest request,
    @Path('id') required int id,
  });

  @DELETE('/connector/api/status-order-pos/{id}')
  Future deleteStatusOrder({@Path('id') required int id});

  @POST('/connector/api/opening-stock')
  Future<AddProductStockResponse> addProductStock({
    @Body() required AddProductStockRequest request,
  });
  @GET('/connector/api/printers')
  Future<List<Printer>> getPrinters();

  @DELETE('/connector/api/printers/{id}')
  Future deletePrinter({@Path('id') required int id});

  @POST('/connector/api/printers')
  Future<AddPrinterResponse> addPrinter(
      {@Body() required AddPrinterRequest request});

  @PUT('/connector/api/printers/{id}')
  Future<AddPrinterResponse> updatePrinter(
      {@Body() required AddPrinterRequest request,
      @Path('id') required int id});

  @GET('/connector/api/delivery/partner')
  Future<DeliveryResponse> getDeliveryPartners();

  @POST('/connector/api/delivery/login_ghtk')
  Future<ConnectGhtkResponse> connectGHTK(
      {@Body() required ConnectGhtkRequest request});
}
