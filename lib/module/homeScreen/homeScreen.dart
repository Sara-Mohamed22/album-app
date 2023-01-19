import 'dart:convert';
import 'package:album_app/layout/cubit/app-cubit.dart';
import 'package:album_app/module/albumInfo/albumInfo.dart';
import 'package:album_app/shared/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../layout/cubit/app-state.dart';
import '../../shared/component.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _controller = ScrollController() ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener( ()async {
      if(_controller.position.maxScrollExtent == _controller.offset)
       {
         AppCubit.get(context).fetchAPI();
       }
      });

  }



  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    AppCubit cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener:(context,state){} ,
    builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Albums'.tr, style: TextStyle(
            fontFamily: fontFamily,
            fontSize: FontSizeManager.s18,
            fontWeight: FontWeightManager.light,

          ),),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              cubit.isLoading = false;
              cubit.hasMore = true;
              cubit.page = 0;
              cubit.allAlbums.clear();
            });

            await cubit.fetchAPI();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.separated(
              controller: _controller,
              itemBuilder: (context, index) {
                if (index < cubit.allAlbums.length) {
                  final item = cubit.allAlbums[index].title;
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text( item ,
                          textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        softWrap: true,),
                      ),
                    ),
                    onTap: (){
                      navTo(context, AlbumInfo(albumId: cubit.allAlbums[index].id,) );
                      cubit.getAllPhotos(cubit.allAlbums[index].id);
                    },
                  );
                }
                else {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                        child:cubit.hasMore ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: CircularProgressIndicator(),
                        ) :
                        Text('No Data to Load ...')),
                  );
                }
              },
              itemCount: cubit.allAlbums.length+ 1,
            separatorBuilder: (context, index)=> SizedBox(height: 20,),),
          ),
        ),
      );

    });
  }
}
