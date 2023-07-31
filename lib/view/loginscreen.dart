import 'package:flutter/material.dart';
import 'package:machine_test1/controller/loginprovider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 GlobalKey<FormState> formkey = GlobalKey();
 
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      resizeToAvoidBottomInset: false,
     body: SafeArea(
        child: Column( 
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome',style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold,fontSize: 24),),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Please sign in to your account',style: TextStyle(color:Color.fromARGB(255, 87, 87, 87),fontSize: 13),)
                 
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 32, right: 32, top: 1, bottom: 15),
                child: Form(
                  key: formkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ListView(
                    children: [
                      Consumer<LoginProvider>(

                        builder: (context, value, child) {
                          return  TextFormField(
                            controller: value.emailcontroller,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "enter your email";
                            } else {
                              return null;
                            }
                          }),
                          autovalidateMode: AutovalidateMode.onUserInteraction,  
                          cursorColor:  const Color.fromARGB(255, 45, 83, 103),
                          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              label:const Text('Email',style: TextStyle(color: Colors.black,fontSize: 14),),
                              filled: true, 
                              fillColor:const Color.fromARGB(255, 208, 208, 208),
                              ), 
                        ); 
                        },
                         
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<LoginProvider>(
                        builder: (context, value, child) {
                          return  TextFormField(
                            controller: value.passwordcontroller, 
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "enter your password"; 
                            } else {
                              return null;
                            }
                          }),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor:  const Color.fromARGB(255, 45, 83, 103),
                          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                             label:const Text('Password',style: TextStyle(color: Colors.black,fontSize: 14),),
                              filled: true, 
                              fillColor: const Color.fromARGB(255, 208, 208, 208),
                              ),
                        );
                        },
                        
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<LoginProvider>(
                        builder: (context, value, child) {
                          return  ElevatedButton(
                            onPressed: () {
                             if (formkey.currentState!.validate()) {
                                       value.loginfunction(context);
                                        
                                     }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all( const Color.fromARGB(255, 45, 83, 103)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(18)),
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20)))),
                            child:value.isload ? const Center(child: CircularProgressIndicator(color: Colors.white,),):const Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 16) ,));
                        },
                      
                      ), 
                           
                      const SizedBox(
                        height: 12,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 29),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 const Text("Don't have an Account?",style: TextStyle(color: Color.fromARGB(255, 51, 51, 51),fontSize: 13),)
                               ,
                                TextButton(
                                    onPressed: () {
                                     
                                    },
                                    child: 
                                     const Text("Sign Up",style: TextStyle(color:    Color.fromARGB(255, 45, 83, 103),fontSize: 15),)
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      );
   
  }
} 