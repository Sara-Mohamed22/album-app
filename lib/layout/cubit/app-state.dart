abstract class AppStates {}
class AppInitializeState extends AppStates {}
class AppLoadingState extends AppStates {}


class GetAllAlbumsLoadingState extends AppStates {}
class GetAllAlbumsSucessState extends AppStates {}
class GetAllAlbumsErrorState extends AppStates {
  final String error ;
  GetAllAlbumsErrorState(this.error);
}