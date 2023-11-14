import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static double productaveragerating(List<int> rating){
    var  avgrating = 0;
    for(int i = 0; i < rating.length; i++){
      avgrating = avgrating + rating[i];
    }
    return double.parse((avgrating/rating.length).toStringAsFixed(1));
  }

   void FieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus){
      current.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT, 
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        backgroundColor: Colors.red,
        fontSize: 16.0
    );
    
  }
   void  FlushBarErrorMessage(String message,BuildContext context){
    showFlushbar(
      context: context, 
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin:  EdgeInsets.symmetric(horizontal: 20,vertical:10),
        padding: EdgeInsets.all(15),
        message: message,
        duration: Duration(seconds: 3),
        borderRadius: BorderRadius.circular(15),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(Icons.error,size: 30,color: Colors.white,),

      )..show(context),
      );

}
  dynamic  snakbar(String message,BuildContext context){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Center(child: Text(message)))
    
    
    );
}

}
 

