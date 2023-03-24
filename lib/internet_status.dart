import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  String welcomeMessage = "";
  String internetStatus = "";

  @override
  void initState() {
    super.initState();
    updateWelcomeMessage();
    updateInternetStatus();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        updateInternetStatus();
      });
    });
  }

  Future<void> updateWelcomeMessage() async {
    var now = DateTime.now();
    var hour = now.hour;
    if (hour < 12) {
      setState(() {
        Text(welcomeMessage = "Good morning");
      });
    } else if (hour < 16) {
      setState(() {
        Text(welcomeMessage = "Good Afternoon");
      });
    } else {
      setState(() {
        Text(welcomeMessage = "Good Evening");
      });
    }
  }

  Future<void> updateInternetStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        internetStatus = "Online";
      });
    } else {
      setState(() {
        internetStatus = "Offline";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              welcomeMessage,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              internetStatus,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
