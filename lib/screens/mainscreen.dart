import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecmapp/constants.dart';
import 'package:ecmapp/screens/productPage.dart';
import 'package:flutter/material.dart';
import '../prdata.dart';
import '../widgets/topbar.dart';
class MainScreen extends StatelessWidget {
  //const MainScreen({Key? key}) : super(key: key);
  CollectionReference _product = FirebaseFirestore.instance.collection("Products");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
              future:_product.get() ,
              builder: (context,snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text("Some Error Occured ${snapshot.error}"));
                }
                if(snapshot.connectionState==ConnectionState.waiting){
                   return Center(
                        child: CircularProgressIndicator());
                }
                if(snapshot.connectionState==ConnectionState.done){
                  return ListView(
                    padding: EdgeInsets.only(top: 90),
                    children: snapshot.data!.docs.map((document){
                      print("Name : ${document['name']}");
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductPage(productId: document.id),));
                        },
                        child: Container(
                            //height:350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            margin:EdgeInsets.only(left:20,right:20,bottom: 20),
                            child: Stack(
                              children: [
                                Container(
                                  height:350,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child:Image.network("${document['images'][0]}",fit: BoxFit.cover,),

                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 15,
                                  right: 15,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${document['name']}",style: Constants.secondHead,),
                                      Text("\$ ${document['price']}",style: Constants.secondHead,),
                                    ],
                                         ),
                                ),

                              ],
                            )
                        ),
                      );
                    }).toList(),
                  );
                }
                return CircularProgressIndicator();
              }
          ),
          TopBar(topBarTitle: "Your Titles",)

        ],
      ),
    );
  }
}
