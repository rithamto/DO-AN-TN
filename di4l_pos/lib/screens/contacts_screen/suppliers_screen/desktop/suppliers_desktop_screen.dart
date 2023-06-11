import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/screens/contacts_screen/suppliers_screen/cubit/suppliers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String name;

  /// Designation of an employee.
  final String designation;

  /// Salary of an employee.
  final int salary;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}

class SuppliersDesktopScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<SuppliersCubit> provider() {
    return BlocProvider(
      create: (context) => SuppliersCubit(),
      child: const SuppliersDesktopScreen(),
    );
  }

  const SuppliersDesktopScreen({Key? key}) : super(key: key);

  @override
  State<SuppliersDesktopScreen> createState() => _SuppliersDesktopScreenState();
}

class _SuppliersDesktopScreenState extends State<SuppliersDesktopScreen>
    with AfterLayoutMixin {
  /// MARK: - Initials;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<SuppliersCubit>().getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfDataGrid(
        source: EmployeeDataSource(employeeData: getEmployeeData()),
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'id',
              label: Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'ID',
                  ))),
          GridColumn(
              columnName: 'name',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text('Name'))),
          GridColumn(
              columnName: 'designation',
              label: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    'Designation',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
            columnName: 'salary',
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('Salary'),
            ),
          ),
        ],
      ),
      // body: Container(
      //   margin: const EdgeInsets.all(8.0),
      //   padding: const EdgeInsets.all(8.0),
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //       width: 1.0,
      //       color: GlobalColors.borderWebColor,
      //     ),
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8.0),
      //     ),
      //   ),
      //   child: Column(
      //     children: [
      //       ListTile(
      //         onTap: null,
      //         leading: null,
      //         title: Row(
      //           children: <Widget>[
      //             Expanded(
      //               child: Text(
      //                 "supplier_name".tr.toUpperCase(),
      //                 style: GlobalStyles.boldStyle.copyWith(fontSize: 17),
      //               ),
      //             ),
      //             Expanded(
      //               child: Text(
      //                 "supplier_phone".tr.toUpperCase(),
      //                 style: GlobalStyles.boldStyle.copyWith(fontSize: 17),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       const Divider(height: 1, color: GlobalColors.borderWebColor),
      //       Expanded(
      //         child: BlocBuilder<SuppliersCubit, SuppliersState>(
      //           builder: (context, state) {
      //             final _suppliers = state.data?.suppliers ?? [];
      //             return ListView.separated(
      //               itemBuilder: (context, index) {
      //                 return ListTile(
      //                   onTap: null,
      //                   leading: null,
      //                   title: Row(
      //                     children: <Widget>[
      //                       Expanded(child: Text("First Name")),
      //                       Expanded(child: Text("Last Name")),
      //                     ],
      //                   ),
      //                 );
      //               },
      //               separatorBuilder: (context, index) {
      //                 return const Divider(
      //                     height: 1, color: GlobalColors.borderWebColor);
      //               },
      //               itemCount: 100,
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000)
    ];
  }
}
