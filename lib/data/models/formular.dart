// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'variable.dart';

class Formular {
  String id;
  String name;
  List<Variable> variables;

  Formular({
    required this.id,
    required this.name,
    required this.variables,
  });

  Formular copyWith({
    String? id,
    String? name,
    List<Variable>? variables,
  }) {
    return Formular(
      id: id ?? this.id,
      name: name ?? this.name,
      variables: variables ?? this.variables,
    );
  }

  Formular copyOf(Formular form) {
    return Formular(
      id: form.id,
      name: form.name,
      variables: form.variables,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'variables': variables.map((x) => x.toMap()).toList(),
    };
  }

  factory Formular.fromMap(Map<String, dynamic> map) {
    return Formular(
      id: map['id'] as String,
      name: map['name'] as String,
      variables: List<Variable>.from(
        (map['variables'] as List<dynamic>).map<Variable>(
          (x) => Variable.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory Formular.empty() {
    return Formular(id: "", name: "", variables: []);
  }

  String toJson() => json.encode(toMap());

  factory Formular.fromJson(String source) =>
      Formular.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Formular(id: $id, name: $name, variables: $variables)';

  @override
  bool operator ==(covariant Formular other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.variables, variables);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ variables.hashCode;
}
