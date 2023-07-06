import 'package:assignment/screens/smart_devices_screen.dart';
import 'package:assignment/widgets/smart_device_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List myDevices = [
    ["Smart Light", "lib/icons/lightbulb.png", true],
    ["Smart Fan", "lib/icons/fan.png", false],
    ["Smart AC", "lib/icons/ac.png", true],
    ["Smart TV", "lib/icons/smart-tv.png", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'lib/icons/menu.png',
                      height: 32,
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage('lib/icons/me.jpg'),
                      radius: 20,
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Container(
                    height: 200,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset('lib/icons/home.png'),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Home",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Divyanshu Darolia",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Smart Devices",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 100));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SmartDevicesScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ))
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(25),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.25, crossAxisCount: 2),
                itemCount: myDevices.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SmartDeviceBox(
                      deviceName: myDevices[index][0],
                      iconPath: myDevices[index][1],
                      powerOn: myDevices[index][2],
                      onChanged: (value) => powerSwitchPressed(value, index),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void powerSwitchPressed(bool value, int index) {
    setState(() {
      myDevices[index][2] = value;
    });
  }
}
