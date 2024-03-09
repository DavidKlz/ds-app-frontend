enum DataType {
  text(1),
  number(2),
  date(3),
  bool(4),
  selection(5),
  multiselection(6);

  final int id;

  const DataType(this.id);

  int getIndex() => id;
}
