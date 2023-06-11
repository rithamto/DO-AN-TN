import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:di4l_pos/common/helpers.dart';
import 'package:di4l_pos/common/ui_helpers.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/common/storage/app_prefs.dart';
import 'package:di4l_pos/models/business_location/response/business_location.dart';
import 'package:di4l_pos/models/user/request/account_request.dart';
import 'package:di4l_pos/models/user/response/account_response.dart';
import 'package:di4l_pos/repositories/data_repository.dart';
import 'package:di4l_pos/route_generator.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

part 'business_state.dart';
part 'business_cubit.freezed.dart';

class BusinessCubit extends Cubit<BusinessState> {
  /// MARK: - Initials;
  final _dataRepository = getIt<DataRepository>();
  final _appPrefs = getIt<AppPref>();

  BusinessCubit() : super(const BusinessState.initial(data: BusinessData()));

  /// Get Units
  Future<BusinessLocation?> getBusinesss() async {
    try {
      final businessResponse = await _dataRepository.getBusinessLocation();
      emit(BusinessState.getBusinesss(
          data: state.data?.copyWith(
        businesss: businessResponse.data ?? [],
        business: businessResponse.data?.first,
      )));
      return businessResponse.data?.first;
    } catch (error) {
      debugPrint('Get Business  Error: $error');
      await navigator!.pushNamed(RouteGenerator.loginScreen);
      Helpers.handleErrorApp(error: error);
      return null;
    } finally {
      UIHelpers.dismissLoading();
      // return null;
    }
  }

  /// Refresh List Contact
  Future<void> refreshtBusinesss({BusinessLocation? business}) async {
    List<BusinessLocation> businesss = [...state.data!.businesss];
    final index = businesss.indexWhere((element) => element.id == business?.id);
    if (index != -1) {
      businesss[index] = business!;
      emit(BusinessState.getBusinesss(
          data: state.data?.copyWith(businesss: businesss)));
    }
  }

  void getBusiness(BusinessLocation business) {
    emit(BusinessState.getBusiness(
        data: state.data?.copyWith(business: business)));
  }

  Future<void> getAccounts() async {
    try {
      final accounts = await _dataRepository.switchAccount();
      emit(BusinessState.getAccounts(
          data: state.data?.copyWith(accounts: accounts.data ?? [])));
    } catch (error) {
      debugPrint('Switch Account Error: $error');
      await navigator!.pushNamed(RouteGenerator.loginScreen);
      Helpers.handleErrorApp(error: error, isShowDialog: true);
    } finally {
      UIHelpers.dismissLoading();
    }
  }

  void changedAccount() async {
    try {
      await _appPrefs.changedAccount();
      navigator!.pushNamedAndRemoveUntil(
          RouteGenerator.switchAccount, (route) => false);
    } catch (error) {
      debugPrint('Changed Account Error: $error');
    } finally {
      UIHelpers.dismissLoading();
    }
  }

  Future<void> postSwitchAccount({required int id}) async {
    try {
      final request = AccountRequest(userId: id);
      final tokenResponse =
          await _dataRepository.postSwitchAccount(request: request);

      /// Save Token
      await _appPrefs.saveToken(tokenJson: tokenResponse.toRawJson());

      /// Save Business
      final businessResponse = await _dataRepository.getBusinessLocation();
      await _appPrefs.saveBusiness(
          business: businessResponse.data!.first.toRawJson());

      /// Loged In
      final userResponse = await _dataRepository.loggedIn();
      await _appPrefs.saveUser(userJson: userResponse.toRawJson());

      /// Go To Home Screen
      navigator!
          .pushNamedAndRemoveUntil(RouteGenerator.mainScreen, (route) => false);
    } catch (error) {
      debugPrint('Switch Account Error: $error');
      Helpers.handleErrorApp(error: error, isShowDialog: true);
    } finally {
      UIHelpers.dismissLoading();
    }
  }

  Future<void> delete(int id) async {
    if (id != 11) {
      UIHelpers.showCustomDialog(
        context: Get.context!,
        message: 'business_confirm_delete'.tr,
        onComfirm: () async {
          try {
            await _dataRepository.deleteBusiness(id: id);
            await _appPrefs.logout();
            await navigator!.pushNamedAndRemoveUntil(
                RouteGenerator.loginScreen, ((route) => false));
          } catch (error) {
            debugPrint('Delete Account Error: $error');
          } finally {
            Future.delayed(const Duration(seconds: 2), () => navigator!.pop());
          }
        },
        isShowClose: true,
      );
    } else {}
  }
}
