abstract class AppStates {}
class AppInitializeState extends AppStates {}
class AppLoadingState extends AppStates {}


class GetAllAlbumsLoadingState extends AppStates {}
class GetAllAlbumsSucessState extends AppStates {}
class GetAllAlbumsErrorState extends AppStates {
  final String error ;
  GetAllAlbumsErrorState(this.error);
}




class GetAllPhotosLoadingState extends AppStates {}
class GetAllPhotosSucessState extends AppStates {}
class GetAllPhotosErrorState extends AppStates {
  final String error ;
  GetAllPhotosErrorState(this.error);
}