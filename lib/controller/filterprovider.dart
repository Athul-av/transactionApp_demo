import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:machine_test1/model/transactionresponse.dart';
import 'package:machine_test1/service/trasactionservice.dart';
import 'package:machine_test1/view/loginscreen.dart';

class FilterProvider with ChangeNotifier{

  List<String> moneyInOut = [ 'Money in','Money out' ];
  List<String> moneyInOutadd = [];
  List<String> statuses = ['Completed','Failed','Declined','Pending','Reverted','Cancelled'];
  List<String> statusesadd = [];
  List<String> timerange = ['Today','This week','This month','This quarter','custom'];
  List<String> timerangeadd=[];
  String? customrange;

  List<String> allfilters = []; 
  DateTimeRange? datetimerange;

   TextEditingController minimum = TextEditingController(); 
    TextEditingController maximum = TextEditingController();
 

  moneyInOutfun(String value){
    if (!moneyInOutadd.contains(value)) {
      moneyInOutadd.add(value); 
      notifyListeners(); 
    }else{
      moneyInOutadd.remove(value);
      notifyListeners();
    }
  }

  statusesfun(value){
   if (!statusesadd.contains(value)) {
     statusesadd.add(value);
     notifyListeners();
   }else{
    statusesadd.remove(value);
    notifyListeners();  
   }
  }


  timerangefun(value){
   if (!timerangeadd.contains(value)) {
     timerangeadd.add(value);
     notifyListeners();
   }else{
    timerangeadd.remove(value);
    notifyListeners();  
   }
  }

  clearfilter(){
    moneyInOutadd.clear();
    timerangeadd.clear();
    statusesadd.clear();
    minimum.clear();
    maximum.clear(); 
    allfilters.clear(); 
    datetimerange = null;
    timerange.removeLast();
    timerange.add('custom');     
    customrange = null;  
    filtersearch();  
    notifyListeners();  
  }

  applyfilter(){ 
    allfilters = [...moneyInOutadd,...statusesadd,...timerangeadd]; 
    if ( minimum.text.isNotEmpty && maximum.text.isNotEmpty) {
      allfilters.add("min ${minimum.text} - max ${maximum.text}"); 
        
    }if (datetimerange != null) {
      final datetime = DateTime.parse(datetimerange!.start.toString());
     String formattedDateTime = DateFormat('d MMMM').format(datetime);
     final datetime2 = DateTime.parse(datetimerange!.end.toString());
     String formattedDateTime2 = DateFormat('d MMMM').format(datetime2);  

      allfilters.add("$formattedDateTime - $formattedDateTime2");  
      
    }
     
      filtersearch(); 
     
    notifyListeners(); 
    log(allfilters.toString()); 
  }

  removefilters(index){
    if (allfilters[index] == "min ${minimum.text} - max ${maximum.text}") {
      minimum.clear();
      maximum.clear(); 
    }
      allfilters.removeAt(index);
      minimum.clear();
      maximum.clear(); 
      filtersearch(); 
      notifyListeners();  
  }
 
  newdatetimerange(DateTimeRange newdate){
    datetimerange = newdate; 
     final datetime = DateTime.parse(datetimerange!.start.toString());
     String formattedDateTime = DateFormat('d MMMM').format(datetime);
     final datetime2 = DateTime.parse(datetimerange!.end.toString());
     String formattedDateTime2 = DateFormat('d MMMM').format(datetime2);  
  
  
     customrange = "$formattedDateTime - $formattedDateTime2";
     timerange.removeLast();
     timerange.add(customrange!);  
     notifyListeners();  
   
  }







 TransactionRes? alltransaction;
  List<Datum>? transaction ;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool isloading = false;


  getdatas(context)async{
   isloading = true;
   notifyListeners();
    String? token = await storage.read(key:'accessToken');

    await TransactionService().getdata(token!).then((value) {
      if (value != null) {
        alltransaction = value;
      transaction = alltransaction?.data;
      notifyListeners(); 
      }else{
      
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context)=> const LoginScreen()), (route) => false);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('token expired'),duration: Duration(seconds: 1),backgroundColor: Colors.red,));
      }
      
    }); 
 isloading = false;
 notifyListeners(); 
  }


search(String keyword){ 
if (keyword.isEmpty) { 
  transaction =alltransaction?.data;
  notifyListeners();
}else{
  transaction = alltransaction?.data?.where((element) => element.description!.toLowerCase().contains(keyword.toLowerCase())).toList(); 
  notifyListeners(); 
}
} 
 
bool ismoneyin(Datum moneyinout){
return moneyinout.transactionType == "CONVERSION_BUY";
 
}

