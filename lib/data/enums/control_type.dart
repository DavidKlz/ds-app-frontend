enum ControlType {
  textField(1),
  textArea(2),
  calendar(3),
  dropdown(4),
  checkbox(5),
  radio(6);

  final int id;

  const ControlType(this.id);

  int getIndex() => id;
}
