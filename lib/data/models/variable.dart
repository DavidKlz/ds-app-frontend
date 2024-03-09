// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Variable {
  String? id;
  bool? isRequired;
  bool? isEditable;
  String? name;
  int? controlTypeId;
  int? dataTypeId;

  Variable({
    this.id,
    this.isRequired,
    this.isEditable,
    this.name,
    this.controlTypeId,
    this.dataTypeId,
  });

  Variable copyWith({
    String? id,
    bool? isRequired,
    bool? isEditable,
    String? name,
    int? controlTypeId,
    int? dataTypeId,
  }) {
    return Variable(
      id: id ?? this.id,
      isRequired: isRequired ?? this.isRequired,
      isEditable: isEditable ?? this.isEditable,
      name: name ?? this.name,
      controlTypeId: controlTypeId ?? this.controlTypeId,
      dataTypeId: dataTypeId ?? this.dataTypeId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isRequired': isRequired,
      'isEditable': isEditable,
      'name': name,
      'controlTypeId': controlTypeId,
      'dataTypeId': dataTypeId,
    };
  }

  factory Variable.fromMap(Map<String, dynamic> map) {
    return Variable(
      id: map['id'] != null ? map['id'] as String : null,
      isRequired: map['isRequired'] != null ? map['isRequired'] as bool : null,
      isEditable: map['isEditable'] != null ? map['isEditable'] as bool : null,
      name: map['name'] != null ? map['name'] as String : null,
      controlTypeId:
          map['controlTypeId'] != null ? map['controlTypeId'] as int : null,
      dataTypeId: map['dataTypeId'] != null ? map['dataTypeId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Variable.fromJson(String source) =>
      Variable.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Variable(id: $id, isRequired: $isRequired, isEditable: $isEditable, name: $name, controlTypeId: $controlTypeId, dataTypeId: $dataTypeId)';
  }

  @override
  bool operator ==(covariant Variable other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.isRequired == isRequired &&
        other.isEditable == isEditable &&
        other.name == name &&
        other.controlTypeId == controlTypeId &&
        other.dataTypeId == dataTypeId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        isRequired.hashCode ^
        isEditable.hashCode ^
        name.hashCode ^
        controlTypeId.hashCode ^
        dataTypeId.hashCode;
  }
}
