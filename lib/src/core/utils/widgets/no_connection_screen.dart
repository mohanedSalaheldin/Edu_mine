import 'package:e_learning/src/features/home/presentation/pages/home_layout.dart';
import 'package:flutter/material.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({
    super.key,
  });
  // final String txt;

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
              image: AssetImage('assets/images/no_connection.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'No internet connection, check your settings.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 22,
                  ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeLayoutScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.refresh,
              // color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
