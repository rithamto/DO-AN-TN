import 'package:di4l_pos/screens/products_screen/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SortFilterButtons extends StatefulWidget {
  const SortFilterButtons({Key? key}) : super(key: key);

  @override
  _SortFilterButtonsState createState() => _SortFilterButtonsState();
}

class _SortFilterButtonsState extends State<SortFilterButtons> {
  int sortOrder = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              // Action when "Giá trị" button is pressed
            },
            child: Row(
              children: const [
                Text(
                  'Giá trị',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  FontAwesomeIcons.sortAmountDown,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
          TextButton(
            onPressed: () {
              // setState(() {
              //   // Toggle the sorting order
              //   sortOrder = (sortOrder + 1) % 2;
              // });
              // // Trigger sorting action in the ProductsInStock widget
              // context.read<ProductsCubit>().sortProductsByQuantity(sortOrder);
            },
            child: Row(
              children: [
                Text(
                  'Số lượng',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  sortOrder == 0
                      ? FontAwesomeIcons.sortNumericDown
                      : FontAwesomeIcons.sortNumericUp,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.black,
            thickness: 1,
          ),
          TextButton(
            onPressed: () {
              // Action when "Từ A -> Z" button is pressed
            },
            child: Row(
              children: const [
                Text(
                  'Từ A -> Z',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  FontAwesomeIcons.sortAlphaDown,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
