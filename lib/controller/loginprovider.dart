import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:machine_test1/model/loginreq.dart';
import 'package:machine_test1/service/loginservice.dart';
import 'package:machine_test1/view/homescreen.dart';

class LoginProvider with ChangeNotifier{


  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isload = false;

  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> loginfunction(context)async{
    isload = true;
    notifyListeners(); 

    final email = emailcontroller.text.trim();
    final password = passwordcontroller.text.trim();

    LoginReq model = LoginReq(email: email,password: password,returnSecureToken: true);

    await LoginService().login(model).then((value) {
        if (value?.idToken != null ) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const HomeScreen())); 
          storage.write(key: 'accessToken', value: value!.idToken);
          // storage.write(key: 'refreshToken', value: value.refreshToken); 
               

          emailcontroller.clear(); 
          passwordcontroller.clear();
        }else{
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('invalid username/password'),backgroundColor: Color.fromARGB(255, 199, 44, 33),),);
          isload = false; 
          notifyListeners(); 
        }
    });
   
  }
}