filtersearch(){
  if (allfilters.isEmpty) {
    transaction = alltransaction?.data; 
    notifyListeners();  
  }else{
     List<Datum>? settledin;
     List<Datum>? cancelledin;
     List<Datum>? pendingin;
     List<Datum>? pendingout;
     List<Datum>? settledout;
     List<Datum>? cancelledout;
     List<Datum>? settled;
     List<Datum>? cancelled;
     List<Datum>? pending;
     List<Datum>? moneynull;
     List<Datum>? moneyintrue;
     List<Datum>? moneyouttrue;
     List<Datum>? amountrangesettled;
     List<Datum>? amountrangesettledin;
     List<Datum>? amountrangesettledout;
     List<Datum>? amountrangepending;
     List<Datum>? amountrangependingin;
     List<Datum>? amountrangependingout;
     List<Datum>? amountrangecancel;
     List<Datum>? amountrangecancelin;
     List<Datum>? amountrangecancelout;
     
   

    final moneyin = allfilters.contains('Money in') ? alltransaction?.data?.where((element) => ismoneyin(element)).toList():null;
    final moneyout = allfilters.contains('Money out') ? alltransaction?.data?.where((element) => !ismoneyin(element)).toList():null;
   

    if (moneyin == null && moneyout == null) {
       settled = allfilters.contains('Completed') ? alltransaction?.data?.where((element) => element.status == "SETTLED").toList():null;
     cancelled =  allfilters.contains('Cancelled') ? alltransaction?.data?.where((element) => element.status == "CANCELLED").toList():null;
     pending =  allfilters.contains('Pending') ? alltransaction?.data?.where((element) => element.status == "PENDING").toList():null;
     if (minimum.text.isNotEmpty && maximum.text.isNotEmpty ) {
      final minint = int.parse(minimum.text);
      final maxint = int.parse(maximum.text);
       amountrangesettled = settled?.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
       amountrangecancel =  cancelled?.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
       amountrangepending =  pending?.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
       moneynull = [...?amountrangesettled,...?amountrangecancel,...?amountrangepending];
     }else{
       moneynull = [...?settled,...?cancelled,...?pending]; 
     }
  
     notifyListeners();  
    }

    if (moneyin != null) { 
      settledin = allfilters.contains('Completed') ?moneyin.where((element) => element.status == "SETTLED").toList():null;
      cancelledin =allfilters.contains('Cancelled') ?moneyin.where((element) => element.status == "CANCELLED").toList():null;
       pendingin =allfilters.contains('Pending') ? moneyin.where((element) => element.status == "PENDING").toList():null;
       if (settledin == null && cancelledin == null && pendingin == null ) {
        if (minimum.text.isNotEmpty && maximum.text.isNotEmpty) {
           final minint = int.parse(minimum.text);
           final maxint = int.parse(maximum.text);
          final moneyinrange =  moneyin.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
          moneyintrue = moneyinrange;

        }else{
          moneyintrue = moneyin;
        }
         
       }else{
            if (minimum.text.isNotEmpty && maximum.text.isNotEmpty ) {
      final minint = int.parse(minimum.text);
      final maxint = int.parse(maximum.text);
       amountrangesettledin = settledin?.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
       amountrangecancelin =  cancelledin?.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
       amountrangependingin =  pendingin?.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
       moneyintrue = [...?amountrangesettledin,...?amountrangecancelin,...?amountrangependingin];

     }else{
      moneyintrue = [...?settledin,...?cancelledin,...?pendingin];
     }

           
       }
      
       notifyListeners();
    }if (moneyout != null) {
      settledout =  allfilters.contains('Completed') ?moneyout.where((element) => element.status == "SETTLED").toList():null;
      cancelledout = allfilters.contains('Cancelled') ?moneyout.where((element) => element.status == "CANCELLED").toList():null;
       pendingout = allfilters.contains('Pending') ? alltransaction?.data?.where((element) => element.status == "PENDING" && !ismoneyin(element)).toList():null;
       if (settledout == null && cancelledout == null && pendingout == null) {
         if (minimum.text.isNotEmpty && maximum.text.isNotEmpty) {
           final minint = int.parse(minimum.text);
           final maxint = int.parse(maximum.text);
          final moneyoutrange =  moneyout.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
          moneyouttrue = moneyoutrange;

        }else{
          moneyouttrue = moneyout;
        }
       }else{ 

         if (minimum.text.isNotEmpty && maximum.text.isNotEmpty ) {
      final minint = int.parse(minimum.text);
      final maxint = int.parse(maximum.text);
       amountrangesettledout = settledout?.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
       amountrangecancelout =  cancelledout?.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
       amountrangependingout =  pendingout?.where((element) => double.parse(element.amount!.replaceAll(',', '')).abs() > minint && double.parse(element.amount!.replaceAll(',', '')).abs() < maxint ).toList();
       moneyouttrue = [...?amountrangesettledout,...?amountrangecancelout,...?amountrangependingout];

     }else{
      moneyouttrue = [...?settledout,...?cancelledout,...?pendingout];
     }
       }
      
       notifyListeners();
    } 
     
   final transactions = <dynamic>{...?moneynull,...?moneyintrue,...?moneyouttrue};  
   transaction = transactions.cast<Datum>().toList(); 
    // transaction = [...?moneyin,...?moneyout];          
    notifyListeners();  
}   
} 
}    