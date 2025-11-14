import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/helpers/bloc_observer.dart';
import 'package:hungry/core/services/get_it_service.dart';
import 'package:hungry/hungry_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetItService();
  Bloc.observer = MyBlocObserver();
  runApp(const HungryApp());
}
