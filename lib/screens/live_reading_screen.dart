import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/fap_progress_bar.dart';

class LiveReadingScreen extends StatefulWidget {
  const LiveReadingScreen({Key? key}) : super(key: key);

  @override
  State<LiveReadingScreen> createState() => _SmartScreenState();
}

class _SmartScreenState extends State<LiveReadingScreen> {
  List<double>? tempList;
  final databaseRef = FirebaseDatabase.instance.ref().child("VariableResistor");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          title: const Text("Live Reading"),
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
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: ProgressBar(
                    value: valued1.round().toDouble(),
                    unit: "%",
                    progressColor: Colors.lightBlue,
                    changeProgressColor: Colors.redAccent,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
