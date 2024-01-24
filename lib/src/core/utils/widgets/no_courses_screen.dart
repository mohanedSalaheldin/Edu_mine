import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NoCoursesScreen extends StatelessWidget {
  const NoCoursesScreen({super.key, required this.txt});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(),
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/no_courses.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
             txt,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    // fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
