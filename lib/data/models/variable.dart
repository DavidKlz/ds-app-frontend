// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../enums/control_type.dart';
import '../enums/data_type.dart';

class Variable {
  String id;
  bool isRequired;
  bool isEditable;
  String name;
  List<String> values;
  ControlType controlType;
  DataType dataType;

  Variable({
    required this.id,
    required this.isRequired,
    required this.isEditable,
    required this.name,
    required this.values,
    required this.controlType,
    required this.dataType,
  });

  factory Variable.empty() {
    return Variable(
      id: "",
      isEditable: false,
      isRequired: false,
      name: "",
      values: [],
      controlType: ControlType.textField,
      dataType: DataType.text,
    );
  }

  Variable copyWith({
    String? id,
    bool? isRequired,
    bool? isEditable,
    String? name,
    List<String>? values,
    ControlType? controlType,
    DataType? dataType,
  }) {
    return Variable(
      id: id ?? this.id,
      isRequired: isRequired ?? this.isRequired,
      isEditable: isEditable ?? this.isEditable,
      name: name ?? this.name,
      values: values ?? this.values,
      controlType: controlType ?? this.controlType,
      dataType: dataType ?? this.dataType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isRequired': isRequired,
      'isEditable': isEditable,
      'name': name,
      'values': values,
      'controlTypeId': controlType.id,
      'dataTypeId': dataType.id,
    };
  }

  factory Variable.fromMap(Map<String, dynamic> map) {
    return Variable(
      id: map['id'] as String,
      isRequired: map['required'] as bool,
      isEditable: map['editable'] as bool,
      name: map['name'] as String,
      values: List<String>.from((map['values'] as List<dynamic>).map<String>(
        (x) => x.toString(),
      )),
      controlType: ControlType.ofIndex(map['controlTypeId'] as int),
      dataType: DataType.ofIndex(map['dataTypeId'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Variable.fromJson(String source) =>
      Variable.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Variable(id: $id, isRequired: $isRequired, isEditable: $isEditable, name: $name, values: $values, controlType: $controlType, dataType: $dataType)';
  }

  @override
  bool operator ==(covariant Variable other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.isRequired == isRequired &&
        other.isEditable == isEditable &&
        other.name == name &&
        listEquals(other.values, values) &&
        other.controlType == controlType &&
        other.dataType == dataType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        isRequired.hashCode ^
        isEditable.hashCode ^
        name.hashCode ^
        values.hashCode ^
        controlType.hashCode ^
        dataType.hashCode;
  }
}
