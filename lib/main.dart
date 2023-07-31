import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:machine_test1/controller/filterprovider.dart';
import 'package:machine_test1/controller/loginprovider.dart';
import 'package:machine_test1/view/homescreen.dart';
import 'package:machine_test1/view/loginscreen.dart';
import 'package:provider/provider.dart';
  
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? token = await storage.read(key: 'accessToken');
  runApp(  MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;
  
  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    log(token.toString());
    return FlutterSizer(
      builder: (p0, p1, p2) {
        return  MultiProvider(
          providers: [
            ChangeNotifierProvider(create:(context) => LoginProvider(),),
            ChangeNotifierProvider(create: (context) => FilterProvider()) ,
          
          ],
          child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData( 
            useMaterial3: true
          ),
          home:  token != null ? const HomeScreen() : const LoginScreen()
              ),
        );
      },
      
    );
  }
}