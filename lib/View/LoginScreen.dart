
import 'package:flutter/material.dart';
import 'package:handel_exception/Res/Component/RoundButtonScreen.dart';
import 'package:handel_exception/Utitlites/Routes/Routes_name.dart';
import 'package:handel_exception/Utitlites/utitlies.dart';
import 'package:handel_exception/View/auth_view_model.dart';
import 'package:mediaquery_sizer/mediaquery_sizer.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

    ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    _obsecurepassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final _authviewmodel = Provider.of<AuthViewModel>(context);
     final  height = MediaQuery.of(context).size.height * 1;
    return  Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.deepPurpleAccent,
        title: const Text("Login",style: TextStyle(fontSize: 30,color: Colors.white),),
        centerTitle: true,
      ),
      body: 
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
               
                      TextFormField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                         focusNode: emailFocusNode,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.withOpacity(0.5),
                          filled: true,
                          hintText: "Email",
                          suffixIcon: Icon(Icons.email_outlined),
                           enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.black
                            ),
                           ),
                            errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.redAccent
                            ),
                           ),
                           focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.blue
                            ),
                           ),
                           ),onFieldSubmitted: (value){
                            Utils().FieldFocusChange(context, emailFocusNode, passwordFocusNode);
                           },
                          
                        ),
                        SizedBox(height: 2.h(context),),
            
                        ValueListenableBuilder(
                          valueListenable: _obsecurepassword,
                          builder: (context, value, child) {
                            return  TextFormField(
                            controller: passwordcontroller,
                          keyboardType: TextInputType.number,
                          focusNode: passwordFocusNode,
                          obscureText: _obsecurepassword.value,
                          
                          decoration: InputDecoration(
                            fillColor: Colors.grey.withOpacity(0.5),
                            filled: true,
                            hintText: "Password",
                            suffixIcon:  InkWell(
                              onTap: (){
                                _obsecurepassword.value = !_obsecurepassword.value;
                              },
                              child: Icon( _obsecurepassword.value ?  Icons.visibility_off_rounded:
                                Icons.visibility)),
                             enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 3,
                                color: Colors.black
                              ),
                             ),
                              errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 3,
                                color: Colors.redAccent
                              ),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 3,
                                color: Colors.blue
                              ),
                             ),
                             )
                          );
                          },
                          
                        ),
                        SizedBox(height: height*.045,),
                       RoundButton(title: "Login",
                         loading: _authviewmodel.loading,
                        onpress: (){
                        if(emailcontroller.text.isEmpty || passwordcontroller.text.isEmpty){
                          Utils().FlushBarErrorMessage("Enter Empty Field", context);
                        }
                        else{
                          Map data = {
                            'email': emailcontroller.text.toString(),
                            'password':passwordcontroller.text.toString()

                          };
                          _authviewmodel.isloginApi(data, context);
                          Utils().toastMessage("Api Hit");
                         
                        }
                       }),
                       SizedBox(height: height *0.02,),
                       Center(
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Don't have a account.?"),
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, RouteName.signup);
                       
                            }, child: const Text("SingUp"))
                          ],
                         ),
                       )
                       
                      
                  
                  
                ],
              ),
            
          ),
        
    );
  }
}