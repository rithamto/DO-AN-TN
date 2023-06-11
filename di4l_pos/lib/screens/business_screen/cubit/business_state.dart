part of 'business_cubit.dart';

@freezed
class BusinessData with _$BusinessData {
  const factory BusinessData({
    @Default([]) List<BusinessLocation> businesss,
    BusinessLocation? business,
    @Default([]) List<Account> accounts,
  }) = _BusinessData;
}

@freezed
class BusinessState with _$BusinessState {
  const factory BusinessState.initial({BusinessData? data}) = Initial;
  const factory BusinessState.getBusinesss({BusinessData? data}) = GetBusinesss;
  const factory BusinessState.getBusiness({BusinessData? data}) = GetBusiness;
  const factory BusinessState.getAccounts({BusinessData? data}) = GetAccounts;
}
