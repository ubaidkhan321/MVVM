import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handel_exception/Data/Network/respone/status.dart';
import 'package:handel_exception/Utitlites/Routes/Routes_name.dart';
import 'package:handel_exception/Utitlites/utitlies.dart';
import 'package:handel_exception/View_Model/Services/home_view_Model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fatchmoviedata();
    super.initState();
   
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RouteName.login);
            },
            child: const Center(child: Text("Logout",style: TextStyle(fontSize: 14),))),
            
           const SizedBox(width: 20,),
        ],
      ),
      body:ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, child){
            switch(value.movieList.status){
              case Status.LOADING:
                  return CircularProgressIndicator();
              case Status.ERROR:
                  return Text(value.movieList.message.toString());
                  //data fetch ho rha hai yaha ..
                  //HomeScreen goes to homeRepostoriy
                  // homeRepostoriy goes to network
                  //netork return dynamic data then pass in model in homerepostoriy
                  //then call homerepostoriy in homeViewModel
                  //then call homeViewModel in homeScreen
              case Status.COMPLETED:
                  return ListView.builder(
                    itemCount: value.movieList.data!.movies!.length,
                    itemBuilder: (context,index){
                      return  Card(
                          child: ListTile(
                            leading: Image.network(value.movieList.data!.movies![index].posterurl.toString(),
                            errorBuilder:(context,error,Stack){
                              return Icon(Icons.error);
                            } ,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                           
                            ),
                            title: Text(value.movieList.data!.movies![index].title.toString()),
                            subtitle: Text(value.movieList.data!.movies![index].year.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(Utils.productaveragerating(value.movieList.data!.movies![index].ratings!).toStringAsFixed(1),style: TextStyle(fontSize: 12),),
                               const Icon(Icons.star,color: Colors.yellow,)
                              ],
                            ),
                            
                          ),
                      
                        );
                      
                    }) ;       

              default:
                return const Text("Status not found");
                 

            }
            
             
            
        
          
          
        }
        
        ),
    
    ),
    );
  }
}