// ignore_for_file: unnecessary_const


import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:machine_test1/controller/filterprovider.dart';
import 'package:machine_test1/widgets/filterwidgets.dart';
import 'package:machine_test1/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) => Provider.of<FilterProvider>(context,listen: false).getdatas()); 

    final filterprovider = Provider.of<FilterProvider>(context,listen: false); 
    TextEditingController searchcontroller = TextEditingController();
   

    return Scaffold( 
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        surfaceTintColor: const Color.fromARGB(255, 247, 247, 247),
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.download,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(14, 5, 5, 5),
                        child: Text(
                          'Transactions',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 16, 13, 1), 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 5.h,
                            width: 80.w,
                            child: TextField(
                              controller: searchcontroller,
                              onChanged: (key) {
                                filterprovider.search(key);  
                              },
                              cursorColor: Colors.grey,
                              cursorHeight: 24,
                              cursorWidth: 1,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              decoration: InputDecoration(
                                  hintText: 'Search vessel',
                                  hintStyle: const TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 153, 158, 162)),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(10, 5, 7, 1),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 227, 231, 235),
                                  suffixIcon: const Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Container(
                                    height: 90.h,
                                    decoration: const BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 247, 247, 247),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25.0),
                                        topRight: const Radius.circular(25.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          13, 40, 13, 12),
                                      child: Consumer<FilterProvider>(
                                        builder: (context, value, child) {
                                          return ListView(
                                          children: [
                                             Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  'Filter',
                                                  style: TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                InkWell( 
                                                  onTap: (){
                                                    filterprovider.clearfilter(); 

                                                  },
                                                  child: const Text('Clear',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                )
                                              ],
                                            ),
                                            transactiontype(value),
                                            transactionstatus(value),
                                            Padding(
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
                                                                  const Text('Time Range',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),) ,
                                                                 Row(children: [
                                                                      InkWell( 
                                                                        onTap: (){
                                                                          value.timerangefun(value.timerange[0]);
                                                                        },
                                                                        child: filtercontainer1(contains:value.timerangeadd.contains(value.timerange[0]), text: value.timerange[0])
                                                                      ),
                                                                      const SizedBox(width: 8,),    
                                                                      InkWell(
                                                                        onTap: (){
                                                                          value.timerangefun(value.timerange[1]);
                                                                        },
                                                                         child: filtercontainer1(contains:value.timerangeadd.contains(value.timerange[1]), text: value.timerange[1])
                                                                      ),
                                                                       const SizedBox(width: 8,),     
                                                                     InkWell(
                                                                        onTap: (){
                                                                          value.timerangefun(value.timerange[2]);
                                                                        },
                                                                         child: filtercontainer1(contains:value.timerangeadd.contains(value.timerange[2]), text: value.timerange[2])
                                                                      ),   
                                                                    ],),
                                                        Row(children: [
                                                                     InkWell(
                                                                        onTap: (){
                                                                          value.timerangefun(value.timerange[3]);
                                                                        },
                                                                         child: filtercontainer1(contains:value.timerangeadd.contains(value.timerange[3]), text: value.timerange[3])
                                                                      ),
                                                                      const SizedBox(width: 8,),    
                                                                      InkWell(
                                                                        onTap: (){
                                                                          daterangepicker(context);   
                                                                        },
                                                                         child: filtercontainer1(contains:value.timerange[4] != 'custom' ? true : false, text: value.timerange[4])
                                                                      ),
                                                                       const SizedBox(width: 8,),      
                                                                    ],)
                                                                   
                                                                ],
                                                              ), 
                                                            ) 
                                              ),
                                            ),
                                            transactionamount(value), 
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 2),
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    value.clearfilter();  
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:  const Color.fromARGB(255, 218, 243, 255),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                     padding: const EdgeInsets.only(top: 15,bottom: 15)   
                                                  ),
                                                  child: const Text('Cancel',style: TextStyle(color: Color.fromARGB(255, 51, 185, 247)),)),
                                            ),
                                             Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 2),
                                              child: ElevatedButton( 
                                                  onPressed: () {
                                                    value.applyfilter(); 
                                                    Navigator.of(context).pop();  
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: const Color.fromARGB(255, 51, 185, 247),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    padding: const EdgeInsets.only(top: 15,bottom: 15)  
                                                  ),
                                                  child: const Text('Apply',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),)),
                                            ),
                                          ],
                                        );
                                        },
                                       
                                      ),
                                    )),
                              );
                            },
                            child: Container(
                              height: 5.h,
                              width: 11.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color:
                                      const Color.fromARGB(255, 227, 231, 235)),
                              child: const Center(
                                  child: Icon(
                                Icons.filter_alt,
                                color: Colors.grey,
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                    
                    Consumer<FilterProvider>(
                      builder: (context, value, child) {
                        if (value.allfilters.isNotEmpty) {
                          return  Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16,top: 5),
                        child: SizedBox(
                         height: 4.5.h, 
                          // color: Colors.red,
                          child: ListView.builder(itemBuilder: (context, index) {
                             return Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: InkWell(
                                onTap: (){
                                  value.removefilters(index);  
                                },
                                child: filtercontainer2(contains: true ,text: value.allfilters[index])), 
                             ); 
                          },itemCount: value.allfilters.length,physics: const ScrollPhysics(),scrollDirection: Axis.horizontal), 
                        ),
                      );
                        }else{
                          return Container(); 
                        }
                        
                      } 
                    )
                  ], 
                )),
            Expanded(
                flex: 7 ,
                child: Consumer<FilterProvider>( 
                  
                  builder: (context, value, child) {
                    
                    if (value.transaction  != null && value.transaction!.isNotEmpty) { 
                      return ListView.builder(itemBuilder:(context, index) { 
                        
                 return  listtile2(amount:value.transaction![index].amount.toString() ,color:value.transaction![index].transactionType == "CONVERSION_BUY"?Colors.green:Colors.black,currency:value.transaction![index].currency ,
                 icon: value.transaction![index].transactionType == "CONVERSION_BUY"? Icons.south_west_rounded:Icons.north_east_rounded ,  
                  date:value.transaction![index].createdAt.toString()  ,
                  name:value.transaction![index].description 
                 );     
                },
                itemCount: value.transaction!.length,);
                    }else if(value.isloading == true){
                      return const Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 45, 83, 103)),); 
                    }
                    
                    else {
                      return const Center(child:Text('No Transactions',style: TextStyle(fontWeight: FontWeight.bold),),);  
                    } 
                  },
                ))
          ],
        ),
      ),
    );
  }

  Future daterangepicker(context)async{
  DateTimeRange? newdatetime = await showDateRangePicker(context: context, firstDate: DateTime(2022 ), lastDate: DateTime(2024),currentDate: DateTime.now(),helpText: 'Custom time range',
    builder: (context, child) {
      return Theme(data: ThemeData.light().copyWith( 
        primaryColor: const Color.fromARGB(255, 218, 243, 255),
      ), child:child!);  
    },);

    if (newdatetime != null) {
    Provider.of<FilterProvider>(context,listen: false).newdatetimerange(newdatetime);
    }
  }
} 
