//here we use handle respone of APIs respone can be loading completed and error.........

import 'package:handel_exception/Data/Network/respone/status.dart';

class APirespone<T>{
   Status? status;
   T? data;
   String? message;
   
   APirespone(this.status,this.data, this.message);

   APirespone.loading() : status = Status.LOADING;
   APirespone.complete(this.data) : status = Status.COMPLETED;
   APirespone.error(this.message) : status = Status.ERROR;
   

   @override
   String  toString(){
    return "Status: $status \n Message $message \n  Data $data ";
   }

}