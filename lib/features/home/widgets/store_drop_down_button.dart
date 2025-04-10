import 'package:flutter/material.dart';
import 'package:store_app/core/utils/colors.dart';

class StoreDropDownButton extends StatefulWidget {
  const StoreDropDownButton({super.key});

  @override
  _StoreDropDownButtonState createState() => _StoreDropDownButtonState();
}

class _StoreDropDownButtonState extends State<StoreDropDownButton> {
  String? selectedValue = 'XXS';
  List<String> items = ['XXS', 'XS', 'S', 'M','L','XL','XXL'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: selectedValue,
        icon: Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: TextStyle(color: AppColors.greyMain),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}