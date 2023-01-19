

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

  late bool _isLastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loading;
  final int _numberOfPostsPerRequest = 10;
  final int _nextPageTrigger = 3;
  late ScrollController? _scrollController;

  getAllAlbumes() {

    emit(GetAllAlbumsLoadingState());

    DioHelper.
    getData(
        url: AllAlbums ,
      query: {

        'lang': CashHelper.getData(key: "lang") ?? 'en' ,
        // '_start' : 0,
        // '_limit' : 10,
      },
        // token: CashHelper.getData(key: 'token')


    )!.then((value) {

        print('albumssss  ${value.data }');

        value.data.forEach((album) {
        allAlbums.add(AlbumModel.FromJson(album));
        });

        _isLastPage = allAlbums.length < _numberOfPostsPerRequest;
        _loading = false;
        _pageNumber = _pageNumber + 1;


        print('albumArray  ${allAlbums[0].title}');
        emit(GetAllAlbumsSucessState());

    }).catchError((e) {

      _loading = false;
      _error = true;

      print('errroxxx ${e.toString()}');
      emit(GetAllAlbumsErrorState(e.toString()));
    });
  }



}
