import 'package:flutter/material.dart';
import 'package:world_clock/sevecies/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime inestance = WorldTime(location: 'Berlin', flag: 'Germany.png', url: 'Europe/Berlin');
    await inestance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': inestance.location,
      'flag': inestance.flag,
      'time': inestance.time,
      'isDayTie': inestance.isDaytime,
    });
  }

  @override
  void initstate() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}
