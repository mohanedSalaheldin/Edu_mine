import 'package:flutter/material.dart';

import '../../../features/home/presentation/pages/home_layout.dart';

class ServerErrorScreen extends StatelessWidget {
  const ServerErrorScreen({
    super.key,
  });

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
              image: AssetImage('assets/images/server_error.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Oops, A sudden error occurred in the server. The team will fix it as soon as possible.',
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
              Icons.arrow_back_ios,
              // color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
