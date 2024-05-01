import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:heart_beat_app/helpers/constants.dart';
import 'package:heart_beat_app/helpers/functions.dart';
import 'package:heart_beat_app/rate_details/rate_details.dart';
import 'package:heart_bpm/heart_bpm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SensorValue> data = [];
  List<SensorValue> bpmValues = [];
  List<int> heartRate = [];
  //  Widget chart = BPMChart(data);

  bool isBPMEnabled = false;
  Widget? dialog;
  double _progress = 0.0; // Track progress (0.0 to 1.0)
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        _progress += 0.0009; // Increment progress by 1/15 every 50ms
        if (_progress >= 1.0) {
          _timer?.cancel(); // Stop timer when progress reaches 1.0
          isBPMEnabled = false;
          _progress = 0;
          double sumValue = heartRate.fold(
              0, (previousValue, element) => previousValue + element);
          double averageValue = sumValue / heartRate.length;
          List<int> highestAndLowest = getHighestAndLowest(heartRate);

          Get.to(() => RateDetails(
                averageValue: averageValue,
                highestValue: highestAndLowest[0],
                lowestValue: highestAndLowest[1],
                date: DateTime.now(),
              ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Heart BPM'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // isBPMEnabled && data.isNotEmpty
          //     ? Container(
          //         decoration: BoxDecoration(border: Border.all()),
          //         height: 180,
          //         child: BPMChart(data),
          //       )
          //     : const SizedBox(),
          // isBPMEnabled && bpmValues.isNotEmpty
          //     ? Container(
          //         decoration: BoxDecoration(border: Border.all()),
          //         constraints: const BoxConstraints.expand(height: 180),
          //         child: BPMChart(bpmValues),
          //       )
          //     : const SizedBox(),
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
          Visibility(
            visible: isBPMEnabled,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: HeartBPMDialog(
                    context: context,
                    showTextValues: false,
                    // alpha: 1 ,
                    cameraWidgetWidth: 200,
                    cameraWidgetHeight: 200,
                    borderRadius: 300,
                    // sampleDelay: 800,
                    onRawData: (value) {
                      setState(() {
                        if (data.length >= 100) data.removeAt(0);
                        data.add(value);
                      });
                      // chart = BPMChart(data);
                    },
                    onBPM: (value) => setState(() {
                      heartRate.add(value);
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
                  ),
                ),
                // const Positioned(
                //   bottom: -20,
                //   right: 0,
                //   left: 0,
                //   child: Center(
                //       child: Text(
                //     'Place index finger on rear camera',
                //     style: TextStyle(),
                //   )),
                // ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator(
                        value: _progress, // Set progress value
                        backgroundColor: kWhite,
                        color: kPrimary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          10.verticalSpace,
          Visibility(
            visible: isBPMEnabled,
            child: const Center(
                child: Text(
              'Place index finger on rear camera',
              style: TextStyle(),
            )),
          ),
          Visibility(
            visible: !isBPMEnabled,
            child: GestureDetector(
              onTap: () {
                _startTimer();
                setState(() {
                  if (isBPMEnabled) {
                    isBPMEnabled = false;
                    // dialog.
                  } else {
                    isBPMEnabled = true;
                  }
                });
              },
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
                    size: 300,
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: kWhite,
                        child: CircleAvatar(
                          backgroundColor: kPrimary.withOpacity(0.9),
                          radius: 90,
                          child: Text(
                            'Tap to start!',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: kWhite,
                            ),
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
