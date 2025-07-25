import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:resturant_app/core/utiles/7.1%20bloc_observer.dart';
import 'package:resturant_app/core/utiles/Constans.dart';
import 'package:resturant_app/core/utiles/shared_pref/shared_pref.dart';
import 'package:resturant_app/features/home/card/presentation/data/hiveCard.dart';
import 'package:resturant_app/features/home/search/data/local/hiveSearch.dart';
import 'package:resturant_app/firebase_options.dart';
import 'package:resturant_app/resturant.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Gemini.init(apiKey: 'AIzaSyCt_TxBiw4ZIdCxwUsacQ02LkETOFWx2y4');
  await SharedPref.preferences.instantiatePreferences();
  Hive.registerAdapter(SearchModelAdapter());
  await Hive.openBox<SearchModel>(Constans.hiveSearch);
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>(Constans.hiveCart);
  Bloc.observer = AppBlocObserver();
  runApp(const Resturant());
}
