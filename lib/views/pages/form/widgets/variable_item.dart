import 'package:flutter/material.dart';

import '../../../../data/enums/control_type.dart';
import '../../../../data/models/variable.dart';

class VariableItem extends StatefulWidget {
  final Variable variable;
  final VoidCallback onRemove;

  const VariableItem(this.variable, this.onRemove, {super.key});

  @override
  State<VariableItem> createState() => _VariableItemState();
}

class _VariableItemState extends State<VariableItem> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() => controller.text = widget.variable.name);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: widget.onRemove,
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Variablen Name",
                  ),
                  controller: controller,
                  onChanged: (value) =>
                      setState(() => widget.variable.name = value),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownMenu(
                inputDecorationTheme: const InputDecorationTheme(
                  border: OutlineInputBorder(),
                ),
                label: const Text("Controltyp"),
                dropdownMenuEntries: ControlType.values
                    .map((e) =>
                        DropdownMenuEntry(value: e, label: e.displayName))
                    .toList(),
                initialSelection: widget.variable.controlType,
                onSelected: (value) => setState(() {
                  widget.variable.controlType =
                      value ?? widget.variable.controlType;
                  widget.variable.dataType =
                      widget.variable.controlType.allowedDataTypes.first;
                }),
              ),
              DropdownMenu(
                inputDecorationTheme: const InputDecorationTheme(
                  border: OutlineInputBorder(),
                ),
                label: const Text("Datentyp"),
                dropdownMenuEntries: widget
                    .variable.controlType.allowedDataTypes
                    .map((e) =>
                        DropdownMenuEntry(value: e, label: e.displayName))
                    .toList(),
                initialSelection: widget.variable.dataType,
                onSelected: (value) => setState(() => widget.variable.dataType =
                    value ?? widget.variable.dataType),
              ),
              Row(
                children: [
                  const Text("Editierbar:"),
                  const SizedBox(width: 5),
                  Checkbox(
                    value: widget.variable.isEditable,
                    onChanged: (value) => setState(() => widget.variable
                        .isEditable = value ?? widget.variable.isEditable),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text("Pflichtfeld:"),
                  const SizedBox(width: 5),
                  Checkbox(
                    value: widget.variable.isRequired,
                    onChanged: (value) => setState(() => widget.variable
                        .isRequired = value ?? widget.variable.isRequired),
                  ),
                ],
              ),
            ],
          ),
          Visibility(
              visible: widget.variable.dataType.isAuswahl(),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: widget.variable.values
                          .map((e) => Chip(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                deleteIcon: const Icon(Icons.delete),
                                deleteIconColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                onDeleted: () => setState(
                                    () => widget.variable.values.remove(e)),
                                label: Text(
                                  e,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Listen Wert hinzufügen...",
                      ),
                      onSubmitted: (value) =>
                          setState(() => widget.variable.values.add(value)),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
