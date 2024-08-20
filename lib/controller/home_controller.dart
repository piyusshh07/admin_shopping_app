import 'package:adminshop/Orders/Orders.dart';
import 'package:adminshop/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
   FirebaseFirestore firestore=FirebaseFirestore.instance;
   late CollectionReference productCollection;
   late CollectionReference orderscollection;

   TextEditingController Productnamectrl=TextEditingController();
   TextEditingController Descriptionctrl=TextEditingController();
   TextEditingController ImageUrlctrl=TextEditingController();
   TextEditingController Pricectrl=TextEditingController();
   String category='';
   bool offer=false;
   String Brand='';
   bool isSaving=false;
   List<Orders> orders=[];
   List<Product> products=[];

   @override
  void onInit() async{
productCollection=firestore.collection('products');
orderscollection=firestore.collection('orders');
await fetchproducts();
 await fetchproducts();
   super.onInit();
  }

   addproducts() async {
     try {
       if (Pricectrl.text.isEmpty ||
           Productnamectrl.text.isEmpty ||
           Descriptionctrl.text.isEmpty ||
           ImageUrlctrl.text.isEmpty) {
         Get.snackbar('Error', 'Please enter all the fields', colorText: Colors.red);
         return;
       }

       isSaving = true;
       update(); // Update the UI to show the saving state

       DocumentReference doc = productCollection.doc();
       Product product = Product(
         id: doc.id,
         ProductName: Productnamectrl.text,
         ImageUrl: ImageUrlctrl.text,
         Brand: Brand,
         Category: category,
         Description: Descriptionctrl.text,
         Offer: offer,
         Price: double.tryParse(Pricectrl.text),
       );

       final productjson = product.toJson();
       await doc.set(productjson);

       // Ensure that the state is no longer saving before showing the Snackbar
       isSaving = false;
       update();
         Get.snackbar('Success', 'Product added', colorText: Colors.green);
        setvaluesdefault();

     } catch (error) {
       isSaving = false;
       update();
       Get.snackbar('Error', error.toString(), colorText: Colors.red);
     }
     update();
   }

   fetchproducts()async{
     try{
    QuerySnapshot productssnapshots=await productCollection.get();
    final List<Product> retrieveproducts=productssnapshots
        .docs.map((doc)=>Product.fromJson(
        doc.data() as Map<String ,dynamic>))
        .toList();
    products.clear();
    products.assignAll(retrieveproducts);
     }
     catch(error){
       Get.snackbar('Error', error.toString(),colorText: Colors.red);
     }
     finally{
       update();
     }
   }
   fetchorders() async {
     try {
         QuerySnapshot orderssnapshots = await orderscollection
             .get();
         final List<Orders> retrieveorders = orderssnapshots.docs
             .map((doc) => Orders.fromJson(doc.data() as Map<String, dynamic>))
             .toList();

         orders.clear();
         orders.assignAll(retrieveorders);
     } catch (error) {
       Get.snackbar('Error', error.toString(), colorText: Colors.red);
     } finally {
       update();
     }
   }
   deeleteproduct(String id)async{
     try{
     await productCollection.doc(id).delete();
     Get.snackbar('Success', 'Product deleted successfully',colorText: Colors.green);
     fetchproducts();
     }
     catch(error){
       Get.snackbar('Error', error.toString(),colorText: Colors.red);
     }
   }
   deleteorder(String id)async{
     try{
       await orderscollection.doc(id).delete();
       Get.snackbar('Success', 'Product deleted successfully',colorText: Colors.green);
       fetchproducts();
     }
     catch(error){
       Get.snackbar('Error', error.toString(),colorText: Colors.red);
     }
     update();
   }
   setvaluesdefault(){
     Productnamectrl.clear();
     Descriptionctrl.clear();
     ImageUrlctrl.clear();
    Pricectrl.clear();
     category='';
     offer=false;
     Brand='';
     update();
   }

}