// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:handel_exception/Data/Network/respone/api_respone.dart';
import 'package:handel_exception/Model/MoveModel.dart';
import 'package:handel_exception/Repository/home_repostoriy.dart';

class HomeViewViewModel with ChangeNotifier{
  final _myrepo = HomeRepostoriy();
  APirespone<MoveModel> movieList = APirespone.loading();
  setMoviesList(APirespone<MoveModel> respone){
    movieList = respone;
    notifyListeners();
  }
  Future<void> fatchmoviedata()async{
    setMoviesList(APirespone.loading());
    _myrepo.moviefatchdata().then((value) {
      setMoviesList(APirespone.complete(value));

    }).onError((error, stackTrace) {
      setMoviesList(APirespone.error(error.toString()));

    });
    
  }

}