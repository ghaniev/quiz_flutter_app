import 'package:flutter/material.dart';
import 'package:quiz_app/shared/shared.dart';

class DropDown extends StatelessWidget {
  final List<String> list;
  final String selected;
  final Function(String? select) onSelectPress;

  const DropDown({
    Key? key,
    required this.list,
    required this.selected,
    required this.onSelectPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(
            color: kBasic,
          )),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selected,
          icon: const Icon(
            Icons.arrow_drop_down_sharp,
            color: kBasic,
          ),
          elevation: 16,
          style: const TextStyle(
              color: kBasic, fontSize: 18, fontWeight: FontWeight.bold),
          onChanged: onSelectPress,
          isExpanded: true,
          focusColor: kBasic,
          selectedItemBuilder: (BuildContext context) {
            return list.map<Widget>((String item) {
              return Align(alignment: Alignment.centerLeft, child: Text(item));
            }).toList();
          },
          menuMaxHeight: 300,
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value),
                    if (value == selected)
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                  ]),
            );
          }).toList(),
        ),
      ),
    );
  }
}
