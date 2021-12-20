import 'dart:convert';
import 'package:flutter/services.dart';
import '../api_models/month_year_data.dart';

class Helper {
  Future<List> getDailyData() async {
    var data = await rootBundle.loadString("json_files/1day.json");
    List dataList = jsonDecode(data)["bars"];
    return dataList;
  }

  Future<List> getWeeklyData() async {
    var data = await rootBundle.loadString("json_files/1week.json");
    List dataList = jsonDecode(data)["bars"];
    return dataList;
  }

  Future<List> getOneYearData() async {
    var data = await rootBundle.loadString("json_files/1year.json");
    List dataList = jsonDecode(data)["bars"];
    return dataList;
  }

  Future<List<YearlyResult>> getFiveYearData() async {
    var data = await rootBundle.loadString("json_files/5years.json");
    List<YearlyResult> dataList = jsonDecode(data)["bars"];
    return dataList;
  }
}
