import 'package:handel_exception/Data/Network/BaseApi.dart';
import 'package:handel_exception/Data/Network/NewtorkApi.dart';
import 'package:handel_exception/Model/MoveModel.dart';
import 'package:handel_exception/Res/Component/App_url.dart';

class HomeRepostoriy{
   BaseApiServices getapiservices = NetworkApi();
 


  Future<MoveModel> moviefatchdata()async{

    try{
      dynamic  response  = await getapiservices.GetApiUrl(AppUrl.movieList);
      return response = MoveModel.fromJson(response);

    }catch(e){
      throw e;
    }
  }
}