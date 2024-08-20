import 'package:adminshop/controller/home_controller.dart';
import 'package:adminshop/screens/orders_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adminshop/screens/addproductscreen.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Products List', style: TextStyle(fontWeight: FontWeight.bold),),
            backgroundColor: Colors.indigoAccent,
            actions: [
              IconButton(onPressed: (){
                ctrl.fetchorders();
                Get.to(OrdersScreen());
              }, icon: Icon(Icons.shopping_bag))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
             Get.to(AddProductScreen());
            },
            child: Icon(Icons.add),
          ),
          body: ListView.builder(
                    itemCount: ctrl.products.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(ctrl.products[index].ProductName ??" "),
                            subtitle: Text((ctrl.products[index].Price ?? 0).toString()),
                            trailing:
                            IconButton(
                                icon: Icon(Icons.delete), onPressed: () async {
                                  ctrl.deeleteproduct(ctrl.products[index].id ??'');
                            }),
                          ),
                        ),
                      );
                    }
                    ),


    );
  }
    );
}
}
