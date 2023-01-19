

class PhotoModel
{
  int? albumId;
  int? id ;
  String? title ;
  String? url ;
  String? thumbnailUrl ;


  Map<String , dynamic> toJson()
  {
    return
      {
        "albumId": albumId ,
      "id": id ,
      "title": title ,
      "url": url,
      "thumbnailUrl": thumbnailUrl


      };
  }


  PhotoModel.FromJson(Map<String , dynamic>json)
  {
    albumId = json["albumId"];
    id = json['id'];
    title = json['title'];
     url = json["url"];
     thumbnailUrl = json["thumbnailUrl"];

  }
}

