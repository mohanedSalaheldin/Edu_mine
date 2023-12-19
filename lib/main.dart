import 'package:e_learning/app.dart';
import 'package:e_learning/bloc_observer.dart';
import 'package:e_learning/firebase_options.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'src/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const SimpleBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: HexColor('#0c1c2c'),
      statusBarBrightness: Brightness.light,
    ),
  );
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseAuth auth = FirebaseAuth.instance;
  // if (auth.currentUser != null) {
  //   debugPrint("Current user is: ${auth.currentUser}");
  // }
  runApp(const MyApp());
}
