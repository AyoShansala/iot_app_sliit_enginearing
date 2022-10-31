import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  SwitchWidget({
    Key? key,
    required this.deviceName,
    required this.deviceStatus,
    required this.deviceTag,
  }) : super(key: key);
  // final Size? size;
  // final Icon? icon;
  final String deviceName;
  late bool deviceStatus;
  final String deviceTag;
  // final String? statusOn;
  // final String? statusOff;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  final dbr = FirebaseDatabase.instance.ref();
  //bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            //isSwitched = !isSwitched;
            dbr.child(widget.deviceTag).set({
              "Status": !widget.deviceStatus,
            });
            widget.deviceStatus = !widget.deviceStatus;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 120,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19.0),
            color: Colors.grey[850],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade900,
                offset: const Offset(5.0, 5.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.grey.shade600,
                offset: const Offset(-5.0, -5.0),
                blurRadius: 15.0,
                spreadRadius: 1.5,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: Row(
                  children: [
                    Switch(
                      value: widget.deviceStatus,
                      onChanged: (value) {
                        setState(() {
                          widget.deviceStatus = value;
                          print(widget.deviceStatus);
                        });
                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.lightbulb,
                      size: 25.0,
                    )
                  ],
                ),
              ),
              Text(
                widget.deviceName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              Text(
                'Value : ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
