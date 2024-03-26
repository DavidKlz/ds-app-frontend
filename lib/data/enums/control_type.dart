import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data_type.dart';

enum ControlType {
  textField(1, "Textfeld", [DataType.text, DataType.number]),
  textArea(2, "Mehrzeiliges Textfeld", [DataType.text]),
  calendar(3, "Kalendar", [DataType.date]),
  dropdown(4, "Auswahlliste", [DataType.selection, DataType.multiselection]),
  checkbox(5, "Checkbox", [DataType.boolean]),
  radio(6, "Radio-Gruppe", [DataType.selection]);

  final int id;

  final String displayName;

  final List<DataType> allowedDataTypes;

  const ControlType(this.id, this.displayName, this.allowedDataTypes);

  int getIndex() => id;

  static ControlType ofIndex(int id) {
    return ControlType.values.firstWhere((element) => element.id == id);
  }

  Widget create({
    required String label,
    required DataType type,
    List<String>? values,
    Function(String)? onValueChanged,
  }) {
    switch (this) {
      case ControlType.textField:
        return TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
          ),
          keyboardType: type == DataType.number
              ? TextInputType.number
              : TextInputType.text,
          inputFormatters: type == DataType.number
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : null,
          maxLines: 1,
        );
      case ControlType.textArea:
        return TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
          ),
          keyboardType: type == DataType.number
              ? TextInputType.number
              : TextInputType.text,
          maxLines: 8,
          inputFormatters: type == DataType.number
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : null,
        );
      case ControlType.calendar:
        return DatePickerDialog(
          firstDate: DateTime(2024),
          lastDate: DateTime(2024),
          fieldLabelText: label,
        );
      case ControlType.dropdown:
        return Row(
          children: [
            Text(label),
            const SizedBox(width: 10),
            DropdownMenu(
              inputDecorationTheme: const InputDecorationTheme(
                border: OutlineInputBorder(),
              ),
              dropdownMenuEntries: values!
                  .map((e) => DropdownMenuEntry(value: e, label: e))
                  .toList(),
            ),
          ],
        );
      case ControlType.checkbox:
        return Row(
          children: [
            Text(label),
            const SizedBox(width: 10),
            Checkbox(value: false, onChanged: (event) {}),
          ],
        );
      case ControlType.radio:
        String groupValue = "";
        return Column(
          children: [
            Text(label),
            const SizedBox(height: 5),
            Row(
                children: values!
                    .map(
                      (e) => Row(
                        children: [
                          Text(e),
                          const SizedBox(width: 10),
                          Radio(
                              value: e,
                              groupValue: groupValue,
                              onChanged: (event) {
                                groupValue = event ?? groupValue;
                                if (onValueChanged != null) {
                                  onValueChanged.call(event ?? groupValue);
                                }
                              }),
                        ],
                      ),
                    )
                    .toList()),
          ],
        );
    }
  }
}
