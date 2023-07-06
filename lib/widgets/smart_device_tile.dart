import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceTile extends StatelessWidget {
  final String deviceName;
  final bool isConnected;
  final bool powerOn;
  final int connections;
  final String iconPath;
  final void Function(bool)? onChanged;

  const SmartDeviceTile(
      {super.key,
      required this.deviceName,
      required this.isConnected,
      required this.powerOn,
      required this.connections,
      required this.iconPath,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      //Column for elements and line
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 110,
                      decoration: BoxDecoration(
                          color: isConnected ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 15),
                        child: connections == 0
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    iconPath,
                                    height: 50,
                                    width: 45,
                                    color: !isConnected
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Image.asset(
                                    iconPath,
                                    height: 50,
                                    width: 45,
                                    color: !isConnected
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    connections.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 24,
                                      color: !isConnected
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isConnected ? "Connected" : "Not Connected",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.grey[500]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      deviceName,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Living Room",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Bed Room",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                CupertinoSwitch(
                  value: powerOn,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[350],
            thickness: 3,
          )
        ],
      ),
    );
  }
}
