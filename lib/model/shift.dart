enum ShiftTime {
  morning,
  evening
}
class Shift {
  final DateTime date;
  final ShiftTime shift;
  String toran;

  Shift(this.date, this.shift, {this.toran = ""});

  static Shift fromRow(dynamic row) {
    return Shift(DateTime.fromMillisecondsSinceEpoch(row["date"]),
        row["shift"] == 0 ? ShiftTime.morning : ShiftTime.evening,
        toran: row["toran"]);
  }
}