import 'package:adminshop/Widgets/dropdownbtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addproductscreen extends StatelessWidget{
  addproductscreen({super.key});
  @override
  Widget build(BuildContext context) {

    var _selectedvalue='One';
    return
      Scaffold(
        appBar:AppBar(
          title: Text("Add Products"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                const Text('Add Products',
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 20)
                      ),label: Text('Product name'),
                      hintText: 'Enter your Product Name'
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)
                        ),label: Text('Product Description'),
                        hintText: 'Enter your Product Description'
                    ),
                  )
                  ,SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)
                        ),label: Text('Image url'),
                        hintText: 'Enter your Product image url'
                    ),
                  )
                  ,SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 20)
                        ),label: Text('Product Price'),
                        hintText: 'Enter your Product Price'
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Flexible(child: Dropdownbtn(items: ['Cate1','Cate2'], selectedText: 'Category',)),
                      Flexible(child: Dropdownbtn(items: ['Brand1','Brand2','Brand3'],selectedText: 'Brand',))
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text('Any Offer on product ?',style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 5,),
                  Dropdownbtn(items: ['True','False'],selectedText: 'offer',),
                  SizedBox(height: 25,),
                  Container(
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent,foregroundColor: Colors.white),
                          onPressed: (){}, child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold),)
                      )
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }

}