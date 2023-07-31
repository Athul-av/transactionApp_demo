import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:intl/intl.dart';

Widget container1(String amount,String currency,String image) {
  return Padding(
    padding: const EdgeInsets.only(right: 8),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      height: 18.h,
      width: 37.w,
      child:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 4.h,
            backgroundColor: Colors.transparent,
            backgroundImage:  AssetImage(image), 
                
              
            ),
            const SizedBox(height: 3,), 
            Text(amount,style: const TextStyle(fontWeight: FontWeight.bold,),),
              Text(currency,style: const TextStyle(color: Colors.grey,fontSize: 13),) 
          ],
        ),
      ) ,
    ),
  );
}



Widget container2(Color color1,Color color2,Color iconcolor,IconData icon,String text) {
  return Padding(
    padding: const EdgeInsets.only(right: 8),
    child: Container(
    
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
           color1,
           color2
        ] ,begin: Alignment.topLeft,end: Alignment.bottomRight),
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      height: 15.h,
      width: 37.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        CircleAvatar(
          radius: 3.h, 
          backgroundColor:  color2,
          child: Center(child: Icon(icon,color: iconcolor,)),
        ),
        Text(text,textAlign: TextAlign.center,style: const TextStyle(fontSize: 13),)  
      ]),
    ),
  );
}

Widget listtile(String amount, IconData icon, Color color) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
    child: Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 1, bottom: 1),
        child: ListTile(
          leading: Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 45, 83, 103)),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          title: const Text(
            'Rent',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: const Text('Sat-16 Jul - 9:00 pm',
              style: TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 181, 181, 181))),
          trailing: Text(
            amount,
            style: TextStyle(fontSize: 13, color: color),
          ),
        ),
      ),
    ),
  );
}

Widget listtile2({required String amount, IconData? icon, Color? color,String? currency,String? date,String? name }) {
  final datetime = DateTime.parse(date!);
   String formattedDateTime = DateFormat('EEEE, d MMMM HH:mm').format(datetime);
  return Padding(
    padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
    child: Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 1, bottom: 1),
        child: ListTile(
          leading: Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 45, 83, 103)),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            name!.isEmpty ?'transaction' : name, 
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle:  Text(formattedDateTime, 
              style: const TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 181, 181, 181))),
          trailing: Text(
            "$currency$amount",
            style: TextStyle(fontSize: 13, color: color), 
          ), 
        ),
      ),
    ),
  );
}
