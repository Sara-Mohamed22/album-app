import 'dart:io';

import 'package:album_app/translation/LanguageTrans.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'module/homeScreen/homeScreen.dart';
import 'layout/cubit/app-cubit.dart';
import 'module/loginScreen/loginScreen.dart';
import 'network/local/cashHelper.dart';
import 'network/remote/dioHelper.dart';
import 'observer.dart';
import 'shared/constant.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  HttpOverrides.global = MyHttpOverrides();

  SharedPreferences.setMockInitialValues({});

  await CashHelper.init();
  DioHelper.init();

  lang = CashHelper.getData(key: "lang") ;

  print(lang);
  return runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context)=> AppCubit()..fetchAPI() ) ,
      ],
      child: GetMaterialApp(
        translations: Language() ,
        locale: Locale( lang ?? 'Get.deviceLocale'),

        fallbackLocale: Locale('en'),

           debugShowCheckedModeBanner:  false ,
        theme: ThemeData(
          // primarySwatch: Colors.teal,
          primarySwatch: Colors.brown,



        ),
          title: 'Album App',
          home:
          // HomeScreen()
          LoginScreen() ,


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