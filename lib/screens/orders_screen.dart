import 'package:adminshop/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('My Orders',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Colors.indigoAccent,
          ),
          body: ctrl.orders.isEmpty
              ? Center(child: Text('No orders yet !!!'))
              : ListView.builder(
                  itemCount: ctrl.orders.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('Customer name: ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(ctrl.orders[index].UserName ?? ''),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text('Mobile No : ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text((ctrl.orders[index].MobileNo ?? 00)
                                      .toString()),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Address : ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    ctrl.orders[index].Address ?? " no",
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Product Name: ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(ctrl.orders[index].BoughtProductName ??
                                      ''),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text('Price: ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text((ctrl.orders[index].ProductPrice ?? 00)
                                      .toString()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ctrl.orders[index].Datetime ?? " no"),
                                  IconButton(
                                      onPressed: () {
                                        ctrl.deleteorder(
                                            ctrl.orders[index].id ?? '');
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              )
                            ],
                          )),
                    );
                  }));
    });
  }
}
