import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class MyScreenCard extends StatelessWidget {
  const MyScreenCard({
    Key? key,
    required this.value,
    required this.name,
    required this.assetImage,
    required this.unit,
    required this.trendData,
    required this.linePoint,
  }) : super(key: key);
  final double value;
  final String name;
  final String unit;
  final List<double> trendData;
  final Color linePoint;
  final AssetImage assetImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      shadowColor: Colors.white,
      elevation: 24,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 8,
                ),
                child: Sparkline(
                  data: trendData,
                  lineWidth: 1.0,
                  lineColor: Color.fromRGBO(244, 67, 54, 1),
                  averageLine: false,
                  fillMode: FillMode.below,
                  sharpCorners: false,
                  pointsMode: PointsMode.last,
                  pointSize: 10,
                  pointColor: linePoint,
                  useCubicSmoothing: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
