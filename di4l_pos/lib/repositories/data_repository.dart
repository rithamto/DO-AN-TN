import 'dart:io';

import 'package:di4l_pos/common/global_configs.dart';
import 'package:di4l_pos/common/storage/app_prefs.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/base/response/error_response.dart';
import 'package:di4l_pos/models/base/response/sucess_response.dart';
import 'package:di4l_pos/models/branch/add_branch_request.dart';
import 'package:di4l_pos/models/branch/response/add_brand_response.dart';
import 'package:di4l_pos/models/branch/response/branch_response.dart';
import 'package:di4l_pos/models/business_location/response/business_location_response.dart';
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
import 'package:di4l_pos/models/revenue_expense/request/add_expense_category.dart';
import 'package:di4l_pos/models/revenue_expense/request/add_expense_request.dart';
import 'package:di4l_pos/models/revenue_expense/response/add_expense_response.dart';
import 'package:di4l_pos/models/revenue_expense/response/expense_category_response.dart';
import 'package:di4l_pos/models/revenue_expense/response/expense_response.dart';
import 'package:di4l_pos/models/sell_report/reponse/sell_report_response.dart';
import 'package:di4l_pos/models/reports/responses/profit_andd_loss_response.dart';
import 'package:di4l_pos/models/reports/responses/report_stock_response.dart';
import 'package:di4l_pos/models/sell/request/add_sell_request.dart';
import 'package:di4l_pos/models/sell/response/sell_response.dart';
import 'package:di4l_pos/models/sell/request/get_sell_request.dart';
import 'package:di4l_pos/models/shopinfo/response/TaxResponse.dart';
import 'package:di4l_pos/models/stock_adjustment/request/add_stock_adjustment_request.dart';
import 'package:di4l_pos/models/stock_adjustment/response/add_stock_adjustment_response.dart';
import 'package:di4l_pos/models/stock_adjustment/response/stock_adjustment_detail_response.dart';
import 'package:di4l_pos/models/stock_adjustment/response/stock_adjustment_response.dart';
import 'package:di4l_pos/models/shopinfo/request/ShopSettingPUTRq.dart';
import 'package:di4l_pos/models/shopinfo/response/Currency.dart';
import 'package:di4l_pos/models/shopinfo/response/DefaultUnit.dart';
import 'package:di4l_pos/models/shopinfo/response/ShopSettingRp.dart';
import 'package:di4l_pos/models/shopinfo/response/UpdateBusinessRp.dart';
import 'package:di4l_pos/models/stock_transfers/response/stock_transfers_detail_response.dart';
import 'package:di4l_pos/models/stock_transfers/response/stock_transfers_response.dart';
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
import 'package:di4l_pos/networks/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:di4l_pos/models/table/response/table_response.dart';

@lazySingleton
class DataRepository implements RestClient {
  /// MARK: - Initials;
  final dio = Dio();
  RestClient? _client;
  final _appPrefs = getIt<AppPref>();

