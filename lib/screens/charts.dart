import 'package:demo_avesoft/api_models/month_year_data.dart';
import 'package:demo_avesoft/firebase/auth_controller.dart';
import 'package:demo_avesoft/helper/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatefulWidget {
  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late List<SalesData> _chartData;
  Helper _helper = new Helper();
  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(year: 2017, sales: 25),
      SalesData(year: 2018, sales: 20),
      SalesData(year: 2019, sales: 17),
      SalesData(year: 2020, sales: 50),
      SalesData(year: 2021, sales: 40),
    ];
    return chartData;
  }

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text("Charts"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                AuthController.instance.logout();
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: SfCartesianChart(
          series: <ChartSeries>[
            LineSeries<SalesData, double>(
                dataSource: getChartData(),
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,)
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData({required this.year, required this.sales});
  final double year;
  final double sales;
}
