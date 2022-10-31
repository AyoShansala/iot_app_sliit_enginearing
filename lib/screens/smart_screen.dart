import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:iot_app_ui/screens/home_screen.dart';
import 'package:iot_app_ui/widgets/drawer.dart';
import 'package:iot_app_ui/widgets/fap_progress_bar.dart';
import 'package:iot_app_ui/widgets/sensor_card.dart';

class SmartScreen extends StatefulWidget {
  const SmartScreen({Key? key}) : super(key: key);

  @override
  State<SmartScreen> createState() => _SmartScreenState();
}

class _SmartScreenState extends State<SmartScreen> {
  List<double>? tempList;
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  final databaseRef = FirebaseDatabase.instance.ref().child("VariableResistor");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: const Text("Power Prediction"),
        ),
        body: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (
            BuildContext context,
            DataSnapshot snapshot,
            Animation<double> animation,
            int index,
          ) {
            var valued1 = snapshot.value as int;
            if (tempList == null) {
              tempList = List.filled(
                5,
                valued1.toDouble(),
                growable: true,
              );
            } else {
              tempList!.add(valued1.toDouble());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 18.0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70),
                  child: MyScreenCard(
                    value: valued1.toDouble(),
                    name: "Power Consumption",
                    assetImage: AssetImage("assets/images/lightning.png"),
                    unit: " kWh",
                    trendData: tempList!,
                    linePoint: Colors.green,
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
