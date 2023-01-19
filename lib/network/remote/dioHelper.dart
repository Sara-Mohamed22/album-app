import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper
{
  static Dio? dio ;


  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      receiveDataWhenStatusError: true ,

    ));

  }



  static Future<Response>? getData({

    @required String? url,
    Map<String, dynamic>? query ,
    String? lang  ,
    String? token

  })async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json' ,
      'lang':  lang ,
      // 'Authorization':'Bearer $token',
      'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWU3YWJhYzdlNWE5ODVlOTEyNjlhMTg2MmFjOTIzYjM5YzhlNTg4MTk0MTg3MTFkZDA2OWJhZjU2ZDE3NmJjN2VlZjE3ODEwMjkxMTIwNmEiLCJpYXQiOjE2NjczMDc3NTUuODE2MDI1MDE4NjkyMDE2NjAxNTYyNSwibmJmIjoxNjY3MzA3NzU1LjgxNjAzMDAyNTQ4MjE3NzczNDM3NSwiZXhwIjoxNjk4ODQzNzU1LjYzMDg2NzAwNDM5NDUzMTI1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.wGu_PF1E1C9SzGqebOTbdrTsA_Kv8PgYvmPADeWoEnqbKxldDoi248RKM4-Evoh6PT7yEm_G1wah5wMpGzLpFydRFTvVSSbCWWmeBWR-Yz2v0J-LJQPK42RGDEogEK0RWqmdtjUVbcfWdEQs8QLIVQjaXfPTRxdxcrISTGmEgXR_71k0gywkuq9vD6UvA_l5BOKyDZxVsPcxGZ3KQSKil6MrhgVpb5LmcRURag8CotB0jhv0gInHUuvZ0J9lPImb_HqhCsiYs7ltF9TJSMoj6SW4p5W93rbVCP4j2ihF8rXjpV--jmSH2nNosZJmWoG4X-Im9fqx6LTi68U-Q5Ce1OsfzpZEq7SE_2JxSp8tlkC4HKbo_7PWCfRU0IRfFeeWesr4HZjune36Ea2sl9fwXoIiB1w8G3Q-6xHM-8dtawN2gRQFJEzHWtON20sQ9EaeXKErUDvzmiMnhr8zRV9c1VzTeahH3SRCI5bxFzY9973OuVkg8_2YMVCWn6KCdl_mtZ_mN_HwAoKan1IXBH3NTpCuCAAnwrXkf7EEs0LxLjt3CojwuHtAVcVWCzZkEfTHsVPzJChomQL2XWl6S0V_X_CPOyQtYGg_gZVIY0H4CdetJX9hP-sI3nIaSGl5xtWsk3jG4MbnUekqi2RAjbBZJ0IwevajtqvbONQmuCnEGL8',

    }
    ;

    return await  dio!.get(url! , queryParameters: query ) ;
  }



  static Future<Response>? postData({
    @required String? url ,
    Map<String , dynamic>? query ,
    @required Map<String , dynamic>? data ,
    String? lang  ,
    String? token

  }) async
  {


    dio!.options.headers =
    {
      'Content-Type':'application/json' ,
      // 'lang':lang ,
      'Authorization':'Bearer $token' ,
    }
    ;
    return await  dio!.post(url! , queryParameters: query , data: data , );

  }




  static Future<Response> putData(
      { @required String? url ,

        Map<String , dynamic>? data ,
        Map<String , dynamic>? query ,
        @required String? lang  ,
        String? token


      }
      )async
  {
    dio!.options.headers={
      'Content-Type':'application/json' ,
      // 'lang':lang ,
      'Authorization':'Bearer $token' ,

    };
    return await  dio!.put(url! , queryParameters: query , data: data);
  }

}



















