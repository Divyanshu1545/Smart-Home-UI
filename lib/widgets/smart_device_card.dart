import 'dart:math';

import 'package:assignment/screens/ac_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final String iconPath;
  final bool powerOn;
  final void Function(bool)? onChanged;
  SmartDeviceBox(
      {super.key,
      required this.deviceName,
      required this.iconPath,
      required this.powerOn,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AcScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: powerOn ? Colors.grey[900] : Color.fromARGB(44, 164, 167, 189),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // icon
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  iconPath,
                  height: 50,
                  color: powerOn ? Colors.white : Colors.grey.shade700,
                ),
              ),

              // smart device name + switch
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        deviceName,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: powerOn ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 3 * pi / 2,
                    child: CupertinoSwitch(
                      activeColor: Colors.white,
                      thumbColor: powerOn ? Colors.black : Colors.white,
                      value: powerOn,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
