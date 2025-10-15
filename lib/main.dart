import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_new/marketa_blocs.dart';
import 'package:marketa_new/marketa_observer.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  //await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('appBox'); // Open a box (like a storage container)

  Bloc.observer = const MarketaObserver();
  runApp(const MarketaBlocs());
}
