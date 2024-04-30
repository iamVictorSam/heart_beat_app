import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:heart_beat_app/helpers/constants.dart';
import 'package:heart_bpm/chart.dart';
import 'package:heart_bpm/heart_bpm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SensorValue> data = [];
  List<SensorValue> bpmValues = [];
  //  Widget chart = BPMChart(data);

  bool isBPMEnabled = false;
  Widget? dialog;
  double _progress = 0.0; // Track progress (0.0 to 1.0)
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _progress += 0.0067; // Increment progress by 1/15 every 50ms
        if (_progress >= 1.0) {
          _timer?.cancel(); // Stop timer when progress reaches 1.0
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: const Text('Heart BPM Demo'),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isBPMEnabled
              ? dialog = HeartBPMDialog(
                  context: context,
                  showTextValues: true,
                  alpha: 1,
                  borderRadius: 100,
                  sampleDelay: 5000 ~/ 70,
                  onRawData: (value) {
                    setState(() {
                      if (data.length >= 100) data.removeAt(0);
                      data.add(value);
                    });
                    // chart = BPMChart(data);
                  },
                  onBPM: (value) => setState(() {
                    if (bpmValues.length >= 100) bpmValues.removeAt(0);
                    bpmValues.add(SensorValue(
                        value: value.toDouble(), time: DateTime.now()));
                  }),
                  // sampleDelay: 1000 ~/ 20,
                  // child: Container(
                  //   height: 50,
                  //   width: 100,
                  //   child: BPMChart(data),
                  // ),
                )
              : const SizedBox(),
          isBPMEnabled && data.isNotEmpty
              ? Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: 180,
                  child: BPMChart(data),
                )
              : const SizedBox(),
          isBPMEnabled && bpmValues.isNotEmpty
              ? Container(
                  decoration: BoxDecoration(border: Border.all()),
                  constraints: const BoxConstraints.expand(height: 180),
                  child: BPMChart(bpmValues),
                )
              : const SizedBox(),
          // Center(
          //   child: ElevatedButton.icon(
          //     icon: const Icon(Icons.favorite_rounded),
          //     label: Text(isBPMEnabled ? "Stop measurement" : "Measure BPM"),
          // onPressed: () => setState(() {
          //   if (isBPMEnabled) {
          //     isBPMEnabled = false;
          //     // dialog.
          //   } else {
          //     isBPMEnabled = true;
          //   }
          // }),
          //   ),
          // ),
          Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: CircularProgressIndicator(
                value: _progress, // Set progress value
                backgroundColor: kWhite,
                color: kPrimary,
              ),
            ),
          ),
          Visibility(
            visible: isBPMEnabled,
            child: GestureDetector(
              onTap: () => setState(() {
                if (isBPMEnabled) {
                  isBPMEnabled = false;
                  // dialog.
                } else {
                  isBPMEnabled = true;
                }
              }),
              child: Stack(
                children: [
                  SpinKitRipple(
                    itemBuilder: (_, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                            color: index.isEven ? kPrimary : kPrimaryLight,
                            borderRadius: BorderRadius.circular(200)),
                      );
                    },
                    size: 400,
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 110,
                        backgroundColor: kWhite,
                        child: CircleAvatar(
                          backgroundColor: kPrimary.withOpacity(0.9),
                          radius: 100,
                          child: Text(
                            'Tap to start!',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
