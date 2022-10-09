import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
class TopBar extends StatelessWidget {
  //const TopBar({Key? key}) : super(key: key);

  final String topBarTitle;
  final bool leftArrow;

  TopBar({required this.topBarTitle,this.leftArrow=false});

  CollectionReference _product = FirebaseFirestore.instance.collection("Products");
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 10,
        left: 24,
        right: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         leftArrow ? Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("assets/images/backarrow.png",color: Colors.white,width: 18,height: 18,),
          ):Text(topBarTitle,style:Constants.generalHead)
          ,
          Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
             color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child:  Text("0",style: TextStyle(color: Colors.white),),
          ),
        ],
      )
    );
  }
}
