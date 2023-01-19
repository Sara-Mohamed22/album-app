
import 'package:album_app/shared/style/fonts.dart';
import 'package:flutter/material.dart';

class AlbumInfo extends StatelessWidget {
  const AlbumInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums Info', style: TextStyle(
          fontFamily: fontFamily,
          fontSize: FontSizeManager.s18,
          fontWeight: FontWeightManager.light,

        ),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Text('222')
        ],
      ),
    );
  }
}
