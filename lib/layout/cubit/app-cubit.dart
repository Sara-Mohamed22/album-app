

import 'package:album_app/model/albumModel.dart';
import 'package:album_app/network/endPoint.dart';
import 'package:album_app/network/local/cashHelper.dart';
import 'package:album_app/network/remote/dioHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app-state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitializeState());

  static AppCubit get(context) => BlocProvider.of(context);


  List<dynamic> allAlbums = [];


  int page =0;
  bool hasMore =true ;
  bool isLoading = false ;
  List<dynamic> items = [];



 /* getAllAlbumes() {

    emit(GetAllAlbumsLoadingState());

    DioHelper.
    getData(
        url: AllAlbums ,
      query: {

        'lang': CashHelper.getData(key: "lang") ?? 'en' ,
        '_start' : page ,
        '_limit' : 10 ,
      },
        // token: CashHelper.getData(key: 'token')


    )!.then((value) {

        print('albumssss  ${value.data }');



        value.data.forEach((album) {
        allAlbums.add(AlbumModel.FromJson(album));
        });




        print('albumArray  ${allAlbums.length }');
        emit(GetAllAlbumsSucessState());

    }).catchError((e) {

      print('errroxxx ${e.toString()}');
      emit(GetAllAlbumsErrorState(e.toString()));
    });
  }*/


  Future  fetchAPI()async
  {

    const limit = 10 ;

    emit(GetAllAlbumsLoadingState());

    DioHelper.
    getData(
      url: AllAlbums ,
      query: {

        'lang': CashHelper.getData(key: "lang") ?? 'en' ,
        '_start' : page ,
        '_limit' : 10 ,
      },
      // token: CashHelper.getData(key: 'token')

    )!.then((value) {
      if(isLoading) return ;
      isLoading = true ;

      page++ ;
      isLoading = false ;

      if(value.data.length < limit )
      {
        hasMore = false ;
      }

     /* items.addAll(value.data.map<String>((item){

        print('ooooo ${item}');
        final title =item['title'];
        // return ' $title ${++page -2 +1 }' ;
        return ' $title ' ;


      }).toList());*/

      value.data.forEach((album) {
        allAlbums.add(AlbumModel.FromJson(album));
      });

      print('4444444444444 ${allAlbums}');

      emit(GetAllAlbumsSucessState());

    }).catchError((e){
      print('errroxxx ${e.toString()}');
      emit(GetAllAlbumsErrorState(e.toString()));

    });




  }



}
