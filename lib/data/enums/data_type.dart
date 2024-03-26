enum DataType {
  text(1, "Text"),
  number(2, "Zahl"),
  date(3, "Datum"),
  boolean(4, "Boolean"),
  selection(5, "Einzel Auswahl"),
  multiselection(6, "Mehrfach Auswahl");

  final int id;

  final String displayName;

  const DataType(this.id, this.displayName);

  int getIndex() => id;

  static DataType ofIndex(int id) {
    return DataType.values.firstWhere((element) => element.id == id);
  }

  bool isAuswahl() => id == 5 || id == 6;
}
