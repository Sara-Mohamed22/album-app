
import 'package:album_app/layout/cubit/app-cubit.dart';
import 'package:album_app/module/albumInfo/albumInfo.dart';
import 'package:album_app/shared/component.dart';
import 'package:album_app/shared/style/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // late bool _isLastPage;
  // late int _pageNumber;
  // late bool _error;
  // late bool _loading;
  // final int _numberOfPostsPerRequest = 10;
  // late List<Post> _posts;
  // final int _nextPageTrigger = 3;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _pageNumber = 0;
    // _posts = [];
    // _isLastPage = false;
    // _loading = true;
    // _error = false;
    // AppCubit.get(context).getAllAlbumes();
  }





  @override
  Widget build(BuildContext context) {

    AppCubit cubit = AppCubit.get(context);
    print('77 ${cubit.allAlbums.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Albums', style: TextStyle(
          fontFamily: fontFamily,
          fontSize: FontSizeManager.s18,
          fontWeight: FontWeightManager.light,

        ),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0 ),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: cubit.allAlbums.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(cubit.allAlbums[index].title ,
                    textAlign: TextAlign.center,),
                ),
                onTap: (){
                  navTo(context, AlbumInfo());
                },
              );
            }),
      ),
    );
  }
}
