import 'package:get/get.dart';

import 'ar.dart';
import 'en.dart';

class Language extends Translations
{
  @override
  Map<String, Map<String, String>> get keys => {

    "en" : en ,
    "ar" : ar
  };

}