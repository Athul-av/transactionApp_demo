
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:machine_test1/controller/filterprovider.dart';
// import 'package:machine_test1/view/homescreen.dart';
// import 'package:machine_test1/view/loginscreen.dart';
// import 'package:provider/provider.dart';

// class SplashProvider with ChangeNotifier{


// FlutterSecureStorage storage = const FlutterSecureStorage();

//   timer(context)async{
//     Future.delayed(const Duration(milliseconds: 150),()async{
       
//         // String? refreshtoken = await storage.read(key: 'refreshToken');
//         String? token = await storage.read(key: 'accessToken'); 
//        log(token.toString()); 
        
//        Provider.of<FilterProvider>(context,listen: false).getdatas();
//        notifyListeners(); 

//         if (token != null) {
//           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const HomeScreen()));
          
//         }else{
//           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const LoginScreen()));
//          }
//     });
//   }
// }