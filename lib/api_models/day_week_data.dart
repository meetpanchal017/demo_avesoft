class DailyModel {

  List<DailyResult> result;
  DailyModel({required this.result});

  factory DailyModel.fromMap(Map<String, dynamic> json) => DailyModel(
        result: List<DailyResult>.from(
          json["Result"].map(
            (x) => DailyResult.fromMap(x),
          ),
        ),
      );
}

class DailyResult {
  String date;
  String open;
  String close;
  String low;
  String high;
  String volume;

  DailyResult({
    required this.date,
    required this.open,
    required this.close,
    required this.low,
    required this.high,
    required this.volume,
  });

  factory DailyResult.fromMap(Map<String, dynamic> json) => DailyResult(
        date: json["date"],
        open: json["open"],
        close: json["close"],
        low: json["low"],
        high: json["high"],
        volume: json["volume"],
      );
}
