import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime yolo = WorldTime(location: 'Makassar', flag: 'germany.png', url: 'Asia/makassar');
    await yolo.getTime();
    
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': yolo.location,
      'flag': yolo.flag,
      'time': yolo.time,
      'isDaytime': yolo.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Center(
        child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      ),
      ),
    );
  }
}