  DataRepository() {
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    dio.options.contentType = Headers.jsonContentType;
    dio.options.responseType = ResponseType.json;
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';

    /// Add Middleware Authorization
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = (await _appPrefs.getToken())?.accessToken ?? '';
      options.headers['Authorization'] = 'Bearer $token';
      options.headers['Content-Type'] = 'application/json';
      options.headers['Accept'] = 'application/json';
      return handler.next(options);
    }));

    /// Middleware Error Handling
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error1, handler) {
          final errorResponse = ErrorResponse.fromJson(error1.response?.data);
          final error = DioError(
            requestOptions: RequestOptions(path: ''),
            error: errorResponse.toJson(),
          );
          return handler.reject(error);
        },
      ),
    );
    _client = RestClient(dio, baseUrl: GlobalConfigs.kBaseUrl);
  }

  @override
  Future<TokenResponse> getToken({required TokenRequest request}) {
    return _client!.getToken(request: request);
  }

  @override
  Future<LoginResponse> login({required LoginRequest request}) {
    return _client!.login(request: request);
  }

  @override
  Future<LoginResponse> loginSocial({required LoginSocial request}) {
    return _client!.loginSocial(request: request);
  }

  @override
  Future<AccountResponse> switchAccount() {
    return _client!.switchAccount();
  }

  @override
  Future<LoginResponse> postSwitchAccount({required AccountRequest request}) {
    return _client!.postSwitchAccount(request: request);
  }

  @override
  Future<UserResponse> loggedIn() {
    return _client!.loggedIn();
  }

  @override
  Future<SuccessResponse> forgetPassword({required SendEmailRequest request}) {
    return _client!.forgetPassword(request: request);
  }

  @override
  Future<ProductResponse> getProducts({required GetProductsRequest request}) {
    return _client!.getProducts(request: request);
  }

  @override
  Future<UnitResponse> getUnits() {
    return _client!.getUnits();
  }

  @override
  Future<CategoryResponse> getCategory({required GetCategoryRequest request}) {
    return _client!.getCategory(request: request);
  }

  @override
  Future<BranchResponse> getBranch() {
    return _client!.getBranch();
  }

  @override
  Future<PriceResponse> getPriceGroup() {
    return _client!.getPriceGroup();
  }

  @override
  Future<NotificationResponse> getNotifications() {
    return _client!.getNotifications();
  }

  @override
  Future<SuccessResponse> updatePassword(
      {required ChangePasswordRequest request}) {
    return _client!.updatePassword(request: request);
  }

  @override
  Future<VariantsResponse> getVariants() {
    return _client!.getVariants();
  }

  ///Contact Repo
  @override
  Future<ContactsResponse> getContacts({required String type, int? page}) {
    return _client!.getContacts(type: type, page: page);
  }

  @override
  Future<LedgerResponse> getLedger(
      {required int id, String? startDate, String? endDate}) {
    return _client!.getLedger(id: id, startDate: startDate, endDate: endDate);
  }

  @override
  Future<ProductResponse> getProductById({required int id}) {
    return _client!.getProductById(id: id);
  }

  @override
  Future<AddContactResponse> addContact({required AddContactRequest request}) {
    return _client!.addContact(request: request);
  }

  @override
  Future<AddContactResponse> updateContact(
      {required AddContactRequest request, required int id}) {
    return _client!.updateContact(request: request, id: id);
  }

  @override
  Future deleteContact({required int id}) {
    return _client!.deleteContact(id: id);
  }

  @override
  Future<TransactionResponse> transactionByContact({required int contactId}) {
    return _client!.transactionByContact(contactId: contactId);
  }

  @override
  Future<SellResponse> getSellById(
      {required int contactId, String? startDate, String? endDate}) {
    return _client!.getSellById(
        contactId: contactId, startDate: startDate, endDate: endDate);
  }

  @override
  Future<TransactionResponse> transactionContactByStatus(
      {required String status}) {
    return _client!.transactionContactByStatus(status: status);
  }

  @override
  Future<TransactionResponse> transactionContactByPaymentStatus(
      {required String status}) {
    return _client!.transactionContactByPaymentStatus(status: status);
  }

  @override
  Future<TransactionResponse> transactionOfContactWithPaymentStatus(
      {required String status,
      required int contactId,
      required String timeRange}) {
    return _client!.transactionOfContactWithPaymentStatus(
        status: status, contactId: contactId, timeRange: timeRange);
  }

  ///
  @override
  Future<ProfitAndLossResponse> getProfitAndLoss(
      {String? startDate, String? endDate}) {
    return _client!.getProfitAndLoss(startDate: startDate, endDate: endDate);
  }

  @override
  Future<List<ExpenseReportResponse>> getExpenseReport(
      {String? startDate, String? endDate}) {
    return _client!.getExpenseReport(startDate: startDate, endDate: endDate);
  }

  @override
  Future<ReportStockResponse> getReportStock() {
    return _client!.getReportStock();
  }

  @override
  Future<CashRegisterResponse> getCashRegister(
      {required GetCashRegisterRequest request}) {
    return _client!.getCashRegister(request: request);
  }

  @override
  Future<AddCashRegisterResponse> addCashRegister(
      {required AddCashRegisterRequest request}) {
    return _client!.addCashRegister(request: request);
  }

  @override
  Future<SellResponse> getSell({required GetSellRequest request}) {
    return _client!.getSell(request: request);
  }

  @override
  Future<SellResponse> getOrder(
      {int? page, String? startDate, String? endDate}) {
    return _client!
        .getOrder(page: page, startDate: startDate, endDate: endDate);
  }

  @override
  Future<SellResponse> getSellReturn({required GetSellRequest request}) {
    return _client!.getSellReturn(request: request);
  }

  @override
  Future<AddCategoryResponse> addCategory(
      {required AddCategoryRequest request}) {
    return _client!.addCategory(request: request);
  }

  @override
  Future<AddCategoryResponse> updateCategory(
      {required AddCategoryRequest request, required int id}) {
    return _client!.updateCategory(request: request, id: id);
  }

  @override
  Future deleteCategory({required int id}) {
    return _client!.deleteCategory(id: id);
  }

  @override
  Future<AddBranchResponse> addBranch({required AddBranchRequest request}) {
    return _client!.addBranch(request: request);
  }

  @override
  Future<AddBranchResponse> updateBranch(
      {required AddBranchRequest request, required int id}) {
    return _client!.updateBranch(request: request, id: id);
  }

  @override
  Future deleteBrand({required int id}) {
    return _client!.deleteBrand(id: id);
  }

  @override
  Future<AddUnitResponse> addUnit({required AddUnitRequest request}) {
    return _client!.addUnit(request: request);
  }

  @override
  Future<AddUnitResponse> updateUnit(
      {required AddUnitRequest request, required int id}) {
    return _client!.updateUnit(request: request, id: id);
  }

  @override
  Future deleteUnit({required int id}) {
    return _client!.deleteUnit(id: id);
  }

  @override
  Future<AddPriceResponse> addPrice({required AddPriceRequest request}) {
    return _client!.addPrice(request: request);
  }

  @override
  Future<AddPriceResponse> updatePrice(
      {required AddPriceRequest request, required int id}) {
    return _client!.updatePrice(request: request, id: id);
  }

  @override
  Future deletePrice({required int id}) {
    return _client!.deletePrice(id: id);
  }

  @override
  Future<BusinessLocationResponse> getBusinessLocation() {
    return _client!.getBusinessLocation();
  }

  @override
  Future<CustomerGroupResponse> getCustomerGroups() {
    return _client!.getCustomerGroups();
  }

  @override
  Future<CustomerGroupResponse> getCustomerGroup({required int id}) {
    return _client!.getCustomerGroup(id: id);
  }

  @override
  Future<AddCustomerGroupResponse> addCustomerGroup(
      {required AddCustomerGroupRequest request}) {
    return _client!.addCustomerGroup(request: request);
  }

  @override
  Future<AddCustomerGroupResponse> updateCustomerGroup(
      {required AddCustomerGroupRequest request, required int id}) {
    return _client!.updateCustomerGroup(request: request, id: id);
  }

  @override
  Future deleteCustomerGroup({required int id}) {
    return _client!.deleteCustomerGroup(id: id);
  }

  @override
  Future<AddProductResponse> addProduct({
    required String name,
    String? sku,
    String? barcodeType,
    String? taxType,
    String? type,
    int? branchId,
    int? unitId,
    int? categoryId,
    int? warrantyId,
    String? tax,
    String? alertQuantity,
    String? productDescription,
    int? enableStock,
    int? notForSelling,
    double? defaultSellPrice,
    double? defaultPurchasePrice,
    bool? enableProductExpiry,
    dynamic expiryPeriodType,
    dynamic expiryPeriod,
    int? enableSrNo,
    List<ProductVariationRequest>? productVariationRequests,
    File? file,
  }) {
    return _client!.addProduct(
      name: name,
      sku: sku,
      branchId: branchId,
      unitId: unitId,
      categoryId: categoryId,
      warrantyId: warrantyId,
      tax: tax,
      barcodeType: barcodeType,
      alertQuantity: alertQuantity,
      taxType: taxType,
      productDescription: productDescription,
      type: type,
      enableStock: enableStock,
      notForSelling: notForSelling,
      enableProductExpiry: enableProductExpiry,
      expiryPeriodType: expiryPeriodType,
      expiryPeriod: expiryPeriod,
      enableSrNo: enableSrNo,
      defaultPurchasePrice: defaultPurchasePrice,
      defaultSellPrice: defaultSellPrice,
      productVariationRequests: productVariationRequests,
      file: file,
    );
  }

  @override
  Future<AddProductResponse> updateProduct({
    required int id,
    required String name,
    String? sku,
    String? barcodeType,
    String? taxType,
    String? type,
    int? branchId,
    int? unitId,
    int? categoryId,
    int? warrantyId,
    String? tax,
    String? alertQuantity,
    String? productDescription,
    int? enableStock,
    int? notForSelling,
    double? defaultSellPrice,
    double? defaultPurchasePrice,
    bool? enableProductExpiry,
    dynamic expiryPeriodType,
    dynamic expiryPeriod,
    int? enableSrNo,
    List<ProductVariationRequest>? productVariationRequests,
    File? file,
  }) {
    return _client!.updateProduct(
      id: id,
      name: name,
      sku: sku,
      branchId: branchId,
      unitId: unitId,
      categoryId: categoryId,
      warrantyId: warrantyId,
      tax: tax,
      barcodeType: barcodeType,
      alertQuantity: alertQuantity,
      taxType: taxType,
      productDescription: productDescription,
      type: type,
      enableStock: enableStock,
      notForSelling: notForSelling,
      enableProductExpiry: enableProductExpiry,
      defaultPurchasePrice: defaultPurchasePrice,
      defaultSellPrice: defaultSellPrice,
      expiryPeriodType: expiryPeriodType,
      expiryPeriod: expiryPeriod,
      enableSrNo: enableSrNo,
      productVariationRequests: productVariationRequests,
      file: file,
    );
  }

  @override
  Future deleteProduct({required int id}) {
    return _client!.deleteProduct(id: id);
  }

  @override
  Future<RegisterResponse> register({required RegisterRequest request}) {
    return _client!.register(request: request);
  }

  @override
  Future<RegisterResponse> addBusiness({required AddBusiness request}) {
    return _client!.addBusiness(request: request);
  }

  @override
  Future deleteBusiness({required int id}) {
    return _client!.deleteBusiness(id: id);
  }

  @override
  Future<WarrantyResponse> getWarranties() {
    return _client!.getWarranties();
  }

  @override
  Future<WarrantyUpdate> addWarranty({required AddWarrantyRequest request}) {
    return _client!.addWarranty(request: request);
  }

  @override
  Future<WarrantyUpdate> updateWarranty(
      {required AddWarrantyRequest request, required int id}) {
    return _client!.updateWarranty(request: request, id: id);
  }

  @override
  Future<SuccessResponse> addSell({required AddSellRequest request}) {
    return _client!.addSell(request: request);
  }

  @override
  Future<SuccessResponse> addVariantion({required AddVariantRequest request}) {
    return _client!.addVariantion(request: request);
  }

  @override
  Future<SuccessResponse> updateVariantion(
      {required AddVariantRequest request, required int id}) {
    return _client!.updateVariantion(request: request, id: id);
  }

  @override
  Future<SuccessResponse> updateAvatar({File? file}) {
    return _client!.updateAvatar(file: file);
  }

  @override
  Future<SuccessResponse> updateProfile(
      {required UpdateProfileRequest request}) {
    return _client!.updateProfile(request: request);
  }

  @override
  Future<ProfileResponse> getProfile() {
    return _client!.getProfile();
  }

  /// KitChen repo
  @override
  Future<KitchenResponse> getKitchens() {
    return _client!.getKitchens();
  }

  @override
  Future<KitchenDetailResponse> getDetailKitchens({required int id}) {
    return _client!.getDetailKitchens(id: id);
  }

  @override
  Future markAsCooked({required int id}) {
    return _client!.markAsCooked(id: id);
  }

  ///Table Order
  @override
  Future<TableResponse> getTables() {
    return _client!.getTables();
  }

  @override
  Future<TableModel> getTableWithId({required int id}) {
    return _client!.getTableWithId(id: id);
  }

  @override
  Future<ModifierResponse> getModifiers() {
    return _client!.getModifiers();
  }

  @override
  Future<List<String>> getListTimeZone() {
    return _client!.getListTimeZone();
  }

  @override
  Future<List<Currency>> getListCurrency() {
    return _client!.getListCurrency();
  }

  @override
  Future<SellReportResponse> getSellReport(
      {int? page, String? startDate, String? endDate}) {
    return _client!
        .getSellReport(page: page, startDate: startDate, endDate: endDate);
  }

  /// Expense
  @override
  Future<ExpenseResponse> getExpenses() {
    return _client!.getExpenses();
  }

  @override
  Future<AddExpenseResponse> addExpense({required AddExpenseRequest request}) {
    return _client!.addExpense(request: request);
  }

  @override
  Future<ShopSettingRp> getInfoBussinessSetting() {
    return _client!.getInfoBussinessSetting();
  }

  @override
  Future<DefaultUnitRp> getListDFUnit() {
    return _client!.getListDFUnit();
  }

  @override
  Future<UpdateBusinessRp> updateInfoBusiness(
      {required ShopSettingRq request}) {
    return _client!.updateInfoBusiness(request: request);
  }

  @override
  Future<ExpenseCategoryResponse> getExpenseCateogries() {
    return _client!.getExpenseCateogries();
  }

  // Stock adjustments
  @override
  Future<StockAdjustmentResponse> getStockAdjustments() {
    return _client!.getStockAdjustments();
  }

  @override
  Future<AddStockAdjustmentResponse> addStockAdjustment(
      {required AddStockAdjustmentRequest request}) {
    return _client!.addStockAdjustment(request: request);
  }

  @override
  Future<StockAdjustmentDetailResponse> getStockAdjustmentsDetail(
      {required int id}) {
    return _client!.getStockAdjustmentsDetail(id: id);
  }

  @override
  Future deleteStockAdjustment({required int id}) {
    return _client!.deleteStockAdjustment(id: id);
  }

  // stock transfer
  @override
  Future<StockTransfersResponse> getStockTransfers() {
    return _client!.getStockTransfers();
  }

  @override
  Future<StockTransfersDetailResponse> getStockTransferDetail(
      {required int id}) {
    return _client!.getStockTransferDetail(id: id);
  }

  @override
  Future deleteStockTransfer({required int id}) {
    return _client!.deleteStockTransfer(id: id);
  }

  @override
  Future<AddExpenseCategoryResponse> addExpenseCateogry(
      {required AddExpenseCategoryRequest request}) {
    return _client!.addExpenseCateogry(request: request);
  }

  @override
  Future<SuccessResponse> updateLogo({File? file}) {
    return _client!.updateLogo(file: file);
  }

  @override
  Future<TaxResponse> getTax() {
    return _client!.getTax();
  }
  
  @override
  Future<GetProfitDayRp> getProfitDay({String? startDate, String? endDate}) {
    return _client!.getProfitDay(startDate: startDate, endDate: endDate);
  }
  
  @override
  Future<ReportStockResponse> getReportStockManage() {
    return _client!.getReportStockManage();
  }
}
