import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:machine_test1/controller/filterprovider.dart';

Widget filtercontainer1({required bool contains,required String text}){
  return  Container(
                                                                           
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: const BorderRadius.all(Radius.circular(10))
                                                                            ,color:contains? const Color.fromARGB(255, 218, 243, 255):Colors.white 
                                                                          ),
                                                                          child:  Padding(
                                                                            padding: const EdgeInsets.fromLTRB(7,3,7,3),
                                                                            child: Center(child: Text(text,style: TextStyle(color:contains? const Color.fromARGB(255, 51, 185, 247):Colors.grey,fontSize: 13),),),
                                                                          ),
                                                                        );
                                                                       
}



Widget filtercontainer2({required bool contains,required String text}){
  return  Container(
                                                                           
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: const BorderRadius.all(Radius.circular(10))
                                                                            ,color:contains? const Color.fromARGB(255, 218, 243, 255):Colors.white 
                                                                          ),
                                                                          child:  Padding(
                                                                            padding: const EdgeInsets.fromLTRB(7,3,7,3),
                                                                            child: Center(child: Row(
                                                                              children: [
                                                                                Text(text,style: TextStyle(color:contains? const Color.fromARGB(255, 51, 185, 247):Colors.grey,fontSize: 13),),
                                                                                const Icon(Icons.close,size: 13,color:Color.fromARGB(255, 51, 185, 247) ,) 
                                                                              ],
                                                                            ),),
                                                                          ),
                                                                        );
                                                                       
}

 

Widget transactiontype(FilterProvider value){
 return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Container(
                                                height: 10.h,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(12),  
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start, 
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                                                                children: [
                                                                  const Text('Money in and out - 2',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),) ,
                                                               Row(children: [
                                                                      InkWell(
                                                                        onTap: (){
                                                                          value.moneyInOutfun(value.moneyInOut[0]);
                                                                        }, 
                                                                        child: filtercontainer1(contains:value.moneyInOutadd.contains(value.moneyInOut[0]), text: value.moneyInOut[0]), 
                                                                      ),
                                                                      const SizedBox(width: 10,),    
                                                                      InkWell(
                                                                        onTap: (){
                                                                           value.moneyInOutfun(value.moneyInOut[1]);
                                                                        },
                                                                        child: filtercontainer1(contains:value.moneyInOutadd.contains(value.moneyInOut[1]), text: value.moneyInOut[1])
                                                                      ) 
                                                                    ],)
                                                                ],
                                                              ),
                                                            ),
                                              ),
                                            );
}



Widget transactionstatus(FilterProvider value){
return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Container(
                                                height: 14.h,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                            child:  Padding(
                                                              padding: const EdgeInsets.all(12),  
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start, 
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                                                                children: [
                                                                  const Text('Statuses - 6',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),) ,
                                                                 Row(children: [
                                                                      InkWell(
                                                                        onTap: (){
                                                                          value.statusesfun(value.statuses[0]);
                                                                        },
                                                                        child: filtercontainer1(contains:value.statusesadd.contains(value.statuses[0]), text: value.statuses[0])
                                                                      ),
                                                                      const SizedBox(width: 8,),    
                                                                      InkWell(
                                                                        onTap: (){
                                                                          value.statusesfun(value.statuses[1]);
                                                                        },
                                                                         child: filtercontainer1(contains:value.statusesadd.contains(value.statuses[1]), text: value.statuses[1])
                                                                      ),
                                                                       const SizedBox(width: 8,),     
                                                                     InkWell(
                                                                        onTap: (){
                                                                          value.statusesfun(value.statuses[2]);
                                                                        },
                                                                         child: filtercontainer1(contains:value.statusesadd.contains(value.statuses[2]), text: value.statuses[2])
                                                                      ),   
                                                                    ],),
                                                        Row(children: [
                                                                     InkWell(
                                                                        onTap: (){
                                                                          value.statusesfun(value.statuses[3]);
                                                                        },
                                                                         child: filtercontainer1(contains:value.statusesadd.contains(value.statuses[3]), text: value.statuses[3])
                                                                      ),
                                                                      const SizedBox(width: 8,),    
                                                                      InkWell(
                                                                        onTap: (){
                                                                          value.statusesfun(value.statuses[4]);
                                                                        },
                                                                         child: filtercontainer1(contains:value.statusesadd.contains(value.statuses[4]), text: value.statuses[4])
                                                                      ),
                                                                       const SizedBox(width: 8,),     
                                                                      InkWell(
                                                                        onTap: (){
                                                                          value.statusesfun(value.statuses[5]);
                                                                        },
                                                                         child: filtercontainer1(contains:value.statusesadd.contains(value.statuses[5]), text: value.statuses[5])
                                                                      ),   
                                                                    ],)
                                                                   
                                                                ],
                                                              ), 
                                                            ),
                                              ),
                                            );
}


Widget transactionamount(FilterProvider value){
  return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Container(
                                                height: 13.h,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(12),  
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start, 
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                                                                children: [
                                                                  const Text('Amount',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),) ,
                                                               Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                                                                children: [
                                                                     SizedBox(
                                                                      height: 6.5.h, 
                                                                      width: 41.w, 
                                                                    
                                                                      child: TextField(
                                                                        controller: value.minimum,
                                                                        cursorColor:  const Color.fromARGB(255, 218, 243, 255),
                                                                        keyboardType: TextInputType.number,
                                                                        decoration: InputDecoration(
                                                                          hintText: 'Minimum',
                                                                          hintStyle: const TextStyle(fontSize: 12,color: Colors.grey),
                                                                          filled: true,
                                                                          fillColor: const Color.fromARGB(255, 234, 234, 234),
                                                                          border: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(10),
                                                                            borderSide: BorderSide.none 
                                                                          )
                                                                        ),

                                                                      ),
                                                                     ),
                                                                      SizedBox(
                                                                      height: 6.5.h, 
                                                                      width: 41.w,
                                                                    
                                                                      child: TextField(
                                                                        controller: value.maximum,  
                                                                          cursorColor:  const Color.fromARGB(255, 218, 243, 255), 
                                                                        keyboardType: TextInputType.number,
                                                                        decoration: InputDecoration(
                                                                           hintText: 'Maximum',
                                                                        
                                                                          hintStyle: const TextStyle(fontSize: 12,color: Colors.grey),
                                                                          filled: true,
                                                                          fillColor: const Color.fromARGB(255, 234, 234, 234),
                                                                          border: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(10),
                                                                            borderSide: BorderSide.none 
                                                                          )
                                                                        ),

                                                                      ),
                                                                     )  
                                                                    ],)
                                                                ],
                                                              ),
                                                            ),  
                                              ),
                                            );
}