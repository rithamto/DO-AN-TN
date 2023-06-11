import 'package:di4l_pos/models/revenue_expense/request/add_expense_category.dart';
import 'package:di4l_pos/models/revenue_expense/request/add_expense_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:di4l_pos/common/helpers.dart';
import 'package:di4l_pos/common/ui_helpers.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/revenue_expense/response/expense_category_response.dart';
import 'package:di4l_pos/models/revenue_expense/response/expense_response.dart';
import 'package:di4l_pos/repositories/data_repository.dart';
import 'package:tiengviet/tiengviet.dart';

part 'expense_cubit.freezed.dart';
part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(const ExpenseState.initial(ExpenseStateData()));
  final _dataRepository = getIt<DataRepository>();

  Future<void> getExpenses() async {
    try {
      final reponse = await _dataRepository.getExpenses();
      emit(Expenses(state.data?.copyWith(
        expenses: reponse.data ?? [],
      )));
      if (state.data!.expenses.isNotEmpty) {
        double due = calculateTotalFinalTotalByPaymentStatus(
            state.data!.expenses, 'due');
        double paid = calculateTotalFinalTotalByPaymentStatus(
            state.data!.expenses, 'paid');
        emit(TotalExpense(state.data?.copyWith(totalExpense: due)));
        emit(TotalRevenue(state.data?.copyWith(totalRevenue: paid)));
      }
    } catch (error) {
      Helpers.handleErrorApp(error: error);
    } finally {
      UIHelpers.dismissLoading();
    }
  }

  Future<void> getExpenseCategories() async {
    try {
      final response = await _dataRepository.getExpenseCateogries();
      emit(Categories(state.data!.copyWith(
        categories: response.data ?? [],
        categoriesOriginal: response.data ?? [],
      )));
    } catch (error) {
      Helpers.handleErrorApp(error: error);
    }
  }

  ///Search Product
  Future<void> searchExpenseCategory({required String searchText}) async {
    List<ExpenseCategory> categoryOriginal = [
      ...state.data!.categoriesOriginal
    ];
    if (searchText.isEmpty) {
      emit(Categories(state.data?.copyWith(categories: categoryOriginal)));
    } else {
      final searchTextVN = TiengViet.parse(searchText.toLowerCase());
      final categories = categoryOriginal
          .where((ExpenseCategory element) =>
              element.name!.toLowerCase().contains(searchTextVN))
          .toList();
      emit(Categories(state.data?.copyWith(categories: categories)));
    }
  }

  Future<void> addExpenseCateogory({
    required String name,
    required String code,
  }) async {
    try {
      final request = AddExpenseCategoryRequest(name: name, code: code);
      final response =
          await _dataRepository.addExpenseCateogry(request: request);
      if (response.data != null) {}
    } catch (error) {
      Helpers.handleErrorApp(error: error);
    }
  }

  Future<void> addExpense({
    required int? locationId,
    required String? finalTotal,
    required int? expenseCategoryId,
    required String? refNo,
    required String? transactionDate,
    required int? expenseFor,
    required int? contactId,
    required int? taxId,
    required String? additionalNotes,
  }) async {
    try {
      final request = AddExpenseRequest(
        locationId: locationId,
        finalTotal: finalTotal,
        expenseCategoryId: expenseCategoryId,
        expenseSubCagegoryId: null,
        refNo: '',
        transactionDate: transactionDate,
        expenseFor: expenseFor,
        contactId: contactId,
        taxId: taxId,
        additionalNotes: additionalNotes,
      );
      final response = await _dataRepository.addExpense(request: request);
      if (response.data != null) {}
    } catch (error) {
      Helpers.handleErrorApp(error: error);
    }
  }

  double calculateTotalFinalTotalByPaymentStatus(
      List<Expense> expenses, String paymentStatus) {
    return expenses
        .where((expense) => expense.paymentStatus == paymentStatus)
        .map((expense) => double.tryParse(expense.finalTotal ?? '0') ?? 0)
        .fold(0, (previousValue, element) => previousValue + element);
  }
}
