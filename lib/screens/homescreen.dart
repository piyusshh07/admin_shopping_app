import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adminshop/screens/addproductscreen.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<void> _refreshProducts;

  @override
  void initState() {
    super.initState();
    _refreshProducts = _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: const Text('Products List',style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.indigoAccent,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddProductScreen()));
          },
          child: Icon(Icons.add),
        ),
        body: RefreshIndicator(
          onRefresh: _fetchProducts,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> ProductsSnapshots) {
              if (ProductsSnapshots.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (ProductsSnapshots.hasError) {
                return const Center(
                  child: Text('Something went Wrong !!!!'),
                );
              }
              if (!ProductsSnapshots.hasData ||
                  ProductsSnapshots.data!.docs.isEmpty) {
                return Center(
                  child: Text('No Products found try adding some...'),
                );
              }

              final Products = ProductsSnapshots.data!.docs;
              return ListView.builder(
                  itemCount: Products.length,
                  itemBuilder: (ctx, index) {
                    final exdata = Products[index].data() as Map<String, dynamic>;
                    final docId = Products[index].id;
                    return Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(exdata['ProductName']),
                          subtitle: Text(exdata['Price'].toString()),
                          trailing:
                              IconButton(icon: Icon(Icons.delete), onPressed: ()async{
                                await FirebaseFirestore.instance
                                    .collection('products')
                                    .doc(docId).delete();
                              }),
                        ),
                      ),
                    );
                  });
            },
          ),
        ));
  }
}
