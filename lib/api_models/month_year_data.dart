class YearlyResult {
  String date;
  String close;

  YearlyResult({
    required this.date,
    required this.close,
  });

  factory YearlyResult.fromMap(Map<String, dynamic> json) => YearlyResult(
        date: json["date"],
        close: json["close"],
      );
}
