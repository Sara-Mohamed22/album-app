
import 'package:album_app/layout/cubit/app-cubit.dart';
import 'package:album_app/layout/cubit/app-state.dart';
import 'package:album_app/shared/style/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AlbumInfo extends StatelessWidget {

final   int? albumId ;
  const AlbumInfo({Key? key , this.albumId } ) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('77777 ${albumId}');

    AppCubit cubit = AppCubit.get(context);

    return BlocConsumer<AppCubit, AppStates>(
      listener:(context,state){} ,
      builder:(context,state) {

        print('888888888${cubit.photos}');

        return Scaffold(
          appBar: AppBar(
            title: Text('Album'.tr, style: TextStyle(
              fontFamily: fontFamily,
              fontSize: FontSizeManager.s18,
              fontWeight: FontWeightManager.light,

            ),),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
                cubit.photos = [];
              },),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 20),
            child:
                cubit.photos.length !=0 ?
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: cubit.photos.length,
                itemBuilder: (BuildContext ctx, index) {
                  return
                      Container(
                        height: 200,
                        child: Card(
                          elevation: 3,
                          color: Colors.white,
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10) ,
                                bottomRight: Radius.circular(10) ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(cubit.photos[index].url),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                                child:

                                // Text(cubit.photos[index].title ,
                                Text(' ',
                                textAlign: TextAlign.center,
                                // maxLines: 3,
                                softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              Text(cubit.photos[index].title ,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );




                }) :
            Center(child: CircularProgressIndicator()),
          ),
        );

      } );
  }
}
