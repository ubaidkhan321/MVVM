class  AppException implements Exception{
  final message;
  final Prefix;
  AppException([this.message, this.Prefix]);

  String tostring(){
    return  '$Prefix$message';
  }
}
//when apis does not respone within 10 second then show this exception
class FetchException extends AppException{
FetchException([String? message]):super(message, 'Error During  Communication');
}

//when URL and Route does not exit on this Server then show this exception
class BedExceptionRequest extends AppException{
  BedExceptionRequest([String? message]):super(message , "Invalid Request");
}


//when User does not Authorized then show this exception
class UnauthorizedException extends AppException{
  UnauthorizedException([String? message]):super(message , "Unauthorized Request");
}

//when User does not Authorized then show this exception
class InvalidInputException extends AppException{
  InvalidInputException([String? message]):super(message , "Invalid  Input");
}