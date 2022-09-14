import 'dart:ui';

import 'package:swagger_exam/pages/home_page/helper/months.dart';
import 'package:swagger_exam/pages/home_page/view_model/home_page_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

import '../../../models/combo_box_model.dart';

class SalesGraphic extends StatefulWidget {
  SalesGraphic({Key? key}) : super(key: key);
  @override
  State<SalesGraphic> createState() => _SalesGraphicState();
}

class _SalesGraphicState extends State<SalesGraphic> {
  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('sales build');
    return SizedBox(
      height: 450,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        //title: ChartTitle(text: widget.dropDownValue!.maladi!),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            labelFormat: '{value}',
            majorTickLines: const MajorTickLines(size: 0)),
        series: _getDefaultColumnSeries(),
        tooltipBehavior: _tooltipBehavior,
      ),
    );
  }
}

List<ColumnSeries<_SalesData, String>> _getDefaultColumnSeries() {
  print('object');
  List<_SalesData> dataSource = [];
  HomePageViewModel.instance.SalesDatas!.forEach((key, value) {
    dataSource.add(_SalesData(key, value));
  });

  // for (var i = 0; i < HomePageViewModel.instance.SalesDatas!.length; i++) {
  //   dataSource.add(
  //       _SalesData(HomePageViewModel.instance.SalesDatas![i].toString(), 2.1));
  // }
  HomePageViewModel.instance.SalesDatas;
  return <ColumnSeries<_SalesData, String>>[
    ColumnSeries<_SalesData, String>(
      dataSource: dataSource,
      // <_SalesData>[
      //   _SalesData('Ocak', 0.541),
      //   _SalesData('Şubat', 0.818),
      //   _SalesData('Mart', 1.51),
      //   _SalesData('Nisan', 1.302),
      //   _SalesData('Mayıs', 2.017),
      //   _SalesData('Haziran', 1.683),
      //   _SalesData('Temmuz', 1.683),
      //   _SalesData('Ağustos', 1.683),
      //   _SalesData('Eylül', 1.683),
      //   _SalesData('Ekim', 1.683),
      //   _SalesData('Kasım', 1.683),
      //   _SalesData('Aralık', 1.683),
      // ],
      xValueMapper: (_SalesData sales, _) => sales.x,
      yValueMapper: (_SalesData sales, _) => sales.y,
      dataLabelSettings: const DataLabelSettings(
          isVisible: true, textStyle: TextStyle(fontSize: 10)),
    )
  ];
}

class _SalesData {
  final String x;
  final double y;

  _SalesData(this.x, this.y);
}
