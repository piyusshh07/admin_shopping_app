import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adminshop/screens/addproductscreen.dart';
import 'package:get/get.dart';
class Homescreen extends StatelessWidget{
  Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Text('Products List'),
        ),
        floatingActionButton:
        FloatingActionButton(
          onPressed: (){
            Get.to(addproductscreen());
            },
          child: Icon(Icons.add),),
        body: ListView.builder(
          itemCount: 10,
            itemBuilder: (ctx,index){
            return  ListTile(
              title: Text('Title'),
              subtitle: Text('price :\$100 '),
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: (){}
                  ),
            );

            }
        )
      )
      ;
  }

}