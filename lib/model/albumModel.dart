

class AlbumModel
{
  int? userId ;
  int? id ;
  String? title ;


  Map<String , dynamic> toJson()
  {
    return
      {
        "userId":userId,
        "id": id ,
       "title": title


      };
  }


  AlbumModel.FromJson(Map<String , dynamic>json)
  {
   userId = json['userId'];
   id = json['id'];
   title = json['title'];

  }
}

