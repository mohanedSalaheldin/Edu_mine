import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SpinKitWave(
            color: Colors.black,
            size: 50.0,
            // controller: AnimationController(
            //     vsync: this, duration: const Duration(milliseconds: 1200)),
          ),
        ),
      ),
    );
  }
}
