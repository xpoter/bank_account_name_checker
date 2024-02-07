import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedItem = "".obs;

  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }
}

class DropDownFancy extends StatelessWidget {
  final List<String> items;

  DropDownFancy({super.key, required this.items});

  final DropdownController controller = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: DropdownButtonFormField(
        items: items
            .map((item) =>
            DropdownMenuItem<String>(value: item, child: SizedBox(width: 250, child: Text(item, style: TextStyle(fontSize: 14),),)))
            .toList(),
        onChanged: (value) {
          controller.selectedItem.value = value!;
        },
        decoration: InputDecoration(
          labelText: 'Select an option',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
