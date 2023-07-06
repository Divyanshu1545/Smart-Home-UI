import 'package:assignment/widgets/smart_device_tile.dart';
import 'package:flutter/material.dart';

class SmartDevicesScreen extends StatefulWidget {
  const SmartDevicesScreen({super.key});

  @override
  State<SmartDevicesScreen> createState() => _SmartDevicesScreenState();
}

class _SmartDevicesScreenState extends State<SmartDevicesScreen> {
  List deviceList = [
    {
      "name": "Smart TV",
      "isConnected": true,
      "connections": 2,
      "powerOn": true,
      "iconPath": "lib/icons/smart-tv.png",
    },
    {
      "name": "Smart AC",
      "isConnected": false,
      "connections": 0,
      "powerOn": false,
      "iconPath": "lib/icons/ac.png",
    },
    {
      "name": "Smart Light",
      "isConnected": false,
      "connections": 0,
      "powerOn": false,
      "iconPath": "lib/icons/lightbulb.png",
    },
    {
      "name": "Smart Fan",
      "isConnected": false,
      "connections": 0,
      "powerOn": false,
      "iconPath": "lib/icons/fan.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Devices",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Connected",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey[400]),
                ),
                const SizedBox(height: 50),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: deviceList.length,
                  itemBuilder: (context, index) {
                    return SmartDeviceTile(
                      deviceName: deviceList[index]['name'],
                      isConnected: deviceList[index]['isConnected'],
                      connections: deviceList[index]['connections'],
                      iconPath: deviceList[index]['iconPath'],
                      powerOn: deviceList[index]['powerOn'],
                      onChanged: (value) {
                        powerSwitchPressed(value, index);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void powerSwitchPressed(bool value, int index) {
    setState(() {
      if (!deviceList[index]['isConnected']) {
        deviceList[index]['powerOn'] = false;
      } else {
        deviceList[index]['powerOn'] = value;
      }
    });
  }
}
