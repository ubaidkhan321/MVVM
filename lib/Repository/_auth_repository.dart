import 'package:handel_exception/Data/Network/BaseApi.dart';
import 'package:handel_exception/Data/Network/NewtorkApi.dart';
import 'package:handel_exception/Res/Component/App_url.dart';


class AuthRepository{

  BaseApiServices postapi = NetworkApi();
 


  Future<dynamic> loginApi(dynamic data)async{

    try{
      dynamic  response  = await postapi.PostApiurl(AppUrl.LoginUrl, data);
      return response;

    }catch(e){
      throw e;
    }
  }

   Future<dynamic> signuprApi(dynamic data)async{

    try{
      dynamic  response  = await postapi.PostApiurl(AppUrl.Registerurl, data);
      return response;

    }catch(e){
      throw e;
    }
  }
}