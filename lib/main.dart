import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'layout/cubit/app-cubit.dart';
import 'module/loginScreen/loginScreen.dart';
import 'network/local/cashHelper.dart';
import 'network/remote/dioHelper.dart';
import 'observer.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  HttpOverrides.global = MyHttpOverrides();

  SharedPreferences.setMockInitialValues({});

  await CashHelper.init();
  DioHelper.init();

  return runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context)=> AppCubit()..getAllAlbumes() ) ,
      ],
      child: MaterialApp(
         debugShowCheckedModeBanner:  false ,
        title: 'Album App',
        home: LoginScreen() ,

      ),
    );
  }
}



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}