
import 'package:album_app/shared/style/fonts.dart';
import 'package:flutter/material.dart';

class AlbumInfo extends StatelessWidget {

  final int? albumId ;
  const AlbumInfo({Key? key , this.albumId } ) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // print('77777 ${albumId}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Albums Info', style: TextStyle(
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
          },),
      ),
      body: Column(
        children: [
          Text('222')
        ],
      ),
    );
  }
}
